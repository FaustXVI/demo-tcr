#!/usr/bin/env bash
BRANCH=origin/master

function runTest() {
    ./gradlew test
}

function testJustAdded(){
    [[ ! -z `git diff HEAD | grep "^\+.*@Test"` ]]
}

function notSynchronisedYet(){
    [[ ! -z `git diff ${BRANCH} HEAD` ]]
}

function needsPull(){
    [[ ! -z `git fetch --dry-run` ]]
}

function commit() {
    git add . && \
    if testJustAdded; then
        git commit
    elif notSynchronisedYet; then
        git commit --amend --no-edit --allow-empty-message
    else
        git commit --allow-empty-message -m ""
    fi
}

function revert() {
    git reset --hard
    git clean -f
}

function pull(){
    if needsPull; then
        git pull --rebase
    fi
}

function push() {
    if notSynchronisedYet; then
        runTest && git push
    fi
}

KNOWN_AS_GREEN=false
KNOWN_AS_RED=false

while [[ $# -gt 0 ]]
do
    key="$1"

    case ${key} in
        -g|--green)
            KNOWN_AS_GREEN=true
            shift
            ;;
        -r|--red)
            KNOWN_AS_RED=true
            shift
            ;;
        *)
            shift
            ;;
    esac
done

if ${KNOWN_AS_RED} || (! ${KNOWN_AS_GREEN} && testJustAdded)
then
    runTest && revert || commit
    pull
else
    runTest && commit || revert
    pull && push
fi