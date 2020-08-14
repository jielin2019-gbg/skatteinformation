*** Keywords ***
Begin Web Test
    Open Browser	                             ${URL}  	        ${BROWSER}
    Set Window Size                              1920               1080
    #Maximize Browser Window

End Web Test
    Close Browser

User logged in front page
    Login User
    Verify logged in

Verify logged in
    ${url_start}                                 Get Location
    Should Match                                 ${url_start}       https://test.skatteinformation.se/start

Click Q/A button menu bar
    Click Link                                   Fråga / svar

Q/A page is shown
    ${url_Q/A}                                   Get Location
    Should Match                                 ${url_Q/A}        https://test.skatteinformation.se/fraga-och-svar

Begin at Q/A page
    User logged in front page
    Click Q/A button menu bar
    Q/A page is shown

Click Next page arrow
    #Scroll Element Into View                     xpath://li[@class='pager__item pager__item--next']//span[2]
    Click Element                                xpath://li[@class='pager__item pager__item--next']//span[2]

Next page is shown
    ${url_next_page}                             Get Location
    Should Match                                 ${url_next_page}    https://test.skatteinformation.se/fraga-och-svar?page=1