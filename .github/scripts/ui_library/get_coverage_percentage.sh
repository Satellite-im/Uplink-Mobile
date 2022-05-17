#!/bin/bash
set -e
PATH_COVERAGE=$1
# Change this variable to increase or downgrade the min coverage percentage:
MIN_COVERAGE_PERC=30

percentageRate=$(lcov --summary "$PATH_COVERAGE" | grep "lines......" | cut -d ' ' -f 4 | cut -d '%' -f 1)

RED='\033[0;31m'
GREEN='\033[0;32m'

if [ "$(echo "${percentageRate} < $MIN_COVERAGE_PERC" | bc)" -eq 1 ]; then
    printf "${RED}Error: Your coverage rate is to low, expected ${MIN_COVERAGE_PERC}%% but have ${percentageRate}%.\n"
    printf "${RED}Please add more tests to cover your code.\n"
    printf "${RED}To see in local your coverage rate use:\n"
    printf "${RED}    sh scripts/create_clean_lcov_and_generate_html.sh true\n"
    exit 1
else
    printf "${GREEN}Coverage rate is fine 👍. Build continue...\n"
fi