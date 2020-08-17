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
	# This keyword only works while window is maximized
	Click Link  xpath=//a[@href="/user/logout"]

Log Out Forced
	Go To  https://test.skatteinformation.se/user/logout

