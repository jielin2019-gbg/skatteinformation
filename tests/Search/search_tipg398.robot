*** Settings ***
Documentation       This is test suite of search function verification of skatteinformation.se
Resource            ../Resources/search_keywords.robot
Resource            ../Resources/login_keywords.robot
Resource            ../Resources/setup_keywords.robot
Resource            ../Resources/teardown_keywords.robot
Library             SeleniumLibrary
Test Setup          Skatteinformation Website Is Open
Test Teardown       Logout And Close All


*** Variables ***
${BROWSER} =  headlesschrome


*** Test Cases ***
Verify Valid Search
        [Documentation]                     Test to verify that search function is working with a valid keyword for eg: moms
        [Tags]                              TIPG-464
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search


Make Search With No Query
        [Documentation]                     Test to verify that search function is working with a an empty keyword
        [Tags]                              TIPG-467
        Login User
        Search Empty



Verify Searchbar Clearing after Refresh
        [Documentation]                     Test to verify that search bar is clearing after refreshing
        [Tags]                              TIPG-477
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search
        Click Refresh
        Verify Refresh Button



Verify Login and Invalid Search
        [Documentation]                     Test to verify that search function is working with an invalid keyword for eg: abcd
        [Tags]                              TIPG-470
        Login User
        Enter Search Text                   abcd
        Click Search
        Verify Search invalid

