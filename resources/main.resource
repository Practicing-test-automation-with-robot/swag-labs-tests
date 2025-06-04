*** Settings ***
Library    SeleniumLibrary

# Resources
# keywords
Resource    ./keywords/kw_cart.resource
Resource    ./keywords/kw_login.resource

# variebles
Resource    ./variables/var_cart.resource
Resource    ./variables/var_login.resource

# auth
Resource    auth/env.resource