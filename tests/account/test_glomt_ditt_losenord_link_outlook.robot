*** Settings ***
Documentation                           As a user I want to reset my password through registered outlook email so that I can log in
...                                     (when I have forgotten my password)
Library                                 SeleniumLibrary
Library                                 String
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/teardown_keywords.robot
Resource                                ../Resources/account_reset_password_keywords.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Logout And Close All

*** Variables ***
${BROWSER} =                            chrome
${reset_email_service}                  https://login.live.com/pp1600/
#${mailbox_host}                         http://imap.outlook.com/


*** Test Cases ***
Check link in Outlook
    Test Glömt Ditt Lösenord link
    Input Outlook Account               ${RESET_EMAIL_OUTLOOK}
    Input Outlook Password
    Submit Outlook Credentials
    Click Skatteinformation Email
    Click Link in Email
    Click Log In
    Change Password
    The Password Should Be Changed Successfully
    Delete The Skatteinformation Email In Gmail

Check link in Gmail
    Test Glömt Ditt Lösenord link
    Open Mailbox                                        host=imap.gmail.com   user=${RESET_EMAIL}   password=${RESET_EMAIL_PASSWORD}
    ${LATEST} =                                         Wait For Email    sender=skatteinformation@wolterskluwer.se    timeout=300
    ${BODY} =                                           Get Email Body                  ${LATEST}
    ${URL} =                                            Get Lines Matching Regexp      ${BODY}             .sendgrid.net        partial_match=True
    Go To                                               ${URL}
    Click Log In
    Change Password
    The Password Should Be Changed Successfully
    Delete Email    ${LATEST}
    Close Mailbox

*** Keywords ***
Test Glömt Ditt Lösenord link
    Click Link Glömt Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page
    Submit Email Address                ${RESET_EMAIL_OUTLOOK}

Click Link in Email
    Wait Until Element Is Visible       xpath://a[contains(@href,'sendgrid')]       timeout= 3 min
    ${ele}      Get WebElement          xpath://a[contains(@href,'sendgrid')]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}



