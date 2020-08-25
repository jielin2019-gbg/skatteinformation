*** Settings ***
Library                 SeleniumLibrary
Resource                login_variables.robot


*** Keywords ***
Enter Search Text
     [Arguments]                           ${search_text}
     Input Text                            id:edit-search                  ${search_text}


Click Search
     Click Button                          id:edit-submit-search


Verify Search
     Wait Until Element Is Visible         id:block-facet-search-summary
     ${Results_all}=                       Get text                        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[1]/a/span[1]
     should be equal                       Alla                            ${Results_all}


Verify content type Fråga/svar
    ${Results_fråga}=                       Get text                        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[3]/a/span[1]
    should be equal                         Fråga/svar                      ${Results_fråga}


Search Empty
    Click Button                            xpath://*[@id="edit-submit-search"]
    Wait Until Page Contains Element        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[1]/a
    Wait Until Page Contains Element        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[2]/a
    Wait Until Page Contains Element        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[3]/a
    Wait Until Page Contains Element        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[4]/a


Click Refresh
    Click Element                           //*[@id="views-exposed-form-search-page"]/div/div[2]/a


Verify Refresh Button
    Wait Until Element Is Visible           id:edit-submit-search
    ${Refresh_all}=                         Get text        xpath://*[@id="edit-search"]
    Should be equal                         ${empty}        ${Refresh_all}


Verify Search invalid
    ${link_text} =                          Get Text  xpath://*[@id="block-facet-search-summary"]/ul/li/span[1]
    Page Should Contain                     ${link_text}  Visar 0 träffar på "abcd"



Verify Search Button From Startpage
        Wait Until Page Contains Element        xpath://*[@id="block-main-menu"]/ul/li[2]/a
        Click Element                           xpath://*[@id="block-main-menu"]/ul/li[2]/a
        Wait Until Page Contains                Vad söker du?


Verify Search Button From Sök Innehåll Page
        Click Element                           xpath://*[@id="block-main-menu"]/ul/li[2]/a
        Wait Until Page Contains Element        xpath://*[@id="block-main-menu"]/ul/li[2]/a


Verify Search Button From Fråga/Svar Page
        Click Element                           xpath://*[@id="block-main-menu"]/ul/li[4]/a
        Wait Until Page Contains Element        xpath://*[@id="block-main-menu"]/ul/li[2]/a


Verify Search Button From Tabeller Page
        Click Element                           xpath://*[@id="block-main-menu"]/ul/li[5]/a
        Wait Until Page Contains Element        xpath://*[@id="block-main-menu"]/ul/li[2]/a


Verify content type artikel
        ${Results_Artikel}=                    Get text                        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[2]/a/span[1]
        should be equal                        Artikel                          ${Results_Artikel}

