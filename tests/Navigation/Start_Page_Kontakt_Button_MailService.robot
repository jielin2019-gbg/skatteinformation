***Settings***
Documentation  Testing the Kontakt button at the StartPage
Library		   SeleniumLibrary
Test Setup	   Begin Web Test
Test Teardown  End Web Test

Resource       ../Resources/login_keywords.robot
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/login_variables.robot


*** Variables ***
${BROWSER} =  	headlesschrome
${URL} =  		https://test.skatteinformation.se/start

*** Keywords ***

Confirm Login Start
	Location Should Be		https://test.skatteinformation.se/user/login?destination=/start
	Page Should Contain     //*[@id="edit-submit"]
	
Test Click Kontakt
		Click Link				//a[@href="mailto:skatteinformation@wolterskluwer.se?subject=Skatteinformation.se%3A%20Jag%20har%20en%20fr%C3%A5ga"]

*** Test Cases ***

Test Kontakt button 
    [Documentation]  Test Kontakt button at StartPage Confirm Mail Service appears
    [Tags]           TIPG-430
    Login User					
    Confirm Login Successful
	Test Click Kontakt
	
	
	
	
	

 
