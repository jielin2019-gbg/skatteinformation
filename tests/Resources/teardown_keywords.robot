*** Keywords ***
Logout And Close All
    # This keyword only works while window is maximized
    Click Link  xpath=//a[@href="/user/logout"]
    Close All Browsers
