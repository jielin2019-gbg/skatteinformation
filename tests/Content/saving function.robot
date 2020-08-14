*** Settings ***
Documentation     Test functionality of saving an article (automation)
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
    [Documentation]     Test saving function in edit page
    [Tags]              saving
    Login Editor
    Wait Until Page Contains    infotiv-editor
    Click Element               class:toolbar-icon-system-admin-content
    Wait Until Page Contains    Lägg till innehåll
    Click Element               xpath://*[@id="block-seven-local-actions"]/ul/li/a
    Wait Until Page Contains    Artikel
    Click Element               xpath://*[@id="block-seven-content"]/ul/li[1]/a
    Input Text                  xpath://*[@id="edit-title-0-value"]     Test artikel
    Click Element               id:edit-submit
    Wait Until Page Contains    Test artikel (Artikel) har skapats.
    Click Element               xpath://*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Input Text                  xpath://*[@id="edit-title-0-value"]     Test artikel 1
    Click Element               id:edit-submit
    Wait Until Page Contains    Test artikel 1 (Artikel) har uppdaterats.
    Element Should Contain      class:field--name-title  Test artikel 1
    Click Element               class:toolbar-icon-system-admin-content
    Wait Until Page Contains    Lägg till innehåll
    Table Should Contain        class:views-table   Test artikel 1
    Click Element               class:dropbutton-toggle
    Click Element               class:delete
    Wait Until Page Contains    Är du säker på att du vill radera content item Test artikel 1?
    Click Element               id:edit-submit
    Wait Until Page Contains    Artikel Test artikel 1 har raderats.