# small-daily-challenges-2

*** Settings ***
Library    SeleniumLibrary


*** Variables ***


*** Keywords ***
Abrir o site na tela de login
    Open Browser	https://www.tumblr.com/	chrome
    Current Frame Should Contain	Login
    Capture Page Screenshot

Inserir as credenciais básicas de login (email e senha)
    Set Focus To Element    locator
    Input Text    locator    text
    Set Focus To Element    locator
    Input Password    locator    password

Clicar no botão "Entrar"
    Set Focus To Element	Entrar
    Click Element	Entrar
    Sleep	2
    Set Focus To Element	tela inicial

Fechar navegador
    Close Browser


*** Test Cases ***

Cenário 1: Login em uma página web usando credenciais básicas
    Abrir o site na tela de login
    Inserir as credenciais básicas de login (email e senha)
    Clicar no botão "Entrar"
    Fechar navegador
