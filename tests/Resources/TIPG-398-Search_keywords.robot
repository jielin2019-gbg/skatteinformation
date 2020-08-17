*** Settings ***
Library                 SeleniumLibrary
Resource                login_variables.robot


*** Keywords ***
Open Browser To Start Page
     Open Browser                          about:blank                     ${BROWSER}      options=add_argument("--ignore-certificate-errors")
     Maximize Browser Window
     Go To                                                                 ${URL}
     Set Selenium Speed                                                                  1
     Wait Until Page Contains              Ange din e-postadress som användarnamn.


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


End Web Test
        Close Browser