*** Settings ***
Resource       ../Resources/navigation_keywords.robot
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
Show Categories
    [Documentation]  This is to show Categories options when clicks on dropdown button
    [Tags]           Test_Categories
    Login User
    Confirm Login Successful
    Verify The User Is Able To Show different Categories When Clicks On Dropdown Arrow



