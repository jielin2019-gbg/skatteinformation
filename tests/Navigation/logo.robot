*** Settings ***
Documentation     Clicking logo to get to start page
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test
Test Teardown	  End Web Test

*** Keywords ***
Verify start page loaded
	[Arguments]				${page}	
	Location Should Be			${page}
       	Wait Until Page Contains Element	xpath://input[@id="edit-search"]

Hover Over Logo
      Mouse over	xpath://div[@id="block-sitebranding"]

Click Shortcut
	[Arguments]	${value}
#	Click Link	xpath://a[@href="/sok?search=${value}"]
	Click Link	xpath://a[contains(@href,"${value}")]	
    	Wait Until Page Contains Element	xpath://input[@id="edit-search" and @value="${value}"]
	Click Element		xpath://div[@id="block-sitebranding"]
	
*** Test Cases ***
Start To Start
    [Documentation]     Trying logo from initial logged in start page
    [Tags]              start
    Login User
    Verify start page loaded	https://test.skatteinformation.se/start
    Hover Over Logo
    Click Element		xpath://div[@id="block-sitebranding"]
    Log Out

Shortcut Landing Page
    [Documentation]	Clicking logo from front page shortcut pages
    [Tags]		shortcuts
    Login User
    Click Shortcut	Corona
    Click Shortcut	12-reglerna
    Log Out

	
