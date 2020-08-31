*** Settings ***
Documentation                                           As a user I want to reset my password through registered gmail so that I can log in
...                                                     (when I have forgotten my password)
Library                                                 SeleniumLibrary
Library                                                 ImapLibrary2
Library                                                 String
Resource	                                            ../Resources/login_keywords.robot
Resource	                                            ../Resources/login_variables.robot
Resource                                                ../Resources/setup_keywords.robot
Resource                                                ../Resources/teardown_keywords.robot
Resource                                                ../Resources/account_reset_password_keywords.robot
Test Setup                                              Delete All Old Emails
Test Teardown                                           Logout And Close All

*** Variables ***
${BROWSER} =                                            chrome
${mailbox_host}                                         imap.gmail.com

*** Test Cases ***
Test Glömt Ditt Lösenord link
    Click Link Glömt Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page

Test Återställ ditt lösenord link
    Click Återställ ditt lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page

Check link in Gmail
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
    Send Reset Email                                    ${RESET_EMAIL_OUTLOOK}
    Input Outlook Account                               ${RESET_EMAIL_OUTLOOK}
    Input Outlook Password
    Submit Outlook Credentials
    Click Skatteinformation Email
    Click Link in Email
    Click Log In
    Change Password
    The Password Should Be Changed Successfully
    Delete The Skatteinformation Email In Gmail

*** Keywords ***
Click Återställ ditt lösenord
    Click Element                                       //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a

Click Link Glömt Ditt Lösenord
    ${ele}      Get WebElement                          xpath://a[contains(text(),'glömt ditt lösenord')]
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}
