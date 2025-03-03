*** Settings ***
Resource  ../main.robot

*** Keywords ***
### Conferências
Conferir se o cadastro foi efetuado com sucesso
  Title Should Be  ${ACCOUNT_CREATED_TITLE_HEAD} 
  Wait Until Element Is Visible  ${ACCOUNT_CREATED_TITLE_PAGE}
  Element Text Should Be  ${ACCOUNT_CREATED_DIV_TEXT}  Congratulations! Your new account has been successfully created!
  Element Should Be Visible  ${ACCOUNT_CREATED_LINK}
  Click Link  ${ACCOUNT_CREATED_LINK}