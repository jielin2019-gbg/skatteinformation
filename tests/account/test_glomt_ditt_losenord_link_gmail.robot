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
Test Setup                                              Skatteinformation Website Is Open
Test Teardown                                           Logout And Close All

*** Variables ***
${BROWSER} =                                            headlesschrome
${mailbox_host}                                         imap.gmail.com

*** Test Cases ***
Test Glömt Ditt Lösenord link
    Click Link Glömt Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page
    Submit Email Address                                ${RESET_EMAIL}

Check link in Gmail
    Open Mailbox                                        host=${mailbox_host}   user=${RESET_EMAIL}   password=${RESET_EMAIL_PASSWORD}
    ${LATEST} =                                         Wait For Email    sender=skatteinformation@wolterskluwer.se    timeout=300
    ${BODY} =                                           Get Email Body                  ${LATEST}
    ${URL} =                                            Get Lines Matching Regexp      ${BODY}             .sendgrid.net        partial_match=True
    Go To                                               ${URL}
    Click Log In
    Change Password
    The Password Should Be Changed Successfully
    Delete Email    ${LATEST}
    Close Mailbox


