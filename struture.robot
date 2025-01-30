*** Settings ***
    # Aqui vem as bibliotecas que serão utilizadas, por padrão usamos o sellenium mas pode haver outras dependendo do teste
Library    SeleniumLibrary


*** Variables ***
    ### Aqui que declaramos as variáveis ###
        # Para atribuir valor para a variável é só dar um tab e inserir o valor

        # Posso declarar as variáveis em outra "sessão" (Settings/ Keywords / Test Cases)?
            # Sim, mas por boas práticas o melhor é declarar as variávies nessa sessão.

${variavel1}    teste
${variavel2}    hhhh
${variavel3}    155455


*** Keywords ***
    # As Keywords podem ser personalizadas aqui
    # OU utilizamos as Keywords prontas do Sellenium para compor direto nos test cases
    # Dentro de uma Keyword pode ter outra Keyword
Abrir site de letras de músicas do grupo de rap nacional Racinais Mcs
    Open Browser    https://www.letras.mus.br/racionais-mcs/    chrome

Verificar o título da página
    Sleep    2
    Set Focus To Element    //h1[contains(@class,'textStyle-primary')]
    Current Frame Should Contain    "Racionais MC's"
    Capture Page Screenshot

Fechar navegador
    Close Browser

*** Test Cases ***
    # Aqui escrevemos nossos testes
    # Dentro de um test case contém KEYWORDS
    # Test cases somente contém Keyword, não pode ter test case dentro de test case

Cenário 1: Teste de abrir site de letras de músicas do grupo de rap nacional Racinais Mcs
    Abrir site de letras de músicas do grupo de rap nacional Racinais Mcs
    Verificar o título da página
    Fechar navegador