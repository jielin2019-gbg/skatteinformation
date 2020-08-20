*** Settings ***
Documentation                            As a user I want to reset my password so that I can log in (when I have forgotten my password)
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Close All Browsers

*** Variables ***
${BROWSER}                              chrome
${reset_email_service} =         https://mail.google.com/mail/
*** Test Cases ***
Going to the Återställ ditt lösenord page
    Given the Återställ ditt lösenord page is open
    when user puts in emailadrees and presses submit
    then the user will get a popup and a email



*** Keywords ***


the Återställ ditt lösenord page is open
    Location Should Contain	 https://test.skatteinformation.se/user/login?destination=/start
    Page Should Contain     Återställ ditt lösenord
    Click Element   //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Location Should Contain	 https://test.skatteinformation.se/user/password

user puts in emailadrees and presses submit
    Input Text   //*[@id="edit-name"]   ${RESET_EMAIL}
    Click Button     //*[@id="edit-submit"]

the user will get a popup and a email

   # Page Should Contain     Ytterligare instruktioner har skickats till din e-postadress.
    
   ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${userAgent}=  set variable  --user-agent="Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/84.0.4147.125 Safari/537.36"
   Call Method    ${options}     add_argument  ${userAgent}
        Call Method    ${options}    add_argument    headless
        Call Method    ${options}    add_argument    disable-gpu
        Call Method    ${options}    add_argument    --start-maximized
        Call Method    ${options}    add_argument    --allow-running-insecure-content
        Call Method    ${options}    add_argument    --disable-web-security
        Call Method    ${options}    add_argument    --disable-dev-shm-usage
        Call Method    ${options}    add_argument    --no-sandbox
        Create WebDriver    Chrome    chrome_options=${options}
    
    Go to                               ${reset_email_service}
    Input Text                          id:identifierId    ${RESET_EMAIL}
   ${ele}      Get WebElement          //*[@id="identifierNext"]/div/button
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    Wait Until Element Is Visible       name:password
    Input Text                          name:password       ${RESET_EMAIL_PASSWORD}
    ${ele}      Get WebElement          //*[@id="passwordNext"]/div/button/div[2]
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}

    Sleep  10
    ${ele}      Get WebElement          //*[@id=":2t"]/span/span
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    Sleep   6
    Page Should Contain         Ersättande inloggningsuppgifter för infotiv-user-reset på Wolters Kluwer Skatteinformation
    Click Element    //*[@id=":4"]/div[2]/div[1]/div/div[2]/div[3]
