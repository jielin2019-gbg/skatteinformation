*** Settings ***
Documentation     Clicking logo to get to start page
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test
Test Teardown	  End Web Test
	
# *** Keywords *** 
# Process Shortcut
# 	[Arguments]	${value}	${value2}
# 	[Timeout]	120
# 	${value3}  Set Variable If  ${value}==4  f%C3%B6rm%C3%A5n  ${value2}
#       	Log To Console	Shortcut nr:${value} name:${value2} Char code:${value3} Using:${BROWSER}
#        	Wait Until Element Is Visible  xpath://a[contains(@href,"${value3}")]  timeout=60
# 	Click Element   xpath://div[@class="cell small-4 large-2"][${value}]
#       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value2}")]  timeout=60
# 	Wait Until Element Is Visible	  xpath://input[@id="edit-search" and contains(@value,"${value2}")]  timeout=60
# 	Wait Until Element Is Visible	  xpath://a[@href="/"]  timeout=60
#     	Click Logo
# 	Wait Until Location Is	${URL}  timeout=60
#        	Wait Until Page Contains Element  xpath://a[contains(@href,"${value3}")]  timeout=60
# 	Wait Until Element Is Visible  xpath://input[@id="edit-search"]  timeout=60
#        	Wait Until Element Is Visible  xpath://a[contains(@href,"${value3}")]  timeout=60
# 	Wait Until Location Is	${URL}  timeout=2m
# 	Location Should Be	${URL}  timeout=60
# 	Verify Start Page Loaded
	
# Verify Initial Start Page Loaded
# 	Location Should Be  ${URL}start
# 	Wait Until Element Is Visible  xpath://input[@id="edit-search"]	
# 	Page Should Contain  Senaste nytt
	
# Verify Start Page Loaded
# 	Location Should Be  ${URL}
# 	Wait Until Element Is Visible  xpath://input[@id="edit-search"]	
# 	Page Should Contain  Senaste nytt

# Verify Specific Page Loaded
# 	[Arguments]  ${string}
# 	Wait Until Location Is	${string}  timeout=2m
# 	Location Should Be  ${string}

# Browser Watershed
#        	[Arguments]	${string}
# 	Log To Console  ${string} ${URL}
# 	Run Keyword If	'${BROWSER}'=='firefox'  Confirm Page Loaded2  ${string}/  
# 	...  ELSE IF	'${BROWSER}'=='headlessfirefox'  Confirm Page Loaded2  ${string}/
# 	...  ELSE 	Confirm Page Loaded

*** Test Cases ***

# Return to start after scrolling to bottom in shortcuts
# 	[Documentation]
# 	[Tags]		scroll-shortcut
# 	Login User
# 	Check Start Page Loaded	
# 	Start From Shortcut After Scroll	Corona
# 	Start From Shortcut After Scroll	12-reglerna
# 	Start From Shortcut After Scroll	fastighet
# 	Start From Shortcut After Scroll	förmån
# 	Start From Shortcut After Scroll	dek20			
# 	Logout

# TODO: create scroll function add it to shortcuts
# TODO: move keywords into keyword file	

Shortcuts 
    [Documentation]	Return to start page after clicking shortcut-links
    [Tags]		shortcuts
    Login User
    Verify Initial Start Page Loaded	
    # Shortcut          nr	name		
    # ---------------------------------------------
    Process Shortcut	1	Corona
    Process Shortcut	2	12-reglerna
    Process Shortcut	3	fastighet
    Process Shortcut	4	förmån
    Process Shortcut	5	dek20			
    Log Out

