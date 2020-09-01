*** Settings ***
Documentation  Checking navigation link fastighetsmoms link
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
    Check Start Page Loaded
    Process Shortcut For Links   3   fastighet

