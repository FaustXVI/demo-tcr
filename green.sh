#!/usr/bin/env bash
source commons.sh

runTest && (commit && sync) || revert