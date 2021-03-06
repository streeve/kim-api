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
#    Jim Madge
#    Yaser Afshar
#

#
# Release: This file is part of the kim-api-2.1.3 package.
#


set(BASH_COMPLETIONS ${PROJECT_NAME}-collections-management.bash)
set(ZSH_COMPLETIONS ${PROJECT_NAME}-collections-management.zsh)

string(MAKE_C_IDENTIFIER "${PROJECT_NAME}" KIM_API_C_ID_PROJECT_NAME)

configure_file(collections-management.bash.in ${BASH_COMPLETIONS} @ONLY)
configure_file(collections-management.zsh.in ${ZSH_COMPLETIONS} @ONLY)

install(
  FILES ${CMAKE_CURRENT_BINARY_DIR}/${BASH_COMPLETIONS}
  DESTINATION ${BASH_COMPLETION_COMPLETIONSDIR}
  )

install(
  FILES
  ${CMAKE_CURRENT_BINARY_DIR}/${ZSH_COMPLETIONS}
  DESTINATION ${ZSH_COMPLETION_COMPLETIONSDIR}
  RENAME "_${PROJECT_NAME}-collections-management"
  )
install(
  FILES
  ${CMAKE_CURRENT_BINARY_DIR}/${BASH_COMPLETIONS}
  DESTINATION ${ZSH_COMPLETION_COMPLETIONSDIR}
  )
