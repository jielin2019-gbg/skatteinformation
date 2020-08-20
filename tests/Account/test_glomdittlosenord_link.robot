*** Settings ***
Documentation                            As a user I want to reset my password so that I can log in (when I have forgotten my password)
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/teardown_keywords.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Logout And Close All

*** Variables ***
${BROWSER} =                            headlesschrome
${reset_email_service}                  https://mail.google.com/mail/

*** Test Cases ***
Test Glömt Ditt Lösenord link
    Click Link Glömt Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page
    Submit Email Address

Check link in Gmail
    Change Chrome
    Input Gmail Account
    Input Gmail Password
    Submit Gmail Credentials
    Click Skatteinformation Email
    Click Link in Email
    Click Log In
    Change Password
    The Password Should Be Changed Successfully
    Delete The Skatteinformation Email In Gmail

*** Keywords ***
Click Link Glömt Ditt Lösenord
    ${ele}      Get WebElement          xpath://a[contains(text(),'glömt ditt lösenord')]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}

The Page Should Navigate to Återställ Ditt Lösenord Page
    ${url}=      Get Location
    Should Match    ${url}              https://test.skatteinformation.se/user/password
    Page Should Contain                 Återställ ditt lösenord

Submit Email Address
    Input Text                          id:edit-name    ${RESET_EMAIL}
    Click Button                        id:edit-submit
    Page Should Contain                 Ytterligare instruktioner har skickats till din e-postadress.

Input Gmail Account
    Go to                               ${reset_email_service}
    Input Text                          id:identifierId    ${RESET_EMAIL}
    ${ele}      Get WebElement          xpath://*[@id="identifierNext"]/div/button/div[2]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}

Input Gmail Password
    Wait Until Element Is Visible       name:password
    Input Text                          name:password       ${RESET_EMAIL_PASSWORD}

Submit Gmail Credentials
    ${ele}      Get WebElement          xpath://*[@id="passwordNext"]/div/button/div[2]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    sleep    6

Click Skatteinformation Email
    ${ele}      Get WebElement          xpath://span[contains(text(),'Skatteinformation')]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    sleep    6

Click Link in Email
    ${ele}      Get WebElement          xpath://a[contains(@href,'sendgrid')]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    sleep     5

Click Log In
    Switch Window                       title:Återställ lösenord | Skatteinformation
    The Page Should Navigate to Change Password Page
    click element                       xpath://input[contains (@class, 'submit')]
    sleep       6

Change Password
    Input Text      id:edit-pass-pass1   slimy-very-decorate-transit
    Input Text      id:edit-pass-pass2   slimy-very-decorate-transit
    ${ele}      Get WebElement           id:edit-submit
    Execute Javascript                   arguments[0].click();       ARGUMENTS    ${ele}

Change Chrome
    ${options}=    Evaluate              sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${userAgent}=  set variable          --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36"
    #Call Method    ${options}            add_argument  ${userAgent}
    #Call Method     ${options}           add_argument   --headless
    Call Method    ${options}    add_argument    test-type
    Call Method    ${options}            add_argument  ${userAgent}
    Call Method    ${options}    add_argument    --disable-extensions
    Call Method   ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --disable-gpu
    Call Method    ${options}    add_argument    --no-sandbox
    Create WebDriver    Chrome           chrome_options=${options}



Change Chrome2
    sleep  2
Delete The Skatteinformation Email In Gmail
    Change Chrome
    Input Gmail Account
    Input Gmail Password
    Submit Gmail Credentials
    Click Skatteinformation Email
    Click Element                           //*[@id=":4"]/div[2]/div[1]/div/div[2]/div[3]

The Page Should Navigate to Change Password Page
    Page Should Contain                     Klicka på denna knapp för att logga in på webbplatsen och byta lösenord.

The Password Should Be Changed Successfully
    Page Should Contain                     Ändringarna har sparats

