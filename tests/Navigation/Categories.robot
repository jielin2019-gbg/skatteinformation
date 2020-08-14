*** Settings ***
Resource       ../Resources/CategoriesKeywords.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
Categories
    Login User
    Confirm Login Successful
