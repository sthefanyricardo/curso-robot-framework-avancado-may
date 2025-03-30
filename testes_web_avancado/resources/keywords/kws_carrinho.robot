*** Settings ***
Resource  ../main.robot

*** Keywords ***
Excluir o produto do carrinho
  Title Should Be  ${CARRINHO_TITLE}
  Wait Until Element Is Visible  ${CARRINHO_DELETAR}
  Click Element  ${CARRINHO_DELETAR}

#### Conferências
Conferir se o carrinho fica vazio
  Wait Until Element Is Visible  ${CARRINHO_MSG}
  Element Text Should Be  ${CARRINHO_MSG}  Cart is empty!