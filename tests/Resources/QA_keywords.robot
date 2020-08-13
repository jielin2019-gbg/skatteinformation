*** Keywords ***
Begin Web Test
    Open Browser	                             ${URL}  	${BROWSER}
    Maximize Browser Window

End Web Test
    Close Browser

User logged in front page
    Login User
    Verify logged in

Verify logged in
    Wait Until Page Contains Element             xpath://a[text()='Start']

Click Q/A button menu bar
    Click Element                                xpath://a[text()='Fråga / svar']

Q/A page is shown
    Wait Until Page Contains Element             xpath://div[@class='view-content']//div[1]//article[1]