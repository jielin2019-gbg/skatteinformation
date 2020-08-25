*** Settings ***
Documentation                                   Change daily email settings in Mitt Konto
Library                                         SeleniumLibrary
Resource	                                      ../Resources/login_keywords.robot
Resource	                                      ../Resources/login_variables.robot
Resource                                        ../Resources/setup_keywords.robot
Resource                                        ../Resources/teardown_keywords.robot
Test Setup                                      Skatteinformation Website Is Open
Test Teardown                                   Close All Browsers

*** Variables ***
${BROWSER}                                      chrome

*** Test Cases ***
Test glömt ditt lösenord with invalid email
    [Documentation]                             Test that the "glömt ditt lösenord?" does not work with an invalid email
    [Tags]                                      test_reset_pass_invalid_email
    Page Should Contain Element                 //*[@id="edit-pass--description"]/a
    Click Element                               //*[@id="edit-pass--description"]/a
    Page Should Contain Element                 id=edit-name
    Input Text                                  id=edit-name    bert-stjärt
    Click Element                               id=edit-submit
    Page Should Contain                         is not recognized as a username or an email address

Test Återställ ditt lösenord with invalid email
    [Documentation]                             Test that the "Återställ ditt lösenord" does not work with an invalid email
    [Tags]                                      test_reset_pass_invalid_email2
    Page Should Contain Element                 //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Click Element                               //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Page Should Contain Element                 id=edit-name
    Input Text                                  id=edit-name    bert-stjärt
    Click Element                               id=edit-submit
    Page Should Contain                         is not recognized as a username or an email address

Test glömt ditt lösenord with empty email input field
    [Documentation]                             Test that the "glömt ditt lösenord?" does not work with an empty email
    [Tags]                                      test_reset_pass_invalid_email3
    Page Should Contain Element                 //*[@id="edit-pass--description"]/a
    Click Element                               //*[@id="edit-pass--description"]/a
    Page Should Contain Element                 id=edit-name
    Click Element                               id=edit-submit
    Element Attribute Value Should Be           id=edit-name  required    true

Test Återställ ditt lösenord with empty email
    [Documentation]                             Test that the "Återställ ditt lösenord" does not work with an empty email
    [Tags]                                      test_reset_pass_invalid_email4
    Page Should Contain Element                 //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Click Element                               //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Page Should Contain Element                 id=edit-name
    Click Element                               id=edit-submit
    Element Attribute Value Should Be           id=edit-name  required    true
