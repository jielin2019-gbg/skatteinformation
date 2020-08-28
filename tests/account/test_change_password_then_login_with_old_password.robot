*** Settings ***
Documentation                                   Change daily email settings in Mitt Konto
Library                                         SeleniumLibrary
Resource	                                      ../Resources/login_keywords.robot
Resource	                                      ../Resources/login_variables.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Resource                                        ../Resources/buttons_keywords.robot
Resource                                        ../Resources/goto_keywords.robot
Suite Setup                                     Skatteinformation Website Is Open
Suite Teardown                                  Change Back Password And Logout    ${NEW_RESET_EMAIL_PASSWORD}

*** Variables ***
${BROWSER}                                      headlesschrome

*** Test Cases ***
Test changing password requires current password
    [Documentation]                             Test that there is an error message if trying to change password without the current password
    ...                                         as credential
    [Tags]                                      test_change_password_wihout_current_password
    Page Should Contain Element                 id=edit-name
    Login ResetUser
    Goto Mitt Konto
    Wait Until Page Contains Element            id=edit-pass-pass1
    Input Text                                  id=edit-pass-pass1      ${NEW_RESET_EMAIL_PASSWORD}
    Input Text                                  id=edit-pass-pass2      ${NEW_RESET_EMAIL_PASSWORD}
    Click Submit Button
    Wait Until Page Contains                    Ditt nuvarande lösenord saknas eller är felaktigt.

Test change password in "Mitt konto"
    [Documentation]                             Test the change password functionality with a new password that differs from the current password
    [Tags]                                      test_change_current_password_to_new_password
    Wait Until Page Contains Element            id=edit-submit
    Input Text                                  id=edit-current-pass    ${PASSWORD}
    Input Text                                  id=edit-pass-pass1      ${NEW_RESET_EMAIL_PASSWORD}
    Input Text                                  id=edit-pass-pass2      ${NEW_RESET_EMAIL_PASSWORD}
    Click Submit Button
    Wait Until Page Contains                    Ändringarna har sparats
    Log Out Forced

Test to log in with the old password
    [Documentation]                             Test to login with the original password that was used before the change
    [Tags]                                      test_login_with_old_password
    Goto Start Page
    Input Text                                  id=edit-name    ${RESET_USERNAME}
    Input Text                                  id=edit-pass    ${PASSWORD}
    Click Submit Button
    Page Should Contain                         Unrecognized username or password.
    Wait Until Page Contains Element            id=edit-name
    Click Element                               id=edit-name
    Input Text                                  id=edit-name    ${RESET_USERNAME}
    Click Element                               id=edit-pass
    Input Text                                  id=edit-pass    ${NEW_RESET_EMAIL_PASSWORD}
    Click Submit Button
    Wait Until Page Contains Element            //*[@id="block-utility-menu"]/ul/li[2]/a
    Goto Mitt Konto
