*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/login_variables.robot
Resource                                        ../Resources/editor_QA_keywords.robot
Resource                                        ../Resources/QA_keywords.robot
Library                                         SeleniumLibrary
Library                                         DateTime
Suite Setup                                     Begin Web Test
Test Teardown                                   Log Out Forced
Suite Teardown                                  End Web Test

*** Variables ***
${BROWSER}                                      chrome

*** Test Cases ***
Test publish date                               #testing the date, not finished
    set selenium speed                          1
    At editing page
    Publish date in future                      20 days
    Publish date back in time                   10 days
    Publish date current date

Publish todays date on topplist
     [Tags]                                      TIPG-743
     Given Begin at innehall page
     When Publish question with current date
     Then Verify question on topplist page