*** Settings ***
Resource    ../../resources//auth/env.resource
Resource    ../../resources/keywords/login.robot

*** Test Cases ***

Cenário 1: Login com dados válidos
    Login em uma página web usando credenciais básicas válidas

Cenário 2: Login com dados inválidos
    Dado que o usuário abriu o site na tela de login
    Quando inserir as credenciais básicas de login (email e senha) inválidas
    Então clicar no botão "Entrar"
    E Validar mensagem de erro de login
    