*** Settings ***
Documentation     Simple tests of the start page
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test
Test Teardown	  End Web Test

*** Test Cases ***
Start Page From Initial Start Page
	[Documentation]	      Checking logo from initial start page
	[Tags]		      start_page
	Login User
	Verify Initial Start Page Loaded
	Hover Over Logo
	Repeat Keyword  5  Click Logo
	Verify Start Page Loaded
	Log Out

Start Page To "Mitt Konto" And Back Again
	[Documentation]		Return to start after clicking; Mitt Konto
	[Tags]			mitt-konto
	Login User
     	Verify Initial Start Page Loaded	
	Return From Mitt Konto
	Verify Start Page Loaded
	Logout	

Return to start after scrolling to bottom
	[Documentation]		Scrolling to bottom of page - click bottom logo
	[Tags]			scroll
	Login User
	Verify Initial Start Page Loaded
	Scroll To Bottom
	Click Logo
	Verify Start Page Loaded
	Logout
