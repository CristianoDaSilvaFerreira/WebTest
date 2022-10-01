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

*** Variables ***
${TITLE}                      Amazon.com.br | Tudo pra você, de A a Z.
${MENU_ELETRONICOS}           //a[text()='Eletrônicos']
${H2_FRETE_GRATIS}            //h2[contains(.,'Frete GRÁTIS no seu primeiro pedido')]
# ${MENU_BOOKS}           //a[contains(.,'eBooks Kindle')]



*** Keywords ***
Acessar a home page do site da Amazon.com
    Go To    ${URL}

Verificar se o título da página fica "${TITLE}"
    Title Should Be                     title=${TITLE}    

    
Verificar se aparece o h2 com a frase "${H2_FRETE_GRATIS}"
    Wait Until Element Is Visible       locator=${H2_FRETE_GRATIS}
    

Menu eletrônicos
    Wait Until Element Is Visible    menu_eletrônicos=${MENU_ELETRONICOS}
    

# Menu Books Kindle
#     Wait Until Element Is Visible    menu=${MENU_BOOKS}

# Clicar no botão do menu eletrônicos
#     Click Element                    menu=${MENU_ELETRONICOS}




    
