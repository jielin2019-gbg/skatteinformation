*** Keywords ***
# Imports: login_variables, login_keywords
Change Back Password And Logout
    [Arguments]   ${CURRENT_PASSWORD}
    Input Text    id=edit-current-pass    ${CURRENT_PASSWORD}
    Input Text    id=edit-pass-pass1      ${PASSWORD}
    Input Text    id=edit-pass-pass2      ${PASSWORD}
    Click Submit Button
    Log Out Forced
    Close All Browsers

# Imports: login_keywords
Logout And Close All
    Log Out Forced
    Close All Browsers

# Imports: login_keywords
Change Back Name With Same Name And Logout
    Input Text     xpath://input[contains(@class,'js-text-full')]       timeout= 3 min
    #Input Text    id=edit-field-name-0-value    ${USERNAME}
    ${ele}      Get WebElement                  id=edit-submit
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}
    Log Out Forced
    Close All Browsers
