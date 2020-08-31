*** Keywords ***
Skatteinformation Website Is Open
    Open Browser                        ${URL}     ${BROWSER}
    Set Window Size                     1920    1080

Delete All Old Emails
    Skatteinformation Website Is Open
    Open Mailbox                                        host=imap.gmail.com     user=${RESET_EMAIL}           password=${RESET_EMAIL_PASSWORD}
    Delete All Emails
    Open Mailbox                                        host=imap.outlook.com   user=${RESET_EMAIL_OUTLOOK}   password=${RESET_EMAIL_PASSWORD}
    Delete All Emails
