#!/bin/bash
set -ex
npm install -g appium@next
appium -v
appium driver install xcuitest
appium driver list
