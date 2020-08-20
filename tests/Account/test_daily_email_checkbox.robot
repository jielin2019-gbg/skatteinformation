*** Settings ***
Documentation                                   Change daily email settings in Mitt Konto
Library                                         SeleniumLibrary
Resource	                                      ../Resources/login_keywords.robot
Resource	                                      ../Resources/login_variables.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Test Setup                                      Skatteinformation Website Is Open
Test Teardown                                   Logout And Close All

*** Variables ***
${BROWSER}                                      chrome

*** Test Cases ***
Test that daily email checkbox is selected
    [Documentation]                             Test that the checkbox for daily email can be selected
    [Tags]                                      test_daily_selected_checkbox
    Page Should Contain Element                 id=edit-name
    The ResetUser Log In Successfully
    Goto Mitt Konto
    Element Should Be Visible                   id=edit-field-mail-daily-digest-value
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 id=edit-field-mail-daily-digest-value

Test that daily email checkbox is selected after save
    [Documentation]                             Test that the checkbox for daily email is still selected after save
    [Tags]                                      test_daily_selected_checkbox2
    Page Should Contain Element                 id=edit-name
    The ResetUser Log In Successfully
    Goto Mitt Konto
    Element Should Be Visible                   id=edit-field-mail-daily-digest-value
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 id=edit-field-mail-daily-digest-value
    Click The Submit Button
    Checkbox Should Be Selected                 id=edit-field-mail-daily-digest-value
    Click The Checkbox Dagligt Utskick
    Click The Submit Button
    Checkbox Should Not Be Selected             id=edit-field-mail-daily-digest-value

Test that daily email checkbox is selected after refresh of page
    [Documentation]                             Test that the checkbox for daily email is still selected after refresh of page
    [Tags]                                      test_daily_selected_checkbox3
    Page Should Contain Element                 id=edit-name
    The ResetUser Log In Successfully
    Goto Mitt Konto
    Element Should Be Visible                   id=edit-field-mail-daily-digest-value
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 id=edit-field-mail-daily-digest-value
    Click The Submit Button
    Goto Start Page
    Goto Mitt Konto
    Checkbox Should Be Selected                 id=edit-field-mail-daily-digest-value
    Click The Checkbox Dagligt Utskick
    Click The Submit Button
    Checkbox Should Not Be Selected             id=edit-field-mail-daily-digest-value

*** Keywords ***
The ResetUser Log In Successfully
    Login ResetUser
    ${url}=                                     Get Location
    Should Match                                ${url}      https://test.skatteinformation.se/start
    Page Should Contain Element                 id=block-sitebranding

Goto Start Page
    Go To                                       https://test.skatteinformation.se/start
    ${url}=                                     Get Location
    Should Match                                ${url}      https://test.skatteinformation.se/start

Goto Mitt Konto
    Go To                                       https://test.skatteinformation.se/user/8629/edit
    Page Should Contain Element                 id=edit-field-mail-daily-digest-value

Click The Checkbox Dagligt Utskick
    ${ele}      Get WebElement                  id=edit-field-mail-daily-digest-value
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}

Click The Submit Button
    ${ele}      Get WebElement                  id=edit-submit
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}
