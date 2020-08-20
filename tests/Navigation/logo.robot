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
Check Start Page Loaded
	Location Should Be			https://test.skatteinformation.se/start
	Wait Until Element Is Visible		xpath://input[@id="edit-search"]

Hover Over Logo
      Mouse over	xpath://div[@id="block-sitebranding"]

Click Logo
       	Click Link	xpath://a[@title="Hem"]

Process Links
	[Arguments]	${value}
      	Log To Console	Testing for ${value}
       	Click Link	xpath://a[contains(@href,"${value}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
       	Click Logo

Process Links Intl Chars
	[Arguments]	${value}	${value2}
	Log To Console	Testing for ${value} and ${value2}
       	Click Link	xpath://a[contains(@href,"${value2}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
       	Click Logo

Start From Shortcut
	[Arguments]	${value}
	Run Keyword If	'${value}'=='förmån'  Process Links Intl Chars	${value}  value2=f%C3%B6rm%C3%A5n
	...  ELSE   	Process Links	      ${value}	

Process Links After Scroll
	[Arguments]	${value}
      	Log To Console	Testing for ${value}
       	Click Link	xpath://a[contains(@href,"${value}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
	Scroll To Bottom
       	Click Logo
#       	Wait Until Page Contains Element  xpath://a[@id="edit-search"]	5	

Process Links After Scroll Intl Chars
	[Arguments]	${value}	${value2}
	Log To Console	Testing for ${value} and ${value2}
       	Click Link	xpath://a[contains(@href,"${value2}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
	Scroll To Bottom
       	Click Logo
#       	Wait Until Page Contains Element  xpath://[@id="edit-search"]	5
	
Start From Shortcut After Scroll
	[Arguments]	${value}
	Run Keyword If	'${value}'=='förmån'  Process Links After Scroll Intl Chars	${value}  value2=f%C3%B6rm%C3%A5n
	...  ELSE   	Process Links After Scroll	      ${value}	

Scroll To Bottom
	Scroll Element Into View	xpath://footer
	Scroll Element Into View	xpath://div[@class="slogan"]
	
*** Test Cases ***
Try Start From Start
     [Documentation]     Trying logo from initial start page
     [Tags]              start
     Login User
     Check Start Page Loaded	
     Hover Over Logo
     Click Logo
     Log Out

Return to start from shortcut page
    [Documentation]	Clicking logo from front page shortcut pages
    [Tags]		shortcuts
    Login User
    Check Start Page Loaded	
    Start From Shortcut  Corona
    Start From Shortcut  12-reglerna
    Start From Shortcut  fastighet
    Start From Shortcut  förmån
    Start From Shortcut  dek20	
    Log Out

Return to start after scrolling to bottom
	[Documentation]
	[Tags]		scroll
	Login User
	Check Start Page Loaded	
	Scroll Element Into View	xpath://footer
	Click Logo
	Logout

Return to start after scrolling to bottom in shortcuts
	[Documentation]
	[Tags]		scroll-shortcut
	Login User
	Check Start Page Loaded	
#	Set Selenium Speed 	    1
	Start From Shortcut After Scroll	Corona
	Start From Shortcut After Scroll	12-reglerna
	# Start From Shortcut After Scroll	fastighet
	# Start From Shortcut After Scroll	förmån
	# Start From Shortcut After Scroll	dek20			
	Logout

