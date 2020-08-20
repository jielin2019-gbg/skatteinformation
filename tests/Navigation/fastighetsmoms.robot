*** Settings ***
Documentation  Checking navigation link 3:12
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/navigation_variables.robot
Resource       ../Resources/login_keywords.robot
Resource       ../Resources/login_variables.robot			
Library        SeleniumLibrary

Test Setup     Begin Web Test
Test Teardown  End Web Test

*** Test Cases ***
User can navigate to Fastighetsmoms link
    [Documentation]  This is to check naviagtion to Fastighetsmoms link
    [Tags]           Test_Fastighetsmoms
    Login User
    Confirm Login Successful
    Verify the user is able to navigate to Fastighetsmoms link
    Verify the user is able to navigate when clicks on any of the popular topic of Fastighetsmoms link

