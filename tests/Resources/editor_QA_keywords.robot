*** Keywords ***

Editor logged in front page
    Login Editor
    Verify logged in on editor page

Verify logged in on editor page
    Page Should Contain                 Hantera

Begin at innehall page
    Editor logged in front page
    Click innehall button
    Innehall page is shown

Click innehall button
    Click Element              xpath: //*[@id="toolbar-item-administration-tray"]/nav/div[1]/ul/li/a

Innehall page is shown
     ${url_Q/A}                              Get Location
    Should Match                            ${url_Q/A}        https://test.skatteinformation.se/admin/content


