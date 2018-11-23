#!/usr/bin/env bash
source commons.sh

runTest && revert || commit
