*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/QA_keywords.robot
Library                                         SeleniumLibrary
Suite Setup                                     Begin Web Test
Test Teardown                                   Log Out
Suite Teardown                                  End Web Test

*** Variables ***
${BROWSER}                                      headless chrome
${URL}                                          https://test.skatteinformation.se/
${USERNAME_USER}                                infotiv-user
${USERNAME_EDITOR}                              infotiv-editor
${PASSWORD}                                     slimy-very-decorate-transit

*** Test Cases ***
Test the Q/A Toplistan section
    [Tags]                                      TIPG-596 Test Q/A toplistan section
    Given User logged in front page
     When Scrolling down the page
     Then Q/A topplistan section is shown

Test Q/A Toplist paragraph
    [Tags]                                      TIPG-601   Test Q/A Toplist paragraph
    Given Begin at Toplist
     When Mouse over question
     Then Q/A paragraph is shown


