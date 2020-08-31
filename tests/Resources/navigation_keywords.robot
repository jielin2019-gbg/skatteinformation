*** Keywords ***
Begin Web Test
    Open Browser                about:blank   ${BROWSER}
    Set Window Size    		${1920}       ${1080}
    Go To                       ${URL}

Check Start Page Loaded
    Location Should Be  https://test.skatteinformation.se/start
    Wait Until Element Is Visible  xpath://input[@id="edit-search"]

Confirm Page Loaded
    Location Should Be  https://test.skatteinformation.se
    Wait Until Element Is Visible  xpath://input[@id="edit-search"]
	
Verify the user is able to navigate to Fastighetsmoms link
    Click Link              //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[3]/a
    Location Should Be      https://test.skatteinformation.se/sok?search=fastighet&f%5B0%5D=kategori%3A25
    Page Should Contain     fastighet

Verify the user is able to navigate when clicks on any of the popular topic of Fastighetsmoms link
    Click Link              //*[@id="block-skatteinfo-content"]/div/div/div/div/div[1]/article/div/a
    Location Should Be      https://test.skatteinformation.se/artikel/525/fyra-solcellsinstallationer-ses-som-en-anlaggning-full-energiskatt
    Page Should Contain     Irini Kallides

Verify the user is able to navigate to 3:12 link
    Click Link              //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[2]/a
    Location Should Be      https://test.skatteinformation.se/sok?search=3%3A12-reglerna&f%5B0%5D=kategori%3A29
    Page Should Contain     3:12-reglerna

Verify the user is able to navigate when clicks on any of the popular topic of 3:12 link
    Click Link      //*[@id="block-skatteinfo-content"]/div/div/div/div/div[1]/article/div/a
    Location Should Be   https://test.skatteinformation.se/artikel/708/proposition-om-nya-skatteregler-generationsskiften-i-famansforetag
    Page Should Contain     Alexandra Wallerius

Press And Verify Deklaration
    Click Element               //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[5]
    Location Should Be          https://test.skatteinformation.se/sok?search=dek20

Press And Verify Corona
   Click Element                 //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[1]
   Location Should Be           https://test.skatteinformation.se/sok?search=Corona

Press And Verify Förmåner
   Click Element                 //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[4]
   Location Should Be            https://test.skatteinformation.se/sok?search=f%C3%B6rm%C3%A5n&f%5B0%5D=kategori%3A32

Press And Verify 3:12
   Click Element                 //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[2]
   Location Should Be            https://test.skatteinformation.se/sok?search=3%3A12-reglerna&f%5B0%5D=kategori%3A29

Press and Verify Content of Frågor/Svar
    Click Link                  //*[@id="block-main-menu"]/ul/li[4]/a
    Location Should Be          https://test.skatteinformation.se/fraga-och-svar
    Wait Until Page Contains    Går det att få avdrag för arbetsresor med mer än 18,50 kronor/mil?

Press And Verify Content of Tabeller
    Click Link                  //*[@id="block-main-menu"]/ul/li[5]/a
    Location Should Be          https://test.skatteinformation.se/tabeller
    Wait Until Page Contains      Allmän pensionsavgift

Press and Verify Return To Start Button
    Click Link                  //*[@id="block-main-menu"]/ul/li[5]/a
    CLick Link                  //*[@id="block-main-menu"]/ul/li[1]/a
    Location Should Be          https://test.skatteinformation.se/
    Wait Until Page Contains    Visa fler filtreringsmöjligheter

Verify the user is able to navigate to Sök innehåll link to confirm the content present in it
    Click Link   //*[@id="block-main-menu"]/ul/li[2]/a
    Page Should Contain   Vad söker du?

Verify the user can access the wide search functionality in one click
    Click Link   //*[@id="block-skatteinfo-content"]/article/div/div/div[2]/div/div[1]/form/div[1]/div[3]/div[2]/div/div/div[3]/a
    Location Should Be      https://test.skatteinformation.se/sok?search=fastighet&f%5B0%5D=kategori%3A25
    Click Link    //*[@id="block-skatteinfo-content"]/div/div/div/div/div[5]/article/div/a
    #Click Sök innehåll menu
    Click Link    //*[@id="block-main-menu"]/ul/li[2]/a
    Page Should Contain    Vad söker du?

    Click Link   //*[@id="block-main-menu"]/ul/li[4]/a
    Location Should Be   https://test.skatteinformation.se/fraga-och-svar
    Click Button   //*[@id="block-skatteinfo-content"]/div/div/div/div[1]/article/div[1]/button
    #Click Sök innehåll menu
    Click Link    //*[@id="block-main-menu"]/ul/li[2]/a
    Page Should Contain    Vad söker du?

    Click Link    //*[@id="block-utility-menu"]/ul/li[2]/a
    #Click Sök innehåll menu
    Click Link    //*[@id="block-main-menu"]/ul/li[2]/a
    Page Should Contain    Vad söker du?

Test Click Kontakt
		Click Link				//a[@href="mailto:skatteinformation@wolterskluwer.se?subject=Skatteinformation.se%3A%20Jag%20har%20en%20fr%C3%A5ga"]

Verify The User Is Able To Show different Categories When Clicks On Dropdown Arrow
    Click Element   xpath://*[@id="block-main-menu"]
    Page Should Contain    Allmänt
    Page Should Contain    Civilrätt och bokföring
    Page Should Contain    Deklaration och förfarande

Verify The User Is Able To Show Specific content of the selected Category
    Click Element   xpath://*[@id="block-main-menu"]
    Page Should Contain    Allmänt
    Click Link  //*[@id="block-main-menu"]/ul/li[3]/ul/li[1]/a
    Page Should contain     Beslut om slopad skattereduktion för fackföreningsavgifter

Verify The User Is Able To hide the category list with one click
    Click Element   xpath://*[@id="block-main-menu"]
    Page Should Contain    Allmänt
    Page Should Contain    Civilrätt och bokföring

    Click Element   xpath://*[@id="block-main-menu"]
    sleep  3s

Hover Over Logo
      Mouse over	xpath://div[@id="block-sitebranding"]

Click Logo
       	Click Link	xpath://a[@title="Hem"]

Return From Mitt Konto
	Click Link 			xpath://a[@href="/user/edit" and text()="Mitt konto"]
	Page Should Contain		Personlig information
       	Click Logo
	
Click Shortcut
	[Arguments]	${number}	${name}
	${name_intl}  Set Variable If  ${number}==4  f%C3%B6rm%C3%A5n
	...  ${number}==2  3%3A12-reglerna  ${name}
#	Log To Console	Shortcut nr:${number} name:${name} name_intl:${name_intl} Using:${BROWSER}
	Wait Until Element Is Visible  xpath://a[contains(@href,"${name_intl}")]  timeout=2m
	Click Element   xpath://div[@class="cell small-4 large-2"][${number}]
	Verify Shortcut Page Loaded  ${name}

Click Menu Item	
	[Arguments]	${menu-item}	
       	Click Link	xpath://a[contains(@href,"${menu-item}")]	
	Location Should Be  ${URL}${menu-item}

Click Menu Sub Item
	[Arguments]	${sub-item}	
      	Wait Until Page Contains Element  xpath://span[@class="menu-link menu-link--main" and text()="Kategorier "]		
	Mouse Over	//*[@id="block-main-menu"]/ul/li[3]
	Click Element	xpath://span[@class="menu-link menu-link--main" and text()="Kategorier "]
	Set Selenium Speed  0.2
      	Wait Until Page Contains Element  xpath://a[@class="menu-link menu-link--main" and text()="${sub-item}"]	
	Set Selenium Speed  0
       	Click Link	xpath://a[@class="menu-link menu-link--main" and text()="${sub-item}"]	
	Wait Until Page Contains Element  xpath://span[@class="facet-item__value"]
	Page Should Contain  ${sub-item}

Verify Initial Start Page Loaded
	Location Should Be  ${URL}start
	Wait Until Element Is Visible  xpath://input[@id="edit-search"]	
	Page Should Contain  Senaste nytt
	
Verify Start Page Loaded
	Wait Until Location Is	${URL}  timeout=25
	Wait Until Element Is Visible  xpath://input[@id="edit-search"]
	Location Should Be	${URL}  
	Page Should Contain  Senaste nytt

Verify Shortcut Page Loaded
	[Arguments]  ${name}
	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${name}")]  timeout=50
	Page Should Contain Element  xpath://input[@id="edit-search" and contains(@value,"${name}")]  timeout=10
	Wait Until Page Contains Element  xpath://a[@href="/"]
	
Browser Watershed
	[Arguments]	${string}
	Log To Console  ${string} ${URL}
	Run Keyword If	'${BROWSER}'=='firefox'  Confirm Page Loaded2  ${string}/  
	...  ELSE IF	'${BROWSER}'=='headlessfirefox'  Confirm Page Loaded2  ${string}/
	...  ELSE 	Confirm Page Loaded

Scroll To Bottom
	Execute Javascript  window.scrollTo(384000,216000)
	Click Element  xpath://footer[@class="footer"]
	Sleep  0.5

End Web Test
    Close Browser

