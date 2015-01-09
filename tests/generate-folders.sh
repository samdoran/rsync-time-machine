#!/bin/bash
#
# Generate test data for rsync-time-machine.sh

PROGRAM=$(basename $0)
HOST=$(hostname)
TEST_SOURCE="./Test Source"
TEST_DESTINATION="./Test Destination/${HOST}"


# --- Functions --- #

die() {
    echo "$PROGRAM: $1" >&2
    exit ${2:-1}
}

gen_source() {
    if [[ ! -d "$TEST_SOURCE" ]]; then
        mkdir "$TEST_SOURCE"
    fi
}

gen_dirs() {

    if [[ ! -d "$TEST_DESTINATION" ]]; then
        mkdir -p "$TEST_DESTINATION"
    fi

    for (( year = $(( $(date "+%Y") - ${1:-2} )); year <= $(date "+%Y"); year++ )); do
        for (( month = 1; month <= 12; month++ )); do
            for (( day = 1; day <= 30; day++ )); do
                mkdir -p "${TEST_DESTINATION}/$(date "+${year}-$(printf "%02d" $month)-$(printf "%02d" $day)-%H%M%S")"
            done
        done
    done
}

cleanup() {
    rm -rf "./${TEST_DESTINATION}"
}



# --- Main --- #

if [[ -d "$TEST_DESTINATION" ]]; then
    cleanup
fi

gen_dirs 5
