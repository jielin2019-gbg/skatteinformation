*** Settings ***
Documentation  This is some basic info about the whole test suite of infotiv rental car webpage
Resource       ../Resources/fastighetsmoms_keywords.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
User can navigate to Fastighetsmoms link
    [Documentation]  This is to check naviagtion to Fastighetsmoms link
    [Tags]           Test_Fastighetsmoms
    Login User
    Verify the user is able to navigate to Fastighetsmoms link
    Verify the user is able to navigate when clicks on any of the popular topic