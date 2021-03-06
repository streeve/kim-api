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


set(PROJECT_VERSION_PRERELEASE "" CACHE STRING "Version prerelease value")

find_package(Git)
if((${GIT_FOUND}) AND (EXISTS "${CMAKE_SOURCE_DIR}/.git"))
  execute_process(COMMAND ${GIT_EXECUTABLE} update-index -q --refresh
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR} TIMEOUT 5 OUTPUT_QUIET
    ERROR_VARIABLE EXEC_ERR OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  if(READTHEDOCS)
    set(_DIRTY "")
  else()
    set(_DIRTY ".dirty")
  endif()
  execute_process(COMMAND ${GIT_EXECUTABLE} describe --dirty=${_DIRTY} --broken=.broken --always
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE KIM_API_GIT_DESCRIBE OUTPUT_STRIP_TRAILING_WHITESPACE
    )
  set(KIM_API_BUILD_METADATA "${KIM_API_GIT_DESCRIBE}")

  set(RECONFIGURE_FILE "${CMAKE_BINARY_DIR}/reconfigure")
  execute_process(COMMAND ${CMAKE_COMMAND} -E touch "${RECONFIGURE_FILE}")
  add_custom_target(git-commit-describe ALL
    COMMAND ${CMAKE_COMMAND} -E touch "${RECONFIGURE_FILE}"
    )
  include("${RECONFIGURE_FILE}")
endif()

if(NOT "${KIM_API_BUILD_METADATA}" STREQUAL "")
  string(APPEND KIM_API_BUILD_METADATA ".")
endif()
string(APPEND KIM_API_BUILD_METADATA "${CMAKE_CXX_COMPILER_ID}")
set(PROJECT_VERSION_BUILD_METADATA "${KIM_API_BUILD_METADATA}" CACHE STRING "Version metadata value" FORCE)


set(PROJECT_VERSION_STRING "${PROJECT_VERSION}")
if(PROJECT_VERSION_PRERELEASE)
  set(PROJECT_VERSION_STRING
    "${PROJECT_VERSION_STRING}-${PROJECT_VERSION_PRERELEASE}")
endif()
set(PROJECT_VERSION_STRING_WITHOUT_BUILD_METADATA "${PROJECT_VERSION_STRING}")
if(PROJECT_VERSION_BUILD_METADATA)
  set(PROJECT_VERSION_STRING
    "${PROJECT_VERSION_STRING}+${PROJECT_VERSION_BUILD_METADATA}")
endif()
