*** Settings ***
Documentation                                           Reset my password through registered gmail
Library                                                 SeleniumLibrary
Library                                                 ImapLibrary2
Library                                                 String
Resource	                                            ../Resources/login_keywords.robot
Resource	                                            ../Resources/login_variables.robot
Resource                                                ../Resources/setup_keywords.robot
Resource                                                ../Resources/teardown_keywords.robot
Test Setup                                              Delete All Old Emails
Test Teardown                                           Logout And Close All

*** Variables ***
${BROWSER}                                              headlesschrome
${mailbox_host}                                         imap.gmail.com

*** Test Cases ***
Test Glömt Ditt Lösenord link
    Click Link Glömt Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page

Test Återställ ditt lösenord link
    Click Återställ ditt lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page

Check link in Gmail
    [Tags]                                              RESETPASS
    Send Reset Email                                    ${RESET_EMAIL}
    Open Mailbox                                        host=${mailbox_host}   user=${RESET_EMAIL}   password=${RESET_EMAIL_PASSWORD}
    ${LATEST} =                                         Wait For Email    sender=skatteinformation@wolterskluwer.se    timeout=300
    ${BODY} =                                           Get Email Body                  ${LATEST}
    ${URL} =                                            Get Lines Matching Regexp      ${BODY}             .sendgrid.net        partial_match=True
    Go To                                               ${URL}
    Click Log In
    Change Password
    The Password Should Be Changed Successfully
    Delete Email                                        ${LATEST}
    Close Mailbox

Check link in Outlook
    [Tags]                                              RESETPASS
    Send Reset Email                                    ${RESET_EMAIL_OUTLOOK}
    Input Outlook Account                               ${RESET_EMAIL_OUTLOOK}
    Input Outlook Password
    Submit Outlook Credentials
    Click Skatteinformation Email
    Click Link in Email
    Click Log In
    Change Password
    The Password Should Be Changed Successfully

*** Keywords ***
Click Återställ ditt lösenord
    Click Element                                       //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a

Click Link Glömt Ditt Lösenord
    ${ele}      Get WebElement                          xpath://a[contains(text(),'glömt ditt lösenord')]
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

Send Reset Email
    [Arguments]                                         ${email}
    Click Link Glömt Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page
    Submit Email Address                                ${email}

The Page Should Navigate to Återställ Ditt Lösenord Page
    Page Should Contain                                 Återställ ditt lösenord

Submit Email Address
    [Arguments]                                         ${email_address}
    Input Text                                          id:edit-name    ${email_address}
    Click Button                                        id:edit-submit
    Page Should Contain                                 Ytterligare instruktioner har skickats till din e-postadress.

Click Link in Email
    Wait Until Element Is Visible                       xpath://a[contains(@href,'sendgrid')]       timeout= 3 min
    ${ele}      Get WebElement                          xpath://a[contains(@href,'sendgrid')]
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

Click Log In
    Switch Window                                       title:Återställ lösenord | Skatteinformation
    The Page Should Navigate to Change Password Page
    click element                                       xpath://input[contains (@class, 'submit')]

Change Password
    Scroll Element Into View                            id:edit-pass-pass1
    Wait Until Element Is Visible                       id:edit-pass-pass1      timeout= 20 s
    Input Text                                          id:edit-pass-pass1   ${PASSWORD}
    Wait Until Element Is Visible                       id:edit-pass-pass1      timeout= 20 s
    Scroll Element Into View                            id:edit-pass-pass2
    Input Text                                          id:edit-pass-pass2   ${PASSWORD}
    ${ele}      Get WebElement                          id:edit-submit
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

The Page Should Navigate to Change Password Page
    Page Should Contain                                 Klicka på denna knapp för att logga in på webbplatsen och byta lösenord.

The Password Should Be Changed Successfully
    Page Should Contain                                 Ändringarna har sparats

Input Outlook Account
    [Arguments]                                         ${outlook_email}
    Go to                                               ${reset_email_service}
    Input Text                                          id:i0116    ${outlook_email}
    ${ele}      Get WebElement                          id:idSIButton9
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

Input Outlook Password
    Wait Until Element Is Visible                       id:i0118
    Input Text                                          id:i0118     ${RESET_EMAIL_PASSWORD}

Submit Outlook Credentials
    ${ele}      Get WebElement                          id:idSIButton9
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}
    ${ele}      Get WebElement                          id:idBtn_Back
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

Click Skatteinformation Email
    Go To                                               https://outlook.live.com/mail/0/inbox
    Wait Until Element Is Visible                       xpath://span[@title='skatteinformation@wolterskluwer.se']       timeout= 20 s
    ${ele}      Get WebElement                          xpath://span[@title='skatteinformation@wolterskluwer.se']
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}
