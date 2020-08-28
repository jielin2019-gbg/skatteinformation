*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/login_variables.robot
Resource                                        ../Resources/editor_QA_keywords.robot
Resource                                        ../Resources/QA_keywords.robot
Library                                         SeleniumLibrary
Library                                         DateTime
Library                                         String
Suite Setup                                     Begin Web Test
Suite Teardown                                  End Web Test

*** Variables ***
${BROWSER}                                       headless chrome

*** Test Cases ***
Test publish date                               #testing the date, not finished
    #set selenium speed                          1
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

Publish todays date on topplist
     [Tags]                                      TIPG-743
     Given Begin at innehall page
     When Publish question with current date
     Then Verify question on topplist page

Publish todays date on Q/A page
     [Tags]                                     TIPG-744
     Given Begin at innehall page
     When Publish question with current date
     Then Verify question on Q/A page

Publish date and time blank
     [Tags]                                     TIPG-745
     Given Begin at innehall page
     When Publish with question date and time blank
     Then Verify question published with todays date

Leave date blank to Publish
    [Tags]                              TIPG-751
    Given Begin at Edit Page
    Then Delete Date
    When Verify Error Message

