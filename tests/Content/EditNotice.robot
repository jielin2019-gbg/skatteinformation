*** Settings ***
Documentation     test functionality for the editing of Notis
Library           SeleniumLibrary
Library           String
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

    Go to                       https://test.skatteinformation.se/node/add/short_story
    Input Text                  xpath://*[@id="edit-title-0-value"]      Test Notice
    Click Element               id:edit-submit
    Wait Until Page Contains    Test Notice
    ${url} =                    Get Location
    ${ID} =                     Get Substring  ${url}  40  45
    Set Global Variable         ${ID}

    #Go to content page to edit the Notis
    Go to                       https://test.skatteinformation.se/admin/content
    Click Link                  Test Notice
    Click Element               xpath://*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Wait Until Page Contains    Redigera Notis Test Notice

    # Edit the notice description
    Input Text                  xpath://*[@id="edit-field-preamble-0-value"]     Description of test notice has been changed.

    #Save the edited Notice
    Click Element               id:edit-submit
    Wait Until Page Contains    Test Notice (Notis) har uppdaterats.

    #Delete notice
    Go To                       https://test.skatteinformation.se/node/${ID}/delete
    Wait Until Page Contains    Är du säker på att du vill radera content item
    Click Element               id:edit-submit
    Wait Until Page Contains    har raderats.

