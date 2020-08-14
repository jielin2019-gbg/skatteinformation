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
    The User Log In Successfully

Visit Mitt Konto Page
    The User Log In Successfully
    The User Visit Mitt Konto Settings
    The User Is On The Settings Page

*** Keywords ***
Skatteinformation Website Is Open
    Open Browser                        ${URL}     ${BROWSER}
    Maximize Browser Window

The User Log In Successfully
    Login User
    Page Should Contain                 Senaste nytt

The User Visit Mitt Konto Settings
    Click Link                          link:Mitt konto

The User Is On The Settings Page
    ${url}=      Get Location
    Should Match    ${url}              https://test.skatteinformation.se/user/8624/edit
