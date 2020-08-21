*** Settings ***
Documentation  Checking the wide search functionality with one click
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/navigation_variables.robot
Resource       ../Resources/login_keywords.robot
Resource       ../Resources/login_variables.robot
Library        SeleniumLibrary

Test Setup     Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
User can check the wide search functionality with one click
    [Documentation]  This is to check search functionality in one click
    [Tags]           Test_WideSearch1Click
    Login User
    Confirm Login Successful
    Verify the user can access the wide search functionality in one click