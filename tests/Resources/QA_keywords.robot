*** Keywords ***
Begin Web Test
      Open Browser	                         ${URL}  	        ${BROWSER}
      Set Window Size                        1920               1080
    #Maximize Browser Window

Go To Web Page
    Go To   ${URL}

#*** Keywords *** (TIPG-567 - test functionality of selecting more than one filtering tag)

Verify Q&A page loaded
    ${link_text} = 		                    Get Text  xpath://*[@id="block-facet-category-term-name"]/div/button
    Should Be Equal		                    ${link_text}  Visa fler val

User select more than one filetring tag
      Click Button                          xpath://*[@id="block-facet-category-term-name"]/div/button
      Execute Javascript                    window.scrollBy(0,800)
      Select Checkbox                       xpath://*[@id="kategori-Enskild-firma"]
      Select Checkbox                       xpath://*[@id="kategori-EU-handel"]
      Select Checkbox                       xpath://*[@id="kategori-Aktiebolag"]
      Execute Javascript                    window.scrollBy(0,400)
      sleep                                 5s

Verify selected tags became marked
      Page Should Contain Element           xpath://*[@id="kategori-EU-handel"]
      Page Should Contain Element           xpath://*[@id="kategori-Enskild-firma"]
      Page Should Contain Element           xpath://*[@id="kategori-Aktiebolag"]

#*** Keywords *** (TIPG-568 - test functionality of checking that relevant Q&A are displayed.)

Check relevant Q&A are displayed
      Execute Javascript                    window.scrollBy(0,900)
      Click Element                         xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]/a
      sleep                                 5s

Verify all Q&A are displayed
      Page should contain Element           xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]

Click Q/A button menu bar
      Click Element                         xpath://a[text()='Fråga / svar']

End Web Test
    Close Browser

Begin at Q/A page
    User logged in front page
    Click Q/A button menu bar
    Q/A page is shown

#*** Keywords *** (TIPG-543 - test functionality of Q/A button )

User logged in front page
    Login User
    Verify logged in

Verify logged in
    ${url_start}                                 Get Location
    Should Match                                 ${url_start}       https://test.skatteinformation.se/start

Q/A page is shown
    ${url_Q/A}                                   Get Location
    Should Match                                 ${url_Q/A}        https://test.skatteinformation.se/fraga-och-svar

#*** Keywords *** (TIPG-550 - test functionality of 'Next/Previous page' button )
Click Next page button
    Click Element                                xpath://li[@class='pager__item pager__item--next']//span[2]

Next page is shown
    ${url_next_page}                             Get Location
    Should Match                                 ${url_next_page}    https://test.skatteinformation.se/fraga-och-svar?page=1

Click Previous page button
    Click Element                                xpath://li[@class='pager__item pager__item--previous']//span[2]

Previous page is shown
    ${url_previous_page}                         Get Location
    Should Match                                 ${url_previous_page}   https://test.skatteinformation.se/fraga-och-svar?page=0

On Next page
    Click Next page button
    Next page is shown

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


#*** Keywords *** TIPG-549 - test the functionality of the 'visa' button

Click 'Visa' Button
      Click Element                         xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[1]/button/span[1]

Verify answer is visible
      Page Should Contain Element           xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[2]/div/div/div[3]


