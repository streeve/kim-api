#
# CDDL HEADER START
#
# The contents of this file are subject to the terms of the Common Development
# and Distribution License Version 1.0 (the "License").
#
# You can obtain a copy of the license at
# http://www.opensource.org/licenses/CDDL-1.0.  See the License for the
# specific language governing permissions and limitations under the License.
#
# When distributing Covered Code, include this CDDL HEADER in each file and
# include the License file in a prominent location with the name LICENSE.CDDL.
# If applicable, add the following below this CDDL HEADER, with the fields
# enclosed by brackets "[]" replaced with your own identifying information:
#
# Portions Copyright (c) [yyyy] [name of copyright owner]. All rights reserved.
#
# CDDL HEADER END
#

#
# Copyright (c) 2013--2019, Regents of the University of Minnesota.
# All rights reserved.
#
# Contributors:
#    Richard Berger
#    Christoph Junghans
#    Ryan S. Elliott
#

#
# Release: This file is part of the kim-api-2.1.3 package.
#


# Set global linker flags
#
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
#
#
if(KIM_API_ENABLE_SANITIZE)
  set(KIM_API_EXE_LINKER_FLAGS "${KIM_API_EXE_LINKER_FLAGS} -fsanitize=address")
endif()
if(KIM_API_ENABLE_COVERAGE)
  set(KIM_API_EXE_LINKER_FLAGS "${KIM_API_EXE_LINKER_FLAGS} -fprofile-arcs -ftest-coverage")
endif()
if(NOT CMAKE_C_COMPILER_ID STREQUAL Intel
    AND
    NOT CMAKE_C_COMPILER_ID STREQUAL AppleClang)
  set(KIM_API_EXE_LINKER_FLAGS "${KIM_API_EXE_LINKER_FLAGS} -pie" CACHE STRING "KIM API linker flags")
endif()
#
#
set(CMAKE_EXE_LINKER_FLAGS "${KIM_API_EXE_LINKER_FLAGS} ${CMAKE_EXE_LINKER_FLAGS}")
#

# Set global compiler options
#
include(EnableCXXCompilerFlagIfSupported)
#enable_cxx_compiler_flag_if_supported("-std=c++${CMAKE_CXX_STANDARD}")
enable_cxx_compiler_flag_if_supported("-Wall")
enable_cxx_compiler_flag_if_supported("-Wextra")
enable_cxx_compiler_flag_if_supported("-pedantic")
if(KIM_API_ENABLE_COVERAGE)
  enable_cxx_compiler_flag_if_supported("-fprofile-arcs")
  enable_cxx_compiler_flag_if_supported("-ftest-coverage")
endif()
if(KIM_API_ENABLE_SANITIZE)
  enable_cxx_compiler_flag_if_supported("-fsanitize=address")
endif()
set(KIM_API_CXX_FLAGS "${KIM_API_CXX_FLAGS}" CACHE STRING "KIM API C++ compiler flags")
#
include(EnableCCompilerFlagIfSupported)
#enable_c_compiler_flag_if_supported("-std=c${CMAKE_C_STANDARD}")
enable_c_compiler_flag_if_supported("-Wall")
enable_c_compiler_flag_if_supported("-Wextra")
enable_c_compiler_flag_if_supported("-pedantic")
if(KIM_API_ENABLE_COVERAGE)
  enable_c_compiler_flag_if_supported("-fprofile-arcs")
  enable_c_compiler_flag_if_supported("-ftest-coverage")
endif()
if(KIM_API_ENABLE_SANITIZE)
  enable_c_compiler_flag_if_supported("-fsanitize=address")
endif()
set(KIM_API_C_FLAGS "${KIM_API_C_FLAGS}" CACHE STRING "KIM API C compiler flags")
#
include(EnableFortranCompilerFlagIfSupported)
if(NOT CMAKE_Fortran_COMPILER_ID STREQUAL Intel)
  enable_fortran_compiler_flag_if_supported("-std=f2003")
  enable_fortran_compiler_flag_if_supported("-Wall")
  enable_fortran_compiler_flag_if_supported("-Wextra")
  enable_fortran_compiler_flag_if_supported("-Wimplicit-interface")
  enable_fortran_compiler_flag_if_supported("-pedantic")
else()
  enable_fortran_compiler_flag_if_supported("-stand f03")
  enable_fortran_compiler_flag_if_supported("-warn all")
  enable_fortran_compiler_flag_if_supported("-e03")
  enable_fortran_compiler_flag_if_supported("-warn interfaces")
  enable_fortran_compiler_flag_if_supported("-diag-disable 5462")  # disable "Global name too long" warning
endif()
if(KIM_API_ENABLE_COVERAGE)
  enable_fortran_compiler_flag_if_supported("-fprofile-arcs")
  enable_fortran_compiler_flag_if_supported("-ftest-coverage")
endif()
if(KIM_API_ENABLE_SANITIZE)
  enable_fortran_compiler_flag_if_supported("-fsanitize=address")
endif()
set(KIM_API_Fortran_FLAGS "${KIM_API_Fortran_FLAGS}" CACHE STRING "KIM API Fortran compiler flags")
#

# Update CMAKE variables
set(CMAKE_CXX_FLAGS "${KIM_API_CXX_FLAGS} ${CMAKE_CXX_FLAGS}")
set(CMAKE_C_FLAGS "${KIM_API_C_FLAGS} ${CMAKE_C_FLAGS}")
set(CMAKE_Fortran_FLAGS "${KIM_API_Fortran_FLAGS} ${CMAKE_Fortran_FLAGS}")
