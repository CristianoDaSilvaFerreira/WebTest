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
${MENU_ELETRONICOS}           //a[text()='Eletrônicos']
${MENU_EBOOK_KINDLE}          //a[text()='eBooks Kindle']
${H2_FRETE_GRATIS}            //h2[contains(.,'Frete GRÁTIS no seu primeiro pedido')]
${OFERTA_DIA_IMG}             //img[contains(@alt,'Ofertas limitadas')]
${H2_OFERTA_DIA}              //h2[text()="Ofertas do Dia"]
${HEADER_OFERTA}              //h1[text()="Ofertas e Promoções"]
${CATEGORIA_INFORMATICA}      //li[@aria-posinset='16']
${MACBOOKS}                   //h1[contains(.,'Seleção em MacBooks e Acessórios')]
${OFERTA_MACBOOKS}            //div[@aria-label='Oferta: Seleção em MacBooks e Acessórios; Preço da oferta: Até 28% off']
# ${MENU_BOOKS}           //a[contains(.,'eBooks Kindle')]



*** Keywords ***
Acessar a home page do site da Amazon.com
    Go To    ${URL}
    Wait Until Element Is Visible      locator=${MENU_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be                     title=${TITULO}    

Verificar se aparece o h2 com a frase "Frete GRÁTIS no seu primeiro pedido"
    Execute JavaScript                 window.scrollTo(0,400)
    Sleep                              2
    Wait Until Element is Visible      locator=${H2_FRETE_GRATIS} 
  
Verificar se existe o menu "Eletrônicos"
    Wait Until Element Is Visible      locator=${MENU_ELETRONICOS}

Verificar se existe o menu "eBooks Kindle"
    Wait Until Element Is Visible      locator=${MENU_EBOOK_KINDLE} 
    
Banner com oferta do dia 
    Wait Until Element Is Visible       locator=${H2_OFERTA_DIA}


Clicar no banner do "${FRASE}"
    Click Element                       locator=${OFERTA_DIA_IMG}
    Wait Until Page Contains            text=${FRASE}
    Wait Until Element Is Visible       locator=${HEADER_OFERTA}

Verificar se aparece a categoria "Informática"
    Element Should Be Visible           locator=${CATEGORIA_INFORMATICA}
    Click Element                       locator=${CATEGORIA_INFORMATICA}

Verificar se existe oferta
    Element Should Be Visible       locator=${OFERTA_MACBOOKS}      

Menu eletrônicos
    Wait Until Element Is Visible    menu_eletrônicos=${MENU_ELETRONICOS}
    

# Menu Books Kindle
#     Wait Until Element Is Visible    menu=${MENU_BOOKS}

# Clicar no botão do menu eletrônicos
#     Click Element                    menu=${MENU_ELETRONICOS}




    
