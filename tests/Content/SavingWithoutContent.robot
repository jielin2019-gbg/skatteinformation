*** Settings ***
Documentation     Log out from menu
Library           SeleniumLibrary
Test Setup	     Begain Web Test
Test Teardown	 End Web Test

*** Variables ***
${BROWSER} =                  Chrome
${URL} =                      https://test.skatteinformation.se/node/add/article
${USERNAME_EDITOR} =         infotiv-editor
${PASSWORD} =                slimy-very-decorate-transit

*** Keywords ***
Begain Web Test
    Open Browser     ${URL}           ${BROWSER}
    Set Window Size    ${1920}       ${1080}
End Web Test
        Close Browser

Display The Error
	Input Text                       //*[@id="edit-name"]     ${USERNAME_EDITOR}
	Input Text                       //*[@id="edit-pass"]       ${PASSWORD}
	Click Button                     //*[@id="edit-submit"]
    Wait Until Element Is Visible    css:.required:invalid

*** Test Cases ***
User receives an error message
    [Documentation]          Testing the login
    [Tags]                  form_submit
    Display The Error


