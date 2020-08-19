*** Settings ***
Documentation     test functionality for the editing on the edit page(automation)
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
   Set Window Size    ${1920}    ${1080}
Close page
   Close Browser

*** Test Cases ***
Saving an article
    [Documentation]     Test editing function on edit page
    [Tags]              editing
    # Login
    Login Editor
    Wait Until Page Contains    infotiv-editor
    #Go to content page
    Go to                       https://test.skatteinformation.se/admin/content
    #Edit article
    Click Element               //a[contains(text(),'test artikel team 1')]/../../td[7]/div/div/ul/li[contains(@class, 'edit')]/a
    Wait Until Page Contains    Redigera Artikel test artikel team 1
    #Change Title
    Input Text                  xpath://*[@id="edit-title-0-value"]     Edited article test
    #Save article
    Click Element               id:edit-submit
    #Check if article is saved
    Wait Until Page Contains    Edited article test (Artikel) har uppdaterats.
    #Redo editing
    Click Element               //a[contains(text(),'Edited article test')]/../../td[7]/div/div/ul/li[contains(@class, 'edit')]/a
    Wait Until Page Contains    Redigera Artikel Edited article test
    Input Text                  xpath://*[@id="edit-title-0-value"]     test artikel team 1
    Click Element               id:edit-submit
    Wait Until Page Contains    test artikel team 1 (Artikel) har uppdaterats.