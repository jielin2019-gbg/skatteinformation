*** Settings ***
Documentation     Test functionality of saving an article (automation)
Library           SeleniumLibrary
Library           String
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Test Setup  Go To Page
Test Teardown  Close page

*** Variables ***
${BROWSER} =        headlesschrome

*** Keywords ***
Go To Page
   Open Browser  ${URL}  ${BROWSER}
   Set Window Size    ${1920}    ${1080}
Close page
   Close Browser

*** Test Cases ***
Saving an article
    [Documentation]     Test saving function in edit page
    [Tags]              saving
    # Login
    Login Editor
    Wait Until Page Contains    infotiv-editor
    #Go to Create Article
    Go to                       https://test.skatteinformation.se/node/add/article
    #Input text in Title
    Input Text                  xpath://*[@id="edit-title-0-value"]     Test artikel
    #Save article
    Click Element               id:edit-submit
    #Check if article is saved
    Wait Until Page Contains    Test artikel (Artikel) har skapats.
    ${url} =                    Get Location
    ${ID} =                     Get Substring  ${url}  42  47
    Set Global Variable         ${ID}
    #Go to administrate page
    Go To                       https://test.skatteinformation.se/node/17616/edit?destination=/admin/content
    #Klick publish checkbox
    Select Checkbox             /html/body/div[2]/div/main/div[3]/div/form/div/div[3]/div/div[1]/div/div/input


    #Remove created article
    Go To                       https://test.skatteinformation.se/node/${ID}/delete

    Wait Until Page Contains    Är du säker på att du vill radera content item Test artikel?
    Click Element               id:edit-submit
    Wait Until Page Contains    Artikel Test artikel har raderats.