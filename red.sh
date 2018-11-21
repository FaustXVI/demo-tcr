#!/usr/bin/env bash
source runTests.sh

function sync() {
    git stash push -m "Rebasing"
    git fetch
    git rebase -i --autosquash origin/master
    git push
    git stash pop
}

function commit() {
    sync
    git add .
    git commit
    # use ref
    git tag -f lastRed
}

function revert() {
    git reset --hard
    git clean -f
}

runTest && revert || commit
