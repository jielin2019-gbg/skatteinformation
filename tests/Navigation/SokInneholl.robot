*** Settings ***
Documentation  Checking the search functionality by clicking on Sök innehåll menu tab
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/navigation_variables.robot
Resource       ../Resources/login_keywords.robot
Resource       ../Resources/login_variables.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
User can navigate to Sök innehåll link to confirm the content
    [Documentation]  This is to check naviagtion to Fastighetsmoms link
    [Tags]           Test_Fastighetsmoms
    Login User
    Confirm Login Successful
    Verify the user is able to navigate to Sök innehåll link to confirm the content present in it
