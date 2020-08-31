*** Keywords ***
Test Glömt Ditt Lösenord link
    Click Link Glömt Ditt Lösenord
    The Page Should Navigate to Återställ Ditt Lösenord Page
    Submit Email Address                ${RESET_EMAIL_OUTLOOK}

Click Link Glömt Ditt Lösenord
    ${ele}      Get WebElement                          xpath://a[contains(text(),'glömt ditt lösenord')]
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

The Page Should Navigate to Återställ Ditt Lösenord Page
    ${url}=      Get Location
    Should Match    ${url}                              https://test.skatteinformation.se/user/password
    Page Should Contain                                 Återställ ditt lösenord

Submit Email Address
    [Arguments]                                         ${email_address}
    Input Text                                          id:edit-name    ${email_address}
    Click Button                                        id:edit-submit
    Page Should Contain                                 Ytterligare instruktioner har skickats till din e-postadress.

Click Link in Email
    Wait Until Element Is Visible       xpath://a[contains(@href,'sendgrid')]       timeout= 3 min
    ${ele}      Get WebElement          xpath://a[contains(@href,'sendgrid')]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}

Click Log In
    Switch Window                                       title:Återställ lösenord | Skatteinformation
    The Page Should Navigate to Change Password Page
    click element                                       xpath://input[contains (@class, 'submit')]

Change Password
    Scroll Element Into View                            id:edit-pass-pass1
    Wait Until Element Is Visible                       id:edit-pass-pass1      timeout= 3 min
    Input Text                                          id:edit-pass-pass1   ${RESET_PASSWORD}
    Wait Until Element Is Visible                       id:edit-pass-pass1      timeout= 3 min
    Scroll Element Into View                            id:edit-pass-pass2
    Input Text                                          id:edit-pass-pass2   ${RESET_PASSWORD}
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
    Wait Until Element Is Visible                       xpath://span[@title='skatteinformation@wolterskluwer.se']       timeout= 3 min
    ${ele}      Get WebElement                          xpath://span[@title='skatteinformation@wolterskluwer.se']
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

Delete The Skatteinformation Email In Gmail
    Click Skatteinformation Email
    Wait Until Element Is Visible                       xpath://*[@id="app"]/div/div[2]/div[1]/div[1]/div[3]/div[1]/div/div/div/div/div[1]/div[1]/button/span/i      timeout= 3 min
    ${ele}      Get WebElement                          xpath://*[@id="app"]/div/div[2]/div[1]/div[1]/div[3]/div[1]/div/div/div/div/div[1]/div[1]/button/span/i
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}

