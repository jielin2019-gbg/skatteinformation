*** Settings ***
Resource   Resources/login_keywords.robot
Resource   Resources/QA_keywords.robot
Library                 SeleniumLibrary
Test Setup                                  Begin Web Test
Test Teardown                               End Web Test

*** Variables ***
${BROWSER}                                  chrome
${URL}                                      https://test.skatteinformation.se/fraga-och-svar
${USERNAME_USER}                            infotiv-user
${PASSWORD}                                 slimy-very-decorate-transit

*** Test Cases ***
Test mutiple filtering tags
    [Tags]                                  DEBUG / Test funcionality of mutiple filtering tags
    Given Go To Web Page
    When User select more than one filetring tag
    Then Check relevant Q&A are displayed

Test Selected Q&A are displayed
    [Tags]                                  DEBUG / Test funcionality of chosen Q&A are displayed
    Given Check relevant Q&A are displayed
    When Verify all Q&A are displayed
    Then End Web Test


