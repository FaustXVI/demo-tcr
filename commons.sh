#!/usr/bin/env bash

BRANCH=origin/master

function runTest() {
    ./gradlew test
}

function commit() {
    git add .
    if [[ -z `git diff ${BRANCH} HEAD` ]]
    then
        git commit
        git update-ref firstCommitAfterSync HEAD
    else
        git commit --squash=firstCommitAfterSync
    fi
}

function revert() {
    git reset --hard
    git clean -f
}

function sync() {
    if [[ -z  `git stash list | grep "stash@{0}.*Rebasing"` ]]
    then
        git stash push -m "Rebasing"
    fi
    git rebase -i --autosquash ${BRANCH} \
    && git fetch \
    && git rebase ${BRANCH} \
    && runTest \
    && git push \
    && \
    if [[ ! -z  `git stash list | grep "stash@{0}.*Rebasing"` ]]
    then
        git stash pop
    fi
}