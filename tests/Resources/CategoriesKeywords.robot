*** Settings ***
Library     SeleniumLibrary
Library     Collections

*** Variables ***
${BROWSER} =  chrome
${URL} =      https://test.skatteinformation.se/
${USERNAME_USER} =  infotiv-user
${PASSWORD} =  slimy-very-decorate-transit


*** Keywords ***
Begin Web Test
    Open Browser                about:blank   ${BROWSER}
    Maximize Browser Window
    Go To                       ${URL}

Login User
	Input Text  //*[@id="edit-name"]  ${USERNAME_USER}
	Input Text  //*[@id="edit-pass"]  ${PASSWORD}
	Click Button  //*[@id="edit-submit"]

Confirm Login Successful
    Location Should Be  https://test.skatteinformation.se/start