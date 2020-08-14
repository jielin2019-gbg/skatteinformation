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


Verify The User Is Able To Show More Filter Options When Clicks On Dropdown Arrow
    Click Link      //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/a
    Page Should Contain    Informationstyp
    Page Should Contain    Källa


End Web Test
    Close Browser