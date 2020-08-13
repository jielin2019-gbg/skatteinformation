*** keywords ***
Login User
	Input Text  //*[@id="edit-name"]  ${USERNAME_USER}
	Input Text  //*[@id="edit-pass"]  ${PASSWORD}
	Click Button  //*[@id="edit-submit"]
Login Editor
	Input Text  //*[@id="edit-name"]  ${USERNAME_EDITOR}
	Input Text  //*[@id="edit-pass"]  ${PASSWORD}
	Click Button  //*[@id="edit-submit"]
Log Out
	Click Link  xpath=//a[@href="/user/logout"]
Log Out Menu
    	Click Button  xpath=//*[@class="navigation__toggle navigation__toggle--open js-navigation__toggle--open"]
	Wait Until Page Contains Element  xpath=//a[@href="/user/logout" and @class="menu-link menu-link--utility"]
	Click Link  xpath=//a[contains(., 'Logga ut') and @class="menu-link menu-link--utility"]
	
	
	
	
#	Mouse Over  //nav[@id="block-utility-menu"]/h2[@id="block-utility-menu-menu"]
#	Mouse Over  //nav[@id="block-utility-menu"]/ul[@class="menu menu--utility"]
#	Mouse Over  xpath=//h2[@id="block-utility-menu-menu"]
#	Mouse Over  xpath=//div[@class="region region-utility-navigation"]/ul/li[3]
#	Mouse Over  xpath=//a[@href="/tabeller"]
#	Mouse Over  xpath=//form[@id='myform']/*/input[@type='submit']	
#	Mouse Over  xpath=//nav[@id="block-utility-menu"]//a[@href="/user/logout"]
#	Mouse Over  xpath=//ul[class="menu menu--utility"]
#	Mouse Over  xpath=//a[@href="/user/logout"]

