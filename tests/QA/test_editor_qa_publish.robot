*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/login_variables.robot
Resource                                        ../Resources/qa_keywords.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Library                                         SeleniumLibrary
Library                                         DateTime
Library                                         String
Suite Setup                                     Skatteinformation Website Is Open
Test Teardown                                   Log Out Forced
Suite Teardown                                  Logout And Close All

*** Variables ***
${BROWSER}                                      headless chrome

*** Test Cases ***
Test the information type 'legislation'
     [Tags]                                      TIPG-755 Information type 'legislation'
     set selenium speed                          500ms
     User is on Skapa fraga/svar page
     Select information type legislation
     Publish with information type
     Select Checkbox legislation
     Verify in Search content

Test the information type 'legal Cases'
     [Tags]                                      TIPG-760 Information type 'legal cases'
     set selenium speed                          500ms
     User is on Skapa fraga/svar page
     Select information type legal cases
     Publish with information type
     Select Checkbox legal cases
     Verify in Search content
     Click innehall button
     Test teardown delete

Test the information type 'position taken'
     [Tags]                                      TIPG-761 Information type 'position taken'
     set selenium speed                          500ms
     User is on Skapa fraga/svar page
     Select information type position taken
     Publish with information type
     Select Checkbox position taken
     Verify in Search content
     Click innehall button
     Test teardown delete

Publish todays date on topplist
     [Tags]                                      TIPG-743
     Given Begin at innehall page
     When Publish question with current date
     Then Verify question on topplist page
     Click innehall button
     Test teardown delete
     Click innehall button
     Test teardown delete

Publish todays date on Q/A page
     [Tags]                                     TIPG-744
     Given Begin at innehall page
     When Publish question with current date
     Then Verify question on Q/A page
     Click innehall button
     Test teardown delete

Publish date and time blank
     [Tags]                                     TIPG-745
     Given Begin at innehall page
     When Publish with question date and time blank
     Then Verify question published with todays date
     Click innehall button
     Test teardown delete
