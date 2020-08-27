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

Process Links
	[Arguments]	${value}
      	Log To Console	Testing for ${value}
       	Click Link	xpath://a[contains(@href,"${value}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]  timeout=15
       	Click Logo
#      	Wait Until Page Contains Element  xpath://input[@id="edit-search"]

Process Links Intl Chars
	[Arguments]	${value}	${value2}
	Log To Console	Testing for ${value} and ${value2}
       	Click Link	xpath://a[contains(@href,"${value2}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
       	Click Logo

Start From Shortcut
	[Arguments]	${value}
	Run Keyword If	'${value}'=='förmån'  Process Links Intl Chars	${value}  value2=f%C3%B6rm%C3%A5n
	...  ELSE   	Process Links	      ${value}	

Process Links After Scroll
	[Arguments]	${value}
      	Log To Console	Testing for ${value}
       	Click Link	xpath://a[contains(@href,"${value}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
	Scroll To Bottom
       	Click Logo
#       	Wait Until Page Contains Element  xpath://a[@id="edit-search"]	5	

Process Links After Scroll Intl Chars
	[Arguments]	${value}	${value2}
	Log To Console	Testing for ${value} and ${value2}
       	Click Link	xpath://a[contains(@href,"${value2}")]	
       	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
	Scroll To Bottom
       	Click Logo
#       	Wait Until Page Contains Element  xpath://[@id="edit-search"]	5
	
Start From Shortcut After Scroll
	[Arguments]	${value}
	Run Keyword If	'${value}'=='förmån'  Process Links After Scroll Intl Chars	${value}  value2=f%C3%B6rm%C3%A5n
	...  ELSE   	Process Links After Scroll	      ${value}	

Scroll To Bottom
	Scroll Element Into View	xpath://footer
	Scroll Element Into View	xpath://div[@class="slogan"]

Return After Menu Item	
	[Arguments]	${value}	
	Log To Console	Testing for ${value}
       	Click Link	xpath://a[contains(@href,"${value}")]	
#      	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value}")]
       	Click Logo

Return After Menu Item Sub
	[Arguments]	${value}	
	Set Selenium Speed 	    0.1
	Log To Console	Testing for ${value}
      	Wait Until Page Contains Element  xpath://span[@class="menu-link menu-link--main" and text()="Kategorier "]		
	Mouse Over	//*[@id="block-main-menu"]/ul/li[3]
	Click Element	xpath://span[@class="menu-link menu-link--main" and text()="Kategorier "]
      	Wait Until Page Contains Element  xpath://a[@class="menu-link menu-link--main" and text()="${value}"]	
       	Click Link	xpath://a[@class="menu-link menu-link--main" and text()="${value}"]	
       	Click Logo

Return From Mitt Konto
	Click Link 			xpath://a[@href="/user/edit" and text()="Mitt konto"]
	Page Should Contain		Personlig information
       	Click Logo
	
Process Shortcut
	[Arguments]	${value}	${value2}
	[Timeout]	120
	${value3}  Set Variable If  ${value}==4  f%C3%B6rm%C3%A5n  ${value2}
      	Log To Console	Shortcut nr:${value} name:${value2} Char code:${value3} Using:${BROWSER}
       	Wait Until Element Is Visible  xpath://a[contains(@href,"${value3}")]  timeout=60
	Click Element   xpath://div[@class="cell small-4 large-2"][${value}]
      	Wait Until Page Contains Element  xpath://input[@id="edit-search" and contains(@value,"${value2}")]  timeout=60
	Wait Until Element Is Visible	  xpath://input[@id="edit-search" and contains(@value,"${value2}")]  timeout=60
	Wait Until Element Is Visible	  xpath://a[@href="/"]  timeout=60
    	Click Logo
	Wait Until Location Is	${URL}  timeout=60
       	Wait Until Page Contains Element  xpath://a[contains(@href,"${value3}")]  timeout=60
	Wait Until Element Is Visible  xpath://input[@id="edit-search"]  timeout=60
       	Wait Until Element Is Visible  xpath://a[contains(@href,"${value3}")]  timeout=60
	Wait Until Location Is	${URL}  timeout=2m
	Location Should Be	${URL}  timeout=60
	Verify Start Page Loaded
	
Verify Initial Start Page Loaded
	Location Should Be  ${URL}start
	Wait Until Element Is Visible  xpath://input[@id="edit-search"]	
	Page Should Contain  Senaste nytt
	
Verify Start Page Loaded
	Location Should Be  ${URL}
	Wait Until Element Is Visible  xpath://input[@id="edit-search"]	
	Page Should Contain  Senaste nytt

Verify Specific Page Loaded
	[Arguments]  ${string}
	Wait Until Location Is	${string}  timeout=2m
	Location Should Be  ${string}

Browser Watershed
       	[Arguments]	${string}
	Log To Console  ${string} ${URL}
	Run Keyword If	'${BROWSER}'=='firefox'  Confirm Page Loaded2  ${string}/  
	...  ELSE IF	'${BROWSER}'=='headlessfirefox'  Confirm Page Loaded2  ${string}/
	...  ELSE 	Confirm Page Loaded


End Web Test
    Close Browser

