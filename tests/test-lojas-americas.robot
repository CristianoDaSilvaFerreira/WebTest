*** Settings ***
Resource        ../resources/base.robot
Resource        ../resources/resources.robot

Test Setup       Abrir navegador
Test Teardown    Fechar navegador



*** Test Cases ***
Abrir o Site da Amazon.com
    [Documentation]    Esse teste verifica o menu eletrônicos do site da Amazon.com.br
    ...                e verifica a categoria Computadores e Informática
    [Tags]             menus  categorias
    Acessar a home page do site da Amazon.com
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."    

Verificar menus
    Menu eletrônicos
    # Menu Books Kindle


# Clicar no botão do menu eletrônicos

