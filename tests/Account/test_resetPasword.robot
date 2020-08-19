*** Settings ***
Documentation                            As a user I want to reset my password so that I can log in (when I have forgotten my password)
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Close All Browsers

*** Variables ***
${BROWSER} =                            chrome
${reset_email_service} =        https://mail.google.com/mail/u/0/#inbox
*** Test Cases ***
Going to the "Återställ ditt lösenord" page
    Given the Återställ ditt lösenord page is open
    when user puts in emailadrees and presses submit
    then the user will get a popup and a email



*** Keywords ***
Skatteinformation Website Is Open
    Open Browser                        ${URL}     ${BROWSER}
    Set Window Size    ${1920}    ${1080}


the Återställ ditt lösenord page is open
    Location Should Contain	 https://test.skatteinformation.se/user/login?destination=/start
    Page Should Contain     Återställ ditt lösenord
    Click Element   //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Location Should Contain	 https://test.skatteinformation.se/user/password

user puts in emailadrees and presses submit
    Input Text   //*[@id="edit-name"]   ${RESET_EMAIL}
    Click Button     //*[@id="edit-submit"]

the user will get a popup and a email
    Page Should Contain     Ytterligare instruktioner har skickats till din e-postadress.
    Go to                               ${reset_email_service}
    Input Text                          id:identifierId    ${RESET_EMAIL}
    ${ele}      Get WebElement          xpath://[@id="identifierNext"]/div/button/div[2]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    Wait Until Element Is Visible       name:password
    Input Text                          name:password       ${RESET_EMAIL_PASSWORD}
    ${ele}      Get WebElement          xpath://[@id="passwordNext"]/div/button/div[2]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}