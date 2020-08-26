*** Settings ***
Documentation                            As a user I want to reset my password so that I can log in (when I have forgotten my password)
Library                                 SeleniumLibrary
Library                                 ImapLibrary2
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/browser_variables.robot
Resource                                ../Resources/teardown_keywords.robot

Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Logout And Close All

*** Variables ***
${BROWSER} =     ${HEADLESS_CHROME}

*** Test Cases ***
Going to the Återställ ditt lösenord page
    Given the Återställ ditt lösenord page is open
    when user puts in emailadrees and presses submit
    then the user will get a popup and a email



*** Keywords ***


the Återställ ditt lösenord page is open
    Location Should Contain	 ${URL}
    Page Should Contain     Återställ ditt lösenord
    Click Element   //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Location Should Contain	 https://test.skatteinformation.se/user/password

user puts in emailadrees and presses submit
    Input Text   //*[@id="edit-name"]   ${RESET_EMAIL_OUTLOOK}
    Click Button     //*[@id="edit-submit"]

the user will get a popup and a email

    Page Should Contain     Ytterligare instruktioner har skickats till din e-postadress.
    Go to                               ${RESET_EMAIL_SERVICE}
    Wait Until Element Is Visible       //*[@id="i0116"]
    Input Text                           //*[@id="i0116"]   ${RESET_EMAIL_OUTLOOK}
    Click Element                     //*[@id="idSIButton9"]
    Wait Until Element Is Visible       //*[@id="i0118"]
    Input Text                        //*[@id="i0118"]   ${RESET_EMAIL_PASSWORD}
    Click Element                       //*[@id="idSIButton9"]
    Wait Until Element Is Visible       //*[@id="idBtn_Back"]
    Click Element                        //*[@id="idBtn_Back"]
    Go to                                https://outlook.live.com/mail/0/inbox
    Wait Until Element Is Visible        //*[@id="Pivot27-Tab1"]
    Click Element                        //*[@id="Pivot27-Tab1"]
    Wait Until Element Is Visible      xpath://span[@title='skatteinformation@wolterskluwer.se']   timeout=3 min
    ${ele}      Get WebElement          xpath://span[@title='skatteinformation@wolterskluwer.se']
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    Page Should Contain                 En begäran om att återställa lösenordet för ditt kontot har gjorts på Wolters Kluwer Skatteinformation.
    Click Element           //*[@id="app"]/div/div[2]/div[1]/div/div[3]/div[1]/div/div/div/div/div[1]/div[1]/button/span
