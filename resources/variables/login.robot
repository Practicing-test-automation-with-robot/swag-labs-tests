*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# colocar o identificador do elemento, nome, id...
# colocar o tipo do elemento ex: input
# Quando os elementos possuem o id ou o name:
${input_email}        name:user-name 
${input_password}     name:password 
${user-name}    standard_user
${password}    secret_sauce
${inventory_filter_container}    id:inventory_filter_container


# utilizando o XPath:
&{login}
...    button_submit_login=//*[@id="login-button"]