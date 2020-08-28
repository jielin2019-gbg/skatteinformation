*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/login_variables.robot
Resource                                        ../Resources/q&a_keywords.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Library                                         SeleniumLibrary
Suite Setup                                     Skatteinformation Website Is Open
Test Teardown                                   Log Out Forced
Suite Teardown                                  Logout And Close All

*** Variables ***
${BROWSER}                                      headless chrome

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

Test the link on Topplistan goes to QA page
    [Tags]                                      TIPG-597 From topplistan to QA page
    Given Begin at Toplist
    Then Go to QA page from topplistan section
    When Q/A page is shown
