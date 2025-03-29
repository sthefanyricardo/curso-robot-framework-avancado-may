*** Settings ***
Library  ./Libraries/ExcelLibrary/excel_library.py

*** Variables ***
${PLANILHA_DADOS}  ${CURDIR}/exem_planilha_testes_automatizados_2.xlsx

*** Test Cases ***
Teste Buscar Animais Por Tamanho
  ${arquivo_excel}  Carregar Planilha  ${PLANILHA_DADOS} 
  ${resultado}  Buscar Animais Por Tamanho  ${arquivo_excel}  Médio
  Log  ${resultado}
  Set Global Variable  ${arquivo_excel}

Teste Contar Animais Por Temperamento
  ${quantidade}  Contar Animais Por Temperamento  ${arquivo_excel}  Calmo
  Log  ${quantidade}

Buscar Animal Por Raça
  ${resultado}  Buscar Animal Por Raça  ${arquivo_excel}  Pinscher
  Log  ${resultado}