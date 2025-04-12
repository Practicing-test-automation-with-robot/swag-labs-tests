*** Settings ***
Library    SeleniumLibrary


*** Variables ***
# colocar o identificador do elemento, nome, id...
# colocar o tipo do elemento ex: input
# Quando os elementos possuem o id ou o name:
${input_email}        name:user-name 
${input_password}     name:password 
${user_name}    standard_user
${password}    secret_sauce
${user_name_invalid}    user_name_invalid 
${password_invalid}    password_invalid
${inventory_filter_container}    id:inventory_filter_container


# utilizando o XPath:
&{login}
...    button_submit_login=//*[@id="login-button"]
...    error_mensage=//*[@id="login_button_container"]/div/form/h3