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
${PASSWORD_FIELD_ID}                    id:edit-pass-pass1
${CONFIRM_PASSWORD_FIELD_ID}            id:edit-pass-pass2

*** Test Cases ***
Max number of characters in password field
    [Documentation]                     Verifying max allowed characters into password field
    [Tags]                              MAXPASS
    ${AMOUNT_OF_CHARACTERS}             Get Element Attribute       ${PASSWORD_FIELD_ID}  maxlength
    Should Be Equal                     ${AMOUNT_OF_CHARACTERS}     128     The attribute 'maxlength' may have been changed in the field ${PASSWORD_FIELD_ID}

Max number of characters in password confirmation field
    [Documentation]                     Verifying max allowed characters into password confirmation field
    [Tags]                              MAXCONFIRM
    ${AMOUNT_OF_CHARACTERS}             Get Element Attribute       ${CONFIRM_PASSWORD_FIELD_ID}  maxlength
    Should Be Equal                     ${AMOUNT_OF_CHARACTERS}     128     The attribute 'maxlength' may have been changed ${CONFIRM_PASSWORD_FIELD_ID}

No password change when fields is left empty
    [Documentation]                     Confirming no changes of password when fields left empty
    [Tags]                              NOCHANGE
    Scroll Element Into View            id=edit-submit
    Input Text                          ${PASSWORD_FIELD_ID}            foo
    Clear Element Text                  ${PASSWORD_FIELD_ID}
    Input Text                          ${CONFIRM_PASSWORD_FIELD_ID}    fighter
    Clear Element Text                  ${CONFIRM_PASSWORD_FIELD_ID}
    Click The Submit Button
    Log Out Forced

    #To confirm no change to password relog with default password
    Login ResetUser
    Location Should Contain             ${URL}start

*** Keywords ***

Login to Skatteinformation and go to account settings
    Skatteinformation Website Is Open
    Login ResetUser
    Go To                               https://test.skatteinformation.se/user/8629/edit

Log in and go to account settings
    Login ResetUser
    Go To                               https://test.skatteinformation.se/user/8629/edit

Click The Submit Button
    ${ele}                              Get WebElement              id=edit-submit
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}