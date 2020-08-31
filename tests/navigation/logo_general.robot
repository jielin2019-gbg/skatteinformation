*** Settings ***
Documentation     Simple tests of the start page
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Suite Setup	  Begin Suite
Suite Teardown	  End Suite
#Test Setup	  Begin Web Test2
Test Teardown	  End Web Test2

*** Keywords ***
Begin Web Test2
	Verify Start Page Loaded
End Web Test2
	Verify Start Page Loaded    
	
Begin Suite
      Open Browser                about:blank   ${BROWSER}
      Set Window Size    		${1920}       ${1080}
      Go To                       ${URL}
      Login User	
      Verify Initial Start Page Loaded	

End Suite
    Log Out	
    Close Browser	

*** Test Cases ***
Start Page From Initial Start Page
	[Documentation]	      Checking logo from initial start page
	[Tags]		      start_page
	Hover Over Logo
	Repeat Keyword  5  Click Logo


Start Page To "Mitt Konto" And Back Again
	[Documentation]		Return to start after clicking; Mitt Konto
	[Tags]			mitt-konto
	Return From Mitt Konto

Return to start after scrolling to bottom
	[Documentation]		Scrolling to bottom of page - click bottom logo
	[Tags]			scroll
	Scroll To Bottom
	Click Logo


