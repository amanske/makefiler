.PHONY: run-app run-app-default-config lint test get-most-recent-logfile tail-logs

.SILENT: run-app lint test get-most-recent-logfile tail-logs

include Env.mk

# '-include' does not generate an error if the included file doesn't exist
-include Examples.mk

# ?= sets the variable, if it's not already defined
CODE_DIR?=.
lint:
	echo "Running pylint on $(CODE_DIR)"
	# pylint $(CODE_DIR)

	echo "Running flake8 on $(CODE_DIR)"
	# flake8 $(CODE_DIR)

TEST_DIR?=test
test: lint
	echo "Running tests from $(TEST_DIR)"
	# ./run_tests.sh --flags

DEFAULT_CONFIG?=default_config.ini
run-app-default-config:
	echo "Running app with --config=$(DEFAULT_CONFIG)"
	# ./app --config $(DEFAULT_CONFIG)

run-app:
	[[ -n "${CONFIG}" ]] || { echo "Config file not specified." 2>&1; exit 1; }
	echo "Running app with --config=$(CONFIG)"

get-most-recent-logfile:
	ls -t logs | head -n1 2>&1

LOG_FILE?=
LOGS_DIR?=
tail-logs:
	tail -f $(LOGS_DIR)/$(LOG_FILE)
