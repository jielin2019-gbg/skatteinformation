*** Keywords ***
Begin Web Test
    Open Browser                            about:blank  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed                      0.5

Go To Web Page
    Go To   ${URL}

Verify start page loaded
    ${link_text} = 		                    Get Text  xpath://*[@id="block-facet-category-term-name"]/div/button
    Should Be Equal		                    ${link_text}  Visa fler val

User select more than one filetring tag
      Login User
      Click Q/A button menu bar
      Click Button                          xpath://*[@id="block-facet-category-term-name"]/div/button
      Execute Javascript                    window.scrollBy(0,800)
      Click Element                         xpath://*[@id="kategori-Enskild-firma"]
      Click Element                         xpath://*[@id="kategori-EU-handel"]
      Click Element                         xpath://*[@id="kategori-Aktiebolag"]
      Execute Javascript                    window.scrollBy(0,400)
      sleep                                 5s

Verify selected tags became marked
      Page Should Contain Element           xpath://*[@id="kategori-EU-handel"]
      Page Should Contain Element           xpath://*[@id="kategori-Enskild-firma"]
      Page Should Contain Element           xpath://*[@id="kategori-Aktiebolag"]

End Web Test
    Close Browser