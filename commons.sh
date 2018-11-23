#!/usr/bin/env bash

BRANCH=origin/master

function runTest() {
    ./gradlew test
}

function commit() {
    git add . && \
    if [[ -z `git diff ${BRANCH} HEAD` ]]
    then
        if [[ -z `git diff | grep "^\+.*@Test"` ]]
        then
            # refactor
            git commit --allow-empty-message
        else
            # red
            git commit
        fi
    else
        # green
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