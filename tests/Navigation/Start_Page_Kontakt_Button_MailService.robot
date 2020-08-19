***Settings***
Documentation  This is some
Library		   SeleniumLibrary
Test Setup	   Begin Web Test
Test Teardown  End Web Test

Resource       ../Resources/login_keywords.robot
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/login_variables.robot


*** Variables ***
${BROWSER} =  chrome
${URL} =  https://test.skatteinformation.se/start

*** Keywords ***

Confirm Login Start
	Location Should Be		https://test.skatteinformation.se/user/login?destination=/start
	Page Should Contain     //*[@id="edit-submit"]
	
Test Click Kontakt
	Click Link			//*[@id="block-utility-menu"]/ul/li[1]/a	
	
	


*** Test Cases ***

Test Kontakt button 
    [Documentation]  Test Kontakt button at StartPage Confirm Mail Service appears
    [Tags]           TIPG-430
    Login User					
    Confirm Login Successful
	Test Click Kontakt
	End Web Test
	
	

 
