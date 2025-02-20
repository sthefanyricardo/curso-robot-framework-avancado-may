*** Settings ***
Resource  ../main.robot

*** Keywords ***
### Ações
Clicar no campo "${NOME_CAMPO}"
  Title Should Be  title=${LOGIN_TITLE_HEAD}
  ${LOGIN_SIGN_UP_CAMPO}  Format String  ${LOGIN_SIGN_UP_CAMPO}  NOME_CAMPO=${NOME_CAMPO}
  Click Element  ${LOGIN_SIGN_UP_CAMPO}
  Wait Until Element Is Visible  ${LOGIN_TITLE_PAGE}
  
Preencher campo "${NOME_CAMPO}" com um "${VALOR_CAMPO}"
  IF  "${NOME_CAMPO}" in [name, NAME]
  ${VALOR_CAMPO}  FakerLibrary.Name
  ELSE IF  "${NOME_CAMPO}" in [email, EMAIL]
  ${VALOR_CAMPO}  FakerLibrary.Email
  END
  Input Text  name=${NOME_CAMPO}  ${VALOR_CAMPO}

Clicar no botão "${NOME_BOTAO}"
  ${SIGN_UP_BUTTON}  Format String  ${SIGN_UP_BUTTON}  NOME_BOTAO=${NOME_BOTAO}
  Click Button  ${SIGN_UP_BUTTON}