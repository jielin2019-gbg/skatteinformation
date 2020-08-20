*** Settings ***
Library     SeleniumLibrary
Library     Collections
Resource       ../Resources/login_keywords.robot

*** Variables ***
${BROWSER} =  chrome

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




Verify Page Loaded
    Location Should be         https://test.skatteinformation.se/user/login?destination=/start


Page Loaded
    Verify Page Loaded

Log In
   Input text               //*[@id="edit-name"]        ${Username_User}
   Input text               //*[@id="edit-pass"]        ${PASSWORD}
   Click Element            //*[@id="edit-submit"]

Confirm Page Loaded
    Location Should Be          https://test.skatteinformation.se/start

Press And Verify Deklaration
    Click Element               //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[5]
    Location Should Be          https://test.skatteinformation.se/sok?search=dek20




Press And Verify Corona
   Click Element                 //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[1]
   Location Should Be           https://test.skatteinformation.se/sok?search=Corona



Press And Verify Förmåner
   Click Element                 //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[4]
   Location Should Be            https://test.skatteinformation.se/sok?search=f%C3%B6rm%C3%A5n&f%5B0%5D=kategori%3A32



Press And Verify 3:12
   Click Element                 //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[2]
   Location Should Be            https://test.skatteinformation.se/sok?search=3%3A12-reglerna&f%5B0%5D=kategori%3A29



End Web Test
    Close Browser
