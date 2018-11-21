#!/usr/bin/env bash
source runTests.sh

function commit() {
    git add .
    git commit --squash=lastRed
}

function revert() {
    git reset --hard
    git clean -f
}

runTest && commit || revert