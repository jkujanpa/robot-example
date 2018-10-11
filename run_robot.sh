#!/bin/sh

# Inputs
ROBOT_OPTIONS=$1
CUSTOM_TEST_DIR=$2

# Set the defaults
DEFAULT_LOG_LEVEL="INFO" # Available levels: TRACE, DEBUG, INFO (default), WARN, NONE (no logging)
DEFAULT_RES="1920x1080x24"
DEFAULT_DISPLAY=":99"
DEFAULT_ROBOT_TESTS="false"
DEFAULT_OUTPUT_DIR="/tmp/"

# Use default if none specified as env var
LOG_LEVEL=${LOG_LEVEL:-$DEFAULT_LOG_LEVEL}
OUTPUT_DIR=${OUTPUT_DIR:-$DEFAULT_OUTPUT_DIR}
RES=${RES:-$DEFAULT_RES}
DISPLAY=${DISPLAY:-$DEFAULT_DISPLAY}
ROBOT_TESTS=${ROBOT_TESTS:-$DEFAULT_ROBOT_TESTS}
# echo $HOSTS >> /etc/hosts

if [ "$ROBOT_TESTS" = "false" ]; then
  echo "Error: Please specify the robot test or directory as env var ROBOT_TESTS"
  exit 1
elif [ -z "$CUSTOM_TEST_DIR" ]; then
  echo "Use default test dir"
  echo "Running tests from: $ROBOT_TESTS"
elif [ $CUSTOM_TEST_DIR = "all" ]; then
  echo "Run all tests in every folder"
  ROBOT_TESTS=/tmp/tests/
else
  ROBOT_TESTS=/tmp/tests/$CUSTOM_TEST_DIR
  echo "Running tests from: $CUSTOM_TEST_DIR"
fi

if [ ! -z "$ROBOT_OPTIONS" ]; then
  echo "Executing robot tests with options: $ROBOT_OPTIONS"
  echo "Use option '-h' to get list of arguments"
fi

# Clean old screenshots from output folder
rm  ${OUTPUT_DIR}/*.png 2>/dev/null

# Execute tests
echo
echo "#######################################"
echo "# Running tests                       #"
echo "#######################################"
echo
echo "robot ${ROBOT_OPTIONS} --outputdir ${OUTPUT_DIR} ${ROBOT_TESTS}"
echo

robot ${ROBOT_OPTIONS} --outputdir ${OUTPUT_DIR} ${ROBOT_TESTS}
