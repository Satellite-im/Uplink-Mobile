#!/bin/bash

FILE1=android/app/src/main/jniLibs/arm64-v8a/libwarp.so
if [ -f "$FILE1" ]; then
    echo "$FILE1 exists."
else 
    wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/arm64-v8a/libwarp.so -P android/app/src/main/jniLibs/arm64-v8a
fi

FILE2=android/app/src/main/jniLibs/arm64-v8a/libwarp_mp_ipfs.so
if [ -f "$FILE2" ]; then
    echo "$FILE2 exists."
else 
    wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/arm64-v8a/libwarp_mp_ipfs.so -P android/app/src/main/jniLibs/arm64-v8a
fi