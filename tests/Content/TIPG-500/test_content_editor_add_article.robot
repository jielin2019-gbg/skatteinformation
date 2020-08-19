*** Settings ***
Documentation     A single test to see if a user with the right credentials can log in as an editor and add an article to the content page.
Library           SeleniumLibrary
Library           String
Resource	  ../../Resources/login_keywords.robot
Resource	  ../../Resources/login_variables.robot
Test Setup  Go to Webpage
Test Teardown  Close Webpage
	
*** Variables ***
${BROWSER} =        headlesschrome

*** Keywords ***

Generate Title
    ${RANDOMSTRING}=   Generate Random String   6   [NUMBERS]abcdef
    Set Global Variable     ${RANDOMSTRING}

Go to Webpage
    Open Browser  ${URL}  ${BROWSER}
    Set Window Size    ${1400}    ${600}
    Wait Until Page Contains        Du behöver vara inloggad

Go to Content Page
    Go To                           https://test.skatteinformation.se/admin/content
    Wait Until Element Is Visible   xpath://html/body/div[2]/div/main/div[3]/div[1]/ul/li/a

Go to Add content page
    Click Element                   xpath://html/body/div[2]/div/main/div[3]/div[1]/ul/li/a
    Wait Until Element Is Visible   xpath://html/body/div[2]/div/main/div[3]/div/ul/li[1]/a

Go to Article creation page
    Click Element                   xpath://html/body/div[2]/div/main/div[3]/div/ul/li[1]/a
    Wait Until Page Contains        Skapa Artikel

Add random test article name
    Input Text                      xpath://html/body/div[2]/div/main/div[3]/div/form/div/div[1]/div/div/div/details[1]/div/fieldset[1]/div/div[1]/div/input     test article ${RANDOMSTRING}        clear=True

Create article
    Click Button                    xpath://html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[2]/input
    Wait Until Page Contains        test article ${RANDOMSTRING} (Artikel) har skapats.

See if article was created
    Go To                           https://test.skatteinformation.se/admin/content
    Wait Until Page Contains        test article ${RANDOMSTRING}

Given that the editor is on content type page after logging in
    Login Editor
    Go to Content Page

When the content type article is selected
    Go to Add content page
    Go to Article creation page

Then an article can be added to the content page
    Add random test article name
    Create article
    See if article was created

Close Webpage
    Close Browser

*** Test Cases ***
Login to webpage as Editor and add an Article
    [Documentation]     Login to https://test.skatteinformation.se/ as an Editor and create an article.
    [Tags]              login       editor      article
    Generate Title
    Given that the editor is on content type page after logging in
    When the content type article is selected
    Then an article can be added to the content page
	
