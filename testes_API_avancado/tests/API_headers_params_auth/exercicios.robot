*** Settings ***
Documentation  Exercícios de API com Robot Framework, utilizando a API do GitHub - Objetivo: Praticar a utilização de headers, parâmetros e autenticação em requisições de API
...  Author: Sthefany Albuquerque Ricardo
...  Data: 13/03/2025
...  Doc da API do GitHub: https://developer.github.com/v3/
...  Doc endpoint de issues: https://docs.github.com/pt/rest/issues/comments?apiVersion=2022-11-28#create-a-comment
...  e https://developer.github.com/v3/issues/comments/#list-comments-in-a-repository
Library  RequestsLibrary
Library  Collections
Resource  ${EXECDIR}/resources/variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}  https://api.github.com
${ISSUES_URI}  /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues

*** Test Cases ***
CT01: Criar comentário em uma issue no GitHub
  [Documentation]  Teste que cria um comentário em uma issue de um repositório no GitHub
  [Tags]  CT01  ExerciciosAPI
  Conectar com autenticação por token na API do GitHub
  Enviar o comentário "Comentário cadastrado via Robot Framework!" para a issue "12"
  Enviar o comentário "Teste Sthefany A. R." para a issue "12"

CT02: Consulta os comentários de uma issue no GitHub
  [Documentation]  Teste que consulta os comentários de uma issue em um repositório no GitHub
  [Tags]  CT02  ExerciciosAPI
  Conectar com autenticação por token na API do GitHub
  Pesquisar os comentários das issues existentes pela classificação "created" e ordenação "desc"
  Pesquisar os comentários da issue "12" a partir da data "2025-01-01T00:00:00Z"

*** Keywords ***
Conectar com autenticação por token na API do GitHub
  [Documentation]  Keyword responsavél por conectar na API do GitHub com autenticação por token
  ${HEADERS}  Create Dictionary  
  ...  Authorization=Bearer ${MY_GITHUB_TOKEN}
  Create Session  alias=myGithubAuth  url=${GITHUB_HOST}  headers=${HEADERS}  disable_warnings=True
  Set Test Variable  ${HEADERS}

Enviar o comentário "${COMMENT}" para a issue "${ISSUE_NUMBER}"
  [Documentation]  KeyWord responsavél por enviar uma requisição post para a API do GitHub
  Set To Dictionary  ${HEADERS}
  ...  Accept=application/vnd.github.squirrel-girl-preview
  ...  Content-Type=application/json
  ${DATA}  Create Dictionary  body=${COMMENT}
  ${RESPONSE_REQUEST}  POST On Session  
  ...  myGithubAuth  
  ...  ${ISSUES_URI}/${ISSUE_NUMBER}/comments
  ...  json=${DATA}
  ...  headers=${HEADERS}
  Log  Dados da requisição: ${RESPONSE_REQUEST.json()}
  Confere sucesso na requisição  ${RESPONSE_REQUEST}  200

Confere sucesso na requisição
  [Documentation]  Keyword responsavél por verificar se a requisição foi bem sucedida por meio do status code da resposta
  [Arguments]  ${RESPONSE}  ${EXPECTED_STATUS_CODE}
  Should Be True  '${RESPONSE.status_code}'=='${EXPECTED_STATUS_CODE}' or '${RESPONSE.status_code}'=='201'
  ...  msg=Erro na requisição! Verifique: ${RESPONSE}

Pesquisar os comentários das issues existentes pela classificação "${sort}" e ordenação "${direction}"
  [Documentation]  Keyword responsavél por pesquisar os comentários das issues em um repositório no GitHub
  &{PARAMS}  Create Dictionary  sort=created  direction=desc
  ${RESPONSE_REQUEST}  GET On Session  
  ...  myGithubAuth  
  ...  ${ISSUES_URI}/comments
  ...  ${PARAMS}
  Log  Lista de Issues: ${RESPONSE_REQUEST.json()}
  Confere sucesso na requisição  ${RESPONSE_REQUEST}  200

Pesquisar os comentários da issue "${ISSUE_NUMBER}" a partir da data "${data_especificada}"
  [Documentation]  Keyword responsavél por pesquisar os comentários das issues em um repositório no GitHub
  &{PARAMS}  Create Dictionary  since=${data_especificada}
  ${RESPONSE_REQUEST}  GET On Session  
  ...  myGithubAuth  
  ...  ${ISSUES_URI}/${ISSUE_NUMBER}/comments
  ...  ${PARAMS}
  Log  Lista de Issues: ${RESPONSE_REQUEST.json()}
  Confere sucesso na requisição  ${RESPONSE_REQUEST}  200