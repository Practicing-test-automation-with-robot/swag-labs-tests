*** Settings ***
Library    SeleniumLibrary


*** Variables ***

# Produto
${cart_icon}    id:shopping_cart_container
${produt_sauce_labs_backpack}    class:inventory_container

# Carrinho
${cart_contents_container}    id:cart_contents_container
${all_itens}    id:inventory_sidebar_link
${checkout_screen}    id:contents_wrapper

# Formulário Checkout: Your Information
${first_name}    id:first-name
${last_name}    id:last-name
${postal_code}    id:postal-code
${continue_button}    class:btn_primary cart_button
${checkout_overview}    class:subheader
${checkout_summary_container}    id:checkout_summary_container
${finish_button}    class:btn_action cart_button
${finish_screen}    id:checkout_complete_container


&{cart}
...    add_to_cart=//*[@id="inventory_container"]/div/div[1]/div[3]/button
...    menu=//*[@id="menu_button_container"]/div/div[3]/div/button
...    checkout=//*[@id="cart_contents_container"]/div/div[2]/a[2]