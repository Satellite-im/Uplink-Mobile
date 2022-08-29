#!/bin/bash

FILE1=android/app/src/main/jniLibs/arm64-v8a/libwarp.so
if [ -f "$FILE1" ]; then
    echo "$FILE1 exists."
else 
    wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/arm64-v8a/libwarp.so -P android/app/src/main/jniLibs/arm64-v8a
    wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/arm64-v8a/libwarp_mp_ipfs.so -P android/app/src/main/jniLibs/arm64-v8a
fi

FILE2=android/app/src/main/jniLibs/x86/libwarp_mp_ipfs.so
if [ -f "$FILE2" ]; then
    echo "$FILE2 exists."
else 
    wget wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/x86/libwarp.so -P android/app/src/main/jniLibs/x86
    wget wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/x86/libwarp_mp_ipfs.so -P android/app/src/main/jniLibs/x86
fi

FILE3=android/app/src/main/jniLibs/x86_64/libwarp.so
if [ -f "$FILE3" ]; then
    echo "$FILE3 exists."
else 
    wget wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/x86_64/libwarp.so -P android/app/src/main/jniLibs/x86_64
    wget wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/x86_64/libwarp_mp_ipfs.so -P android/app/src/main/jniLibs/x86_64
fi

FILE4=android/app/src/main/jniLibs/armeabi-v7a/libwarp.so
if [ -f "$FILE4" ]; then
    echo "$FILE4 exists."
else 
    wget wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/armeabi-v7a/libwarp.so -P android/app/src/main/jniLibs/armeabi-v7a
    wget wget https://raw.githubusercontent.com/Satellite-im/warp-dart/main/android/src/main/jniLibs/armeabi-v7a/libwarp_mp_ipfs.so -P android/app/src/main/jniLibs/armeabi-v7a
fi