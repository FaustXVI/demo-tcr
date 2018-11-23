#!/usr/bin/env bash
source commons.sh

if isRed
then
    runTest && revert || commit
else
    runTest && (commit && sync) || revert
fi