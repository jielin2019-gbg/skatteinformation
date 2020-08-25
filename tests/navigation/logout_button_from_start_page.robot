***Settings***
Documentation  Logging out from start page
Library	       SeleniumLibrary
Test Setup     Begin Web Test
Test Teardown  End Web Test

Resource       ../Resources/login_keywords.robot
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/login_variables.robot
Resource       ../Resources/navigation_variables.robot

*** Test Cases ***

Test of logout button
    [Documentation]  Test the logout button on start page full webbpage
    [Tags]           TIPG-433
    Login User					
    Check Start Page Loaded
    Log Out




	


