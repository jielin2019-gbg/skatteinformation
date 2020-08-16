*** Settings ***
Documentation
Resource                                        Resources/login_keywords.robot
Resource                                        Resources/QA_keywords.robot
Library                                         SeleniumLibrary
Test Setup                                      Begin Web Test
Test Teardown                                   End Web Test


*** Variables ***
${BROWSER}                                      chrome
${URL}                                          https://test.skatteinformation.se/
${USERNAME_USER}                                infotiv-user
${USERNAME_EDITOR}                              infotiv-editor
${PASSWORD}                                     slimy-very-decorate-transit


*** Test Cases ***
Test on 'Collapse' button
    [Tags]                                      Link in QA paragraph
    User clicks on show button
    Collapse button is clicked
    Q/A paragraph disappear


*** Keywords ***

User clicks on show button

      Login User
      Click Q/A button menu bar
      Execute Javascript                    window.scrollTo(0,60000)
      Click Button                          xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[1]/button

Verify Q/A paragraph displayed
      Page Should Contain Element          xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[2]/div
      Page Should Contain Element          xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[2]/div/div/div[1]
      sleep                                5s

Collapse button is clicked

       Click Button                         xpath://*[@id="block-skatteinfo-content"]/div/div/div/div[2]/article/div[1]/button
       #sleep                                5s

Q/A paragraph disappear
      Page Should not Contain              FRÅGA

