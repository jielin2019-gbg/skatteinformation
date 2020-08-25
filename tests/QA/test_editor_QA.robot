*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/login_variables.robot
Resource                                        ../Resources/editor_QA_keywords.robot
Resource                                        ../Resources/QA_keywords.robot
Library                                         SeleniumLibrary
Suite Setup                                     Begin Web Test
Test Teardown                                   Log Out Forced
Suite Teardown                                  End Web Test

*** Variables ***
${BROWSER}                                      headless chrome


*** Test Cases ***
Innehall page is shown
    [Tags]                                      editor_login
    Given Editor logged in front page
     When Click innehall button
     Then Innehall page is shown

Delete button at end of page
    [Tags]                                      TIPG-721
    Given Begin at innehall page
     When At editing page
      And Click delete end of page
     Then Page verifying deletion shown
