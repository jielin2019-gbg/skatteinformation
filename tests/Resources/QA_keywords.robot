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
