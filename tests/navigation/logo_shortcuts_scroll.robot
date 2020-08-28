*** Settings ***
Documentation     Return to start page from shortcut pages using bottom logo
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test
Test Teardown	  End Web Test

*** Test Cases ***
Click Shortcut 1 + Scroll 
    [Documentation]	Check bottom logo; 1 - CORONA
    [Tags]		shortcut1-scroll
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut	1	Corona
    Scroll To Bottom
    Click Logo
    Verify Start Page Loaded
    Log Out

Click Shortcut 2 + Scroll 
    [Documentation]	Check bottom logo; 2 - 3:12
    [Tags]		shortcut2-scroll
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut	2	3:12-reglerna
    Scroll To Bottom
    Click Logo
    Verify Start Page Loaded
    Log Out

Click Shortcut 3 + Scroll 
    [Documentation]	Check bottom logo; 3 - FASTIGHETSMOMS
    [Tags]		shortcut3-scroll
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut	3	fastighet
    Scroll To Bottom
    Click Logo
    Verify Start Page Loaded
    Log Out

Click Shortcut 4 + Scroll 
    [Documentation]	Check bottom logo; 4 - FÖRMÅNER
    [Tags]		shortcut4-scroll
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut	4	förmån
    Scroll To Bottom
    Click Logo
    Verify Start Page Loaded
    Log Out

Click Shortcut 5 + Scroll 
    [Documentation]	Check bottom logo; 5 - DEKLARATION
    [Tags]		shortcut5-scroll
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut	5	dek20
    Scroll To Bottom
    Click Logo
    Verify Start Page Loaded
    Log Out

