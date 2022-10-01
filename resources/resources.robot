*** Settings ***
Resource    base.robot

*** Variables ***
${TITLE}                Amazon.com.br | Tudo pra você, de A a Z.
${MENU_BOOKS}           //a[contains(.,'eBooks Kindle')]



*** Keywords ***
Acessar a home page do site da Amazon.com
    Go To    ${URL}

Verificar se o título da página fica "${TITLE}"
    Title Should Be                    title=${TITLE}

Menu Books Kindle
    Wait Until Element Is Visible    menu=${MENU_BOOKS}

# Clicar no botão do menu eletrônicos
#     Click Element                    menu=${MENU_ELETRONICOS}




    
