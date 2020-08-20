*** Settings ***
Documentation                            As a user I want to reset my password so that I can log in (when I have forgotten my password)
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/teardown_keywords.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Logout And Close All

*** Variables ***
${BROWSER} =                            chrome

*** Test Cases ***
Test Glöm Ditt Lösenord link
    Click Link Glöm Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page
    Submit Email Address

*** Keywords ***
Click Link Glöm Ditt Lösenord
    ${ele}      Get WebElement          xpath://a[contains(text(),'glömt ditt lösenord')]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}

The Page Should Navigate to Återställ Ditt Lösenord Page
    ${url}=      Get Location
    Should Match    ${url}              https://test.skatteinformation.se/user/password
    Page Should Contain                 Återställ ditt lösenord

Submit Email Address
    Input Text                          id:edit-name    ${RESET_EMAIL}
    Click Button                        id:edit-submit
    Page Should Contain                 Ytterligare instruktioner har skickats till din e-postadress.



