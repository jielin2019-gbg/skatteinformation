*** Settings ***
Documentation     test functionality of the add button on content page (automation)
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Test Setup  Go To Page
Test Teardown  Close page

*** Variables ***
${BROWSER} =        headlesschrome

*** Keywords ***
Go To Page
   Open Browser  ${URL}  ${BROWSER}
   Maximize Browser Window
Close page
   Close Browser

*** Test Cases ***
Saving an article
    [Documentation]     Test of the add button on content page
    [Tags]              saving
    Login Editor
    Wait Until Page Contains    infotiv-editor
    Go To                       https://test.skatteinformation.se/admin/content
    Wait Until Page Contains    Lägg till innehåll
    Click Element               xpath://*[@id="block-seven-local-actions"]/ul/li/a
    Wait Until Page Contains    Artikel