*** Settings ***

Documentation  This is a test suite that test the navigation part of the website Skatteinformation.se
Resource       C:/Users/fritz/PycharmProjects/Skatteinformation/Resources/navigation_keywords.robot
Resource       C:/Users/fritz/PycharmProjects/Skatteinformation/Resources/login_variables.robot
Library        SeleniumLibrary

Test Setup     Begin web test
Test Teardown  End webtest



*** Variables ***

${Browser} =    chrome


*** Test Cases ***

Test of Deklaration button
    [Documentation]  This is a test case that test if the button "Deklaration" takes you to a search for the word "Dek20"
    [Tags]      Deklaration
    Set Selenium Speed  1 seconds
    Page Loaded
    Log In
    Confirm Page Loaded
    Press And Verify Deklaration


Test of Corona button
    [Documentation]  This is a test case that test if the button "Corona" takes you to a search for the word "Corona"
    [Tags]      Corona
    Page Loaded
    Log In
    Confirm Page Loaded
    Press And Verify Corona




Test of Förmåner button
    [Documentation]  This is a test case that test if the button "Förmåner" takes you to a search for the word "Förmån"
    [Tags]      Förmåner
    Page Loaded
    Log In
    Confirm Page Loaded
    Press And Verify Förmåner


Test of 3:12 button
    [Documentation]  This is a test case that test if the button "3:12" takes you to a search for the word "3:12"
    [Tags]      3:12
    Page Loaded
    Log In
    Confirm Page Loaded
    Press And Verify 3:12


