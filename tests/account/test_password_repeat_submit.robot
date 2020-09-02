*** Settings ***
Documentation                                                   Change daily email, weekly email settings in Mitt Konto
Library                                                         SeleniumLibrary
Resource	                                                    ../Resources/login_keywords.robot
Resource	                                                    ../Resources/login_variables.robot
Resource                                                        ../Resources/setup_keywords.robot
Resource                                                        ../Resources/teardown_keywords.robot
Test Setup                                                      Skatteinformation Website Is Open
Test Teardown                                                   Logout And Close All

*** Variables ***
${BROWSER}                                                      headlesschrome
# If you need to run this test manually without headless then uncomment line 43

*** Test Cases ***
Enter The Same Password In "Lösenord" And "Bekräfta lösenord"
    Given The User Is On The "Mitt Konto" Page And Is On "Bekräfta Lösenord" Input Field
    When Enter The Same Password In Bekräfta lösenord Input Field
    And Save The Changes Of Password                            ja
    Then Successfully Change The Password

Enter Different Password In "Lösenord" And "Bekräfta lösenord"
    Given The User Is On The "Mitt Konto" Page And Is On "Bekräfta Lösenord" Input Field
    When Enter A Different Password In Bekräfta lösenord Input Field
    And Save The Changes Of Password                            nej
    Then Fail To Change The Password

*** Keywords ***
The User Is On The "Mitt Konto" Page And Is On "Bekräfta Lösenord" Input Field
    The User Log In Successfully
    The User Visit Mitt Konto Settings
    Enter The Current Password In Nuvarande lösenord Input Field
    Enter The New Password In Lösenord Input Field

The User Log In Successfully
    Login ResetUser
    Page Should Contain                                         Senaste nytt

The User Visit Mitt Konto Settings
    Click Link                                                  link:Mitt konto

Enter The Current Password In Nuvarande lösenord Input Field
#    Sleep                                                       3
    Input Text                                                  id:edit-current-pass    ${PASSWORD}

Enter The New Password In Lösenord Input Field
    Scroll Element Into View                                    id:edit-pass-pass1
    Input Text                                                  id:edit-pass-pass1      ${PASSWORD}

Enter A Different Password In Bekräfta lösenord Input Field
    Scroll Element Into View                                    id:edit-pass-pass2
    Input Text                                                  id:edit-pass-pass2      ${NEW_RESET_EMAIL_PASSWORD}

Enter The Same Password In Bekräfta lösenord Input Field
    Scroll Element Into View                                    id:edit-pass-pass2
    Input Text                                                  id:edit-pass-pass2      ${PASSWORD}

Save The Changes Of Password
    [Arguments]  ${repeated_password}
    Page Should Contain                                         Lösenorden stämmer överens: ${repeated_password}
    ${ele}      Get WebElement                                  id:edit-submit
    Execute Javascript                                          arguments[0].click();   ARGUMENTS    ${ele}

Successfully Change The Password
    Sleep                                                       2
    Page Should Contain                                         Ändringarna har sparats

Fail To Change The Password
    Page Should Contain                                         De angivna lösenorden stämmer inte överens