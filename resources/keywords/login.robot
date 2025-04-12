*** Settings ***
Resource    ../variables/login.robot
Library    SeleniumLibrary

*** Keywords ***

# Keywords escritas em gherkin, para testes que dada a necessidade
#  viraram keyword para melhor aproveitamento de código
#__________________________________________________________________#
Login em uma página web usando credenciais básicas válidas
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) válidas
    Então clicar no botão "Entrar"

Fechar navegador
    Close Browser

#__________________________________________________________________#



# Keywords desenvolvidas
#__________________________________________________________________#
Dado que o usuário abriu o site na tela de login
    Open Browser	https://www.saucedemo.com/v1/	chrome
    Capture Page Screenshot

Quando inserir as credenciais básicas de login (email e senha) válidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password}

Então clicar no botão "Entrar"
    Click Element    ${login.button_submit_login}
    Sleep	2
    Capture Page Screenshot

O usuário está logado
    Wait Until Element Is Visible    ${inventory_filter_container}
    Capture Page Screenshot
    

Quando inserir as credenciais básicas de login (email e senha) inválidas
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    ${user_name_invalid} 
    Set Focus To Element    ${input_password}    
    Input Password    ${input_password}    ${password_invalid}


E Validar mensagem de erro de login
    Wait Until Element Is Visible    ${login.error_mensage}
    Capture Page Screenshot