*** Settings ***
Documentation  This is some basic info about the whole test suite of infotiv rental car webpage
Resource       ../Resources/navigation_keywords.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
User can be able to navigate to 3:12 link
    [Documentation]  This is to check naviagtion to 3:12 link
    [Tags]           Test_3:12
    Login User
    Confirm Login Successful
    Verify the user is able to navigate to 3:12 link
    Verify the user is able to navigate when clicks on any of the popular topic of 3:12 link

