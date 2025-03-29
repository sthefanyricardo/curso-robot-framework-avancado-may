*** Settings ***
Documentation  Arquivo principal de inicialização dos testes (aqui estarão todas as keywords de inicialização)
Resource  ../main.robot

*** Variables ***
${BROWSER}  chrome
${HEADLESS}  ${False}

*** Keywords ***
#### Setup e Teardown
Abrir navegador
  [Documentation]  Abre o navegador
  IF  '${HEADLESS}' == 'True'
      Open Browser  about:blank  ${BROWSER}  options=add_argument("--headless")
  ELSE
      Open Browser  about:blank  ${BROWSER}
  END
  Maximize Browser Window