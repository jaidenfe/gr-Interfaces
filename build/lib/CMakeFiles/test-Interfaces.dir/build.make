# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list

# Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/ground/jaidenfe/gr-Interfaces

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/ground/jaidenfe/gr-Interfaces/build

# Include any dependencies generated for this target.
include lib/CMakeFiles/test-Interfaces.dir/depend.make

# Include the progress variables for this target.
include lib/CMakeFiles/test-Interfaces.dir/progress.make

# Include the compile flags for this target's objects.
include lib/CMakeFiles/test-Interfaces.dir/flags.make

lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o: lib/CMakeFiles/test-Interfaces.dir/flags.make
lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o: ../lib/test_Interfaces.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ground/jaidenfe/gr-Interfaces/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o"
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o -c /home/ground/jaidenfe/gr-Interfaces/lib/test_Interfaces.cc

lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.i"
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ground/jaidenfe/gr-Interfaces/lib/test_Interfaces.cc > CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.i

lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.s"
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ground/jaidenfe/gr-Interfaces/lib/test_Interfaces.cc -o CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.s

lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.requires:
.PHONY : lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.requires

lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.provides: lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-Interfaces.dir/build.make lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.provides

lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.provides.build: lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o

lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o: lib/CMakeFiles/test-Interfaces.dir/flags.make
lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o: ../lib/qa_Interfaces.cc
	$(CMAKE_COMMAND) -E cmake_progress_report /home/ground/jaidenfe/gr-Interfaces/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o"
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o -c /home/ground/jaidenfe/gr-Interfaces/lib/qa_Interfaces.cc

lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.i"
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/ground/jaidenfe/gr-Interfaces/lib/qa_Interfaces.cc > CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.i

lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.s"
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/ground/jaidenfe/gr-Interfaces/lib/qa_Interfaces.cc -o CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.s

lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.requires:
.PHONY : lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.requires

lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.provides: lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.requires
	$(MAKE) -f lib/CMakeFiles/test-Interfaces.dir/build.make lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.provides.build
.PHONY : lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.provides

lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.provides.build: lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o

# Object files for target test-Interfaces
test__Interfaces_OBJECTS = \
"CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o" \
"CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o"

# External object files for target test-Interfaces
test__Interfaces_EXTERNAL_OBJECTS =

lib/test-Interfaces: lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o
lib/test-Interfaces: lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o
lib/test-Interfaces: lib/CMakeFiles/test-Interfaces.dir/build.make
lib/test-Interfaces: /usr/local/lib/libgnuradio-runtime.so
lib/test-Interfaces: /usr/local/lib/libgnuradio-pmt.so
lib/test-Interfaces: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/test-Interfaces: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/test-Interfaces: /usr/lib/x86_64-linux-gnu/libcppunit.so
lib/test-Interfaces: lib/libgnuradio-Interfaces-1.0.0git.so.0.0.0
lib/test-Interfaces: /usr/local/lib/libgnuradio-runtime.so
lib/test-Interfaces: /usr/local/lib/libgnuradio-pmt.so
lib/test-Interfaces: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
lib/test-Interfaces: /usr/lib/x86_64-linux-gnu/libboost_system.so
lib/test-Interfaces: lib/CMakeFiles/test-Interfaces.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test-Interfaces"
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test-Interfaces.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
lib/CMakeFiles/test-Interfaces.dir/build: lib/test-Interfaces
.PHONY : lib/CMakeFiles/test-Interfaces.dir/build

lib/CMakeFiles/test-Interfaces.dir/requires: lib/CMakeFiles/test-Interfaces.dir/test_Interfaces.cc.o.requires
lib/CMakeFiles/test-Interfaces.dir/requires: lib/CMakeFiles/test-Interfaces.dir/qa_Interfaces.cc.o.requires
.PHONY : lib/CMakeFiles/test-Interfaces.dir/requires

lib/CMakeFiles/test-Interfaces.dir/clean:
	cd /home/ground/jaidenfe/gr-Interfaces/build/lib && $(CMAKE_COMMAND) -P CMakeFiles/test-Interfaces.dir/cmake_clean.cmake
.PHONY : lib/CMakeFiles/test-Interfaces.dir/clean

lib/CMakeFiles/test-Interfaces.dir/depend:
	cd /home/ground/jaidenfe/gr-Interfaces/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/ground/jaidenfe/gr-Interfaces /home/ground/jaidenfe/gr-Interfaces/lib /home/ground/jaidenfe/gr-Interfaces/build /home/ground/jaidenfe/gr-Interfaces/build/lib /home/ground/jaidenfe/gr-Interfaces/build/lib/CMakeFiles/test-Interfaces.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : lib/CMakeFiles/test-Interfaces.dir/depend

