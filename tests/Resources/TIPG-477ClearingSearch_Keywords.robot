*** Settings ***
Library                 SeleniumLibrary
Resource                login_variables.robot


*** Keywords ***

Open Browser To Start Page
     Open Browser                          about:blank      ${BROWSER}
     Maximize Browser Window
     Go To      ${URL}
     Set Selenium Speed                                                                  1
     Wait Until Page Contains              Ange din e-postadress som användarnamn.


Enter Search Text
     [Arguments]                           ${search_text}
     Input Text                            id:edit-search                  ${search_text}


Click Search
     Click Button                          id:edit-submit-search
Click Refresh
     Click Element        //*[@id="views-exposed-form-search-page"]/div/div[2]/a



End Web Test
        Close Browser

Verify Search
     Wait Until Element Is Visible         id:block-facet-search-summary
     ${Results_all}=                       Get text                        xpath://*[@id="block-facet-search-content-type"]/div/ul/li[1]/a/span[1]
     should be equal                       Alla                            ${Results_all}

#Verify Refresh Button
   #  Wait Until Element Is Visible      id:edit-submit-search
   # ${Refresh_all}=             Get text       xpath://*[@id="block-facet-search-content-type"]/div/ul/li[1]/a
   #  Page Should Contain        Alla        ${Refresh_all}

Verify Refresh Button
    Wait Until Element Is Visible      id:edit-submit-search
    ${Refresh_all}=                       Get text        xpath://*[@id="edit-search"]
     Should be equal                      ${empty}        ${Refresh_all}
