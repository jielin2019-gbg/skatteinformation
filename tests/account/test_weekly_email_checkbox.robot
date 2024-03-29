*** Settings ***
Documentation                           Change daily email, weekly email settings in Mitt Konto
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
${weekly_email_checkbox}                id:edit-field-mail-digest-weekly-value

*** Test Cases ***
Change The Settings Of Weekly Email
    The User Log In Successfully
    The User Visit Mitt Konto Settings
    The User Is On The Settings Page
    Select The Checkbox Jag Vill Ha Veckobrev
    Unselect The Checkbox Jag Vill Ha Veckobrev
    Changes Should Be Saved In Settings

*** Keywords ***
The User Log In Successfully
    Login User
    Page Should Contain                 Senaste nytt

The User Visit Mitt Konto Settings
    Click Link                          link:Mitt konto

The User Is On The Settings Page
    ${url}=      Get Location
    Should Match    ${url}              https://test.skatteinformation.se/user/8624/edit

Select The Checkbox Jag Vill Ha Veckobrev
    Wait Until Element Is Enabled       ${weekly_email_checkbox}
    ${ele}      Get WebElement          ${weekly_email_checkbox}
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    Checkbox Should Be Selected         ${weekly_email_checkbox}

Unselect The Checkbox Jag Vill Ha Veckobrev
    Wait Until Element Is Enabled       ${weekly_email_checkbox}
    ${ele}      Get WebElement          ${weekly_email_checkbox}
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}
    Checkbox Should Not Be Selected     ${weekly_email_checkbox}

Changes Should Be Saved In Settings
    Click Submit Button
    Page Should Contain                 Ändringarna har sparats.
