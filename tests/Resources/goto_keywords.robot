*** Keywords ***
Goto Start Page
    Go To                                       https://test.skatteinformation.se/start
    ${url}=                                     Get Location
    Should Match                                ${url}      https://test.skatteinformation.se/start

Goto Mitt Konto
    Go To                                       https://test.skatteinformation.se/user/8629/edit
    Page Should Contain Element                 id=edit-field-mail-daily-digest-value
