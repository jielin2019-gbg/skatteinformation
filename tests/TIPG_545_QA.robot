*** Settings ***
Documentation
Resource                                        Resources/login_keywords.robot
Resource                                        Resources/QA_keywords.robot
Library                                         SeleniumLibrary
Test Setup                                      Begin Web Test
Test Teardown                                   End Web Test


*** Variables ***
${BROWSER}                                      chrome
${URL}                                          https://test.skatteinformation.se/
${USERNAME_USER}                                infotiv-user
${USERNAME_EDITOR}                              infotiv-editor
${PASSWORD}                                     slimy-very-decorate-transit


*** Test Cases ***
Test on 'Collapse' button
    [Tags]                                      Link in QA paragraph
    User clicks on show button
    Collapse button is clicked
    Q/A paragraph disappear
