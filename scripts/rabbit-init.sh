#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o nounset
set -o xtrace

# change workdir relative to this scirpt
cd "$(dirname "${BASH_SOURCE[0]}")"

curl http://localhost:15672/cli/rabbitmqadmin -o "rabbitmqadmin"
chmod +x "rabbitmqadmin"

./rabbitmqadmin declare vhost name=console-test

# curl -u guest:guest -X PUT http://localhost:15672/api/vhosts/console-test
