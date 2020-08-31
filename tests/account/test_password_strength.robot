*** Settings ***

Documentation                                           Change daily email, weekly email settings in Mitt Konto
Library                                                 SeleniumLibrary
Resource	                                            ../Resources/login_keywords.robot
Resource	                                            ../Resources/login_variables.robot
Resource	                                            ../Resources/setup_keywords.robot
Resource                                                ../Resources/teardown_keywords.robot
Suite Setup                                             Testing Setup
Suite Teardown                                          Logout And Close All


*** Variables ***

${BROWSER}                                             chrome
${PASS_STRENGTH}                                        //div[@class='password-strength']
${NEW_PASS_ID}                                          id:edit-pass-pass1

*** Test Cases ***

Test password less than 10char
    Input Text                                          ${NEW_PASS_ID}       aaAA99!!
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Svag

    Input Text                                          ${NEW_PASS_ID}       123fff999
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Svag

    Input Text                                          ${NEW_PASS_ID}       hej
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Svag


Test password 12char of one type
    Input Text                                          ${NEW_PASS_ID}       abcdefghijkl
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Tillräcklig

    Input Text                                          ${NEW_PASS_ID}       123456789101
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Tillräcklig

    Input Text                                          ${NEW_PASS_ID}       !"#_¤%&/(.,?
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Tillräcklig


Test password 12char + 2 other requisites
    Input Text                                          ${NEW_PASS_ID}       123abc456def
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Bra

    Input Text                                          ${NEW_PASS_ID}       _12_34_56_78
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Bra


Test password 12char + 3 other requisites
    Input Text                                          ${NEW_PASS_ID}       123abc456DEF
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark

    Input Text                                          ${NEW_PASS_ID}       kias12_!o#9ac
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark

Test password all requisites
    Input Text                                          ${NEW_PASS_ID}       abc123DEF!"#
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark

    Input Text                                          ${NEW_PASS_ID}       4gC#!1mn9P6_
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark

Test password all requisites then just 1
    Input Text                                          ${NEW_PASS_ID}       abc123DEF!"#
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Stark
    Clear Password
    Element Should Contain                              ${PASS_STRENGTH}     Lösenordsstyrka: Svag


*** Keywords ***

Testing Setup
    Skatteinformation Website Is Open
    Log in and go to account settings


Log in and go to account settings
    Log in ResetUser
    Go To                                               https://test.skatteinformation.se/user/8629/edit

Clear Password
    Scroll Element Into View                            id:edit-submit
    Click Element                                       id:edit-pass-pass1
    Press Keys                                          None     BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE+BACKSPACE