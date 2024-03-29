*** Settings ***
Documentation     Sorting authors alphabetically
Library           SeleniumLibrary
Resource	      ../Resources/login_keywords.robot
Resource	      ../Resources/login_variables.robot
Test Setup	     Begain Web Test
Test Teardown	 End Web Test

*** Variables ***
${BROWSER} =                  headlesschrome
*** Keywords ***
Begain Web Test
    Open Browser     ${URL}           ${BROWSER}
    Set Window Size    ${1920}    ${1080}

Open The Content Page
    Go To                            https://test.skatteinformation.se/admin/content
    Wait Until Page Contains         infotiv-editor

End Web Test
        Close Browser

*** Test Cases ***
User is able to sort articles title
    [Documentation]          Sorting articles title
    [Tags]                    Sort_asc_desc
    Login Editor
    Open The Content Page
	Click Element                       xpath://*[@id="view-title-table-column"]/a
    Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid&order=title&sort=asc
    Click Element                       xpath://*[@id="view-title-table-column"]/a
    Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid=&order=title&sort=desc


User is able to sort the content type list alphabatically
    [Documentation]          Sorting content type
    [Tags]                    Sorting_content_List_asc_desc
    Login Editor
    Open The Content Page
	Click Element                       xpath://*[@id="view-type-table-column"]/a
	Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid&order=type&sort=asc
    Click Element                       xpath://*[@id="view-type-table-column"]/a
	Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid=&order=type&sort=desc

User is able to sort authors list alphabetically
    [Documentation]            Sorting Authors list
    [Tags]                     Sorting_Authors_List_asc_desc
    Login Editor
    Open The Content Page
	Click Element                    xpath://*[@id="view-name-table-column"]/a
    Wait Until Location Contains     https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid&order=name&sort=asc
    Click Element                    xpath://*[@id="view-name-table-column"]/a
    Wait Until Location Contains     https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid=&order=name&sort=desc

User is able to check if the article is published or not published
    [Documentation]          Sorting article status
    [Tags]                    Article_status_asc_desc
    Login Editor
    Open The Content Page
	Click Element                       xpath://*[@id="view-status-table-column"]/a
	Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid&order=status&sort=asc
	Click Element                       xpath://*[@id="view-status-table-column"]/a
	Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid=&order=status&sort=desc

User is able to sort the written article date and time
    [Documentation]          Sorting recent written article
    [Tags]                   Sorting_Article_Date_Time_desc_asc
    Login Editor
    Open The Content Page
	Click Element                    xpath://*[@id="view-created-table-column"]/a
	Wait Until Location Contains     https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid&order=created&sort=desc
	Click Element                    xpath://*[@id="view-created-table-column"]/a
	Wait Until Location Contains     https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid=&order=created&sort=asc

User is able to sort previously updated articles
    [Documentation]           Previously updated articles
    [Tags]                    Sorting_previously_updated_List_desc_asc
    Login Editor
    Open The Content Page
	Click Element                       xpath://*[@id="view-changed-table-column"]/a
	Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid&order=changed&sort=asc
    Click Element                       xpath://*[@id="view-changed-table-column"]/a
	Wait Until Location Contains        https://test.skatteinformation.se/admin/content?title=&type=All&status=All&sticky=All&uid=&order=changed&sort=desc



