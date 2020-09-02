*** Settings ***
Documentation                           Test if the name change effects the login name
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/teardown_keywords.robot
Resource                                ../Resources/goto_keywords.robot
Resource                                ../Resources/buttons_keywords.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Logout And Close All

*** Variables ***
${BROWSER}                              chrome

*** Test Cases ***
Test if the user can change the name to the password name.
    Given the user is signed in and is on mitt konto page
    When user changes the name on personlig information and press save
    Then when user tryes to login with the new name it dosent work


*** Keywords ***
the user is signed in and is on mitt konto page
    Login ResetUser
    Goto Mitt Konto

user changes the name on personlig information and press save
    Wait Until Element Is Visible       //*[@id="edit-field-name-0-value"]
    Input text                          //*[@id="edit-field-name-0-value"]       Viktor_Nilsson
    Click Submit Button
    Log Out Forced

when user tryes to login with the new name it dosent work
    Page Should Contain                 Logga in
    Input Text                          //*[@id="edit-name"]  Viktor_Nilsson
    Input Text                          //*[@id="edit-pass"]  ${PASSWORD}
	Click Button                        //*[@id="edit-submit"]
    Page Should Contain                 Unrecognized username or password. Forgot your password?