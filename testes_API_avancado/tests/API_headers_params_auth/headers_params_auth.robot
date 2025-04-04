*** Settings ***
Documentation  Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...  Doc da API do GitHub: https://developer.github.com/v3/
...  Doc endpoint de users: https://docs.github.com/pt/rest/users/users?apiVersion=2022-11-28#get-a-user
...  Doc endpoint de issues: https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues
...  Doc endpoint de reactions: https://docs.github.com/pt/rest/reactions/reactions?apiVersion=2022-11-28#create-reaction-for-an-issue
Library  RequestsLibrary
Library  Collections
Resource  ${EXECDIR}/resources/variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}  https://api.github.com
${ISSUES_URI}  /repos/mayribeirofernandes/myudemyrobotframeworkcourse/issues

*** Test Cases ***
Exemplo: Fazendo autenticação básica (Basic Authentication)
  [Documentation]  Teste que conecta na API do GitHub com autenticação básica (Basic Authentication)
  [Tags]  CT01  AutenticaçãoGitHub  HeadersParamsAuth
  # Conectar com autenticação básica na API do GitHub
  Conectar com autenticação por token na API do GitHub
  Solicitar os dados do meu usuário

Exemplo: Usando parâmetros
  [Documentation]  Teste que conecta na API do GitHub com parâmetros
  [Tags]  CT02  UtilizandoParâmetros  HeadersParamsAuth
  Conectar na API do GitHub sem autenticação
  Pesquisar issues com o state "open" e com o label "bug"

Exemplo: Usando headers
  [Documentation]  Teste que conecta na API do GitHub com headers
  [Tags]  CT03  UtilizandoHeaders  HeadersParamsAuth
  # Conectar com autenticação básica na API do GitHub
  Conectar com autenticação por token na API do GitHub
  Enviar a reação "eyes" para a issue "8"

*** Keywords ***
# Conectar com autenticação básica na API do GitHub
#  ${AUTH}  Create List  ${MY_GITHUB_USER}  ${MY_GITHUB_PASS}
#  Create Session  alias=mygithubAuth  url=${GITHUB_HOST}  auth=${AUTH}  disable_warnings=True

#### ----- Recentemente a API do GitHub mudou a forma de autenticação, crie o seu TOKEN e use no teste
#### ----- conforme nova keyword abaixo:
Conectar com autenticação por token na API do GitHub
  ${HEADERS}  Create Dictionary  Authorization=Bearer ${MY_GITHUB_TOKEN}
  Create Session  alias=mygithubAuth  url=${GITHUB_HOST}  headers=${HEADERS}  disable_warnings=True

Solicitar os dados do meu usuário
  ${MY_USER_DATA}  GET On Session  mygithubAuth  /user
  Log  Meus dados: ${MY_USER_DATA.json()}
  Confere sucesso na requisição  ${MY_USER_DATA}

Conectar na API do GitHub sem autenticação
  Create Session  alias=mygithub  url=${GITHUB_HOST}  disable_warnings=True

Pesquisar issues com o state "${STATE}" e com o label "${LABEL}"
  &{PARAMS}  Create Dictionary  state=${STATE}  labels=${LABEL}
  ${MY_ISSUES}  GET On Session  mygithub  ${ISSUES_URI}  ${PARAMS}
  Log  Lista de Issues: ${MY_ISSUES.json()}
  Confere sucesso na requisição  ${MY_ISSUES}

Enviar a reação "${REACTION}" para a issue "${ISSUE_NUMBER}"
  ${HEADERS}  Create Dictionary  Accept=application/vnd.github.squirrel-girl-preview+json
  ${MY_REACTION}  POST On Session  
  ...  mygithubAuth  
  ...  ${ISSUES_URI}/${ISSUE_NUMBER}/reactions
  ...  {"content": "${REACTION}"}
  ...  ${HEADERS}
  Log  Meus dados: ${MY_REACTION.json()}
  Confere sucesso na requisição  ${MY_REACTION}

Confere sucesso na requisição
  [Arguments]  ${RESPONSE}
  Should Be True  '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
  ...  msg=Erro na requisição! Verifique: ${RESPONSE}