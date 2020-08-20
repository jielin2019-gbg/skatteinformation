*** Settings ***
Documentation     Clicking logo to get to start page
Library           SeleniumLibrary
#Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot

*** Test Cases ***
Try To Login
    [Documentation]     Logo to startpage
    [Tags]              logo
    Begin Web Test
    Login User
    Log Out
    End Web Test

	
