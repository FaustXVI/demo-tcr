#!/usr/bin/env bash
if [[ -z `git diff | grep "^\+.*@Test"` ]]
then
    ./green.sh
else
    ./red.sh
fi