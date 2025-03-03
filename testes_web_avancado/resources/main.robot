*** Settings ***
Documentation  Arquivo principal de importação de todos os arquivos de recursos/resources (bibliotecas, keywords, pages objects e variáveis)

# Importando as bibliotecas de keywords
Library  SeleniumLibrary
Library  String
Library  FakerLibrary  locale=pt_BR

# Importando os arquivos de keywords comuns
Resource  ./keywords_common/setup.robot
Resource  ./keywords_common/teardown.robot

# Importando os arquivos de variáveis de URL
Resource  ./url_variables/path_url.resource

# Importando os arquivos de pages objects
Resource  ./page_objects/PO_home.robot
Resource  ./page_objects/PO_carrinho.robot
Resource  ./page_objects/PO_login.robot
Resource  ./page_objects/PO_sign_up.robot
Resource  ./page_objects/PO_account_created.robot

# Importando os arquivos de keywords
Resource  ./keywords/kws_home.robot
Resource  ./keywords/kws_carrinho.robot
Resource  ./keywords/kws_login.robot
Resource  ./keywords/kws_sign_up.robot
Resource  ./keywords/kws_account_created.robot