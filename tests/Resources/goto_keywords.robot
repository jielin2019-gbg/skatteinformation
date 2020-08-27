*** Keywords ***
Goto Start Page
    Go To                                       https://test.skatteinformation.se/user/login?destination=/start
    ${url}=                                     Get Location
    Should Match                                ${url}      https://test.skatteinformation.se/user/login?destination=/start

Goto Mitt Konto
    Go To                                       https://test.skatteinformation.se/user/8629/edit
    ${url}=                                     Get Location
    Should Match                                ${url}      https://test.skatteinformation.se/user/8629/edit
