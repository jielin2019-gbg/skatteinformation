*** Keywords ***
# Imports: login_variables, login_keywords
Change Back Password And Logout
    [Arguments]   ${CURRENT_PASSWORD}
    Input Text    id=edit-current-pass    ${CURRENT_PASSWORD}
    Input Text    id=edit-pass-pass1      ${PASSWORD}
    Input Text    id=edit-pass-pass2      ${PASSWORD}
    Log Out Forced
    Close All Browsers

# Imports: login_keywords
Logout And Close All
    Log Out Forced
    Close All Browsers
