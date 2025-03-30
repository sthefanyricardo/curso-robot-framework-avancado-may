*** Settings ***
Resource  ../main.robot

*** Keywords ***
### Ações
Preencher campo "${NOME_CAMPO}" com um "${VALOR_CAMPO}"
  Title Should Be  title=${LOGIN_TITLE_HEAD}
  Wait Until Element Is Visible  ${LOGIN_TITLE_PAGE}
  IF  "${NOME_CAMPO}" in ["name", "NAME"]
    ${NOME}  FakerLibrary.First Name Female
    ${NOME}  Replace String  ${NOME}  ' '  _
    ${VALOR_CAMPO}  Set Variable  ${NOME}
    Set Test Variable  ${first_name}  ${NOME}
  ELSE IF  "${NOME_CAMPO}" in ["email", "EMAIL"]
    ${EMAIL}  Catenate  ${first_name}Teste@robotautomacao.com
    ${VALOR_CAMPO}  Set Variable  ${EMAIL}
    Set Test Variable  ${email}  ${EMAIL}
  END
  ${SIGN_UP_FORM}  Format String  ${SIGN_UP_FORM}  NOME_CAMPO=${NOME_CAMPO}
  Input Text  ${SIGN_UP_FORM}  ${VALOR_CAMPO}

Clicar no botão "${NOME_BOTAO}"
  ${SIGN_UP_BUTTON}  Format String  ${SIGN_UP_BUTTON}  NOME_BOTAO=${NOME_BOTAO}
  Click Button  ${SIGN_UP_BUTTON}