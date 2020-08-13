*** Settings ***
Resource  /Resources/login_keywords.robot
Resource  /Resources/QA_keywords.robot
Library                 SeleniumLibrary


Documentation    Suite description

*** Variables ***
${BROWSER}          headlesschrome


*** Test Cases ***
Test title
    [Tags]    DEBUG
    Provided precondition
    When action
    Then check expectations

