#!/usr/bin/env bash
source commons.sh

sync && (runTest && revert || commit)
