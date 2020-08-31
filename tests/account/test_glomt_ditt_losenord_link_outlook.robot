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






