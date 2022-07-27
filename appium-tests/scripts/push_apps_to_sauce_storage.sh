#!/bin/bash

VERSION='0.4.0'
SAUCE_ACCESS_KEY='006c7097-3e08-48a6-83de-91839ef666d5'
SAUCE_USERNAME='oauth-lcard54-d9aa6'

## US
# Android
curl \
  -F "payload=@../apps/Android-NativeDemoApp-$VERSION.apk" \
  -F name=wdio-demo-app-android.apk \
  -u "$SAUCE_USERNAME:$SAUCE_ACCESS_KEY"  \
  'https://api.us-west-1.saucelabs.com/v1/storage/upload'
# iOS
curl \
  -F "payload=@../apps/iOS-Simulator-NativeDemoApp-$VERSION.app.zip" \
  -F name=wdio-demo-app-ios.zip \
  -u "$SAUCE_USERNAME:$SAUCE_ACCESS_KEY"  \
  'https://api.us-west-1.saucelabs.com/v1/storage/upload'
