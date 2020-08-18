

*** Variables ***
${BROWSER}          Chrome
${URL}              https://test.skatteinformation.se/fraga-och-svar

*** Keywords ***
Begin Web Test
    Open Browser    about:blank  ${BROWSER}
    Maximize Browser Window

Go To Web Page
    Go To   ${URL}

Click 'Visa' Button
    Click Element   xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[1]/button/span[1]

Verify answer is visable
    Click Element   xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[2]/div/div/div[3]

End Web Test
    Close Browser

*** Test Cases ***
Visa Button
    [Tags]    DEBUG
    Given Go To Web Page
    When Click 'Visa' Button
    Then Verify answer is visable
