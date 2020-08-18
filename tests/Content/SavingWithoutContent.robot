*** Settings ***
Documentation     Saving the article without adding compulsary information
Library           SeleniumLibrary
Resource	      ../Resources/login_keywords.robot
Resource	      ../Resources/login_variables.robot
Test Setup	     Begain Web Test
Test Teardown	 End Web Test

*** Variables ***
${BROWSER} =                  headlesschrome
*** Keywords ***
Begain Web Test
    Open Browser     ${URL}           ${BROWSER}
    Set Window Size    ${1920}    ${1080}
End Web Test
        Close Browser

*** Test Cases ***
User receives an error message
    [Documentation]          Testing the login
    [Tags]                  form_submit
    Login Editor
    Wait Until Page Contains         infotiv-editor
    Go To                            https://test.skatteinformation.se/node/add/article
	Click Button                     //*[@id="edit-submit"]
    Wait Until Element Is Visible    css:.required:invalid


