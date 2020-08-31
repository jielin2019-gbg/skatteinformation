*** Settings ***
Documentation                           Testing for number of characters allowed in passwordfield and make a
...                                     boundary value analysis
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Resource                                ../Resources/setup_keywords.robot
Resource                                ../Resources/teardown_keywords.robot
Suite Setup                             Login to Skatteinformation and go to account settings
Suite Teardown                          Logout And Close All

*** Variables ***
${BROWSER}                              chrome
${NEW_PASS_ID}                          id:edit-pass-pass1
${PASS_STRENGTH}                        //div[@class='password-strength']
${PASS_STRENGTH_BAR}                    //div[@class='password-strength__meter']

*** Test Cases ***
Assert password strength bar set to xx%
    [Documentation]                     Verifying password strength bar to show xx% when password is weak
    [Tags]                              PASSWEAK
    Input Text                          ${NEW_PASS_ID}       aaAA99!!
    ${WIDTH_STRENGTH_BAR}               Get Element Attribute   css:body.body.js-body:nth-child(2) div.site.dialog-off-canvas-main-canvas:nth-child(3) div.site-container div.site-content main.main div.main__inner.grid-container.js-user-edit:nth-child(4) div.grid-x.grid-margin-x div.cell.small-12.medium-6 div.region.region-content div.block.block-system.block-system-main-block form.user-form.form.form--user-form fieldset.required-fields.field-group-fieldset.js-form-item.form-item.js-form-wrapper.form-wrapper.form-fieldset:nth-child(5) div.fieldset-wrapper div.js-form-wrapper.form-wrapper div.js-form-item.form-item.form-item--password-confirm.js-form-type-password-confirm.form-type-password-confirm.js-form-item-pass.form-item-pass.form-no-label:nth-child(5) div.js-form-item.form-item.form-item--password.js-form-type-password.form-type-password.js-form-item-pass-pass1.form-item-pass-pass1.password-parent:nth-child(1) div.password-strength div.password-strength__meter > div.password-strength__indicator.js-password-strength__indicator.is-weak   width
    Log to console                      Width_strengt_bar variable for password strength bar:   no_newline=true
    Log to console                      ${WIDTH_STRENGTH_BAR}
    #Log to console                      Height variable for password strength bar:              no_newline=true
    #Log to console                      ${HEIGHT}

*** Keywords ***
Login to Skatteinformation and go to account settings
    Skatteinformation Website Is Open
    Login ResetUser
    Go To                               https://test.skatteinformation.se/user/8629/edit

Click The Submit Button
    ${ele}                              Get WebElement              id=edit-submit
    Execute Javascript                  arguments[0].click();       ARGUMENTS    ${ele}