*** Settings ***
Documentation  Esta suíte de testes foi desenvolvida para utilizar a biblioteca personalizada "excel_library.py", que estende a biblioteca Python openpyxl. Essa biblioteca permite a manipulação de planilhas Excel no formato .xlsx e foi criada como parte da Tarefa 2 do curso avançado de Automação de Testes com Robot Framework.
Library  ../../Libraries/ExcelLibrary/excel_library.py
*** Variables ***
${PLANILHA_DADOS}  ${CURDIR}/exem_planilha_testes_automatizados_2.xlsx

*** Test Cases ***
CT01: Teste Buscar Animais Por Tamanho
  [Documentation]  Teste para buscar animais por tamanho na planilha do excel
  [Tags]  PlanilhaDadosAnimais CT01
  ${arquivo_excel}  Carregar Planilha  ${PLANILHA_DADOS}
  Set Global Variable  ${arquivo_excel}
  ${resultado}  Buscar Animais Por Tamanho  ${arquivo_excel}  Médio
  Log  ${resultado}

CT02: Teste Contar Animais Por Temperamento
  [Documentation]  Teste para contar animais por temperamento na planilha do excel
  [Tags]  PlanilhaDadosAnimais CT02
  ${quantidade}  Contar Animais Por Temperamento  ${arquivo_excel}  Calmo
  Log  ${quantidade}

CT03: Buscar Animal Por Raça
  [Documentation]  Teste para buscar um animal por raça na planilha do excel
  [Tags]  PlanilhaDadosAnimais CT03
  ${resultado}  Buscar Animal Por Raça  ${arquivo_excel}  Pinscher
  Log  ${resultado}