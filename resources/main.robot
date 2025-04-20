*** Settings ***
Library    SeleniumLibrary

# Resources
# keywords
Resource    keywords/cart.robot
Resource    keywords/login.robot

# variebles
Resource    variables/cart.robot
Resource    variables/login.robot
Resource    auth/env.resource