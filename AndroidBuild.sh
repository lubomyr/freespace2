#!/bin/sh

LOCAL_PATH=`dirname $0`
LOCAL_PATH=`cd $LOCAL_PATH && pwd`

JOBS=1

ln -sf libglshim.a $LOCAL_PATH/../../../obj/local/armeabi-v7a/libGL.a

if [ "$1" = armeabi-v7a ]; then
env CFLAGS="-include ../../android_debug.h" \
../setEnvironment-armeabi-v7a.sh sh -c "cd freespace2 && make -j$JOBS" && mv -f freespace2/freespace2 libapplication-armeabi-v7a.so
fi
