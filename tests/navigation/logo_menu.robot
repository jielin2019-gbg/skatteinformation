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
Return to start after menu item; Sök Innehåll
	[Documentation]	   Click Logo at page "Sök Innehåll"
	[Tags]		   menu-item-sok
	Login User
	Verify Initial Start Page Loaded
	Click Menu Item		sok
	Click Logo
	Verify Start Page Loaded
	Logout			

Return to start after menu item; Fråga / Svar
	[Documentation]	   Click Logo at page "Fråga / Svar"
	[Tags]		   menu-item-qa
	Login User
	Verify Initial Start Page Loaded
	Click Menu Item		fraga-och-svar
	Click Logo
	Verify Start Page Loaded
	Logout			

Return to start after menu item; Tabeller
	[Documentation]	   Click Logo at page "Tabeller"
	[Tags]		   menu-item-tabeller
	Login User
	Verify Initial Start Page Loaded
	Click Menu Item		tabeller		
	Click Logo
	Verify Start Page Loaded
	Logout			

Return to start after using menu item; Kategorier
	[Documentation]	    Explore all subcategories under "Kategorier"
	[Tags]		    menu-item-kategorier
	Login User
	Verify Initial Start Page Loaded

	Click Menu Sub Item	Allmänt
       	Click Logo
	Verify Start Page Loaded

	Click Menu Sub Item	Civilrätt och bokföring	
	Click Logo
	Verify Start Page Loaded

	Click Menu Sub Item	Deklaration och förfarande	
	Click Logo
	Verify Start Page Loaded
	
	Click Menu Sub Item	Fastighet	
	Click Logo
	Verify Start Page Loaded
	
	Click Menu Sub Item	Internationell beskattning	
	Click Logo
	Verify Start Page Loaded
	
	Click Menu Sub Item	Kapital	
	Click Logo
	Verify Start Page Loaded
	
	Click Menu Sub Item	Mervärdesskatt och punktskatter	
	Click Logo
	Verify Start Page Loaded
	
	Click Menu Sub Item	Näringsverksamhet	
	Click Logo
	Verify Start Page Loaded
	
	Click Menu Sub Item	Tjänst	
	Click Logo
	Verify Start Page Loaded
	
	Logout			

