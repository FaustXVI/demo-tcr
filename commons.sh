#!/usr/bin/env bash

BRANCH=origin/master

function runTest() {
    ./gradlew test
}

function commit() {
    git add . && \
    if [[ -z `git diff ${BRANCH} HEAD` ]]
    then
        git commit
    else
        git commit --amend --no-edit
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