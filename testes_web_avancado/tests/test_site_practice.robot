*** Settings ***
Documentation  Suíte de testes para o site http://automationpractice.com, utilizando o padrão Page Objects
Resource  ../resources/main.robot
Test Setup  Abrir navegador
Test Teardown  Fechar navegador

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
  [Documentation]  Teste para adicionar e remover um produto do carrinho
  kws_home.Acessar a página home do site
  kws_home.Adicionar o produto "t-shirt" no carrinho
  kws_carrinho.Excluir o produto do carrinho
  kws_carrinho.Conferir se o carrinho fica vazio

## EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
  [Documentation]  Teste para cadastrar e validar o registro do novo cliente
  kws_home.Acessar a página home do site
  kws_home.Clicar no campo "Signup / Login"
  kws_login.Preencher campo "name" com um "nome válido"
  kws_login.Preencher campo "email" com um "e-mail válido"
  kws_login.Clicar no botão "Signup"
  kws_sign_up.Preencher os dados obrigatórios no formulário de cadastro
  kws_sign_up.Enviar o formulário de cadastro
  kws_account_created.Conferir se o cadastro foi efetuado com sucesso
  kws_home.Verificar se o usuário está logado