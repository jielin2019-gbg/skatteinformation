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
   Set Window Size    ${1920}    ${1080}
Close page
   Close Browser

*** Test Cases ***
Saving an article
    [Documentation]     Test saving function in edit page
    [Tags]              saving
    # Login
    Login Editor
    Wait Until Page Contains    infotiv-editor
    #Go to Create Article
    Go to                       https://test.skatteinformation.se/node/add/article
    #Input text in Title
    Input Text                  xpath://*[@id="edit-title-0-value"]     Test artikel
    #Save article
    Click Element               id:edit-submit
    #Check if article is saved
    Wait Until Page Contains    Test artikel (Artikel) har skapats.
    #Remove created article
    Click Element               xpath://*[@id="block-skatteinfo-local-tasks"]/ul/li[3]/a
    Wait Until Page Contains    Är du säker på att du vill radera content item Test artikel?
    Click Element               id:edit-submit
    Wait Until Page Contains    Artikel Test artikel har raderats.