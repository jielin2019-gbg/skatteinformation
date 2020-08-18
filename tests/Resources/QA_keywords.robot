*** Keywords ***
Begin Web Test
<<<<<<< HEAD
    Open Browser	                             ${URL}  	        ${BROWSER}
    Set Window Size                              1920               1080
    #Maximize Browser Window
=======
    Open Browser	                             ${URL}  	${BROWSER}
    Maximize Browser Window
>>>>>>> TIPG-399

End Web Test
    Close Browser

User logged in front page
    Login User
    Verify logged in

Verify logged in
<<<<<<< HEAD
    ${url_start}                                 Get Location
    Should Match                                 ${url_start}       https://test.skatteinformation.se/start

Click Q/A button menu bar
    Click Link                                   Fråga / svar

Q/A page is shown
    ${url_Q/A}                                   Get Location
    Should Match                                 ${url_Q/A}        https://test.skatteinformation.se/fraga-och-svar
=======
    Wait Until Page Contains Element             xpath://a[text()='Start']

Click Q/A button menu bar
    Click Element                                xpath://a[text()='Fråga / svar']

Q/A page is shown
    Wait Until Page Contains Element             xpath://div[@class='view-content']//div[1]//article[1]
>>>>>>> TIPG-399
