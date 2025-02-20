*** Settings ***
Resource  ../main.robot

*** Keywords ***
#### Ações
Acessar a página home do site
  Go To  ${HOME_URL}
  Wait Until Element Is Visible  ${HOME_TOPMENU}
  Title Should Be  ${HOME_TITLE}

Adicionar o produto "${PRODUTO}" no carrinho
  Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Clicar no botão pesquisar
  Clicar no botão "Add to Cart" do produto
  Clicar no botão "Proceed to checkout"

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
  Input Text  ${HOME_FIELD_PESQUISAR}  ${PRODUTO}

Clicar no botão pesquisar
  Click Element  ${HOME_BTN_PESQUISAR}

Clicar no botão "Add to Cart" do produto
  Wait Until Element Is Visible  ${HOME_PRODUCT}
  Click Element  ${HOME_PRODUCT}
  Wait Until Element Is Visible  ${HOME_BTN_ADDCART}
  Click Button  ${HOME_BTN_ADDCART}

Clicar no botão "Proceed to checkout"
  Wait Until Element Is Visible  ${HOME_BTN_CHECKOUT}
  Click Element  ${HOME_BTN_CHECKOUT}

Verificar se o usuário está logado
  Title Should Be  ${HOME_TITLE}
  Element Should Be Visible  ${HOME_LINK_LOGOUT}
  Capture Page Screenshot

Clicar no campo "${NOME_CAMPO}"
  ${HOME_TOP_MENU_CAMPO_SIGN_UP_LOGIN}  Format String  ${HOME_TOP_MENU_CAMPO_SIGN_UP_LOGIN}  NOME_CAMPO=${NOME_CAMPO}
  Click Element  ${HOME_TOP_MENU_CAMPO_SIGN_UP_LOGIN}