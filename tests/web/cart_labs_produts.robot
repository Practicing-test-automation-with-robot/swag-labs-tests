*** Settings ***
Resource    ../../resources/keywords/login.robot
Resource    ../../resources/keywords/cart.robot
Suite Setup    Login em uma página web usando credenciais básicas válidas
Test Setup    O usuário está logado
Suite Teardown    Fechar navegador

*** Test Cases ***

Test case 1: Adicionar 1 Produto ao carrinho de compras
    Dado que o produto "Sauce Labs Backpack" foi localizado
    Quando o usuário clicar no botão "Add to cart"
    Então o produto deve ser apresentado no carrinho de compras
    E o usuário volta para a tela inicial de produtos
    E remove produto do carrinho