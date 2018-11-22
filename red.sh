#!/usr/bin/env bash
source commons.sh
source sync.sh

sync && (runTest && revert || commit)
