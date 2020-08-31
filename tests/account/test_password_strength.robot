*** Settings ***
Documentation                                           Testing to see the password strength changes correctly
Library                                                 SeleniumLibrary
Resource	                                            ../Resources/login_keywords.robot
Resource	                                            ../Resources/login_variables.robot
Resource	                                            ../Resources/setup_keywords.robot
Resource                                                ../Resources/teardown_keywords.robot
Suite Setup                                             Testing Setup
Suite Teardown                                          Logout And Close All


*** Variables ***
${BROWSER}                                              headlesschrome
${PASS_STRENGTH}                                        //div[@class='password-strength']
${NEW_PASS_ID}                                          id:edit-pass-pass1


*** Test Cases ***
Test password less than 10char
    [Tags]                                              PASSWEAK
    Input Text                                          ${NEW_PASS_ID}       aaAA99!!
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Svag
    Check Strength Meter                                50

    Input Text                                          ${NEW_PASS_ID}       123fff999
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Svag
    Check Strength Meter                                30

    Input Text                                          ${NEW_PASS_ID}       hej
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Svag
    Check Strength Meter                                0

Test password 12char of one type
    Input Text                                          ${NEW_PASS_ID}       abcdefghijkl
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Tillräcklig
    Check Strength Meter                                60

    Input Text                                          ${NEW_PASS_ID}       123456789101
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Tillräcklig
    Check Strength Meter                                60

    Input Text                                          ${NEW_PASS_ID}       !"#_¤%&/(.,?
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Tillräcklig
    Check Strength Meter                                60

Test password 12char + 2 other requisites
    Input Text                                          ${NEW_PASS_ID}       123abc456def
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Bra
    Check Strength Meter                                75

    Input Text                                          ${NEW_PASS_ID}       _12_34_56_78
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Bra
    Check Strength Meter                                75

Test password 12char + 3 other requisites
    Input Text                                          ${NEW_PASS_ID}       123abc456DEF
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark
    Check Strength Meter                                87.5

    Input Text                                          ${NEW_PASS_ID}       kias12_!o#9ac
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark
    Check Strength Meter                                87.5

Test password all requisites
    Input Text                                          ${NEW_PASS_ID}       abc123DEF!"#
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark
    Check Strength Meter                                100

    Input Text                                          ${NEW_PASS_ID}       4gC#!1mn9P6_
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark
    Check Strength Meter                                100

*** Keywords ***
Testing Setup
    Skatteinformation Website Is Open
    Log in and go to account settings

Log in and go to account settings
    Log in ResetUser
    Go To                                               https://test.skatteinformation.se/user/8629/edit

Check Strength Meter
    [Arguments]                                         ${percent}
    ${WIDTH_STRENGTH_BAR}                               Get Element Attribute   //div[contains(@class,'password-strength__indicator')]            style
    Should Match                                        ${WIDTH_STRENGTH_BAR}          width: ${percent}%;
