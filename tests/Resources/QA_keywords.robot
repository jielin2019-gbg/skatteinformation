*** Keywords ***
Begin Web Test
    Open Browser    about:blank  ${BROWSER}
    Maximize Browser Window

Go To Web Page
    Go To   ${URL}

User select more than one filetring tag
      Login User
      Click Q/A button menu bar
      Click Element                         id:kategori-Enskild-firma
      Execute Javascript                    window.scrollBy(0,400)
      Click Element                         id:kategori-Aktiebolag
      Execute Javascript                    window.scrollBy(0,400)
      Click Element                         id:kategori-EU-handel

Verify selected tags became marked
      Page Should Contain Element           xpath://*[@id="kategori-EU-handel"]
      Page Should Contain Element           xpath://*[@id="kategori-Enskild-firma"]
      Page Should Contain Element           xpath://*[@id="kategori-Aktiebolag"]


Number of Q&A are displayed correctly.
      Click Element                         xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]/a/span[1]

Verify all Q&A are displayed
      Page should contain                   xpath://*[@id="block-skatteinfo-content"]/div/div/nav/ul/li[2]
