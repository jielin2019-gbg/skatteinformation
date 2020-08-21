*** Settings ***
Documentation     Log out from menu
Library           SeleniumLibrary
Test Setup	     Begain Web Test
Test Teardown	 End Web Test

*** Variables ***
${BROWSER} =                 Chrome
${URL} =                     https://test.skatteinformation.se/admin/content
${USERNAME_EDITOR} =         infotiv-editor
${PASSWORD} =                slimy-very-decorate-transit


*** Keywords ***
Begain Web Test
    Open Browser     ${URL}           ${BROWSER}
    Maximize Browser Window
End Web Test
        Close Browser
Click The Edit Button
     Input Text                     xpath://*[@id="edit-name"]     ${USERNAME_EDITOR}
	 Input Text                     xpath://*[@id="edit-pass"]       ${PASSWORD}
	 Click Button                   xpath://*[@id="edit-submit"]
	 Click Element                  xpath://td/a[contains(text(),'testartikel')]/../../td[7]/div/div/ul/li[contains(@class, 'edit')]/a
     Wait Until Page Contains       Redigera Artikel testartikel
	 Click Button                   xpath://*[@id="edit-submit"]

*** Test Cases ***
User is able to edit the article
       [Documentation]          Testing the Edit Button
       [Tags]                   edit_button
       Click The Edit Button