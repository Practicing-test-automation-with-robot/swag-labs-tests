*** Settings ***
Resource    ../variables/login.robot
Library    SeleniumLibrary

*** Keywords ***

# Keywords escritas em gherkin, para testes que dada a necessidade
#  viraram keyword para melhor aproveitamento de código
#__________________________________________________________________#
Login em uma página web usando credenciais básicas válidas
    Abrir o site na tela de login
    Inserir as credenciais básicas de login (email e senha)
    Clicar no botão "Entrar"

Fechar navegador
    Close Browser

#__________________________________________________________________#



# Keywords desenvolvidas
#__________________________________________________________________#
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




