*** Settings ***
Documentation                           Change daily email, weekly email settings in Mitt Konto
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Suite Setup                             Skatteinformation Website Is Open
Suite Teardown                          Close All Browsers

*** Variables ***
${BROWSER} =                            chrome

*** Test Cases ***

Log In
    Page Should Not Contain Element             id=block-sitebranding
    The User Log In Successfully

Go To Mitt Konto
    The User Visit Mitt Konto Settings

Assert That The Option Is Not Available
    Element Should Not Be Visible               id=edit-field-mail-daily-digest-verdict-value

Click The Box
    Click The Checkbox Jag Vill Ha Dagligt Utskick
    Checkbox Should Be Selected                 id=edit-field-mail-daily-digest-value

Assert That The Option Is Available
    Element Should Be Visible                   id=edit-field-mail-daily-digest-verdict-value

Click The Box Again
    Click The Checkbox Jag Vill Ha Dagligt Utskick
    Checkbox Should Not Be Selected             id=edit-field-mail-daily-digest-value

    Sleep                                       3


*** Keywords ***
Skatteinformation Website Is Open
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
    Wait Until Element Is Enabled       id=edit-field-mail-daily-digest-value
    ${ele}      Get WebElement          id=edit-field-mail-daily-digest-value
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
