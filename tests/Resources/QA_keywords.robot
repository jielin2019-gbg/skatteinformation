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
    Click Element                                xpath://li[@class='pager__item pager__item--next']//span[2]

Next page is shown
    ${url_next_page}                             Get Location
    Should Match                                 ${url_next_page}    https://test.skatteinformation.se/fraga-och-svar?page=1

#*** Keywords *** (TIPG-545 - test functionality of 'Collapse' button )

User clicks on show button

      Login User
      Click Q/A button menu bar
      Execute Javascript                    window.scrollBy(0,400)
      Click Button                          xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[1]/button

Verify Q/A paragraph displayed
      Page Should Contain Element          xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[2]/div
      Page Should Contain Element          xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[2]/div/div/div[1]
      sleep                                5s

Collapse button is clicked

      Click Button                         xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[2]/article/div[1]/button

Q/A paragraph disappear
      Page Should not Contain              FRÅGA

