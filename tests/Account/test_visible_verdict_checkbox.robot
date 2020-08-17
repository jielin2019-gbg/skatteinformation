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
    Page Should Not Contain Element             id=block-sitebranding
    The User Log In Successfully
    The User Visit Mitt Konto Settings
    Element Should Not Be Visible               ${DAILY_RATTS}
    Click The Checkbox Jag Vill Ha Dagligt Utskick
    Checkbox Should Be Selected                 ${DAILY}
    Element Should Be Visible                   ${DAILY_RATTS}


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
