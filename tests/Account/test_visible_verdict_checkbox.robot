*** Settings ***
Documentation                           Change daily email, weekly email settings in Mitt Konto
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Test Setup                             Go To Site
Test Teardown                          Close Browser

*** Variables ***
${BROWSER} =                                    chrome
${DAILY}                                        id:edit-field-mail-daily-digest-value
${DAILY_RATTS}                                  id=edit-field-mail-daily-digest-verdict-value

*** Test Cases ***

Assert Rättsfall option visible in Daily
    [Documentation]                             Check that checkbox for daily news is selected and therefor the option for "rättsfall" is visible for the user
    [Tags]                                      test_verdict_vis
    Page Should Not Contain Element             id=block-sitebranding
    The User Log In Successfully
    The User Visit Mitt Konto Settings
    Element Should Not Be Visible               ${DAILY_RATTS}
    Click The Checkbox Jag Vill Ha Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}
    Element Should Be Visible                   ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}


Assert Rättsfall option not visible in Daily
    [Documentation]                             Check that checkbox for daily news is not selected and therefor the option for "rättsfall" is not visible
    [Tags]                                      test_verdict_invis
    Page Should Not Contain Element             id=block-sitebranding
    The User Log In Successfully
    The User Visit Mitt Konto Settings
    Checkbox Should Not Be Selected             ${DAILY}
    Element Should Not Be Visible               ${DAILY_RATTS}
    Checkbox Should Not Be Selected             ${DAILY_RATTS}



*** Keywords ***
Go To Site
    Open Browser                        ${URL}     ${BROWSER}
    Maximize Browser Window

The User Log In Successfully
    Login ResetUser
    ${url}=                             Get Location
    Should Match                        ${url}      https://test.skatteinformation.se/start
    Page Should Contain Element         id=block-sitebranding

The User Visit Mitt Konto Settings
    Click Link                          link:Mitt konto
    Page Should Contain                 E-postinställningar

Click The Checkbox Jag Vill Ha Dagligt Utskick
    ${ele}      Get WebElement          ${DAILY}
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}

Save Mail Settings
    ${ele}      Get WebElement          id:edit-submit
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    Page Should Contain                 Ändringarna har sparats.
