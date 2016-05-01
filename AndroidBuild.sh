#!/bin/sh

LOCAL_PATH=`dirname $0`
LOCAL_PATH=`cd $LOCAL_PATH && pwd`

JOBS=1

ln -sf libglshim.a $LOCAL_PATH/../../../obj/local/$1/libGL.a

env CFLAGS="-include ../../android_debug.h" \
../setEnvironment-$1.sh sh -c "cd freespace2 && make -j$JOBS" && mv -f freespace2/freespace2 libapplication-$1.so

