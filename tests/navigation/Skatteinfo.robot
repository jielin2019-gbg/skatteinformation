*** Settings ***
Documentation  This is a test suite that test the navigation part of the website Skatteinformation.se
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/navigation_variables.robot
Resource       ../Resources/login_keywords.robot
Resource       ../Resources/login_variables.robot			
Library        SeleniumLibrary

Test Setup     Begin Web Test
Test Teardown  End Web Test

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
    Login User
    Confirm Page Loaded
    Press And Verify Corona


Test of Förmåner button
    [Documentation]  This is a test case that test if the button "Förmåner" takes you to a search for the word "Förmån"
    [Tags]      Förmåner
    Page Loaded
    Login User
    Confirm Page Loaded
    Press And Verify Förmåner


Test of 3:12 button
    [Documentation]  This is a test case that test if the button "3:12" takes you to a search for the word "3:12"
    [Tags]      3-12
    Page Loaded
    Login User
    Confirm Page Loaded
    Press And Verify 3:12


