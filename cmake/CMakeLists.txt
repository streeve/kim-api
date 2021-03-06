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


set(CONFIG_FILE_IN config.cmake.in)
set(CONFIG_FILE kim-api-config.cmake)  # should _not_ use PROJECT_NAME here
set(CONFIG_VERSION_FILE_IN config-version.cmake.in)
set(CONFIG_VERSION_FILE kim-api-config-version.cmake)  # should _not_ use PROJECT_NAME here

configure_file("${CONFIG_FILE_IN}" "${CMAKE_CURRENT_BINARY_DIR}/${CONFIG_FILE}" @ONLY)
configure_file("${CONFIG_VERSION_FILE_IN}"
  "${CMAKE_CURRENT_BINARY_DIR}/${CONFIG_VERSION_FILE}" @ONLY)

install(
  FILES
  "${CMAKE_CURRENT_BINARY_DIR}/${CONFIG_FILE}"
  "${CMAKE_CURRENT_BINARY_DIR}/${CONFIG_VERSION_FILE}"
  DESTINATION
  ${CMAKE_INSTALL_DATADIR}/cmake/${PROJECT_NAME}
  )

target_include_directories(kim-api PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})

set(ITEM_BUILD_SOURCES
  KIM_SharedLibrarySchema.hpp
  item-wrapper.cpp.in
  item-info.txt.in
  item-compiled-with-version.txt.in
  )

install(
  FILES ${ITEM_BUILD_SOURCES}
  DESTINATION ${CMAKE_INSTALL_LIBDIR}/${PROJECT_NAME}/${KIM_API_CMAKE_DIR_IDENTIFIER}
  )

add_subdirectory(Modules)
