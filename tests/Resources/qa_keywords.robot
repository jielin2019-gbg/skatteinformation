*** Keywords ***
#*** Keywords *** user_keywords
Begin at Q/A page
    User logged in front page
    Click Q/A button menu bar
    Q/A page is shown

Begin at Toplist
    User logged in front page
    Scrolling down the page
    Q/A topplistan section is shown

Scrolling down the page
    Execute Javascript                      window.scrollTo(0,900)

Test teardown delete
    Clicks on delete button
    Verify delete alert page
    Click on final delete
    Delete verification

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
     Sleep                                  10s
     Verify QA text

Verify QA text
     ${QA_text}                             Get Text       xpath://*[@id="block-skatteinfo-content"]/div/div/div/div/div/article/div/div[1]/h1
     Should Be Equal                        ${QA_text}      AGI och redovisning av bilförmån

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

#*** Keywords *** (TIPG-567 - test functionality of selecting more than one filtering tag)a

User select more than one filetring tag
    Click Button                            xpath://*[@id="block-facet-category-term-name"]/div/button
    Sleep                                   500ms
    Scrolling down the page
    Select Checkbox                         xpath://*[@id="kategori-Enskild-firma"]
    Select Checkbox                         xpath://*[@id="kategori-EU-handel"]
    Select Checkbox                         xpath://*[@id="kategori-Aktiebolag"]
    Scrolling down the page

Verify selected tags became marked
    Page Should Contain Element             xpath://*[@id="kategori-EU-handel"]
    Page Should Contain Element             xpath://*[@id="kategori-Enskild-firma"]
    Page Should Contain Element             xpath://*[@id="kategori-Aktiebolag"]

#*** Keywords *** (TIPG-568 - test functionality of checking that relevant Q&A are displayed.)

Check relevant Q&A are displayed
    Scrolling down the page
    Click Element                           xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]/a

Verify all Q&A are displayed
    Page should contain Element             xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]

#*** Keywords *** (TIPG-596 - test that toplistan section is shown on the start page )

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

#*** Keywords *** editor_keywords

Editor logged in front page
    Login Editor
    Verify logged in on editor page

Verify logged in on editor page
    Page Should Contain                     Hantera

Innehall page is shown
    ${url_Q/A}                              Get Location
    Should Match                            ${url_Q/A}             https://test.skatteinformation.se/admin/content

Begin at innehall page
    Editor logged in front page
    Click innehall button
    Innehall page is shown

Click innehall button
    Click Link                              Innehåll

Click filter button
    Click Button                            id:edit-submit-content

Clicks on Edit button
    Click Element                           xpath://*[@class="edit dropbutton-action"]

Generate title
    ${RANDOMINT}=   Evaluate               random.randint(0, 10)    random
    Set Global Variable                    ${RANDOMINT}

Click on Save button
    Click Element                           xpath:/html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input

Verify delete alert page
    Page Should Contain                     Är du säker på att du vill radera content item

Verify the Edit page
    Page Should Contain                     Redigera Fråga/svar Q/A

Go to article
    [Arguments]                             ${article_name}
    Click Link                              ${article_name}

Go to skapa fraga/svar page
    Click Element                           xpath://*[@id="block-seven-local-actions"]/ul/li/a
    Click Element                           xpath://*[@id="block-seven-content"]/ul/li[3]/a/span

#*** Keywords *** (date keywords)
Publish date in future
    [Arguments]                             ${day}
    ${date}=                                Get Current Date
    ${result_date}                          Add Time To Date             ${date}   ${day}
    Input Text                              id:edit-created-0-value-date            ${result_date}

Publish date back in time
    [Arguments]                             ${day}
    ${date}=                                Get Current Date
    ${result_date}                          Subtract Time From Date          ${date}   ${day}
    Input Text                              id:edit-created-0-value-date            ${result_date}

Publish date current date
    ${date}=                                Get Current Date
    Input Text                              id:edit-created-0-value-date            ${date}

#*** Keywords *** (TIPG-719 'delete' button of the Q/A in the content page list)
Q/A displays in content page list
     Login Editor
     Click innehall button
     Filter content                         Fråga/svar

Clicks on delete button
    Click Element                           xpath://*[@class="dropbutton-arrow"]
    Click Element                           xpath://*[@class="delete dropbutton-action secondary-action"]

#*** Keywords *** (TIPG-720 - test functionality of save button only title filled)
Add question with only title
    Go to skapa fraga/svar page
    Generate title
    Add random title

#*** Keywords *** (TIPG-721 - test functionality of delete button at end of editor page )
Filter content
    [Arguments]                             ${content_type}
    Select From List By Label               edit-type              ${content_type}
    Click filter button

At editing page
    Filter content                          Fråga/svar
    Clicks on Edit button

Click delete end of page
    Click Element                           id:edit-delete

#*** Keywords *** (TIPG-723 - test functionality of save button with all fields filled )
Add question with title fraga and svar
    Go to skapa fraga/svar page
    Generate title
    Add random title
    Add random fraga
    Add random svar

Add random title
    Input text                              id:edit-title-0-value        Q/A testtitle ${RANDOMINT}

Add random fraga
    Input text                              id:edit-field-question-0-value      testquestion

Add random svar
    Select frame                            xpath://*[@id="cke_1_contents"]/iframe
    Input text                              xpath:/html/body/p    testanswer
    Unselect Frame

Save question
    Click on Save button
    Wait Until Page Contains                Q/A testtitle ${RANDOMINT} (Fråga/svar) har skapats.
Verify question on content page
    Go To                                   https://test.skatteinformation.se/admin/content
    Wait Until Page Contains                Q/A testtitle

#*** Keywords *** (TIPG-724 - test that question that was saved with title, fråga, svar inputs is dispayed correctly)
Save question with all fields filled
    Begin at innehall page
    Add question with title fraga and svar
    Save question

Click on question with all fields filled
    Click innehall button
    Filter content                          Fråga/svar
    Go to article                           Q/A testtitle ${RANDOMINT}

Show the whole question
    Click Element                           xpath://*[@id="block-skatteinfo-content"]/article/div[1]/button

Verify correct question
    Page Should Contain Element             xpath://*[@class='faq__content js-faq__content']
    Page Should Contain                     testquestion
    Page Should Contain                     testanswer

#*** Keywords *** (TIPG-728 Fraga/Svar link)
Verify fraga/svar link
    Page should contain Element             xpath://*[@id="block-seven-page-title"]/h1

#*** Keywords *** (TIPG-729 - Delete alert message page)
Delete on edit page
    Click Element                           xpath://*[@id="block-seven-primary-local-tasks"]/nav/nav/ul/li[3]/a
#*** Keywords *** (TIPG-732 'Edit' button of the Q/A in the content page list)
#*** Keywords *** (TIPG-733 - Create QA without title)
Add QA with only fraga
    Begin at innehall page
    Go to skapa fraga/svar page
    Verify fraga/svar link
    Input text                              id:edit-field-question-0-value      testquestion Gisela

Alert bubble should appear
    Wait Until Element Is Visible           css:.required:invalid

#*** Keywords *** (TIPG-734 - Execute delete on confirmation page)
Create and delete QA
    Begin at innehall page
    Add question with title fraga and svar
    Save question
    Verify question on content page
    Clicks on delete button
    Verify delete alert page

Click on final delete
    Click Element                           id:edit-submit

Delete verification
    Page Should contain                     Fråga/svar Q/A testtitle ${RANDOMINT} har raderats.

#*** Keywords *** (TIPG-743 - test that publishing question with today's date is on topplist page)
Publish question with current date
    Add question with only title
    Publish date current date
    Select Checkbox                         id:edit-status-value
    Click Element                           xpath:/html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input

Verify question on topplist page
    Click Element                           xpath://*[@id="block-main-menu"]/ul/li[1]/a
    Execute Javascript                      window.scrollTo(0,900)
    Page Should Contain		                Q/A testtitle ${RANDOMINT}

#*** Keywords *** (TIPG-744 - test that publishing question with today's date is on Q/A page)
Verify question on Q/A page
    Click Q/A button menu bar
    Page Should Contain		                Q/A testtitle ${RANDOMINT}

#*** Keywords *** (TIPG-745 - test that publishing question with date and time empty)
Delete date
    Input Text                              id:edit-created-0-value-date            ${EMPTY}

Delete time
    Input Text                              id:edit-created-0-value-time            ${EMPTY}

Publish with question date and time blank
    Add question with only title
    Delete Date
    Delete Time
    Select Checkbox                         id:edit-status-value
    Click Element                           xpath:/html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input

Verify question published with todays date
     Click Q/A button menu bar
     Page Should Contain		            Q/A testtitle ${RANDOMINT}
     ${date}=                               Get Current Date
     ${format_date}                         Convert Date       ${date}  result_format=%d %b %Y
     ${lowercase_date}                      Convert to Lower Case                ${format_date}
     Page Should contain				    ${lowercase_date}

#*** Keywords *** (TIPG-753 Publishing for the previous date)

Verify previous date
     Click Element               xpath://*[@id="edit-created-0-value-date"]
     ${format_date}              Convert Date     2014-06-11       result_format=%Y-%m-%d
     Input Text                  id:edit-created-0-value-date            ${format_date}
     Select Publish chekbox
     Click on Save button
     Click Link                   Start
     ${toplistan_date}            Get WebElements           class:meta-item__data
     Log                          ${toplistan_date}
     Should Not Be Equal          ${format_date}            ${toplistan_date}

#*** Keywords *** (TIPG-755 verify the information type 'legislation')
Verify QA legislation
      ${QA_legislation}                     Get Text                xpath://*[@id="block-skatteinfo-content"]/div/div/div/div/div[1]/article/div/div[1]/h1/span
      Log                                   ${QA_legislation}
      Should Be Equal                       ${QA_legislation}       Q/A testtitle ${RANDOMINT}

User is on Skapa fraga/svar page
    Login Editor
    Click innehall button
    Go to skapa fraga/svar page
    Generate title
    Add random title

Publish with information type
    Select Publish chekbox
    Click on Save button
    Click Link                              Sök innehåll

Verify in Search content
    Input text                              id:edit-search        Q/A testtitle ${RANDOMINT}
    Click button                            id:edit-submit-search
    Wait Until Page Contains                Vad söker du?
    Verify QA legislation

Select Publish chekbox
    Select Checkbox                         id:edit-status-value

Select information type legislation
    Select from list by index               field_information_type          1

Select Checkbox legislation
    Select Checkbox                         id:informationstyp-108

#*** Keywords *** (TIPG-760 verify the information type 'legal cases')
Select information type legal cases
    Select from list by index               field_information_type          2

Select Checkbox legal cases
    Select Checkbox                         id:informationstyp-109

#*** Keywords *** (TIPG-761 verify the information type 'position taken')
Select information type position taken
    Select from list by index               field_information_type          3

Select Checkbox position taken
    Select Checkbox                         id:informationstyp-110

#*** Keywords *** (TIPG-751 verify the error message after publish date or time blank)
Click on publish and save
    Click element                           id:edit-status-value
    Click element                           id:edit-submit

Verify error message
    Page should contain                     Datumet Författad är ogiltigt. Var vänlig ange ett datum på formatet

#*** Keywords *** (TIPG-807 verify newly Q/A is displayed on 'Start' page)
Editor check newly published Q/A is displayed on "Start" page
      Input text                            id:edit-search  ${Q/A_title}
      Click Button                          id:edit-submit-search
      Execute Javascript                    window.scrollBy(1000,9000)
      Sleep                                 1s

Verify newly Q/A is displayed
    Page Should Contain		                Q/A testtitle

