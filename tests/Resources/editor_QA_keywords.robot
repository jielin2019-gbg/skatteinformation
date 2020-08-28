*** Keywords ***

Editor logged in front page
    Login Editor
    Verify logged in on editor page

Verify logged in on editor page
    Page Should Contain                     Hantera

Begin at innehall page
    Editor logged in front page
    Click innehall button
    Innehall page is shown

Click innehall button
    Click Link                              Innehåll

Innehall page is shown
    ${url_Q/A}                              Get Location
    Should Match                            ${url_Q/A}             https://test.skatteinformation.se/admin/content

Test teardown delete
    Clicks on delete button
    Page verifying deletion shown
    Click on final delete
    Delete verification

#*** Keywords *** (TIPG-721 - test functionality of delete button at end of editor page )
Filter content
    [Arguments]                             ${content_type}
    Select From List By Label               edit-type              ${content_type}
    Click Button                            id:edit-submit-content

At editing page
    Filter content                          Fråga/svar
    Clicks on Edit button

Click delete end of page
    Click Element                           id:edit-delete

Page verifying deletion shown
    Page Should Contain                     Är du säker på att du vill radera content item

Verify the Edit page
    Page Should Contain                     Redigera Fråga/svar Q/A

#*** Keywords *** (TIPG-719 'delete' button of the Q/A in the content page list)
Q/A displays in content page list
     Login Editor
     Click innehall button
     Filtering Q/A

Filtering Q/A
    Filter content                          Fråga/svar

Clicks on delete button
    Click Element                           xpath://*[@class="dropbutton-arrow"]
    Click Element                           xpath://*[@class="delete dropbutton-action secondary-action"]

#*** Keywords *** (TIPG-732 'Edit' button of the Q/A in the content page list)
Clicks on Edit button
    Click Element                           xpath://*[@class="edit dropbutton-action"]

#*** Keywords *** (TIPG-728 Fraga/Svar link)
Go to skapa fraga/svar page
    Click Element                           xpath://*[@id="block-seven-local-actions"]/ul/li/a
    Click Element                           xpath://*[@id="block-seven-content"]/ul/li[3]/a/span

Verify fraga/svar link
    Page should contain Element             xpath://*[@id="block-seven-page-title"]/h1

#*** Keywords *** (TIPG-723 - test functionality of save button with all fields filled )
Generate title
    ${RANDOMINT}=   Evaluate               random.randint(0, 10)    random
    Set Global Variable                    ${RANDOMINT}

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
    Click Element                           xpath:/html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input
    Wait Until Page Contains                Q/A testtitle ${RANDOMINT} (Fråga/svar) har skapats.

Verify question on content page
    Go To                           https://test.skatteinformation.se/admin/content
    Wait Until Page Contains        Q/A testtitle ${RANDOMINT}

#*** Keywords *** (TIPG-724 - test that question that was saved with title, fråga, svar inputs is dispayed correctly)

Go to article
    [Arguments]                             ${article_name}
    Click Link                              ${article_name}

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



#*** Keywords *** (TIPG-720 - test functionality of save button only title filled)

Add question with only title
    Go to skapa fraga/svar page
    Generate title
    Add random title

#*** Keywords *** (TIPG-729 - Delete alert message page)
Delete on edit page
    Click Element                           xpath://*[@id="block-seven-primary-local-tasks"]/nav/nav/ul/li[3]/a

Verify delete alert page
    Page Should Contain                     Är du säker på att du vill radera content item

#*** Keywords *** (TIPG-733 - Create QA without title)
Add QA with only fraga
    Begin at innehall page
    Go to skapa fraga/svar page
    Verify fraga/svar link
    Input text                              id:edit-field-question-0-value      testquestion Gisela

Click on save
    Click Element                           xpath:/html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input

Alert bubble should appear
    Wait Until Element Is Visible          css:.required:invalid

#*** Keywords *** (TIPG-734 - Execute delete on confirmation page)
Create and delete QA
    Begin at innehall page
    Add question with title fraga and svar
    Save question
    Verify question on content page
    Clicks on delete button
    Page verifying deletion shown

Click on final delete
    Click Element                           id:edit-submit

Delete verification
    Page Should contain                     Fråga/svar Q/A testtitle ${RANDOMINT} har raderats.