*** Settings ***
Documentation     Clicking logo to get to start page
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test Firefox
Test Teardown	  End Web Test
	
*** Keywords *** 
Begin Web Test Firefox
    Open Browser                about:blank   ${BROWSER}
    Set Window Size    		${1920}       ${1080}
    Maximize Browser Window
    Go To                       ${URL}

Process Shortcut
	[Arguments]	${value}	${value2}
	[Timeout]	120
	${value3}  Set Variable If  ${value}==4  f%C3%B6rm%C3%A5n  ${value2}
      	Log To Console	Shortcut nr:${value} name:${value2} Char code:${value3} Using:${BROWSER}
       	Wait Until Element Is Visible  xpath://a[contains(@href,"${value3}")]  timeout=60
	Click Element   xpath://div[@class="cell small-4 large-2"][${value}]
      	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value2}")]  timeout=60
	Wait Until Element Is Visible	  xpath://input[@id="edit-search" and contains(@value,"${value2}")]  timeout=60
	Wait Until Element Is Visible	  xpath://a[@href="/"]  timeout=60
    	Click Logo
	Wait Until Location Is	https://test.skatteinformation.se/  timeout=60
       	Wait Until Page Contains Element  xpath://a[contains(@href,"${value3}")]  timeout=60
	Wait Until Element Is Visible  xpath://input[@id="edit-search"]  timeout=60
       	Wait Until Element Is Visible  xpath://a[contains(@href,"${value3}")]  timeout=60
	Wait Until Location Is	https://test.skatteinformation.se/  timeout=2m
	Location Should Be	https://test.skatteinformation.se/  timeout=60

Browser Watershed
       	[Arguments]	${value}	${value2}
	Run Keyword If	'${BROWSER}'=='firefox'  Process Shortcut Firefox  ${value}  ${value2}
	...  ELSE IF	'${BROWSER}'=='headlessfirefox'  Process Shortcut Firefox  ${value}  ${value2}
	...  ELSE 	Process Shortcut Firefox  ${value}

*** Test Cases ***
Try Start From Start
     [Documentation]     Trying logo from initial start page
     [Tags]              start
     Login User
     Check Start Page Loaded	
     Hover Over Logo
     Repeat Keyword	5	Click Logo
     Location Should Be	https://test.skatteinformation.se/
     Log Out

# Return to start from shortcut page
#     [Documentation]	Clicking logo from front page shortcut pages
#     [Tags]		shortcuts
#     Login User
#     Check Start Page Loaded	
#     Set Selenium Speed		2	# Needed for chrome/firefox testing
#     Start From Shortcut  Corona
#     Start From Shortcut  12-reglerna
#     Start From Shortcut  fastighet
#     Start From Shortcut  förmån
#     Start From Shortcut  dek20	
#     Log Out

# Return to start after scrolling to bottom
# 	[Documentation]
# 	[Tags]		scroll
# 	Login User
# 	Check Start Page Loaded	
# 	Scroll Element Into View	xpath://footer
# 	Click Logo
# 	Logout

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

Return to start after using menu items
	[Documentation]
	[Tags]		menu-item
	Login User
	Check Start Page Loaded	
	Return After Menu Item		sok
	Return After Menu Item		fraga-och-svar
	Return After Menu Item		tabeller
	Logout			

Return to start after using menu items with subcategories
	[Documentation]
	[Tags]		menu-item-sub
	Login User
	Check Start Page Loaded	
	Return After Menu Item Sub	Allmänt
	Return After Menu Item Sub	Civilrätt och bokföring	
	Return After Menu Item Sub	Deklaration och förfarande	
	Return After Menu Item Sub	Fastighet	
	Return After Menu Item Sub	Internationell beskattning	
	Return After Menu Item Sub	Kapital	
	Return After Menu Item Sub	Mervärdesskatt och punktskatter	
	Return After Menu Item Sub	Näringsverksamhet	
	Return After Menu Item Sub	Tjänst	
	Logout			

Return to start from Mitt Konto
	[Documentation]
	[Tags]		mitt-konto
	Login User
	Check Start Page Loaded	
	Return From Mitt Konto
	Logout	

Shortcuts 
    [Documentation]	Return to start page after clicking shortcut-links
    [Tags]		shortcuts
    Login User
    Check Start Page Loaded	
    # Shortcut                 nr	name		
    # ---------------------------------------------
    Process Shortcut Firefox   1	Corona
    Process Shortcut Firefox   2	12-reglerna
    Process Shortcut Firefox   3	fastighet
    Process Shortcut Firefox   4	förmån
    Process Shortcut Firefox   5	dek20			
    Log Out
