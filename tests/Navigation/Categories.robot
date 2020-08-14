*** Settings ***
Resource       ../Resources/CategoriesKeywords.robot
Library        SeleniumLibrary


Test Setup     Begin Web Test
Test Teardown  End Web Test


*** Test Cases ***
User can navigate to Fastighetsmoms link
   