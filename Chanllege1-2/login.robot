# small-daily-challenges-2

*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# colocar o identificador do elemento, nome, id...
# colocar o tipo do elemento ex: input
# Quando os elementos possuem o id ou o name:
${input_email}        name:email 
${input_password}     name:password 

# utilizando o XPath:
&{login}
...    button_submit_login=//button[@class='TRX6J CxLjL qjTo7 CguuB yC5pj'][contains(.,'Entrar')]
...    password=inserir password aqui

*** Keywords ***
Abrir o site na tela de login
    Open Browser	https://www.tumblr.com/login?language=pt_BR	chrome
    Current Frame Should Contain	tumblr
    Capture Page Screenshot

Inserir as credenciais básicas de login (email e senha)
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    email@gmail.com
    Set Focus To Element    ${input_password}
    Input Password    ${input_password}    ${login.password}

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
