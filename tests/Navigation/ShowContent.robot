*** Settings ***
Resource       ../Resources/navigation_keywords.robot
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***

Show Content of the Selected Category(TIPG-446)
    [Documentation]  This is to show Specific content of the selected Category
    [Tags]           Test_CategoryContent
    Login User
    Confirm Login Successful
    Verify The User Is Able To Show Specific content of the selected Category
