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
    [Arguments]                             ${article_name}
    Click Link                              ${article_name}
    Click Link                              Edit

At editing page
    Filter content                          Fråga/svar
    Edit article                            Q/A test2

Click delete end of page
    Click Element                           id:edit-delete

Page verifying deletion shown
    Page Should Contain                     Är du säker på att du vill radera content item

