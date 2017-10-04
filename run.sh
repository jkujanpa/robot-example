#!/bin/sh

FIRSTPARAMETER=$1

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
elif [ -z "$FIRSTPARAMETER" ]; then
  echo "Use default test dir"
  echo "Running tests from: $ROBOT_TESTS"
elif [ $FIRSTPARAMETER = "all" ]; then
  echo "Run all tests in every folder"
  ROBOT_TESTS=/tmp/tests/
else
  ROBOT_TESTS=/tmp/tests/$FIRSTPARAMETER
  echo "Running tests from: $ROBOT_TESTS"
fi

# Clean old screenshots from output folder
rm  ${OUTPUT_DIR}/*.png

# Execute tests
echo -e "Executing robot tests at log level ${LOG_LEVEL}"

echo
echo "#######################################"
echo "# Running tests                       #"
echo "#######################################"
echo

robot --loglevel ${LOG_LEVEL}  --outputdir ${OUTPUT_DIR} ${ROBOT_TESTS}

