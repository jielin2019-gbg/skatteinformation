*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/QA_keywords.robot
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
    [Tags]                                      TIPG-543
    Given User logged in front page
     When Click Q/A button menu bar
     Then Q/A page is shown

Test on 'Collapse' button
    [Tags]                                      TIPG-545
    User clicks on show button
    Collapse button is clicked
    Q/A paragraph disappear

Visa Button
    [Tags]                                      TIPG-549
    Given Begin at Q/A page
    When Click 'Visa' Button
    Then Verify answer is visible

Next Page
    [Tags]                                      TIPG-550
    Given Begin at Q/A page
     When Click Next page button
     Then Next page is shown

Previous Page
    [Tags]                                      TIPG-550
    Given Begin at Q/A page
    And On Next page
    When Click Previous page button
    Then Previous page is shown

Test mutiple filtering tags
    [Tags]                                  DEBUG / Test funcionality of mutiple filtering tags
    Given Begin at Q/A page
    When User select more than one filetring tag
    Then Verify selected tags became marked

Test Selected Q&A are displayed
    [Tags]                                  DEBUG / Test funcionality of chosen Q&A are displayed
    Given Begin at Q/A page
    When Check relevant Q&A are displayed
    Then Verify all Q&A are displayed

