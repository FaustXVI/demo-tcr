#!/usr/bin/env bash
source runTests.sh

function sync() {
    if [[ -z  `git stash list | grep "stash@{0}.*Rebasing"` ]]
    then
        git stash push -m "Rebasing"
    fi
    git rebase -i --autosquash origin/master \
    && git fetch \
    && git rebase origin/master \
    && runTest \
    && git push \
    && \
    if [[ -z  `git stash list | grep "stash@{0}.*Rebasing"` ]]
    then
        git stash pop
    fi
}

if [[ "$0" == "$BASH_SOURCE" ]]
then
    sync
fi
