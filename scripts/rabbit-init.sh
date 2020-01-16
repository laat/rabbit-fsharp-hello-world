#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

curl -u guest:guest -X PUT http://localhost:15672/api/vhosts/console-test
