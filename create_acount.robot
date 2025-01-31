# small-daily-challenges-2

*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# colocar o identificador do elemento, nome, id
# colocar o tipo do elemento ex: input
${input_email}    id:email 
${input_password}    id:password 
${button_submit}    id:submit 


*** Keywords ***
Abrir o site na tela de cadastro
    Open Browser	https://www.tumblr.com/register?source=new_to_tumblr	chrome
    # Current Frame Should Contain	href="#managed-icon__logo-tumblr"
    Capture Page Screenshot

Inserir as credenciais básicas de login (email e senha)
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    testesrobotjubaicar@gmail.com
    Set Focus To Element    ${input_password}
    Input Password    ${input_password}    awsedrf456

Clicar no botão "Criar conta"
    Set Focus To Element	${button_submit}
    Click Button	${button_submit}
    Sleep	2
    Capture Page Screenshot

Fechar navegador
    Close Browser


*** Test Cases ***

Cenário 1: Login em uma página web usando credenciais básicas
    Abrir o site na tela de cadastro
    Inserir as credenciais básicas de login (email e senha)
    Clicar no botão "Criar conta"
    Fechar navegador
