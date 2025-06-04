*** Settings ***
Resource    ../main.resource
Library    SeleniumLibrary

*** Variables ***
# Google
${CHROME_OPTIONS}    --disable-features=PasswordCheck

${input_email}        name:user-name 
${input_password}     name:password 
${initial_screen}    class:main-body
${logout}    id:logout_sidebar_link
${login_screen}    class:login_wrapper

&{login}
...    button_submit_login=//*[@id="login-button"]
...    error_mensage=//*[@id="login_button_container"]/div/form/h3