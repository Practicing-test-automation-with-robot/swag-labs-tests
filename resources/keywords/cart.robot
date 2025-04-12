*** Settings ***
Resource    ../variables/cart.robot
Library    SeleniumLibrary

*** Keywords ***

# Keywords escritas em gherkin, para testes que dada a necessidade
#  viraram keyword para melhor aproveitamento de código
#__________________________________________________________________#


#__________________________________________________________________#



# Keywords desenvolvidas
#__________________________________________________________________#

Dado que o produto "Sauce Labs Backpack" foi localizado
    Wait Until Element Is Visible    ${produt_sauce_labs_backpack}
    Capture Page Screenshot

Quando o usuário clicar no botão "Add to cart"
    Set Focus To Element    ${cart.add_to_cart}
    Click Button    ${cart.add_to_cart}
    Wait Until Element Is Visible    ${cart.add_to_cart}

Então o produto deve ser apresentado no carrinho de compras
    Set Focus To Element    ${cart_icon}
    Click Element    ${cart_icon}
    Capture Page Screenshot
    Sleep    5
    Wait Until Element Is Visible    ${cart_contents_container}    timeout=10s
    Capture Element Screenshot    ${cart_contents_container}
    
E o usuário volta para a tela inicial de produtos
    Set Focus To Element    ${cart.menu}
    Click Button    ${cart.menu}
    Wait Until Element Is Visible    ${all_itens}
    Click Element    ${all_itens}
    Dado que o produto "Sauce Labs Backpack" foi localizado

E remove produto do carrinho
    Set Focus To Element    ${cart.add_to_cart}
    Click Button    ${cart.add_to_cart}
    Capture Page Screenshot

