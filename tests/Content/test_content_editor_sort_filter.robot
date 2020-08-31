*** Settings ***
Documentation     A single test to see if a user with the right credentials can log in as an editor and filter content on the content page.
Library           SeleniumLibrary
Library           String
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Test Setup  Go to Webpage
Test Teardown  Close Webpage
	
*** Variables ***
${BROWSER} =        headlesschrome

*** Keywords ***

Go to Webpage
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size    ${1920}    ${1080}
    Wait Until Page Contains        Du behöver vara inloggad

Go to Content Page
    Go To                           https://test.skatteinformation.se/admin/content
    Wait Until Element Is Visible   xpath://html/body/div[2]/div/main/div[3]/div[1]/ul/li/a

Filter by Title
    Input Text                      //*[@id="edit-title"]       test
    Click Element                   //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=test&type=All&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]

Filter by Content Type
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[2]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=article&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[3]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=page&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[4]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=faq&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[5]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=shortcut&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[6]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=landingpage&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[7]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=editor_digest&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[8]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=short_story&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-type"]
    Click Element                   //*[@id="edit-type"]/option[9]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=tables&status=All&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]

Filter by Publication Status
    Click Element                   //*[@id="edit-status"]
    Click Element                   //*[@id="edit-status"]/option[2]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=All&status=1&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-status"]
    Click Element                   //*[@id="edit-status"]/option[3]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=All&status=2&sticky=All&uid=
    Click Element                   //*[@id="edit-reset"]

Filter by Always on top of the List
    Click Element                   //*[@id="edit-sticky"]
    Click Element                   //*[@id="edit-sticky"]/option[2]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=1&uid=
    Click Element                   //*[@id="edit-reset"]
    Click Element                   //*[@id="edit-sticky"]
    Click Element                   //*[@id="edit-sticky"]/option[3]
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=0&uid=
    Click Element                   //*[@id="edit-reset"]

Filter by Editor
    Input Text                      //*[@id="edit-uid"]     infotiv-editor
    Click Button                    //*[@id="edit-submit-content"]
    Wait Until Location Contains    https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid=infotiv-editor
    Click Element                   //*[@id="edit-reset"]

Given that the user is logged in as editor
    Login Editor

When the editor goes to the content page
    Go to Content Page

Then the editor should be able to filter content by title and/or chosen parameters
    Filter by Title
    Filter by Content Type
    Filter by Publication Status
    Filter by Always on top of the List
    Filter by Editor

Close Webpage
    Close Browser

*** Test Cases ***
Login to webpage as Editor and filter by title and/or chosen parameters on content page
    [Documentation]     Login to https://test.skatteinformation.se/ as an Editor and filter content on the content page by title and/or chosen parameters (e.g Content type, Publication Status, Always on top of the List and Editor).
    [Tags]              login       editor      content     filter
    Given that the user is logged in as editor
    When the editor goes to the content page
    Then the editor should be able to filter content by title and/or chosen parameters
