*** Settings ***
Documentation  Teste de diferença entre arquivos com a biblioteca DiffLibrary
...  Documentação da biblioteca: https://github.com/MarketSquare/robotframework-difflibrary e https://marketsquare.github.io/robotframework-difflibrary/
Library  DiffLibrary

*** Variables ***
${ARQ_TEXTO_1}  ${CURDIR}/my_files/arquivo_texto_exem_1.txt
${ARQ_TEXTO_2}  ${CURDIR}/my_files/arquivo_texto_exem_2.txt
${ARQ_JSON_1}  ${CURDIR}/my_files/arquivo_json_exem_1.json
${ARQ_JSON_2}  ${CURDIR}/my_files/arquivo_json_exem_2.json

*** Test Cases ***
Exemplo 01: Diferença entre arquivos
  [Documentation]  Teste que verifica a diferença entre dois arquivos
  Teste de diferença entre arquivos  ${ARQ_TEXTO_1}  ${ARQ_TEXTO_2}
  Teste de diferença entre arquivos  ${ARQ_JSON_1}  ${ARQ_JSON_2}
  
*** Keywords ***
Teste de diferença entre arquivos
  [Documentation]  Keyword responsável por comparar dois arquivos
  [Arguments]  ${arquivo_1}  ${arquivo_2}
  ${DIFF}  Diff Files  ${arquivo_1}  ${arquivo_2}
  Log  ${DIFF}