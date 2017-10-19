//
// CDDL HEADER START
//
// The contents of this file are subject to the terms of the Common Development
// and Distribution License Version 1.0 (the "License").
//
// You can obtain a copy of the license at
// http://www.opensource.org/licenses/CDDL-1.0.  See the License for the
// specific language governing permissions and limitations under the License.
//
// When distributing Covered Code, include this CDDL HEADER in each file and
// include the License file in a prominent location with the name LICENSE.CDDL.
// If applicable, add the following below this CDDL HEADER, with the fields
// enclosed by brackets "[]" replaced with your own identifying information:
//
// Portions Copyright (c) [yyyy] [name of copyright owner]. All rights reserved.
//
// CDDL HEADER END
//

//
// Copyright (c) 2014--2017, Regents of the University of Minnesota.
// All rights reserved.
//
// Contributors:
//    Ryan S. Elliott
//

//
// Release: This file is part of the kim-api.git repository.
//

#include <cstdio>
#include <cstring>
#include <sstream>


#ifndef CC_STRING
#error
#endif
#ifndef CXX_STRING
#error
#endif
#ifndef FC_STRING
#error
#endif
#ifndef LD_STRING
#error
#endif
#ifndef INCLUDES_STRING
#error
#endif
#ifndef CFLAGS_STRING
#error
#endif
#ifndef CXXFLAGS_STRING
#error
#endif
#ifndef FFLAGS_STRING
#error
#endif
#ifndef LDFLAGS_STRING
#error
#endif
#ifndef LDLIBS_STRING
#error
#endif
#ifndef XLANGLDLIBS_STRING
#error
#endif
#ifndef FNOMAINFLAG_STRING
#error
#endif
#ifndef OBJONLYFLAG_STRING
#error
#endif
#ifndef OUTPUTINFLAG_STRING
#error
#endif
#ifndef MAKEFILEKIMCONFIG_STRING
#error
#endif
#ifndef LIBEXECPATH_STRING
#error
#endif
#ifndef VERSION_STRING
#error
#endif


#define SUCCESS                     0
#define INVALID_NUMBER_OF_ARGUMENTS 1
#define UNKNOWN_OPTION              3

int processFlag(char const* const opt, std::stringstream * const outString)
{
  int result = SUCCESS;
  if (!strcmp(opt, "--includes"))
  {
    *outString << INCLUDES_STRING << " ";
    return result;
  }
  else if (!strcmp(opt, "--cflags"))
  {
    *outString << CFLAGS_STRING << " ";
    return result;
  }
  else if (!strcmp(opt, "--cxxflags"))
  {
    *outString << CXXFLAGS_STRING << " ";
    return result;
  }
  else if (!strcmp(opt, "--fflags"))
  {
    *outString << FFLAGS_STRING << " ";
    return result;
  }
  else if (!strcmp(opt, "--ldflags"))
  {
    *outString << LDFLAGS_STRING << " ";
    return result;
  }
  else if (!strcmp(opt, "--ldlibs"))
  {
    *outString << LDLIBS_STRING << " ";
    return result;
  }
  else if (!strcmp(opt, "--xlangldlibs"))
  {
    *outString << XLANGLDLIBS_STRING << " ";
    return result;
  }
  else if (!strcmp(opt, "--fnomainflag"))
  {
    *outString << FNOMAINFLAG_STRING << " ";
    return result;
  }
  else
  {
    result = UNKNOWN_OPTION;
    return result;
  }
}

int main(int argc, char* argv[])
{
  int result = SUCCESS;
  if (argc > 2)
  {
    std::stringstream outString;
    int i;
    for (i = 1; i < argc; ++i)
    {
      result = processFlag(argv[i], &outString);
      if (result != SUCCESS)
      {
        fprintf(stderr, "Incompatible or unknown options.\n");
        // drop through with UNKNOWN_OPTION
        break;
      }
    }
    if ((i == argc) && (result == SUCCESS))
    {
      outString << "\n";
      printf("%s", outString.str().c_str());
      return result;
    }
  }
  else if (argc == 2)
  {
    if (!strcmp(argv[1], "--master-config"))
    {
      printf(MAKEFILEKIMCONFIG_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--libexec-path"))
    {
      printf(LIBEXECPATH_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--cc"))
    {
      printf(CC_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--cxx"))
    {
      printf(CXX_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--fc"))
    {
      printf(FC_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--ld"))
    {
      printf(LD_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--objonlyflag"))
    {
      printf(OBJONLYFLAG_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--outputinflag"))
    {
      printf(OUTPUTINFLAG_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--version"))
    {
      printf(VERSION_STRING "\n");
      return result;
    }
    else if (!strcmp(argv[1], "--help"))
    {
      // drop through with SUCCESS
    }
    else
    {
      std::stringstream outString;
      result = processFlag(argv[1], &outString);
      if (result == SUCCESS)
      {
        outString << "\n";
        printf("%s", outString.str().c_str());
        return result;
      }
      // else drop through with UNKNOWN_OPTION
    }
  }
  else
  {
    result = INVALID_NUMBER_OF_ARGUMENTS;
  }

  fprintf(stderr, "Usage: %s option [option [...]]\n", argv[0]);
  fprintf(stderr, "  Stand-alone Options:\n");
  fprintf(stderr, "    --master-config\n");
  fprintf(stderr, "    --libexec-path\n");
  fprintf(stderr, "    --cc\n");
  fprintf(stderr, "    --cxx\n");
  fprintf(stderr, "    --fc\n");
  fprintf(stderr, "    --ld\n");
  fprintf(stderr, "    --objonlyflag\n");
  fprintf(stderr, "    --outputinflag\n");
  fprintf(stderr, "    --version\n");
  fprintf(stderr, "    --help\n");
  fprintf(stderr, "\n");
  fprintf(stderr, "  Combinable Options:\n");
  fprintf(stderr, "    --includes\n");
  fprintf(stderr, "    --cflags\n");
  fprintf(stderr, "    --cxxflags\n");
  fprintf(stderr, "    --fflags\n");
  fprintf(stderr, "    --ldflags\n");
  fprintf(stderr, "    --ldlibs\n");
  fprintf(stderr, "    --xlangldlibs\n");
  fprintf(stderr, "    --fnomainflag\n");
  return result;
}