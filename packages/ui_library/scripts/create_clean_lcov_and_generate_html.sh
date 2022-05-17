#!/bin/bash
set -e
flutter pub get
sh scripts/import_files_coverage.sh ui_library
flutter test --coverage
lcov --remove coverage/lcov.info \
-o coverage/lcov.info
if [ -n "$1" ]
then
    if [ "$1" = true ]
    then
        genhtml coverage/lcov.info -o coverage
        open coverage/index.html
    fi
fi