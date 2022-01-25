#!/bin/bash

set -eou pipefail

which make || { echo "Missing 'make'." 2>&1; exit 1; }
# which pylint || { echo "Missing 'pylint'." 2>&1; exit 1; }
# which flake8 || { echo "Missing 'flake8'." 2>&1; exit 1; }

make test
# make run-app-default-config
CONFIG=my-config.ini make run-app &

LOG_FILE=$(make get-most-recent-logfile) make tail-logs

echo "Dummy CI completed successfully"
