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

*** Test Cases ***
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

