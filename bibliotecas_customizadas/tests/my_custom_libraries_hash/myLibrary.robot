*** Settings ***
Library  ${EXECDIR}/Libraries/HashLibrary/geradorHash.py

*** Variables ***
${ARQUIVO}  ${CURDIR}/arquivo_PDF.pdf

*** Test Cases ***
Teste de conversão de string para HASH sha256
  Converter "Estou ficando ninja em Robot Framework!!" para sha256

Teste de conversão de arquivo para HASH sha256
  Converter o arquivo "${ARQUIVO}" para sha256

*** Keywords ***
Converter "${CONTEUDO}" para sha256
  ${CONTEUDO_HASH}  Gerar Hash  ${CONTEUDO}
  Log  ${CONTEUDO_HASH}

Converter o arquivo "${FILE}" para sha256
  ${CONTEUDO_HASH}  Gerar Hash Arquivo  ${FILE}
  Log  ${CONTEUDO_HASH}