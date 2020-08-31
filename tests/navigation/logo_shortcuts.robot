*** Settings ***
Documentation     Return to start page from shortcut pages using top logo
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
Resource	  ../Resources/navigation_keywords.robot
Resource	  ../Resources/navigation_variables.robot	
Test Setup	  Begin Web Test
Test Teardown	  End Web Test

*** Test Cases ***
Click Shortcut 1 
    [Documentation]	Check top logo; 1 - CORONA
    [Tags]		shortcut1
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut  1  Corona
    Click Logo
    Verify Start Page Loaded
    Log Out

# ==============================================================
# THIS TEST IS PRONE TO TIMEOUT, POTENTIAL DATABASE QUERY ISSUE
# ==============================================================
# Click Shortcut 2 
#     [Documentation]	Check top logo; 2 - 3:12
#     [Tags]		shortcut2
#     Login User
#     Verify Initial Start Page Loaded	
#     Click Shortcut  2  3:12-reglerna
#     Click Logo
#     Verify Start Page Loaded
#     Log Out
#
	
Click Shortcut 3 
    [Documentation]	Check top logo; 3 - FASTIGHETSMOMS
    [Tags]		shortcut3
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut  3  fastighet
    Click Logo
    Verify Start Page Loaded
    Log Out

Click Shortcut 4 
    [Documentation]	Check top logo; 4 - FÖRMÅNER
    [Tags]		shortcut4
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut  4  förmån
    Click Logo
    Verify Start Page Loaded
    Log Out

Click Shortcut 5 
    [Documentation]	Check top logo; 5 - DEKLARATION
    [Tags]		shortcut5
    Login User
    Verify Initial Start Page Loaded	
    Click Shortcut  5  dek20
    Click Logo
    Verify Start Page Loaded
    Log Out

