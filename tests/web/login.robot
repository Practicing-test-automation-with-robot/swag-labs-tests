# small-daily-challenges-2

*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# colocar o identificador do elemento, nome, id...
# colocar o tipo do elemento ex: input
# Quando os elementos possuem o id ou o name:
${input_email}        name:user-name 
${input_password}     name:password 
${user-name}    standard_user
${password}    secret_sauce

# utilizando o XPath:
&{login}
...    button_submit_login=//*[@id="login-button"]

*** Keywords ***
Abrir o site na tela de login
    Open Browser	https://www.saucedemo.com/v1/	chrome
    Capture Page Screenshot

Inserir as credenciais básicas de login (email e senha)
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user-name}
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password}

Clicar no botão "Entrar"
    Click Element    ${login.button_submit_login}
    Sleep	2
    Capture Page Screenshot

Fechar navegador
    Close Browser


*** Test Cases ***

Cenário 1: Login em uma página web usando credenciais básicas
    Abrir o site na tela de login
    Inserir as credenciais básicas de login (email e senha)
    Clicar no botão "Entrar"
    Fechar navegador
