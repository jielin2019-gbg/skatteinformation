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

#*** Keywords *** (TIPG-721 - test functionality of delete button at end of editor page )
Filter content
    [Arguments]                             ${content_type}
    Select From List By Label               edit-type              ${content_type}
    Click Button                            id:edit-submit-content

Edit article
    Click Link                              Edit

At editing page
    Begin at innehall page
    Filter content                          Fråga/svar
    Go to article                            Q/A testtitle
    Edit article


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
    Click Element                          xpath://*[@class="dropbutton-arrow"]
    Click Element                          xpath://*[@class="delete dropbutton-action secondary-action"]

#*** Keywords *** (TIPG-732 'Edit' button of the Q/A in the content page list)
Clicks on Edit button
    Click Element                          xpath://*[@class="edit dropbutton-action"]

#*** Keywords *** (TIPG-728 Fraga/Svar link)
Go to skapa fraga/svar page
    Click Element    xpath://*[@id="block-seven-local-actions"]/ul/li/a
    Click Element    xpath://*[@id="block-seven-content"]/ul/li[3]/a/span

Verify fraga/svar link
    Page should contain Element     xpath://*[@id="block-seven-page-title"]/h1

#*** Keywords *** (TIPG-723 - test functionality of save button with all fields filled )
Add question with title fraga and svar
    Go to skapa fraga/svar page
    Add random title
    Add random fraga
    Add random svar

Add random title
    Input text                              id:edit-title-0-value        Q/A testtitle

Add random fraga
    Input text                              id:edit-field-question-0-value      testquestion

Add random svar
    Select frame                            xpath://*[@id="cke_1_contents"]/iframe
    Input text                              xpath:/html/body/p    testanswer
    Unselect Frame

Save question
    Click Element                          xpath:/html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input
    Wait Until Page Contains               Q/A testtitle (Fråga/svar) har skapats.

Verify question on content page
    Go To                           https://test.skatteinformation.se/admin/content
    Wait Until Page Contains        Q/A testtitle

#*** Keywords *** (TIPG-724 - test that question that was saved with title, fråga, svar inputs is dispayed correctly)

Go to article
    [Arguments]                             ${article_name}
    Click Link                              ${article_name}

Click on question with all fields filled
    Filter content                          Fråga/svar
    Go to article                           Q/A testtitle

Show the whole question
    Click Element                           xpath://*[@id="block-skatteinfo-content"]/article/div[1]/button

Verify correct question
    Page Should Contain                     testquestion
    Page Should Contain                     testanswer

#*** Keywords *** (date keywords)
Add time from todays date
    [Arguments]                          ${day}
    ${date}=                             Get Current Date
    ${result_date}                       Add Time To Date             ${date}   ${day}
    ${format_date}                       Convert Date    ${result_date}   result_format=%m.%d.%Y
    Input Text                           id:edit-created-0-value-date            ${format_date}

Subtract time from todays date
    [Arguments]                          ${day}
    ${date}=                             Get Current Date
    ${result_date}                       Subtract Time From Date          ${date}   ${day}
    ${format_date}                       Convert Date    ${result_date}   result_format=%m.%d.%Y
    Input Text                           id:edit-created-0-value-date            ${format_date}