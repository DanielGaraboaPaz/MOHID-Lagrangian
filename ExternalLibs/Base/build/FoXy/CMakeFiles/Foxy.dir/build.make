# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


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
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.13.2/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.13.2/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build

# Include any dependencies generated for this target.
include FoXy/CMakeFiles/Foxy.dir/depend.make

# Include the progress variables for this target.
include FoXy/CMakeFiles/Foxy.dir/progress.make

# Include the compile flags for this target's objects.
include FoXy/CMakeFiles/Foxy.dir/flags.make

FoXy/CMakeFiles/Foxy.dir/foxy.f90.o: FoXy/CMakeFiles/Foxy.dir/flags.make
FoXy/CMakeFiles/Foxy.dir/foxy.f90.o: ../FoXy/foxy.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object FoXy/CMakeFiles/Foxy.dir/foxy.f90.o"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy.f90 -o CMakeFiles/Foxy.dir/foxy.f90.o

FoXy/CMakeFiles/Foxy.dir/foxy.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/Foxy.dir/foxy.f90.i"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy.f90 > CMakeFiles/Foxy.dir/foxy.f90.i

FoXy/CMakeFiles/Foxy.dir/foxy.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/Foxy.dir/foxy.f90.s"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy.f90 -o CMakeFiles/Foxy.dir/foxy.f90.s

FoXy/CMakeFiles/Foxy.dir/foxy_xml_file.f90.o: FoXy/CMakeFiles/Foxy.dir/flags.make
FoXy/CMakeFiles/Foxy.dir/foxy_xml_file.f90.o: ../FoXy/foxy_xml_file.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object FoXy/CMakeFiles/Foxy.dir/foxy_xml_file.f90.o"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy_xml_file.f90 -o CMakeFiles/Foxy.dir/foxy_xml_file.f90.o

FoXy/CMakeFiles/Foxy.dir/foxy_xml_file.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/Foxy.dir/foxy_xml_file.f90.i"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy_xml_file.f90 > CMakeFiles/Foxy.dir/foxy_xml_file.f90.i

FoXy/CMakeFiles/Foxy.dir/foxy_xml_file.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/Foxy.dir/foxy_xml_file.f90.s"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy_xml_file.f90 -o CMakeFiles/Foxy.dir/foxy_xml_file.f90.s

FoXy/CMakeFiles/Foxy.dir/foxy_xml_tag.f90.o: FoXy/CMakeFiles/Foxy.dir/flags.make
FoXy/CMakeFiles/Foxy.dir/foxy_xml_tag.f90.o: ../FoXy/foxy_xml_tag.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building Fortran object FoXy/CMakeFiles/Foxy.dir/foxy_xml_tag.f90.o"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy_xml_tag.f90 -o CMakeFiles/Foxy.dir/foxy_xml_tag.f90.o

FoXy/CMakeFiles/Foxy.dir/foxy_xml_tag.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/Foxy.dir/foxy_xml_tag.f90.i"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy_xml_tag.f90 > CMakeFiles/Foxy.dir/foxy_xml_tag.f90.i

FoXy/CMakeFiles/Foxy.dir/foxy_xml_tag.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/Foxy.dir/foxy_xml_tag.f90.s"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy/foxy_xml_tag.f90 -o CMakeFiles/Foxy.dir/foxy_xml_tag.f90.s

# Object files for target Foxy
Foxy_OBJECTS = \
"CMakeFiles/Foxy.dir/foxy.f90.o" \
"CMakeFiles/Foxy.dir/foxy_xml_file.f90.o" \
"CMakeFiles/Foxy.dir/foxy_xml_tag.f90.o"

# External object files for target Foxy
Foxy_EXTERNAL_OBJECTS =

lib/libFoxy.a: FoXy/CMakeFiles/Foxy.dir/foxy.f90.o
lib/libFoxy.a: FoXy/CMakeFiles/Foxy.dir/foxy_xml_file.f90.o
lib/libFoxy.a: FoXy/CMakeFiles/Foxy.dir/foxy_xml_tag.f90.o
lib/libFoxy.a: FoXy/CMakeFiles/Foxy.dir/build.make
lib/libFoxy.a: FoXy/CMakeFiles/Foxy.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking Fortran static library ../lib/libFoxy.a"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && $(CMAKE_COMMAND) -P CMakeFiles/Foxy.dir/cmake_clean_target.cmake
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Foxy.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
FoXy/CMakeFiles/Foxy.dir/build: lib/libFoxy.a

.PHONY : FoXy/CMakeFiles/Foxy.dir/build

FoXy/CMakeFiles/Foxy.dir/clean:
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy && $(CMAKE_COMMAND) -P CMakeFiles/Foxy.dir/cmake_clean.cmake
.PHONY : FoXy/CMakeFiles/Foxy.dir/clean

FoXy/CMakeFiles/Foxy.dir/depend:
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/FoXy /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/Base/build/FoXy/CMakeFiles/Foxy.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : FoXy/CMakeFiles/Foxy.dir/depend

