*** Keywords ***
# Imports: None
Click Submit Button
    ${ele}      Get WebElement                  id=edit-submit
    Execute Javascript                          arguments[0].click();       ARGUMENTS    ${ele}
