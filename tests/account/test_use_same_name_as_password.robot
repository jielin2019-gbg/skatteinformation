*** Settings ***
Documentation                           Test if the name change effects the login name
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/browser_variables.robot
Resource                                ../Resources/teardown_keywords.robot
Resource                                ../Resources/goto_keywords.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Logout And Close All

*** Variables ***
${BROWSER} =    chrome

*** Test Cases ***

Test if the user can change the name to the password name
    Given the user is signed in and is on mitt konto page
    When user changes the name on personlig information to the current password and press save
    Then messege shuld should apear saying Ändringarna har sparats


*** Keywords ***

the user is signed in and is on mitt konto page
    Login ResetUser
    Goto Mitt Konto

user changes the name on personlig information to the current password and press save
    Wait Until Element Is Visible   //*[@id="edit-field-name-0-value"]
    Input text                      //*[@id="edit-field-name-0-value"]       ${PASSWORD}
    ${ele}      Get WebElement      //*[@id="edit-submit"]
    Execute Javascript              arguments[0].click();       ARGUMENTS    ${ele}


messege shuld should apear saying Ändringarna har sparats
    Page Should Contain         Ändringarna har sparats.
