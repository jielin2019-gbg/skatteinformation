*** Keywords ***
# Imports: login_variables, login_keywords
Change Back Password With Same Passwords And Logout
    Input Text    id=edit-current-pass    ${PASSWORD}
    Input Text    id=edit-pass-pass1      ${PASSWORD}
    Input Text    id=edit-pass-pass2      ${PASSWORD}
    Log Out Forced
    Close All Browsers

# Imports: login_variables, login_keywords
Change Back Password Different Passwords And Logout
    Input Text    id=edit-current-pass    ${NEW_RESET_EMAIL_PASSWORD}
    Input Text    id=edit-pass-pass1      ${PASSWORD}
    Input Text    id=edit-pass-pass2      ${PASSWORD}
    Log Out Forced
    Close All Browsers

# Imports: login_keywords
Logout And Close All
    Log Out Forced
    Close All Browsers
