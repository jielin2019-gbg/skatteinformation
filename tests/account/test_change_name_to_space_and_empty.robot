*** Settings ***
Documentation                                           Change name in Mitt Konto
Library                                                 SeleniumLibrary
Resource	                                            ../Resources/login_keywords.robot
Resource	                                            ../Resources/login_variables.robot
Resource	                                            ../Resources/setup_keywords.robot
Resource	                                            ../Resources/teardown_keywords.robot
Resource	                                            ../Resources/buttons_keywords.robot
Test Setup                                              Skatteinformation Website Is Open
Test Teardown                                           Change Back Name With Same Name And Logout

*** Variables ***
${BROWSER}                                              chrome

*** Test Cases ***
Test the user name with only space
    [Documentation]                                     Changing the name to empty space
    [Tags]                                              CHANGENAME
    User login and in mitt konto
    Enter new name                                      ${SPACE}
    Click Submit Button
    Page Should Contain                                 Fält Namn är obligatoriskt.

Test the user name with empty string
    [Documentation]                                     Changing the name to an empty string
    [Tags]                                              CHANGENAME
    User login and in mitt konto
    Enter new name                                      ${EMPTY}
    Click Submit Button
    Element Attribute Value Should Be                   xpath://input[contains(@class,'js-text-full')]   aria-required   true

*** Keywords ***
User login and in mitt konto
    Login ResetUser
    Go To                                               https://test.skatteinformation.se/user/8629/edit

Enter new name
    [Arguments]                                         ${name}
    Input Text                                          xpath://input[contains(@class,'js-text-full')]   ${name}