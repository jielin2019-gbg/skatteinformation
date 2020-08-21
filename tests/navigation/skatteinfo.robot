*** Settings ***
Documentation  This is a test suite that test the navigation part of the website Skatteinformation.se
Resource       ../Resources/navigation_keywords.robot
Resource       ../Resources/navigation_variables.robot
Resource       ../Resources/login_keywords.robot
Resource       ../Resources/login_variables.robot			
Library        SeleniumLibrary

Test Setup     Begin Web Test
Test Teardown  End Web

*** Test Cases ***

Test of Deklaration button
    [Documentation]  This is a test case that test if the button "Deklaration" takes you to a search for the word "Dek20"
    [Tags]      Deklaration
    Set Selenium Speed  1 seconds
    Check Start Page Loaded
    Login User
    Confirm Page Loaded
    Press And Verify Deklaration


Test of Corona button
    [Documentation]  This is a test case that test if the button "Corona" takes you to a search for the word "Corona"
    [Tags]      Corona
    Check Start Page Loaded
    Login User
    Confirm Page Loaded
    Press And Verify Corona


Test of Förmåner button
    [Documentation]  This is a test case that test if the button "Förmåner" takes you to a search for the word "Förmån"
    [Tags]      Förmåner
    Check Start Page Loaded
    Login User
    Confirm Page Loaded
    Press And Verify Förmåner


Test of 3:12 button
    [Documentation]  This is a test case that test if the button "3:12" takes you to a search for the word "3:12"
    [Tags]      3-12
    Check Start Page Loaded
    Login User
    Confirm Page Loaded
    Press And Verify 3:12

Test of Frågor/Svar Button
    [Documentation]  This is a test case that test if the button "Frågor/Svar" takes you to the frågor/svar section of the site
    [Tags]      3:12
    Set Selenium Speed  1 seconds
    Page Loaded
    Log In
    Confirm Login Successful
    Press and Verify Content of Frågor/Svar

Test Of Tabeller Button
    [Documentation]  This is a test case that test if the button "Tabeller" takes you to the section of the site where tabeller shows up
    [Tags]      3:12
    Set Selenium Speed  1 seconds
    Page Loaded
    Log In
    Confirm Login Successful
    Press And Verify Content of Tabeller

Test Of Start Button
    [Documentation]  This is a test case that test if the button "Start" takes you to the home page
    [Tags]      Start
    Set Selenium Speed  1 seconds
    Page Loaded
    Log In
    Confirm Login Successful
    Press and Verify Return To Start Button
