*** Settings ***
Documentation       Keywords..

Library             Selenium2Library     timeout=60
Library             Collections
Library             String

*** Globals ***

*** Variables ***
${init_url}                             http://localhost
${browser}                              chrome
${alias}                                None
${seleniumhost}                         http://%{HUB_ADDR}:%{HUB_PORT}/wd/hub
${capabilities}                         None

*** Keywords ***
Init browser
    Open Browser                        ${init_url}   ${browser}    ${alias}     ${seleniumhost}
    Set Window Size                     ${1400}  ${900}
#    Maximize Browser Window

Terminite browser
    Close Browser
    # Close all browser at the end
    [Teardown]                          Selenium2Library.Close All Browsers

Open browser page
    [Arguments]                         ${page_url}
    Go to                               ${page_url}
    Log                                 Opened url at ${page_url} in ${browser}

Page click link
    [Arguments]                         ${link_locator}
    Click link                          ${link_locator}
