*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# colocar o identificador do elemento, nome, id...
# colocar o tipo do elemento ex: input
# Quando os elementos possuem o id ou o name:

${cart_icon}    id:shopping_cart_container
${produt_sauce_labs_backpack}    class:inventory_container
${cart_contents_container}    id:cart_contents_container
${all_itens}    id:inventory_sidebar_link


&{cart}
...    add_to_cart=//*[@id="inventory_container"]/div/div[1]/div[3]/button
...    menu=//*[@id="menu_button_container"]/div/div[3]/div/button
