*** Settings ***
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/navigation_variables.robot
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***

Hide Categories(TIPG-456)
    [Documentation]  This is to hide the category list with one click
    [Tags]           Test_HideCategoryList
    Login User
    Check Start Page Loaded
    Verify The User Is Able To hide the category list with one click
