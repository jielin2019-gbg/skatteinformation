*** Settings ***
Documentation                           Change daily email, weekly email settings in Mitt Konto
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Close All Browsers

*** Variables ***
${BROWSER} =                            chrome

*** Test Cases ***

Log In
    Page Should Not Contain Element    id=block-sitebranding
    The User Log In Successfully



*** Keywords ***
Skatteinformation Website Is Open
    Open Browser                        ${URL}     ${BROWSER}
    Maximize Browser Window

The User Log In Successfully
    Login ResetUser
    ${url}=                             Get Location
    Should Match                        ${url}      https://test.skatteinformation.se/start
    Page Should Contain Element         id=block-sitebranding