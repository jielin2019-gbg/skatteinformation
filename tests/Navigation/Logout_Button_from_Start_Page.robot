***Settings***
Documentation  This is some
Library		   SeleniumLibrary
Test Setup	   Begin Web Test
Test Teardown  End Web Test

Resource       ../Resources/login_keywords.robot
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/login_variables.robot


*** Variables ***
${BROWSER} =  headlesschrome
${URL} =  https://test.skatteinformation.se/start

*** Keywords ***

Confirm Login Start
	Location Should Be		https://test.skatteinformation.se/user/login?destination=/start
	Page Should Contain     //*[@id="edit-submit"]
	
	


*** Test Cases ***

Test of logout button
    [Documentation]  Test the logout button on start page full webbpage
    [Tags]           TIPG-433
    Login User					
    Confirm Login Successful
	Log Out
	End Web Test



	


