*** Settings ***
Documentation     Clicking logo to get to start page
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test
Test Teardown	  End Web Test

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

Return to start from shortcut page
    [Documentation]	Clicking logo from front page shortcut pages
    [Tags]		shortcuts
    Login User
    Check Start Page Loaded	
    Set Selenium Speed		0.2	# Needed for chrome/firefox testing
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
	Start From Shortcut After Scroll	Corona
	Start From Shortcut After Scroll	12-reglerna
	Start From Shortcut After Scroll	fastighet
	Start From Shortcut After Scroll	förmån
	Start From Shortcut After Scroll	dek20			
	Logout

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

