*** Settings ***
Documentation  Exemplos da própria Library: https://github.com/bulkan/robotframework-requests/blob/master/tests/testcase.robot
...  Doc da API do GitHub: https://developer.github.com/v3/
...  Doc endpoint de issues: https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#create-an-issue
Library  RequestsLibrary
Library  Collections
Library  String
Resource  ${EXECDIR}/resources/variables/my_user_and_passwords.robot

*** Variables ***
${GITHUB_HOST}  https://api.github.com
${ISSUES_URI}  /repos/sthefanyricardo/curso-robot-framework-avancado-may/issues
${ARQ_BODY_JSON}  ${EXECDIR}/resources/data/input/post_issue.json

*** Test Cases ***
Exemplo: Postando com body template
  # Conectar com autenticação básica na API do GitHub
  Conectar com autenticação por token na API do GitHub
  Postar uma nova issue com label "robot framework"

*** Keywords ***
# Conectar com autenticação básica na API do GitHub
#  ${AUTH}  Create List  ${MY_GITHUB_USER}  ${MY_GITHUB_PASS}
#  Create Session  alias=mygithubAuth  url=${GITHUB_HOST}  auth=${AUTH}  disable_warnings=True

#### ----- Recentemente a API do GitHub mudou a forma de autenticação, crie o seu TOKEN e use no teste
#### ----- conforme nova keyword abaixo:
Conectar com autenticação por token na API do GitHub
  ${HEADERS}  Create Dictionary  Authorization=Bearer ${MY_GITHUB_TOKEN}
  Create Session  alias=mygithubAuth  url=${GITHUB_HOST}  headers=${HEADERS}  disable_warnings=True

Postar uma nova issue com label "${LABEL}"
  ${BODY}  Format String  ${ARQ_BODY_JSON}
  ...  user_git=${MY_GITHUB_USER}
  ...  label=${LABEL}
  Log  Meu Body ficou:\n${BODY}
  ${RESPONSE}  POST On Session  mygithubAuth  ${ISSUES_URI}  ${BODY}
  Confere sucesso na requisição  ${RESPONSE}

Confere sucesso na requisição
  [Arguments]  ${RESPONSE}
  Should Be True  '${RESPONSE.status_code}'=='200' or '${RESPONSE.status_code}'=='201'
  ...  msg=Erro na requisição! Verifique: ${RESPONSE}