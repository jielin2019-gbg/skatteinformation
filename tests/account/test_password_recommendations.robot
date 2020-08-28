*** Settings ***
Documentation                                           Change daily email, weekly email settings in Mitt Konto
Library                                                 SeleniumLibrary
Resource	                                            ../Resources/login_keywords.robot
Resource	                                            ../Resources/login_variables.robot
Resource	                                            ../Resources/setup_keywords.robot
Suite Setup                                             Testing Setup
Suite Teardown                                          Close Browser

*** Variables ***
${BROWSER}                                              chrome
${REC_BOX}                                              //div[@class='password-suggestions description']


*** Test Cases ***
Recommendation box all password tips showing
    [Documentation]                                     Checking all recommendations are showing when password field is left empty
    [Tags]                                              qwerty
    Enter password                                      qwerty
    Clear Password Test
    Recommendation box should contain                   Make it at least 12 characters
    Recommendation box should contain                   Lägg till små bokstäver
    Recommendation box should contain                   Lägg till versaler
    Recommendation box should contain                   Lägg till siffror
    Recommendation box should contain                   Lägg till skiljetecken

#    Commented out since Clear Password doesn´t work on Jenkins server

Recommendation box 'atleast 12 characters' tip removal
    [Documentation]                                     Checking the visual text in the password recommendations
    Enter password                                      123456789101           #12 characters
    Recommendation box should not contain               Make it at least 12 characters

Recommendation box 'atleast 12 characters' tip reappearing
    [Documentation]                                     Checking the visual text in the password recommendations
    Enter password                                      123456789101           #12 characters
    Recommendation box should not contain               Make it at least 12 characters
    Enter password                                      .
    #Clear Password
    Recommendation box should contain                   Make it at least 12 characters

Recommendation box 'små bokstäver' tip removal
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_3
    Enter password                                      qwerty
    Recommendation box should not contain               Lägg till små bokstäver

Recommendation box 'små bokstäver' tip reappearing
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_4
    Enter password                                      qwerty
    Recommendation box should not contain               Lägg till små bokstäver
    Enter password                                      .
    #Clear password
    Recommendation box should contain                   Lägg till små bokstäver

Recommendation box 'versaler' tip removal
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_5
    Enter password                                      QWERTY
    Recommendation box should not contain               Lägg till versaler

Recommendation box 'versaler' tip reappearing
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_6
    Enter password                                      QWERTY
    Recommendation box should not contain               Lägg till versaler
    #Clear Password
    Enter password                                      .
    Recommendation box should contain                   Lägg till versaler

Recommendation box 'siffror' tip removal
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_7
    Enter password                                      123456
    Recommendation box should not contain               Lägg till siffror

Recommendation box 'siffror' tip reappearing
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_8
    Enter password                                      123456
    Recommendation box should not contain               Lägg till siffror
    #Clear password
    Enter password                                      .
    Recommendation box should contain                   Lägg till siffror

Recommendation box 'skiljetecken' tip removal
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_9
    Enter password                                      !-#%/!
    Recommendation box should not contain               Lägg till skiljetecken

Recommendation box 'skiljetecken' tip reappearing
    [Documentation]                                     Checking the visual text in the password recommendations
    [Tags]                                              test_10
    Enter password                                      !-#%/!
    Recommendation box should not contain               Lägg till skiljetecken
    Enter password                                      a
    #Clear password
    Recommendation box should contain                   Lägg till skiljetecken

Recommendation box no password tips showing
    [Documentation]                                     Checking that no recommendations are showing when all recommends are fulfilled
    [Tags]                                              test_11
    Enter password                                      Qwerty123456!
    Recommendation box should not contain               Make it at least 12 characters
    Recommendation box should not contain               Lägg till små bokstäver
    Recommendation box should not contain               Lägg till versaler
    Recommendation box should not contain               Lägg till siffror
    Recommendation box should not contain               Lägg till skiljetecken

*** Keywords ***
Testing Setup
    Skatteinformation Website Is Open
    Log in and go to account settings

Log in and go to account settings
    Log in ResetUser
    Go To                                               https://test.skatteinformation.se/user/8629/edit

Enter password
    [Arguments]                                         ${pass}
    Input Text                                          id:edit-pass-pass1      ${pass}

Recommendation box should not contain
    [Arguments]                                         ${text}
    ${recommendations}                                  Get Text                ${REC_BOX}
    Should Not Contain                                  ${recommendations}      ${text}

Recommendation box should contain
    [Arguments]                                         ${text}
    ${recommendations}                                  Get Text                ${REC_BOX}
    Should Contain                                      ${recommendations}      ${text}

Clear Password
    #Function only removes 6 characters and Function does not work in Jenkins server
    Scroll Element Into View                            id:edit-submit
    Click Element                                       id:edit-pass-pass1
    Press Keys                                          None     BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE



Clear Password Test
    Input Text                                          id:edit-pass-pass1    ${EMPTY}