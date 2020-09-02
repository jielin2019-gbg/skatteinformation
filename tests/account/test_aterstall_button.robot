*** Settings ***
Documentation                           Reset the password before logging in
Library                                 SeleniumLibrary
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/login_variables.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Close All Browsers

*** Variables ***
${BROWSER} =                            chrome

*** Test Cases ***
Check if återställ mitt lösenord button works
    Page Should Contain                 Återställ ditt lösenord
    Click Element                       //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Location Should Contain	            https://test.skatteinformation.se/user/password