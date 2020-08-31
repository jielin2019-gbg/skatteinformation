*** Settings ***
Documentation     test functionality for the editing of Notis
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
Saving an article
    [Documentation]     Test editing function of a Notis
    [Tags]              editing

    # Login as an Editor
    Login Editor
    Wait Until Page Contains    infotiv-editor

    #Go to content page to edit the Notis
    Go to                       https://test.skatteinformation.se/admin/content
    Click Link                  test notice
    Click Element               xpath://*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Wait Until Page Contains    Redigera Notis test notice

    # Edit the notice description
    Input Text                  xpath://*[@id="edit-field-preamble-0-value"]     Description of test notice has been changed.

    #Save the edited Notice
    Click Element               id:edit-submit
    Wait Until Page Contains    test notice (Notis) har uppdaterats.

