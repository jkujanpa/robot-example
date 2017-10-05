*** Settings ***
Documentation       Example test case
Resource            test-example-resources.robot
Test Setup          Init browser
Test Teardown       Terminite browser

*** Test Cases ***
Open Google.fi
    [Documentation]    Open google page with ${browser}
    [Tags]    smoke
    # Open browser with url as parameters
    Open browser page  http://www.google.fi
    # Verify page
    Title should be  Google
    # Screenshot page
    Capture Page Screenshot

Open Google.fi på svenska
    [Documentation]    Open google page with ${browser}
    [Tags]
    # Open browser with url as parameters
    Open browser page  http://www.google.fi
    # Screenshot page
    Capture Page Screenshot
    # Click link
    Page click link  //*[@id="als"]//a[text()[contains(.,'svenska')]]
    # Screenshot page
    Capture Page Screenshot
