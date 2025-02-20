*** Settings ***
Documentation  Arquivo principal de inicialização dos testes (aqui estarão todas as keywords de inicialização)
Resource  ../main.robot

*** Variables ***
${BROWSER}  chrome

*** Keywords ***
#### Setup e Teardown
Abrir navegador
  [Documentation]  Abre o navegador
  Open Browser  about:blank  ${BROWSER}
  Maximize Browser Window