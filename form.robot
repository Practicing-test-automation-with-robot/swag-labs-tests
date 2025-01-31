*** Settings ***
Library    SeleniumLibrary

*** Variables ***



*** Keywords ***
Abrir navegador
    Open Browser    https://demoqa.com/automation-practice-form    chrome
    
Preencher campos
# Mapear os elementos para conseguir preencher os campos
# Para isso é necessário que o elemento tenha um identificador unico  -> procurar no html do elemento o name ou o id
# Copiar somente o identificador único

    Input Text    locator    text


Clicar em 'Submit'
    Click Element    locator
    
Fechar navegador
    Close Browser


*** Test Cases ***

Cenário 1: Preencher formulário
    Abrir navegador
    Preencher campos
    Clicar em 'Submit'
    Fechar navegador