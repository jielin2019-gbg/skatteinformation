*** Settings ***
Documentation       This is test suite of recreating bug found in search function of Skatteinformation.se
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
Recreate search bug
        [Documentation]                     Test to recreate the bug found in search function.The bug is the user searched with a valid
        ...                                 keyword and selecting a filter option,then the user is able to see the filtered result.
        ...                                 But once gain if the user clicked search button then the search result is not filtering and
        ...                                 in the result ,user can see a filter selected indicator and content type(Artikel,fråga/svar and notis)
        ...                                 are based on the filter previously selected
        [Tags]                              TIPG-635
        Login User
        Enter Search Text                   moms
        Click Search
        Verify Search
        Select Filter Kammarrätten i Göteborg
        Verify filter appeared in search result
        Click Again Search
        Unmatched Filter Result Appeared
