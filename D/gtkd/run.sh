#!/bin/sh
set -ex
trap "rm -f demo.exe" EXIT
gdc gtkdgl.d `pkg-config gtkd-3 gl --cflags --libs` -o demo.exe
./demo.exe
