*** Settings ***
Documentation                                           Change user name in Mitt Konto
Library                                                 SeleniumLibrary
Resource	                                            ../Resources/login_keywords.robot
Resource	                                            ../Resources/login_variables.robot
Resource	                                            ../Resources/setup_keywords.robot
Resource	                                            ../Resources/teardown_keywords.robot
Resource                                                ../Resources/browser_variables.robot
Test Setup                                              Skatteinformation Website Is Open
Test Teardown                                           Change Back Name With Same Name And Logout

*** Variables ***
${BROWSER} =     ${CHROME}

*** Test Cases ***
Test the user name with only space
    [Documentation]                                     Changing the user name to empty space
    [Tags]                                              test_1
    User login and in mitt konto
    Enter new name                                      ${SPACE}
    Click The Submit Button
    Page Should Contain                                 Fält Namn är obligatoriskt.

Test the user name with empty string
    [Documentation]                                     Changing the user name to empty space
    [Tags]                                              test_2
    User login and in mitt konto
    Enter new name                                      ${EMPTY}
    Click The Submit Button
    Element Attribute Value Should Be                   id=edit-field-name-0-value  aria-required   true


*** Keywords ***

User login and in mitt konto
    Login ResetUser
    Go To                                               https://test.skatteinformation.se/user/8629/edit

Enter new name
    [Arguments]                                         ${name}
    Input Text                                          id:edit-field-name-0-value        ${name}

Click The Submit Button
    ${ele}      Get WebElement                          id=edit-submit
    Execute Javascript                                  arguments[0].click();       ARGUMENTS    ${ele}





