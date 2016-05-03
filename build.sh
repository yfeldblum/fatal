#!/bin/sh

. ./scripts.inc

set -e

if [ "$NO_CLEAR" != "true" ]; then
  lclear
fi

if [ -z "$USE_CC" ]; then
  for cc in $full_compilers_list; do
    if which $cc; then
      USE_CC="$cc" NO_CLEAR=true "$0" "$@"
    fi
  done
else
  for f in `find ./fatal -name \*.cpp`; do
    CC_OPT="-O0" USE_CC="$USE_CC" NO_CLEAR=true ./compile.sh "$f" "$@"
  done
fi
