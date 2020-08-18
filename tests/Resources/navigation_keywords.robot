*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource       ../Resources/login_keywords.robot

*** Variables ***
${BROWSER} =        chrome

*** Keywords ***
Begin Web Test
    Open Browser                about:blank   ${BROWSER}
    Maximize Browser Window
    Go To                       ${URL}

Confirm Login Successful
    Location Should Be  https://test.skatteinformation.se/start

Verify the user is able to navigate to Fastighetsmoms link
    Click Link              //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[3]/a
    Location Should Be      https://test.skatteinformation.se/sok?search=fastighet&f%5B0%5D=kategori%3A25
    Page Should Contain     fastighet


Verify the user is able to navigate when clicks on any of the popular topic of Fastighetsmoms link
    Click Link              //*[@id="block-skatteinfo-content"]/div/div/div/div/div[1]/article/div/a
    Location Should Be      https://test.skatteinformation.se/artikel/525/fyra-solcellsinstallationer-ses-som-en-anlaggning-full-energiskatt
    Page Should Contain     Irini Kallides


Verify the user is able to navigate to 3:12 link
    Click Link              //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[2]/a
    Location Should Be      https://test.skatteinformation.se/sok?search=3%3A12-reglerna&f%5B0%5D=kategori%3A29
    Page Should Contain     3:12-reglerna


Verify the user is able to navigate when clicks on any of the popular topic of 3:12 link
    Click Link      //*[@id="block-skatteinfo-content"]/div/div/div/div/div[1]/article/div/a
    Location Should Be   https://test.skatteinformation.se/artikel/708/proposition-om-nya-skatteregler-generationsskiften-i-famansforetag
    Page Should Contain     Alexandra Wallerius

Verify The User Is Able To Show different Categories When Clicks On Dropdown Arrow
    Click Element   xpath://*[@id="block-main-menu"]
    Page Should Contain    Allmänt
    Page Should Contain    Civilrätt och bokföring
    Page Should Contain    Deklaration och förfarande

Verify The User Is Able To Show Specific content of the selected Category
    Click Element   xpath://*[@id="block-main-menu"]
    Page Should Contain    Allmänt
    Click Link  //*[@id="block-main-menu"]/ul/li[3]/ul/li[1]/a
    Page Should contain     Beslut om slopad skattereduktion för fackföreningsavgifter

Verify The User Is Able To hide the category list with one click
    Click Element   xpath://*[@id="block-main-menu"]
    Page Should Contain    Allmänt
    Page Should Contain    Civilrätt och bokföring

    Click Element   xpath://*[@id="block-main-menu"]
    sleep  3s

End Web Test
    Close Browser