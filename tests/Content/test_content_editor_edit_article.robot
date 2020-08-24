*** Settings ***
Documentation     A single test to see if a user with the right credentials can log in as an editor and edit content on the content page.
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

Create test article
    Go To                       https://test.skatteinformation.se/node/add/article
    Input Text                  xpath://*[@id="edit-title-0-value"]     Test artikel
    Click Element               id:edit-submit
    Wait Until Page Contains    Test artikel (Artikel) har skapats.
    ${url} =                    Get Location
    ${ID} =                     Get Substring  ${url}  42  47
    Set Global Variable         ${ID}

Go to Content Page
    Go To                           https://test.skatteinformation.se/admin/content
    Wait Until Element Is Visible   xpath://html/body/div[2]/div/main/div[3]/div[2]/div/div/div[2]/table/tbody/tr[1]/td[7]/div/div/ul/li[1]/a

Go to edit page for the top item on the content page
    Click Element                   xpath://a[contains(text(),'Test artikel')]/../../td[7]/div/div/ul/li[contains(@class, 'edit')]/a
    Wait Until Page Contains        Kom ihåg att ändra författardatumet innan du publicerar

Edit title and save changes
    Input Text                      xpath://html/body/div[2]/div/main/div[3]/div/form/div/div[1]/div/div/div/details[1]/div/fieldset[1]/div/div[1]/div/input        (automated_edit)        clear=False
    Click Button                    xpath://html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input
    Wait Until Page Contains        har uppdaterats.

Delete test article
    Go To                       https://test.skatteinformation.se/node/${ID}/delete
    Wait Until Page Contains    Är du säker på att du vill radera content item
    Click Element               id:edit-submit
    Wait Until Page Contains    har raderats.

Given that the editor is on content type page after logging in
    Login Editor
    Create test article
    Go to Content Page

When the editor clicks on the edit button on a chosen content edit page
    Go to edit page for the top item on the content page

Then the chosen content should be edited
    Edit title and save changes
    Delete test article

Close Webpage
    Close Browser

*** Test Cases ***
Login to webpage as Editor and edit an Article
    [Documentation]     Login to https://test.skatteinformation.se/ as an Editor and edit content on the content page.
    [Tags]              login       editor      content     edit
    Given that the editor is on content type page after logging in
    When the editor clicks on the edit button on a chosen content edit page
    Then the chosen content should be edited
	
