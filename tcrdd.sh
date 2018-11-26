#!/usr/bin/env bash
RED_REF=refs/isRed

function runTest() {
    ./gradlew test
}

function testJustAdded(){
    [[ ! -z `git diff HEAD | grep "^\+.*@Test"` ]]
}

function lastCommitRed(){
    [[ -z `git diff ${RED_REF} HEAD` ]]
}

function needsPull(){
    [[ -z `git fetch --dry-run` ]]
}

function commitRed() {
    git add . && \
    if lastCommitRed; then
        git commit --amend
    else
        git commit
    fi && \
    git update-ref ${RED_REF}
}

function commitGreen() {
    git add . && \
    if lastCommitRed; then
        git commit --amend --no-edit
    else
        git commit --allow-empty-message -m ""
    fi && \
    git update-ref -d ${RED_REF}
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
    if lastCommitRed; then
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
    runTest && revert || commitRed
    pull
else
    runTest && commitGreen || revert
    pull && push
fi