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
CMAKE_SOURCE_DIR = /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build

# Include any dependencies generated for this target.
include utils/CMakeFiles/FoX_utils.dir/depend.make

# Include the progress variables for this target.
include utils/CMakeFiles/FoX_utils.dir/progress.make

# Include the compile flags for this target's objects.
include utils/CMakeFiles/FoX_utils.dir/flags.make

utils/CMakeFiles/FoX_utils.dir/FoX_utils.f90.o: utils/CMakeFiles/FoX_utils.dir/flags.make
utils/CMakeFiles/FoX_utils.dir/FoX_utils.f90.o: ../utils/FoX_utils.f90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building Fortran object utils/CMakeFiles/FoX_utils.dir/FoX_utils.f90.o"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/FoX_utils.f90 -o CMakeFiles/FoX_utils.dir/FoX_utils.f90.o

utils/CMakeFiles/FoX_utils.dir/FoX_utils.f90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/FoX_utils.dir/FoX_utils.f90.i"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/FoX_utils.f90 > CMakeFiles/FoX_utils.dir/FoX_utils.f90.i

utils/CMakeFiles/FoX_utils.dir/FoX_utils.f90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/FoX_utils.dir/FoX_utils.f90.s"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/FoX_utils.f90 -o CMakeFiles/FoX_utils.dir/FoX_utils.f90.s

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.o: utils/CMakeFiles/FoX_utils.dir/flags.make
utils/CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.o: ../utils/fox_m_utils_mtprng.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building Fortran object utils/CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.o"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_mtprng.F90 -o CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.o

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.i"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_mtprng.F90 > CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.i

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.s"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_mtprng.F90 -o CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.s

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.o: utils/CMakeFiles/FoX_utils.dir/flags.make
utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.o: ../utils/fox_m_utils_uri.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building Fortran object utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.o"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_uri.F90 -o CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.o

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.i"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_uri.F90 > CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.i

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.s"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_uri.F90 -o CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.s

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.o: utils/CMakeFiles/FoX_utils.dir/flags.make
utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.o: ../utils/fox_m_utils_uuid.F90
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building Fortran object utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.o"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -c /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_uuid.F90 -o CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.o

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing Fortran source to CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.i"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -E /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_uuid.F90 > CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.i

utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling Fortran source to assembly CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.s"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && /usr/local/bin/gfortran $(Fortran_DEFINES) $(Fortran_INCLUDES) $(Fortran_FLAGS) -S /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils/fox_m_utils_uuid.F90 -o CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.s

# Object files for target FoX_utils
FoX_utils_OBJECTS = \
"CMakeFiles/FoX_utils.dir/FoX_utils.f90.o" \
"CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.o" \
"CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.o" \
"CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.o"

# External object files for target FoX_utils
FoX_utils_EXTERNAL_OBJECTS =

lib/libFoX_utils.a: utils/CMakeFiles/FoX_utils.dir/FoX_utils.f90.o
lib/libFoX_utils.a: utils/CMakeFiles/FoX_utils.dir/fox_m_utils_mtprng.F90.o
lib/libFoX_utils.a: utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uri.F90.o
lib/libFoX_utils.a: utils/CMakeFiles/FoX_utils.dir/fox_m_utils_uuid.F90.o
lib/libFoX_utils.a: utils/CMakeFiles/FoX_utils.dir/build.make
lib/libFoX_utils.a: utils/CMakeFiles/FoX_utils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking Fortran static library ../lib/libFoX_utils.a"
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && $(CMAKE_COMMAND) -P CMakeFiles/FoX_utils.dir/cmake_clean_target.cmake
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/FoX_utils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
utils/CMakeFiles/FoX_utils.dir/build: lib/libFoX_utils.a

.PHONY : utils/CMakeFiles/FoX_utils.dir/build

utils/CMakeFiles/FoX_utils.dir/clean:
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils && $(CMAKE_COMMAND) -P CMakeFiles/FoX_utils.dir/cmake_clean.cmake
.PHONY : utils/CMakeFiles/FoX_utils.dir/clean

utils/CMakeFiles/FoX_utils.dir/depend:
	cd /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/utils /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils /Users/rbc-laptop/Documents/GitHub/MOHID-Lagrangian/ExternalLibs/fox/build/utils/CMakeFiles/FoX_utils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : utils/CMakeFiles/FoX_utils.dir/depend

