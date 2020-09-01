*** Settings ***
Documentation     Testing the Edit Button
Library           SeleniumLibrary
Library           String
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Test Setup	     Begain Web Test
Test Teardown	 End Web Test

*** Variables ***
${BROWSER} =                 headlesschrome
*** Keywords ***
Begain Web Test
    Open Browser     ${URL}           ${BROWSER}
    Set Window Size    ${1920}    ${1080}
End Web Test
        Close Browser

*** Test Cases ***
User is able to edit the article
       [Documentation]          Testing the Edit Button
       [Tags]                   edit_button
       Login Editor
       Wait Until Page Contains        infotiv-editor
       Go To                          https://test.skatteinformation.se/admin/content
       #Go to Create Article
       Go to                          https://test.skatteinformation.se/node/add/article
       #Input text in Title
       Input Text                     xpath://*[@id="edit-title-0-value"]     Test artikel
       #Save article
       Click Element                  id:edit-submit
       #Check if article is saved
       Wait Until Page Contains       Test artikel (Artikel) har skapats.
       ${url} =                       Get Location
       ${ID} =                        Get Substring  ${url}  42  47
       Set Global Variable            ${ID}
	   Click Element                  xpath://a[contains(text(),'Test artikel')]
	   Click Element                  xpath://*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
       Wait Until Page Contains       Redigera Artikel Test artikel
       #Remove created article
       Go To                          https://test.skatteinformation.se/node/${ID}/delete
       Wait Until Page Contains       Är du säker på att du vill radera content item Test artikel?
       Click Element                  id:edit-submit
       Wait Until Page Contains       Artikel Test artikel har raderats.