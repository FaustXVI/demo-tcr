#!/usr/bin/env bash
BRANCH=origin/master

function runTest() {
    ./gradlew test
}

function isRed(){
    [[ ! -z `git diff | grep "^\+.*@Test"` ]]
}

function isGettingGreen(){
    [[ ! -z `git diff ${BRANCH} HEAD` ]]
}

function commit() {
    git add . && \
    if isRed; then
        git commit
    elif isGettingGreen; then
        git commit --amend --no-edit
    else
        git commit --allow-empty-message -m ""
    fi
}

function revert() {
    git reset --hard
    git clean -f
}

function sync() {
    git rebase ${BRANCH} \
    && runTest \
    && git push
}

if isRed
then
    runTest && revert || commit
else
    runTest && (commit && sync) || revert
fi