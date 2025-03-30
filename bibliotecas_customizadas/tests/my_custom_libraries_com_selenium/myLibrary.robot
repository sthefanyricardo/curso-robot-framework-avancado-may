*** Settings ***
Library  Libraries.SeleniumLibrary
Test Teardown  Close Browser

*** Test Cases ***
Teste minha SeleniumLibrary
  [Tags]  SeleniumLibraryCustom
  Abrir meu browser

*** Keywords ***
Abrir meu browser
  My Open Browser  http://www.robotframework.org  chrome