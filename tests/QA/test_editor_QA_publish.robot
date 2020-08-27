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
${BROWSER}                                      headless chrome

*** Test Cases ***
Test publish date                               #testing the date, not finished
    set selenium speed                          1
    At editing page
    Publish date in future                      20 days
    Publish date back in time                   10 days
    Publish date current date

Test the information type 'legislation'
    [TAGS]                                      TIPG-755 Information type 'legislation'
    set selenium speed                          500ms
    User is on Skapa fraga/svar page
    Select information type legislation
    Publish with information type
    Select Checkbox legislation
    Verify in Search content

Test the information type 'legal Cases'
    [TAGS]                                      TIPG-760 Information type 'legal cases'
    set selenium speed                          500ms
    User is on Skapa fraga/svar page
    Select information type legal cases
    Publish with information type
    Select Checkbox legal cases
    Verify in Search content

Test the information type 'position taken'
    [TAGS]                                      TIPG-761 Information type 'position taken'
    set selenium speed                          500ms
    User is on Skapa fraga/svar page
    Select information type position taken
    Publish with information type
    Select Checkbox position taken
    Verify in Search content