*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/QA_keywords.robot
Resource                                        ../Resources/login_variables.robot
Library                                         SeleniumLibrary
Suite Setup                                     Begin Web Test
Test Teardown                                   Log Out
Suite Teardown                                  End Web Test

*** Variables ***
${BROWSER}                                      chrome
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

Next Page
    [Tags]                                      Q/A page
    Given Begin at Q/A page
     When Click Next page arrow
     Then Next page is shown

Test on 'Collapse' button
    [Tags]                                      'Collapse' button functionality
    User clicks on show button
    Collapse button is clicked
    Q/A paragraph disappear

Selecting a filter category
    [Tags]                                      TIPG-555 Q/A page
    Given Begin at Q/A page
    When Clicking show more and selecting category
    Then Checkbox should be selected

Visa Button
    [Tags]                                      TIPG-549
    Given Begin at Q/A page
    When Click 'Visa' Button
    Then Verify answer is visable

