*** Settings ***
Documentation       Example test case
Resource            test-example-resources.robot
Test Setup          Init browser
Test Teardown       Terminite browser

*** Test Cases ***
Example open browser
    [Documentation]    Open google page with ${browser}
    [Tags]    smoke
    # Open browser with url as parameters
    Open browser page  http://www.google.fi
    # Screenshot page
    Capture Page Screenshot
