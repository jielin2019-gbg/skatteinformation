*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/QA_keywords.robot
Library                                         SeleniumLibrary
Suite Setup                                     Begin Web Test
Suite Teardown                                  End Web Test


*** Variables ***
${BROWSER}                                      headless chrome
${URL}                                          https://test.skatteinformation.se/
${USERNAME_USER}                                infotiv-user
${USERNAME_EDITOR}                              infotiv-editor
${PASSWORD}                                     slimy-very-decorate-transit


*** Test Cases ***
Q/A Page Shown
    [Tags]                                      Q/A page
    Given User logged in front page
     When Click Q/A button menu bar
     Then Q/A page is shown

Test on 'Collapse' button
    [Tags]                                      'Collapse' button functionality
    User clicks on show button
    Collapse button is clicked
    Q/A paragraph disappear