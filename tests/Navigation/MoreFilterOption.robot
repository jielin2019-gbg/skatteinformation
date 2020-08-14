*** Settings ***
Documentation  This is some basic info about the whole test suite of infotiv rental car webpage
Resource       ../Resources/MoreFilterOption_keywords.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
User can show more filter options when clicks on dropdown button
    [Documentation]  This is to show more filter options when clicks on dropdown button
    [Tags]           Test_MoreFilterOption
    Login User
    Confirm Login Successful
    Verify The User Is Able To Show More Filter Options When Clicks On Dropdown Arrow