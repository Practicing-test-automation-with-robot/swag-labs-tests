# small-daily-challenges-2

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
# colocar o identificador do elemento, nome, id...
# colocar o tipo do elemento ex: input
${input_email}        name:email 
${input_password}     name:password 
${selec_month}        name:month
${selec_day}          name:day
${selec_year}         name:year
${input_name_blog}    id:onboardingBlogname

&{cadastro}
...    button_submit=//button[@class='TRX6J CxLjL qjTo7 CguuB yC5pj'][contains(.,'Criar conta')] 
...    selec_month_8=//option[@value='7'][contains(.,'agosto')]
...    selec_day_5=//option[@value='5'][contains(.,'5')]
...    selec_year_2002=//option[@value='2002'][contains(.,'2002')]
...    button_submit_birth=//button[@class='TRX6J CxLjL qjTo7 CguuB yC5pj E_Qq0'][contains(.,'Seguinte')]
...    button_submit_create=//button[@class='TRX6J CxLjL qjTo7 CguuB yC5pj E_Qq0'][contains(.,'Criar conta')]


*** Keywords ***

Abrir o site na tela de cadastro
    Open Browser	https://www.tumblr.com/register?source=new_to_tumblr	chrome
    Capture Page Screenshot

Inserir as credenciais básicas de login (email e senha)
    Set Focus To Element    ${input_email}
    Input Text    ${input_email}    testesrobotjubaicar@gmail.com
    Set Focus To Element    ${input_password}
    Input Password    ${input_password}    AWSedrf*456

Clicar no botão "Criar conta"
    Click Element	${cadastro.button_submit}
    Sleep	2
    Capture Page Screenshot

Preencher campos de cadastro
    Click Element    ${selec_month}
    Click Element    ${cadastro.selec_month_8}
    Sleep    2
    Click Element    ${selec_day}
    Click Element    ${cadastro.selec_day_5}
    Sleep    2
    Click Element    ${selec_year}
    Click Element    ${cadastro.selec_year_2002}
    Sleep    2

Submeter formulário de data de Nascimento
    Sleep    2
    Click Element    ${cadastro.button_submit_birth}
    Capture Page Screenshot

Inserir nome do blog
    Sleep    2
    Input Text    ${input_name_blog}    testesrobotjubaicar

Finalizar criação de conta clicando no botão "Criar conta"
    Sleep    2
    Click Element    ${cadastro.button_submit_create}
    Sleep    2
    Capture Page Screenshot

Fechar navegador
    Close Browser


*** Test Cases ***

Cenário 1: Login em uma página web usando credenciais básicas
    Abrir o site na tela de cadastro
    Inserir as credenciais básicas de login (email e senha)
    Clicar no botão "Criar conta"
    Preencher campos de cadastro
    Submeter formulário de data de Nascimento
    Inserir nome do blog
    Finalizar criação de conta clicando no botão "Criar conta"
    Fechar navegador
