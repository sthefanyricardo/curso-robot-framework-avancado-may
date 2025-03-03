*** Settings ***
Resource  ../main.robot

*** Keywords ***
Preencher os dados obrigatórios no formulário de cadastro
  Title Should Be  ${SIGN_UP_TITLE_HEAD}
  Wait Until Element Is Visible  ${SIGN_UP_TITLE_PAGE}
  ${password}  ${ano}  ${last_name}  ${company}  ${address}  ${address_2}  ${state}  ${city}  ${postal_code}  ${mobile_number}  ${genero}  ${dia}  ${mes}  ${country}  Gerar os dados do formulário de cadastro
  Clicar no radio button "${genero}"
  Preencher campo com valor  ${INPUT_PASSWORD}  ${password}
  Selecionar data de nascimento  ${dia}  ${mes}  ${ano}
  Marcar os checkboxes
  Preencher campo com valor  ${INPUT_FIRST_NAME}  ${first_name}
  Preencher campo com valor  ${INPUT_LAST_NAME}  ${last_name}
  Preencher campo com valor  ${INPUT_COMPANY}  ${company}
  Preencher campo com valor  ${INPUT_ADDRESS}  ${address}
  Preencher campo com valor  ${INPUT_ADDRESS_2}  ${address_2}
  Selecionar no dropdown  ${DROPDOWN_COUNTRY}  ${country}
  Preencher campo com valor  ${DROPDOWN_STATE}  ${state}
  Preencher campo com valor  ${INPUT_CITY}  ${city}
  Preencher campo com valor  ${INPUT_POSTAL_CODE}  ${postal_code}
  Preencher campo com valor  ${INPUT_MOBILE_NUMBER}  ${mobile_number}

Gerar os dados do formulário de cadastro
  ${password}  FakerLibrary.Password
  ${ano}  FakerLibrary.Year
  ${last_name}  FakerLibrary.Last Name Female
  ${company}  FakerLibrary.Company
  ${address}  FakerLibrary.Address
  ${address_2}  FakerLibrary.Street Address
  ${state}  FakerLibrary.State
  ${city}  FakerLibrary.City
  ${postal_code}  FakerLibrary.Postcode
  ${mobile_number}  FakerLibrary.Phone Number
  ${genero}  Gerar gênero aleatório
  ${dia}  Selecionar dia aleatório
  ${mes}  Selecionar mês aleatório
  ${country}  Selecionar país aleatório
  RETURN  ${password}  ${ano}  ${last_name}  ${company}  ${address}  ${address_2}  ${state}  ${city}  ${postal_code}  ${mobile_number}  ${genero}  ${dia}  ${mes}  ${country}

Gerar gênero aleatório
    ${gender_list}  Create List  Mrs.  Ms.  Miss
    ${random_gender}  Evaluate  random.choice(${gender_list})
    RETURN  ${random_gender}

Selecionar país aleatório
  ${country_list}  Create List  India  United States  Canada  Australia  Israel  New Zealand  Singapore
  ${random_country}  Evaluate  random.choice(${country_list})
  RETURN  ${random_country}

Selecionar dia aleatório
  ${days_list}  Create List  1  2  3  4  5  6  7  8  9  10  11  12  13  14  15  16  17  18  19  20  21  22  23  24  25  26  27  28  29  30  31
  ${random_day}  Evaluate  random.choice(${days_list})  modules=random
  RETURN  ${random_day}

Selecionar mês aleatório
  ${months_list}  Create List  1  2  3  4  5  6  7  8  9  10  11  12
  ${random_month}  Evaluate  random.choice(${months_list})  modules=random
  RETURN  ${random_month}

Clicar no radio button "${VALOR_GENERO}"
  IF  "${VALOR_GENERO}" in ["Mrs.", "Ms.", "Miss"]
    ${CHECK_BTN_RADIO_TITLE}  Format String  ${CHECK_BTN_RADIO_TITLE}  NUMBER=2
  ELSE IF  "${VALOR_GENERO}" in ["Mr.", "Master"]
    ${CHECK_BTN_RADIO_TITLE}  Format String  ${CHECK_BTN_RADIO_TITLE}  NUMBER=1
  END
  Click Element  ${CHECK_BTN_RADIO_TITLE}

Preencher campo com valor  
  [Arguments]  ${CAMPO}  ${VALOR}
  Input Text  ${CAMPO}  ${VALOR}

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
  Select From List By Value  ${DROPDOWN}  ${VALOR}

Enviar o formulário de cadastro
  Click Button  ${BUTTON_SUBMIT}