*** Settings ***
Documentation
Resource                                        ../Resources/login_keywords.robot
Resource                                        ../Resources/login_variables.robot
Resource                                        ../Resources/qa_keywords.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Library                                         SeleniumLibrary
Suite Setup                                     Skatteinformation Website Is Open
Test Teardown                                   Log Out Forced
Suite Teardown                                  Logout And Close All

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
     Then Verify delete alert page

Delete button in content page list
     [Tags]                                     TIPG-719 'delete' button of the Q/A in the content page list
     Given Q/A displays in content page list
     When Clicks on delete button
     Then Verify delete alert page

Edit button in content page list
     [Tags]                                     TIPG-732 'Edit' button of the Q/A in the content page list
     Given Save question for editing
     When Clicks on Edit button
     Then Verify the Edit page
     Click innehall button
     Test teardown delete

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
     Test teardown delete

Check question with all fields displayed correctly
     [Tags]                                      TIPG-724
     Given Save question with all fields filled
     When Click on question with all fields filled
     and Show the whole question
     Then Verify correct question
     Click innehall button
     Test teardown delete

Save question with title only
     [Tags]                                      TIPG-720
     Given Begin at innehall page
     And Add question with only title
     When Save question
     Then Verify question on content page
     Test teardown delete

Page with delete alert message
     [Tags]                                      TIPG-729
     Given Begin at innehall page
     When Clicks on Edit button
     And Delete on edit page
     Then Verify delete alert page

Creating QA Without title
    [Tags]                                      TIPG-733
    Given Add QA with only fraga
    When Click on save button
    Then Alert bubble should appear

Executing delete when confirmation is asked
    [Tags]                                      TIPG-734
    Given Create and delete QA
    When Click on final delete
    Then Delete verification

Click avbryt on delete confirmation page
    [Tags]                                      TIPG-736
    Given Create and delete QA
    When Click on avbryt
    Then Verify question still on content page
    Test teardown delete