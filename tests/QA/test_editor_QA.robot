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

Delete button in content page list
    [Tags]                                     TIPG-719 'delete' button of the Q/A in the content page list
    Given Q/A displays in content page list
     When Clicks on delete button
     Then Page verifying deletion shown

Edit button in content page list
    [Tags]                                     TIPG-732 'Edit' button of the Q/A in the content page list
    Given Q/A displays in content page list
     When Clicks on Edit button
     Then Verify the Edit page

Fraga/svar link
    [Tags]                                     TIPG-728 - Test 'fråga/svar' link
    Given Begin at innehall page
    When Go to skapa fraga/svar page
    Then Verify fraga/svar link

Save question with all fields filled
    [Tags]                                      TIPG-723
     Given Begin at innehall page
     And Add question with title fraga and svar
     When Save question
     Then Verify question on content page