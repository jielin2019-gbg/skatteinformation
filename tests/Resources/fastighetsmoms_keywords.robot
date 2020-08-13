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

Confirm Page Loaded
    Location Should Be  https://test.skatteinformation.se/start

Verify the user is able to navigate to Fastighetsmoms link
    Click Link                      //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[3]/a
    Location Should Be      https://test.skatteinformation.se/sok?search=fastighet&f%5B0%5D=kategori%3A25
    #${link_text}    Get Text        //*[@id="block-skatteinfo-content"]/div/div/div/div/div[1]/article/div/a/h2
    #${text}         Set Variable    Fyra solcellsinstallationer ses som en anläggning – full energiskatt
    #Should Be Equal     ${link_text}    ${text}
    Page Should Contain     fastighet


Verify the user is able to navigate when clicks on any of the popular topic
    Click Link      //*[@id="block-skatteinfo-content"]/div/div/div/div/div[1]/article/div/a
    Location Should Be   https://test.skatteinformation.se/artikel/525/fyra-solcellsinstallationer-ses-som-en-anlaggning-full-energiskatt
    Page Should Contain     Irini Kallides


End Web Test
    Close Browser