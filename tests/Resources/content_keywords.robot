*** Settings ***
Library           String

*** Variables ***
${ID} =  none

*** Keywords ***
Create article
    Go To                       https://test.skatteinformation.se/node/add/article
    Input Text                  xpath://*[@id="edit-title-0-value"]     Test artikel
    Click Element               id:edit-submit
    Wait Until Page Contains    Test artikel (Artikel) har skapats.
    ${url} =                    Get Location
    ${ID} =                     Get Substring  ${url}  42  47
    Set Global Variable         ${ID}

Delete article
    Go To                       https://test.skatteinformation.se/node/${ID}/delete
    Wait Until Page Contains    Är du säker på att du vill radera content item
    Click Element               id:edit-submit
    Wait Until Page Contains    har raderats.