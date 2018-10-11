#!/bin/bash

# Clean output folder
rm -f ./output/*.html
rm -f ./output/*.xml
rm -f ./output/*.png

echo "start selenium to background"
/opt/bin/entry_point.sh > /dev/null 2>&1 &

echo "wait for selenium"
./wait-for-selenium.sh "localhost:4444" "./run_robot.sh"

# Kill selenium
ps uax | grep "selenium\|xvfb" | awk '{print $2}' | xargs kill -9 > /dev/null

exit 0
