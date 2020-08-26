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
Try Start From Start
     [Documentation]     Trying logo from initial start page
     [Tags]              start
     Login User
     Check Start Page Loaded	
     Hover Over Logo
     Repeat Keyword	5	Click Logo
     Confirm Page Loaded
     Log Out

Return to start from Mitt Konto
	[Documentation]
	[Tags]		mitt-konto
	Login User
	Check Start Page Loaded	
	Return From Mitt Konto
	Logout	

Return to start after scrolling to bottom
	[Documentation]
	[Tags]		scroll
	Login User
	Check Start Page Loaded	
	Scroll Element Into View	xpath://footer
	Click Logo
	Logout
