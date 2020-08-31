*** Settings ***
Documentation     Test if as an editor you can create a notice (automation)
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Test Setup  Go To Page
Test Teardown  Close page

*** Variables ***
${BROWSER} =        chrome

*** Keywords ***
Go To Page
   Open Browser  ${URL}  ${BROWSER}
   Set Window Size    ${1920}    ${1080}
Close page
   Close Browser

*** Test Cases ***
Create a Notice
    [Documentation]     Test to create a notice
    [Tags]              Create
    # Login
    Login Editor
    Wait Until Page Contains    infotiv-editor
     #Go to Create Notice
    Go to                       https://test.skatteinformation.se/node/add/short_story
    Input Text                  xpath://*[@id="edit-title-0-value"]      First Notice
    Click Element               id:edit-submit
    Wait Until Page Contains    First Notice

   # Delete a notice

   Click Link                  xpath://*[@id="block-skatteinfo-local-tasks"]/ul/li[3]/a
   Wait Until Page Contains    Är du säker på att du vill radera content item First Notice?
   Click Element               id:edit-submit
   Wait Until Page Contains    Notis First Notice har raderats.



