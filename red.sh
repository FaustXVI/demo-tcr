#!/usr/bin/env bash
source runTests.sh
source sync.sh

function commit() {
    git add .
    git commit
    git update-ref lastRed HEAD
}

function revert() {
    git reset --hard
    git clean -f
}

sync && (runTest && revert || commit)
