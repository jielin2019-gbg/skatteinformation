*** Settings ***
Documentation       This is test suite of search function verification of skatteinformation.se
Resource            ../Resources/TIPG-505-Search_keywords.robot
Resource            ../Resources/login_keywords.robot
Library             SeleniumLibrary
Test Setup          Open Browser To Start Page
Test Teardown       End Web Test


*** Variables ***
${BROWSER} =  headlesschrome



*** Test Cases ***
Verify Fråga/svar content type in valid search
        [Documentation]                     Test to verify that search function is working with a valid keyword and its showing fråga/svar
        ...                                 content type in the search results
        [Tags]                              TIPG-523
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search
        Verify content type questions/answer
        Log Out


Verify Sök Innehåll On The Header
        [Documentation]                     Test to verify that Sök Innehåll button is redirecting to search page
        ...                                 content type in the search results
        [Tags]                              TIPG-547
        Login User
        Verify Search Button From Startpage
        Verify Search Button From Sök Innehåll Page
        Verify Search Button From Fråga/Svar Page
        Verify Search Button From Tabeller Page
        Log Out


Verify the search result by search content type Artikel
        [Documentation]                     test verify that search function is working with showing Artikel content type
         ...                                in the search results
        [Tags]                              TIPG-522
        Login User
        Enter Search Text                   bilförmån
        Click Search
        Verify Search
        Verify content type artikel
        Log Out