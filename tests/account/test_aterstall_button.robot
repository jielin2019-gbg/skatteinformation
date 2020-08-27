*** Settings ***
Documentation                            As a user I want to reset my password so that I can log in (when I have forgotten my password)
Library                                 SeleniumLibrary
Resource	                            ../Resources/login_keywords.robot
Resource	                            ../Resources/login_variables.robot
Test Setup                              Skatteinformation Website Is Open
Test Teardown                           Close All Browsers

*** Variables ***
${BROWSER} =                            chrome

*** Test Cases ***

Check if återställ mitt lösenord button works
    Page Should Contain     Återställ ditt lösenord
    Click Element   //*[@id="block-skatteinfo-local-tasks"]/ul/li[2]/a
    Location Should Contain	 https://test.skatteinformation.se/user/password


*** Keywords ***
Skatteinformation Website Is Open
    Open Browser                        ${URL}     ${BROWSER}
    Set Window Size    ${1920}    ${1080}




