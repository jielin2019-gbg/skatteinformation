*** Settings ***
Library                 SeleniumLibrary
Resource                login_variables.robot


*** Keywords ***
Open Browser To Start Page
        Open Browser                           ${URL}     ${BROWSER}
        Set Window Size                        1920       1080
        Wait Until Page Contains              Ange din e-postadress som användarnamn.



Enter Search Text
        [Arguments]                             ${search_text}
        Input Text                              id:edit-search                  ${search_text}


Click Search
        Click Button                            id:edit-submit-search


Verify Search
         Wait Until Element Is Visible          id:block-facet-search-summary
         ${Results_all}=                        Get text                        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[1]/a/span[1]
         should be equal                        Alla                            ${Results_all}


Verify content type questions/answer
        ${Results_QA}=                          Get text                        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[3]/a/span[1]
        should be equal                         Fråga/svar                      ${Results_QA}


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


End Web Test
        Close Browser