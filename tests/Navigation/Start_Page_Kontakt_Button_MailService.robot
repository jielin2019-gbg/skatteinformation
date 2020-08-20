***Settings***
Documentation  Testing the Kontakt button at the StartPage
Library		   SeleniumLibrary
Test Setup	   Begin Web Test
Test Teardown  End Web Test

Resource       ../Resources/login_keywords.robot
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/login_variables.robot
Resource       ../Resources/navigation_variables.robot

*** Test Cases ***

Test Kontakt button 
    [Documentation]  Test Kontakt button at StartPage Confirm Mail Service appears
    [Tags]           TIPG-430
    Login User					
    Check Start Page Loaded
	Test Click Kontakt
	
	
	
	
	

 
