*** Settings ***
Resource  ../main.robot

*** Keywords ***
Preencher os dados obrigatórios no formulário de cadastro
  Title Should Be  ${SIGN_UP_TITLE_HEAD}
  Wait Until Element Is Visible  ${SIGN_UP_TITLE_PAGE}
  ${password}  ${data_aniversario}  ${dia}  ${mes}  ${ano}  ${first_name}  ${last_name}  ${company}  ${address}  ${address_2}  ${country}  ${state}  ${city}  ${postal_code}  ${mobile_number}  Gerar os dados do formulário de cadastro
  ${genero}  Gerar gênero aleatório
  Clicar no radio button "${genero}"
  Preencher campo com valor  ${INPUT_PASSWORD}  ${password}
  Selecionar data de nascimento  ${dia}  ${mes}  ${ano}
  Marcar os checkboxes
  Preencher campo com valor  ${INPUT_FIRST_NAME}  ${first_name}
  Preencher campo com valor  ${INPUT_LAST_NAME}  ${last_name}
  Preencher campo com valor  ${INPUT_COMPANY}  ${company}
  Preencher campo com valor  ${INPUT_ADDRESS}  ${address}
  Preencher campo com valor  ${INPUT_ADDRESS_2}  ${address_2}
  Preencher campo com valor  ${DROPDOWN_COUNTRY}  ${country}
  Preencher campo com valor  ${DROPDOWN_STATE}  ${state}
  Preencher campo com valor  ${INPUT_CITY}  ${city}
  Preencher campo com valor  ${INPUT_POSTAL_CODE}  ${postal_code}
  Preencher campo com valor  ${INPUT_MOBILE_NUMBER}  ${mobile_number}

Gerar os dados do formulário de cadastro
  ${password}  FakerLibrary.Password
  ${data_aniversario}  FakerLibrary.Date  pattern=%d-%m-%Y
  ${dia}  FakerLibrary.Day Of Month
  ${mes}  FakerLibrary.Month
  ${ano}  FakerLibrary.Year
  ${first_name}  FakerLibrary.First_Name
  ${last_name}  FakerLibrary.Last_Name
  ${company}  FakerLibrary.Company
  ${address}  FakerLibrary.Street_Address
  ${address_2}  FakerLibrary.Secondary_Address
  ${country}  FakerLibrary.Country
  ${state}  FakerLibrary.State
  ${city}  FakerLibrary.City
  ${postal_code}  FakerLibrary.Zip_Code
  ${mobile_number}  FakerLibrary.Phone_Number
  RETURN  ${password}  ${dia}  ${mes}  ${ano}  ${first_name}  ${last_name}  ${company}  ${address}  ${address_2}  ${country}  ${state}  ${city}  ${postal_code}  ${mobile_number} 

Gerar gênero aleatório
    ${gender_list}  Create List  Mrs.  Ms.  Miss  Mr.  Master
    ${random_gender}  Evaluate  random.choice(${gender_list})
    RETURN  ${random_gender}

Clicar no radio button "${VALOR_GENERO}"
  IF  "${VALOR_GENERO}" in ["Mrs.", "Ms.", "Miss"]
    ${CHECK_BTN_RADIO_TITLE}  Format String  ${CHECK_BTN_RADIO_TITLE}  NUMBER=2
  ELSE IF  "${VALOR_GENERO}" in ["Mr.", "Master"]
    ${CHECK_BTN_RADIO_TITLE}  Format String  ${CHECK_BTN_RADIO_TITLE}  NUMBER=1
  END
  Click Element  ${CHECK_BTN_RADIO_TITLE}

Preencher campo com valor  
  [Arguments]  ${CAMPO}  ${VALOR}
  Input Text  name=${CAMPO}  ${VALOR}

Selecionar data de nascimento
  [Arguments]  ${dia}  ${mes}  ${ano}
  Selecionar no dropdown  ${DROPDOWN_DAYS}  ${dia}
  Selecionar no dropdown  ${DROPDOWN_MONTHS}  ${mes}
  Selecionar no dropdown  ${DROPDOWN_YEARS}  ${ano}

Marcar os checkboxes
  Click Element  ${CHECKBOX_NEWSLETTER}
  Click Element  ${CHECKBOX_OPTIN}

Selecionar no dropdown
  [Arguments]  ${DROPDOWN}  ${VALOR}
  Select From List By Value  name=${DROPDOWN}  ${VALOR}

Enviar o formulário de cadastro
  Click Button  ${BUTTON_SUBMIT}