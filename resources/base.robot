*** Settings ***
Library        SeleniumLibrary

*** Variables ***
${URL}                 https://www.amazon.com.br/


*** Keywords ***
Abrir navegador
    Open Browser                     ${URL}                chrome 
    Maximize Browser Window   

Fechar navegador
    Capture Page Screenshot
    Close Browser