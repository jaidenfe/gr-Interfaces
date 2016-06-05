/* -*- c++ -*- */
/*
 * Copyright 2016 University at Buffalo Nanosatellite Laboratory.
 * Author: Jaiden Ferraccioli
 *
 * This is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this software; see the file COPYING.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street,
 * Boston, MA 02110-1301, USA.
 */

#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include <gnuradio/io_signature.h>
#include "queue_len_deframer_sink_b_impl.h"
#include <bitset>
#include <unistd.h>

namespace gr {
  namespace Interfaces {

    queue_len_deframer_sink_b::sptr
    queue_len_deframer_sink_b::make(char preamble, bool rxlog)
    {
      return gnuradio::get_initial_sptr
        (new queue_len_deframer_sink_b_impl(preamble, rxlog));
    }

    /*
     * The private constructor
     */
    queue_len_deframer_sink_b_impl::queue_len_deframer_sink_b_impl(char preamble = 'U', bool rxlog = true)

      : gr::sync_block("queue_len_deframer_sink_b",
              gr::io_signature::make(1, 1, sizeof(char)),
              gr::io_signature::make(0, 0, 0))
    {
      // Initialize the private variables and states whether or not to log received information
      _preamble = preamble;
      _log = rxlog;
    }

    /*
     * The virtual destructor.
     */
    queue_len_deframer_sink_b_impl::~queue_len_deframer_sink_b_impl() {}

    /*
     * Returns whether the input buffer matches the preamble
     */
    bool queue_len_deframer_sink_b_impl::check_preamble(std::vector<char> ub_in) {
	std::bitset<8> bit_buffer0;
        std::bitset<8> bit_buffer1;
        char _preamble = 'U';
        char out[2];

        for(int i=0; i < ub_in.size(); i++) {
                if(i < 8) {
                        bit_buffer0.set((7-i), ub_in[i]); // This gets the first part of the preamble of inverted unpacked bytes
                        //bit_buffer0.set(i, ub_in[i]); // This gets the first part of the preamble of unpacked bytes
                }
                if(i > 7 && i < 16) {
                        bit_buffer1.set((15-i), ub_in[i]); // This gets the second part of the preamble of inverted unpacked bytes
                        //bit_buffer1.set((i-8), ub_in[i]); // This gets the second part of the preamble of unpacked bytes
                }
        }

        out[0] = static_cast<char>( bit_buffer0.to_ulong() );
        out[1] = static_cast<char>( bit_buffer1.to_ulong() );

        std::cout << "  Actually: " << out[0] << out[1] <<std::endl;
        return (out[0] == _preamble && out[1] == _preamble);
    }

    /*
     * Converts a vector of unpacked bytes to an integer between 0 and 256
     */
    int queue_len_deframer_sink_b_impl::ubvtoi(std::vector<char> v_len) {

	int lenbuff;
        std::bitset<8> len;

        for(int i=0; i < 8; i++) {
                len.set((7-i), v_len[i]); // This converts a length buffer of inverted unpacked bytes to an integer length
                //len.set(i, v_len[i]); // This converts a length buffer of unpacked bytes to an integer length
        }

        return std::bitset<8>(len).to_ulong();

    }

    /*
     * Converts a buffer of 8 unpacked bytes into one packed byte
     */
    char queue_len_deframer_sink_b_impl::pack(std::vector<char> ubyte) {

	std::bitset<8> pbyte;

        for(int i=0; i < ubyte.size(); i++) {
                //pbyte.set((7-i), ubyte[i]); // This packs an unpacked byte that is inverted
                pbyte.set(i, ubyte[i]); // This packs an unpacked byte
        }

        return static_cast<char>( pbyte.to_ulong() );
    }

    /*
     * Extends access to the received packet queue to the higher layers and external applications.
     * Here the first element of the receive queue is returned and removed from the queue.
     * The packet is returned as a char pointer (SWIG turns this into a string in python)
     */
    char * queue_len_deframer_sink_b_impl::receive() {

	// If the queue is empty wait until a packet is added and return the top packet
	while( _phy_i.empty() ) usleep(TIMEOUT);
	// if( _phy_i.empty() ) _cv.wait();

	// Access and store the first received packet and remove it from the queue
	char * packet = _phy_i.front();
	_phy_i.pop();

	return packet;
    }

    /*
     * The work function
     */
    int queue_len_deframer_sink_b_impl::work(int noutput_items,
      gr_vector_const_void_star &input_items,
      gr_vector_void_star &output_items) {


	// Input pointer of unpacked bytes to be processed
	const char *in = (const char *) input_items[0];

	switch(state){

		case POPULATE_BUFFER:

			// Populates the detect buffer with 16 unpacked bytes
			detect.push_back(in[0]);
			if(detect.size() == 16) { // Fix the equality of buffer unpacked size and preamble packed size
				state = DETERMINE_PREAMBLE;
			}
			break;

		case DETERMINE_PREAMBLE:

			/*
			 * If the buffer does not match the preamble
			 * remove the top bit and add the most recent bit
			 */
			if(check_preamble(detect)) {
				v_length.push_back(in[0]);
				detect.clear();
				state = DETERMINE_LENGTH;
				break;
			}

			detect.erase( detect.begin() );
			detect.push_back(in[0]);
			break;

		case DETERMINE_LENGTH:

			// Determine the packet length
			v_length.push_back(in[0]);
			if(v_length.size() == 8) {
				_pac_len = ubvtoi(v_length);
				v_length.clear();
				state = DETERMINE_PACKET;
			}
			break;

		case DETERMINE_PACKET:

			/*
			 * Take in unpacked bytes 8 at a time, pack them
			 * and add them to the packet buffer. When the packet
			 * buffer is the same length as _pac_len the packet
			 * is then added to the received queue.
			 */
			byte_buffer.push_back(in[0]);

			if(byte_buffer.size() == 8) {
				packet.push_back(pack(byte_buffer));
				byte_buffer.clear();
			}

			if(packet.size() == _pac_len) {
				_phy_i.push(packet.data());
				//_cv.notify_all();
				packet.clear();
				state = POPULATE_BUFFER;
			}
			break;

		default:

			detect.clear();
			v_length.clear();
			byte_buffer.clear();
			packet.clear();
			state = POPULATE_BUFFER;
	}

	// Tell runtime system how many output items we produced.
	return noutput_items;
    }

  } /* namespace Interfaces */
} /* namespace gr */
