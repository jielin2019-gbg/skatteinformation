*** Settings ***
Documentation     Testing the Edit Button
Library           SeleniumLibrary
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
	   Click Element                  xpath://a[contains(text(),'testartikel')]
	   Click Element                  xpath://*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
       Wait Until Page Contains       Redigera Artikel testartikel