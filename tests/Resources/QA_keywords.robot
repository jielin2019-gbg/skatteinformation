*** Keywords ***
Begin Web Test
      Open Browser	                         ${URL}  	        ${BROWSER}
      Set Window Size                        1920               1080
      #Maximize Browser Window

End Web Test
    Close All Browsers

Begin at Q/A page
    User logged in front page
    Click Q/A button menu bar
    Q/A page is shown

Begin at Toplist
    User logged in front page
    Scrolling down the page
    Q/A topplistan section is shown

#*** Keywords *** (TIPG-543 - test functionality of Q/A button )

User logged in front page
    Login User
    Verify logged in

Verify logged in
    ${url_start}                            Get Location
    Should Match                            ${url_start}       https://test.skatteinformation.se/start

Click Q/A button menu bar
    Click Link                              Fråga / svar

Q/A page is shown
    ${url_Q/A}                              Get Location
    Should Match                            ${url_Q/A}        https://test.skatteinformation.se/fraga-och-svar

#*** Keywords *** (TIPG-545 - test functionality of 'Collapse' button )

User is on QA paragraph
    Click Element                           xpath://div[@class='view-content']//div[1]//article[1]//div[1]//button[1]

Collapse button is clicked
    Click Element                           xpath://span[contains(text(),'Dölj')]

Q/A paragraph disappear
    Page Should not Contain                 FRÅGA

#*** Keywords *** TIPG-549 - test the functionality of the 'visa' button

Click 'Visa' Button
    Click Element                           xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[1]/button/span[1]

Verify answer is visible
    Page Should Contain Element             xpath://*[@class='faq__content js-faq__content']

#*** Keywords *** (TIPG-550 - test functionality of 'Next/Previous page' button )
Click Next page button
    Click Element                           xpath://li[@class='pager__item pager__item--next']//span[2]

Next page is shown
    ${url_next_page}                        Get Location
    Should Match                            ${url_next_page}    https://test.skatteinformation.se/fraga-och-svar?page=1

Click Previous page button
    Click Element                           xpath://li[@class='pager__item pager__item--previous']//span[2]

Previous page is shown
    ${url_previous_page}                    Get Location
    Should Match                            ${url_previous_page}   https://test.skatteinformation.se/fraga-och-svar?page=0

On Next page
    Click Next page button
    Next page is shown

#*** Keywords *** (TIPG-554 - test the functionality of the link in QA Paragraph )
Begin at search content page
     Login User
     Click Link                             Sök innehåll

Search for the Question 'AGI och redovisning av bilförmån'
     Input text                             id:edit-search       AGI och redovisning av bilförmån
     Click Button                           id:edit-submit-search
     Sleep                                  8s
     Verify QA text

Verify QA text
      ${QA_text}                            Get Text       xpath://*[@id="block-skatteinfo-content"]/div/div/div/div/div/article/div/div[1]/h1
      Should Be Equal                       ${QA_text}      AGI och redovisning av bilförmån

Clicks the link in QA paragraph
     Click Element                           xpath://div[@class='view-content']//div[1]//article[1]//div[1]//button[1]
     Sleep                                   500ms
     Click Link                              Skatteverkets ställningstagande med dnr 202 155257-18/111


#**************** TIPG-555 testing the filtering option

Show more and selecting category
    [Arguments]                             ${kategori}
    Click Button                            xpath://*[@id="block-facet-category-term-name"]/div/button
    Sleep                                   500ms
    Select Checkbox                         xpath://*[@id="kategori-${kategori}"]

Checkbox Selected
    [Arguments]                             ${kategori}
    Checkbox should be selected             xpath://*[@id="kategori-${kategori}"]

Corresponding website should appear
    ${website_link}                         Get Location
    Should Match                            ${website_link}     https://www4.skatteverket.se/rattsligvagledning/369260.html
    Go Back

#*** Keywords *** (TIPG-567 - test functionality of selecting more than one filtering tag)

Verify Q&A page loaded
    ${link_text} = 		                    Get Text  xpath://*[@id="block-facet-category-term-name"]/div/button
    Should Be Equal		                    ${link_text}  Visa fler val

User select more than one filetring tag
    Click Button                            xpath://*[@id="block-facet-category-term-name"]/div/button
    Sleep                                   500ms
    Execute Javascript                      window.scrollBy(0,800)
    Select Checkbox                         xpath://*[@id="kategori-Enskild-firma"]
    Select Checkbox                         xpath://*[@id="kategori-EU-handel"]
    Select Checkbox                         xpath://*[@id="kategori-Aktiebolag"]
    Execute Javascript                      window.scrollBy(0,800)

Verify selected tags became marked
    Page Should Contain Element             xpath://*[@id="kategori-EU-handel"]
    Page Should Contain Element             xpath://*[@id="kategori-Enskild-firma"]
    Page Should Contain Element             xpath://*[@id="kategori-Aktiebolag"]

#*** Keywords *** (TIPG-568 - test functionality of checking that relevant Q&A are displayed.)

Check relevant Q&A are displayed
    Execute Javascript                      window.scrollBy(0,900)
    Click Element                           xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]/a

Verify all Q&A are displayed
    Page should contain Element             xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]

#*** Keywords *** (TIPG-596 - test that toplistan section is shown on the start page )

Scrolling down the page
    Execute Javascript                      window.scrollTo(0,900)

Q/A topplistan section is shown
    Page Should Contain Element             xpath://*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[3]/div/div/div/div/div

#*** Keywords *** (TIPG-601 - test QA paragraph in the top list is shown when mousing over questions )

Mouse over question
    Mouse Over                              xpath:/html[1]/body[1]/div[2]/div[1]/div[1]/main[1]/div[3]/div[1]/article[1]/div[1]/div[1]/div[2]/div[1]/div[3]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/article[1]/div[1]

Q/A paragraph is shown
    Page Should Contain Element             xpath://div[@class='paragraph paragraph--faq-toplist paragraph--view-mode--default']//div[@class='views-element-container']//div[1]//article[1]//div[2]//div[1]//div[1]

#*** Keywords *** TIPG-597 - Test the link on Topplistan goes to QA page

Go to QA Page from topplistan section
    Click Element                           xpath://*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[3]/div/div/div/div/div/a/span

