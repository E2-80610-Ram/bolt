/*
 * kmp_config.h -- Feature macros
 */
//===----------------------------------------------------------------------===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//
#ifndef KMP_CONFIG_H
#define KMP_CONFIG_H

#include "kmp_platform.h"

// cmakedefine01 MACRO will define MACRO as either 0 or 1
// cmakedefine MACRO 1 will define MACRO as 1 or leave undefined
#cmakedefine01 DEBUG_BUILD
#cmakedefine01 RELWITHDEBINFO_BUILD
#cmakedefine01 LIBOMP_USE_ITT_NOTIFY
#define USE_ITT_NOTIFY LIBOMP_USE_ITT_NOTIFY
#if ! LIBOMP_USE_ITT_NOTIFY
# define INTEL_NO_ITTNOTIFY_API
#endif
#cmakedefine01 LIBOMP_USE_VERSION_SYMBOLS
#if LIBOMP_USE_VERSION_SYMBOLS
# define KMP_USE_VERSION_SYMBOLS
#endif
#cmakedefine01 LIBOMP_HAVE_WEAK_ATTRIBUTE
#define KMP_HAVE_WEAK_ATTRIBUTE LIBOMP_HAVE_WEAK_ATTRIBUTE
#cmakedefine01 LIBOMP_HAVE_PSAPI
#define KMP_HAVE_PSAPI LIBOMP_HAVE_PSAPI
#cmakedefine01 LIBOMP_STATS
#define KMP_STATS_ENABLED LIBOMP_STATS
#cmakedefine01 LIBOMP_HAVE_X86INTRIN_H
#define KMP_HAVE_X86INTRIN_H LIBOMP_HAVE_X86INTRIN_H
#cmakedefine01 LIBOMP_HAVE___BUILTIN_READCYCLECOUNTER
#define KMP_HAVE___BUILTIN_READCYCLECOUNTER LIBOMP_HAVE___BUILTIN_READCYCLECOUNTER
#cmakedefine01 LIBOMP_HAVE___RDTSC
#define KMP_HAVE___RDTSC LIBOMP_HAVE___RDTSC
#cmakedefine01 LIBOMP_USE_DEBUGGER
#define USE_DEBUGGER LIBOMP_USE_DEBUGGER
#cmakedefine01 LIBOMP_OMPT_DEBUG
#define OMPT_DEBUG LIBOMP_OMPT_DEBUG
#cmakedefine01 LIBBOLT_OMPT_SUPPORT
#define OMPT_SUPPORT LIBBOLT_OMPT_SUPPORT
#cmakedefine01 LIBOMPTARGET_PROFILING_SUPPORT
#define OMPTARGET_PROFILING_SUPPORT LIBOMPTARGET_PROFILING_SUPPORT
#cmakedefine01 LIBOMP_OMPT_OPTIONAL
#define OMPT_OPTIONAL LIBOMP_OMPT_OPTIONAL
#cmakedefine01 LIBOMP_USE_ADAPTIVE_LOCKS
#define KMP_USE_ADAPTIVE_LOCKS LIBOMP_USE_ADAPTIVE_LOCKS
#define KMP_DEBUG_ADAPTIVE_LOCKS 0
#cmakedefine01 LIBOMP_USE_INTERNODE_ALIGNMENT
#define KMP_USE_INTERNODE_ALIGNMENT LIBOMP_USE_INTERNODE_ALIGNMENT
#cmakedefine01 LIBOMP_ENABLE_ASSERTIONS
#define KMP_USE_ASSERT LIBOMP_ENABLE_ASSERTIONS
#cmakedefine01 LIBOMP_USE_HIER_SCHED
#define KMP_USE_HIER_SCHED LIBOMP_USE_HIER_SCHED
#cmakedefine01 STUBS_LIBRARY
#cmakedefine01 LIBOMP_USE_HWLOC
#define KMP_USE_HWLOC LIBOMP_USE_HWLOC
#cmakedefine01 LIBOMP_ENABLE_SHARED
#define KMP_DYNAMIC_LIB LIBOMP_ENABLE_SHARED
#define KMP_ARCH_STR "@LIBBOLT_LEGAL_ARCH@"
#define KMP_LIBRARY_FILE "@LIBOMP_LIB_FILE@"
#define KMP_VERSION_MAJOR @LIBBOLT_VERSION_MAJOR@
#define KMP_VERSION_MINOR @LIBBOLT_VERSION_MINOR@
#cmakedefine01 LIBOMP_TSAN_SUPPORT
#if LIBOMP_TSAN_SUPPORT
#define TSAN_SUPPORT
#endif
#cmakedefine01 MSVC
#define KMP_MSVC_COMPAT MSVC
#cmakedefine01 LIBOMP_HAVE_WAITPKG_INTRINSICS
#define KMP_HAVE_WAITPKG_INTRINSICS LIBOMP_HAVE_WAITPKG_INTRINSICS
#cmakedefine01 LIBOMP_HAVE_RTM_INTRINSICS
#define KMP_HAVE_RTM_INTRINSICS LIBOMP_HAVE_RTM_INTRINSICS
#cmakedefine01 LIBOMP_HAVE_IMMINTRIN_H
#define KMP_HAVE_IMMINTRIN_H LIBOMP_HAVE_IMMINTRIN_H
#cmakedefine01 LIBOMP_HAVE_INTRIN_H
#define KMP_HAVE_INTRIN_H LIBOMP_HAVE_INTRIN_H
#cmakedefine01 LIBOMP_HAVE_ATTRIBUTE_WAITPKG
#define KMP_HAVE_ATTRIBUTE_WAITPKG LIBOMP_HAVE_ATTRIBUTE_WAITPKG
#cmakedefine01 LIBOMP_HAVE_ATTRIBUTE_RTM
#define KMP_HAVE_ATTRIBUTE_RTM LIBOMP_HAVE_ATTRIBUTE_RTM
#cmakedefine01 LIBOMP_ARCH_AARCH64_A64FX
#define KMP_ARCH_AARCH64_A64FX LIBOMP_ARCH_AARCH64_A64FX

#cmakedefine01 LIBOMP_USE_ARGOBOTS
#define KMP_USE_ABT LIBOMP_USE_ARGOBOTS

#cmakedefine01 LIBOMP_REMOVE_FORKJOIN_LOCK
#define KMP_REMOVE_FORKJOIN_LOCK LIBOMP_REMOVE_FORKJOIN_LOCK

// Configured cache line based on architecture
#if KMP_ARCH_PPC64
# define CACHE_LINE 128
#elif KMP_ARCH_AARCH64_A64FX
# define CACHE_LINE 256
#else
# define CACHE_LINE 64
#endif

#if ! KMP_32_BIT_ARCH
# define BUILD_I8 1
#endif

#define KMP_NESTED_HOT_TEAMS 1
#define KMP_ADJUST_BLOCKTIME 1
#define BUILD_PARALLEL_ORDERED 1
#define KMP_ASM_INTRINS 1
#if !KMP_USE_ABT
#  define USE_ITT_BUILD LIBOMP_USE_ITT_NOTIFY
#else
#  define USE_ITT_BUILD 0
#endif
#define INTEL_ITTNOTIFY_PREFIX __kmp_itt_
#if ! KMP_MIC && ! KMP_USE_ABT
# define USE_LOAD_BALANCE 1
#endif
#if ! (KMP_OS_WINDOWS || KMP_OS_DARWIN)
# define KMP_TDATA_GTID 1
#endif
#if STUBS_LIBRARY
# define KMP_STUB 1
#endif
#if DEBUG_BUILD || RELWITHDEBINFO_BUILD
# define KMP_DEBUG 1
#endif

#if KMP_OS_WINDOWS
# define KMP_WIN_CDECL
#else
# define BUILD_TV
# define KMP_GOMP_COMPAT
#endif

#endif // KMP_CONFIG_H
