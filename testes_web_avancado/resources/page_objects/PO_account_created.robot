*** Variables ***
${ACCOUNT_CREATED_TITLE_HEAD}  Automation Exercise - Account Created
${ACCOUNT_CREATED_TITLE_PAGE}  xpath=//b[normalize-space()='Account Created!']
${ACCOUNT_CREATED_DIV_TEXT}  //div[@class='col-sm-9 col-sm-offset-1']//p
${ACCOUNT_CREATED_MESSAGE}  xpath=//p[contains(text(),'Congratulations! Your new account has been successfully created!')]
${ACCOUNT_CREATED_LINK}  //a[normalize-space()='Continue']