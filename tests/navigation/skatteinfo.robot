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


Test of Deklaration button: User
    [Documentation]  This is a test case that test if the button "Deklaration" takes you to a search for the word "Dek20"
    [Tags]      Deklaration
    Set Selenium Speed  1 seconds
    Login User
    Check Start Page Loaded
    Press And Verify Deklaration


Test of Corona button: User
    [Documentation]  This is a test case that test if the button "Corona" takes you to a search for the word "Corona"
    [Tags]      Corona
    Login User
    Check Start Page Loaded
    Press And Verify Corona


Test of Förmåner button: User
    [Documentation]  This is a test case that test if the button "Förmåner" takes you to a search for the word "Förmån"
    [Tags]      Förmåner
    Login User
    Check Start Page Loaded	
    Press And Verify Förmåner


Test of 3:12 button: User
    [Documentation]  This is a test case that test if the button "3:12" takes you to a search for the word "3:12"
    [Tags]      3-12
    Set Selenium Speed      2 seconds
    Login User
    Check Start Page Loaded
    Press And Verify 3:12

Test of Frågor/Svar Button: User
    [Documentation]  This is a test case that test if the button "Frågor/Svar" takes you to the frågor/svar section of the site
    [Tags]      frågor/svar
     Set Selenium Speed  1 seconds
    Login User
    Check Start Page Loaded
    Press and Verify Content of Frågor/Svar

Test Of Tabeller Button: User
    [Documentation]  This is a test case that test if the button "Tabeller" takes you to the section of the site where tabeller shows up
    [Tags]      3:12
    Login User
    Check Start Page Loaded
    Press And Verify Content of Tabeller

Test Of Start Button: User
    [Documentation]  This is a test case that test if the button "Start" takes you to the home page
    [Tags]      Start
    Login User
    Check Start Page Loaded	
    Press and Verify Return To Start Button



Test of Deklaration button: Editor
    [Documentation]  This is a test case that test if the button "Deklaration" takes you to a search for the word "Dek20"
    [Tags]      Deklaration
    Set Selenium Speed  1 seconds
    Login Editor
    Check Start Page Loaded
    Press And Verify Deklaration


Test of Corona button: Editor
    [Documentation]  This is a test case that test if the button "Corona" takes you to a search for the word "Corona"
    [Tags]      Corona
    Login Editor
    Check Start Page Loaded
    Press And Verify Corona


Test of Förmåner button: Editor
    [Documentation]  This is a test case that test if the button "Förmåner" takes you to a search for the word "Förmån"
    [Tags]      Förmåner
    Login Editor
    Check Start Page Loaded
    Press And Verify Förmåner


Test of 3:12 button: Editor
    [Documentation]  This is a test case that test if the button "3:12" takes you to a search for the word "3:12"
    [Tags]      3-12
    Set Selenium Speed      2 seconds
    Login Editor
    Check Start Page Loaded
    Press And Verify 3:12

Test of Frågor/Svar Button: Editor
    [Documentation]  This is a test case that test if the button "Frågor/Svar" takes you to the frågor/svar section of the site
    [Tags]      frågor/svar
     Set Selenium Speed  1 seconds
    Login Editor
    Check Start Page Loaded
    Press and Verify Content of Frågor/Svar

Test Of Tabeller Button: Editor
    [Documentation]  This is a test case that test if the button "Tabeller" takes you to the section of the site where tabeller shows up
    [Tags]      3:12
    Login Editor
    Check Start Page Loaded
    Press And Verify Content of Tabeller

Test Of Start Button: Editor
    [Documentation]  This is a test case that test if the button "Start" takes you to the home page
    [Tags]      Start
    Login Editor
    Check Start Page Loaded
    Press and Verify Return To Start Button
