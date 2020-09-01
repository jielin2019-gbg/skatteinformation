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

Test of logout button Logged in as User
    [Documentation]  Test the logout button on start page full webbpage
    [Tags]           TIPG-433
    Login User					
    Check Start Page Loaded
    Log Out

Test of logout button Logged in as Editor
    [Documentation]  Test the logout button on start page full webbpage
    [Tags]           TIPG-793
    Login Editor					
    Check Start Page Loaded
    Log Out Editor mode


	


