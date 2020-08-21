*** Settings ***
Documentation     Log out from menu
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot	
	
*** Variables ***
${BROWSER} =        headlesschrome

*** Keywords ***
Go To Page
   Open Browser  ${URL}  ${BROWSER}
Close page
      Close Browser	

*** Test Cases ***
Try To Login
    [Documentation]     Log out from menu
    [Tags]              logout
    Go To Page
    Maximize Browser Window	
    Login User
    Run Keyword And Continue On Failure    Log Out
    Close Page
	
