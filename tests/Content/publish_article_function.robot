*** Settings ***
Documentation     Test publish and unpublish article function (automation)
Library           SeleniumLibrary
Library           String
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
    [Documentation]     Test publish and unpublish article function
    # Login
    Login Editor
    Wait Until Page Contains    infotiv-editor
    #Go to Create Article
    Go to                       https://test.skatteinformation.se/node/add/article
    #Input text in Title
    Input Text                  xpath://*[@id="edit-title-0-value"]     Test publish
    #Save article
    Click Element               id:edit-submit
    #Check if article is saved
    Wait Until Page Contains    Test publish (Artikel) har skapats.
    ${url} =                    Get Location
    ${ID} =                     Get Substring  ${url}  42  47
    Set Global Variable         ${ID}
    #Go to administrate page
    Go To                       https://test.skatteinformation.se/node/${ID}/edit?destination=/admin/content
    #Check publish checkbox
    Select Checkbox             //*[@id="edit-status-value"]
    Click Element               //*[@id="edit-submit"]
    Go To                       https://test.skatteinformation.se/
    #Check if article is publish
    Wait Until Page Contains     Test publish
    #Go to administrate page
    Go To                       https://test.skatteinformation.se/node/${ID}/edit?destination=/admin/content
    #Uncheck publish checkbox
    Unselect Checkbox           //*[@id="edit-status-value"]
    Click Element               //*[@id="edit-submit"]
    Go To                       https://test.skatteinformation.se/
    #Check if article is unpublish
    Page Should Not Contain     Test publish
    #Remove created article
    Go To                       https://test.skatteinformation.se/node/${ID}/delete
    Wait Until Page Contains    Är du säker på att du vill radera content item Test publish?
    Click Element               id:edit-submit
    Wait Until Page Contains    Artikel Test publish har raderats.