*** Settings ***
Documentation     This is test suite to verify Kategorier so that I can test my search result by Selecting the categories in dropdown menu.
Library           SeleniumLibrary
Resource	  ../Resources/login_keywords.robot
Resource	  ../Resources/login_variables.robot
Resource          ../Resources/search_keywords.robot
Resource          ../Resources/teardown_keywords.robot
Resource          ../Resources/setup_keywords.robot
Test Setup        Skatteinformation Website Is Open
Test Teardown     Logout And Close All


*** Variables ***
${BROWSER} =      chrome


*** Test Case ***


Verify Kategorier Function On The Header Allmänt
     [Documentation]                  Test to be able to select a category so that I can filter my search result by category
     [Tags]                           TIPG-664

        Login User
        Verification of Kategorier samt Allmänt
        Verification of Allmänt

Civilrätt och bokföring
    [Documentation]                   Testing second option in the dropdown menu of Kategorier
    [Tags]                            TIPG-665

        Login User
        Verify Kategori Civilrätt och bokföring
        Verification of Civilrätt

Deklaration och Förfarande
    [Documentation]                   Testing third option in the dropdown menu of Kategorier
    [Tags]                            TIPG-666

        Login User
        Verify Kategori Deklaration och förfarande
        Verification of Deklaration


Fastighet
    [Documentation]                   Testing fourth option in the dorpdown menu of Kategorier
    [Tags]                            TIPG-667
        Login User
        Verify Kategori Fastighet
        Verification of Fastighet

Internationell beskattning
    [Documentation]                   Testing fIfth option in the dorpdown menu of Kategorier
    [Tags]                            TIPG-669
        Login User
        Verify Kategori Internationell beskattning
        Verification of Internationell beskattning

Kapital
    [Documentation]                   Testing sixth option in the dorpdown menu of Kategorier
    [Tags]                            TIPG-672
       Login User
       Verify Kategori Kapital
       Verification of Kapital

Mervärdesskatt och punktskatter
    [Documentation]                   Testing seventh option in the dorpdown menu of Kategorier
    [Tags]                            TIPG-673
        Login User
        Verify Kategori Mervärdesskatt och punktskatter
        Verification of Mervärdesskatt och punktskatter

Näringsverksamhet
    [Documentation]                   Testing eighth option in the dorpdown menu of Kategorier
    [Tags]                            TIPG-674
        Login User
        Verify Kategori Näringsverksamhet
        Verification of Näringsverksamhet


Tjänst
     [Documentation]                   Testing ninth option in the dorpdown menu of Kategorier
     [Tags]                            TIPG-676
        Login User
        Verify Kategori Tjänst
        Verification of Tjänst
