*** Settings ***
Documentation                                   Change daily email settings in Mitt Konto
Library                                         SeleniumLibrary
Resource	                                    ../Resources/login_keywords.robot
Resource	                                    ../Resources/login_variables.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Resource                                        ../Resources/buttons_keywords.robot
Suite Setup                                     Testing Setup
Test Setup                                      Check Status
Suite Teardown                                  Logout And Close All

*** Variables ***
${BROWSER}                                      chrome
${DAILY}                                        id:edit-field-mail-daily-digest-value

*** Test Cases ***
Test that daily email checkbox is selected
    [Documentation]                             Test that the checkbox for daily email can be selected
    [Tags]                                      DAILYCHECKBOX
    Element Should Be Visible                   ${DAILY}
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}

Test that daily email checkbox is selected after save
    [Documentation]                             Test that the checkbox for daily email is still selected after save
    [Tags]                                      DAILYCHECKBOX
    Element Should Be Visible                   ${DAILY}
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}
    Click Submit Button
    Checkbox Should Be Selected                 ${DAILY}

Test that daily email checkbox is selected after refresh of page
    [Documentation]                             Test that the checkbox for daily email is still selected after refresh of page
    [Tags]                                      DAILYCHECKBOX
    Element Should Be Visible                   ${DAILY}
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}
    Click Submit Button
    Goto Start Page
    Goto Mitt Konto
    Checkbox Should Be Selected                 ${DAILY}

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
    Page Should Contain Element                 ${DAILY}

Click The Checkbox Dagligt Utskick
    ${ele}      Get WebElement                  id=edit-field-mail-daily-digest-value
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}

Testing Setup
    Skatteinformation Website Is Open
    Log in and go to account settings

Log in and go to account settings
    Page Should Not Contain Element             id=block-sitebranding
    The User Log In Successfully
    The User Visit Mitt Konto Settings

The User Log In Successfully
    Login ResetUser
    ${url}=                                     Get Location
    Should Match                                ${url}      https://test.skatteinformation.se/start
    Page Should Contain Element                 id=block-sitebranding

The User Visit Mitt Konto Settings
    Go To                                       https://test.skatteinformation.se/user/8629/edit
    Wait Until Page Contains Element            id:edit-field-mail-daily-digest-wrapper
    Page Should Contain                         E-postinställningar

Check Status
    ${status}   ${value} =      Run Keyword And Ignore Error    Checkbox Should Not Be Selected             ${DAILY}
    Run Keyword If      '${status}' == 'FAIL'       Click The Checkbox Dagligt Utskick
    Run Keyword If      '${status}' == 'FAIL'       Click Submit Button