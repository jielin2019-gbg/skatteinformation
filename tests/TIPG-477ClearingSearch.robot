*** Settings ***
Documentation       This is test suite of search function verification of skatteinformation.se
Resource            ../tests/Resources/TIPG-477ClearingSearch_Keywords.robot
Resource            ../tests/Resources/login_keywords.robot
Library             SeleniumLibrary
Test Setup          Open Browser To Start Page
Test Teardown       End Web Test



*** Variables ***
${BROWSER} =    chrome

*** Test Cases ***
Verify Searchbar Clearing after Refresh
        [Documentation]                     Test to verify that search bar is clearing after refreshing
        [Tags]                              TIPG-477
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search
        Click Refresh
        Verify Refresh Button
        Log Out