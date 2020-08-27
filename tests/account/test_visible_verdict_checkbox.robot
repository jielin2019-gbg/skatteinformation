*** Settings ***
Documentation                                   Change daily email, weekly email settings in Mitt Konto
Library                                         SeleniumLibrary
Resource	                                    ../Resources/login_keywords.robot
Resource	                                    ../Resources/login_variables.robot
Resource	                                    ../Resources/setup_keywords.robot
Test Setup                                      Skatteinformation Website Is Open
Test Teardown                                   Close Browser

*** Variables ***
${BROWSER} =                                    chrome
${DAILY}                                        id:edit-field-mail-daily-digest-value
${DAILY_RATTS}                                  id=edit-field-mail-daily-digest-verdict-value

*** Test Cases ***

Assert Rättsfall option visible in Daily
    [Documentation]                             Check that checkbox for daily news is selected and therefor the option
     ...                                        for "rättsfall" is visible for the user
    [Tags]                                      test_verdict_vis
    Log in and go to account settings
    Element Should Not Be Visible               ${DAILY_RATTS}
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}
    Element Should Be Visible                   ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}


Assert Rättsfall option not visible in Daily
    [Documentation]                             Check that checkbox for daily news is not selected and therefor the
     ...                                        option for "rättsfall" is not visible
    [Tags]                                      test_verdict_invis
    Log in and go to account settings
    Checkbox Should Not Be Selected             ${DAILY}
    Element Should Not Be Visible               ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}

Assert Rättsfall option visible in Daily after updated mail settings
    [Documentation]                             Check that the checkbox for "dagligt utskick" is selected and therefor the option
     ...                                        for "rättsfall" is visible for the user after updated mail settings
    [Tags]                                      test_verdict_vis2
    Log in and go to account settings
    Element Should Not Be Visible               ${DAILY_RATTS}
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}
    Element Should Be Visible                   ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}
    Save Mail Settings
    Checkbox Should Be Selected                 ${DAILY}
    Element Should Be Visible                   ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}
#   Lines below may be a part of a teardown
    Click The Checkbox Dagligt Utskick
    Checkbox Should Not Be Selected             ${DAILY}
    Save Mail Settings

Assert Rättsfall option visible in Daily after updated mail settings and relog
    [Documentation]                             Check that checkbox for "dagligt utskick" is selected and therefor the option
     ...                                        for "rättsfall" is visible but not checked for the user after updated mail
     ...                                        settings and a relog
    [Tags]                                      test_verdict_vis3
    Log in and go to account settings
    Element Should Not Be Visible               ${DAILY_RATTS}
    Click The Checkbox Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}
    Element Should Be Visible                   ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}
    Save Mail Settings
    Log Out
    Log in and go to account settings
    Element Should Be Visible                   ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}
#   Lines below may be a part of a teardown
    Click The Checkbox Dagligt Utskick
    Checkbox Should Not Be Selected             ${DAILY}
    Save Mail Settings

Assert Rättsfall checkbox still checked after updated mail settings and relog
    [Documentation]                             Check correct box is still checked
    [Tags]                                      test_verdict_vis4
    Log in and go to account settings
    Element Should Not Be Visible               ${DAILY_RATTS}
    Click The Checkbox Dagligt Utskick
    Click The Checkbox Notiser Om Rättsfall
    Checkbox Should Be Selected                 ${DAILY}
    Checkbox Should Be Selected                 ${DAILY_RATTS}
    Save Mail Settings
    Log Out
    Log in and go to account settings
    Checkbox Should Be Selected                 ${DAILY_RATTS}
#   Lines below may be a part of a teardown
    Click The Checkbox Dagligt Utskick
    Click The Checkbox Notiser Om Rättsfall
    Save Mail Settings

    
*** Keywords ***
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

Click The Checkbox Dagligt Utskick
    ${ele}      Get WebElement                  ${DAILY}
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}

Click The Checkbox Notiser Om Rättsfall
    ${ele}      Get WebElement                  ${DAILY_RATTS}
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}

Save Mail Settings
    ${ele}      Get WebElement                  id:edit-submit
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}
    Page Should Contain                         Ändringarna har sparats.
