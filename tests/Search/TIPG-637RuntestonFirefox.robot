*** Settings ***
Documentation       This is test suite of search function verification of skatteinformation.se
Resource            ../Resources/search_keywords.robot
Resource            ../Resources/login_keywords.robot
Resource            ../Resources/login_variables.robot
Resource            ../Resources/setup_keywords.robot
Resource            ../Resources/teardown_keywords.robot
Library             SeleniumLibrary
Test Setup          Skatteinformation Website Is Open
Test Teardown       Logout And Close All



*** Variables ***
${BROWSER} =    Firefox

*** Test Cases ***
Verify Valid Search
        [Documentation]                     Test to verify that search function is working with a valid keyword for eg: moms
        [Tags]                              TIPG-464
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search


Verify Searchbar Clearing after Refresh
        [Documentation]                     Test to verify that search bar is clearing after refreshing
        [Tags]                              TIPG-477
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search
        Click Refresh
        Verify Refresh Button


Make Search With No Query
        [Documentation]                     Test to verify that search function is working with a an empty keyword
        [Tags]                              TIPG-467
        Login User
        Search Empty



Verify Login and Invalid Search
        [Documentation]                     Test to verify that search function is working with an invalid keyword for eg: abcd
        [Tags]                              TIPG-470
        Login User
        Enter Search Text                   abcd
        Click Search
        Verify Search invalid

#search_by_content_type_tipg505.robot

Verify Fråga/svar content type in valid search
        [Documentation]                     Test to verify that search function is working with a valid keyword and its showing fråga/svar
        ...                                 content type in the search results
        [Tags]                              TIPG-523
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search
        Verify content type Fråga/svar

Verify Sök Innehåll On The Header
        [Documentation]                     Test to verify that Sök Innehåll button is redirecting to search page
        ...                                 content type in the search results
        [Tags]                              TIPG-547
        Login User
        Verify Search Button From Startpage
        Verify Search Button From Sök Innehåll Page
        Verify Search Button From Fråga/Svar Page
        Verify Search Button From Tabeller Page

Verify the search result by search content type Artikel
        [Documentation]                     test verify that search function is working with showing Artikel content type
         ...                                in the search results
        [Tags]                              TIPG-522
        Login User
        Enter Search Text                   bilförmån
        Click Search
        Verify Search
        Verify content type artikel
