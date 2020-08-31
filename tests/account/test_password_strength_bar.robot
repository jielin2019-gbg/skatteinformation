*** Settings ***
Documentation                           Testing for number of characters allowed in passwordfield and make a
...                                     boundary value analysis
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/teardown_keywords.robot
Suite Setup                             Login to Skatteinformation and go to account settings
Suite Teardown                          Logout And Close All

*** Variables ***
${BROWSER}                              chrome
${NEW_PASS_ID}                          id:edit-pass-pass1
${PASS_STRENGTH}                        //div[@class='password-strength']
${PASS_STRENGTH_BAR}                    //div[@class='password-strength__meter']

*** Test Cases ***
Assert password strength bar set to xx%
    [Documentation]                     Verifying password strength bar to show xx% when password is weak
    [Tags]                              PASSWEAK
    Input Text                          ${NEW_PASS_ID}       aaAA99!!
    ${WIDTH_STRENGTH_BAR}               Get Element Attribute   //div[contains(@class,'password-strength__indicator')]  style
    Log to console                      Width_strengt_bar variable for password strength bar:   no_newline=true
    Log to console                      ${WIDTH_STRENGTH_BAR}
    #Log to console                      Height variable for password strength bar:              no_newline=true
    #Log to console                      ${HEIGHT}

*** Keywords ***
Login to Skatteinformation and go to account settings
    Skatteinformation Website Is Open
    Login ResetUser
    Go To                               https://test.skatteinformation.se/user/8629/edit

Click The Submit Button
    ${ele}                              Get WebElement              id=edit-submit
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}