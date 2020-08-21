*** Settings ***
Documentation     Log out from menu
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test
Test Teardown	  End Web Test

*** Test Cases ***
Try To Login
    [Documentation]     Log out from menu
    [Tags]              logout
    Login User

	
