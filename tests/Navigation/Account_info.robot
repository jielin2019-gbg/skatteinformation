*** Settings ***
Documentation     This is some basic info about the whole test suite
Library           SeleniumLibrary
Resource	      ../Resources/login_keywords.robot
Resource	      ../Resources/login_variables.robot
Test Setup  Go To Page
Test Teardown  Close page

*** Variables ***
${BROWSER} =        chrome

*** Keywords ***
Go To Page
   Open Browser  ${URL}  ${BROWSER}
   Maximize Browser Window
   Set Selenium Speed          0.9
Close page
      Close Browser
Varify login as user
      Wait Until Page Contains    Logga ut


*** Test Cases ***
User can able to acces own account details
    [Documentation]     User can able to access own account details with one click
    [Tags]              Check occount details
    Login User
    Wait Until Page Contains    Logga ut
    Click Element               xpath://*[@id="block-utility-menu"]/ul/li[2]/a
    Wait Until Page Contains    Personlig information
