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
${OFERTA_DIA_IMG}             //img[contains(@alt,'Ofertas limitadas')]
${H2_OFERTA_DIA}              //h2[text()="Ofertas do Dia"]
${HEADER_OFERTA}              //h1[text()="Ofertas e Promoções"]
${CATEGORIA_INFORMATICA}      //li[@aria-posinset='16']
${MACBOOKS}                   //h1[contains(.,'Seleção em MacBooks e Acessórios')]
${OFERTA_LACTOPS}             //div[text()='Oferta em Laptops']
${H2_HEADER}                  //h2[text()='Considere esses itens alternativos']
${LOCALIZAR_PRODUTO}          //a[text()='Xbox Series S']

# //h1[contains(.,'Eletrônicos e Tecnologia')]


*** Keywords ***
Acessar a home page do site da Amazon.com
    Go To    ${URL}
    Wait Until Element Is Visible      locator=${MENU_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be                     title=${TITULO}    

Verificar se aparece a frase "${H1_TITULO}"
    Execute JavaScript                 window.scrollTo(0,400)
    Sleep                              2
    Wait Until Element is Visible      locator=//h2[contains(.,'${H1_TITULO}')] 
  
Verificar se existe o menu "Eletrônicos"
    Wait Until Element Is Visible      locator=${MENU_ELETRONICOS}

Verificar se existe o menu "eBooks Kindle"
    Wait Until Element Is Visible      locator=${MENU_EBOOK_KINDLE} 
    
Banner com oferta do dia 
    Wait Until Element Is Visible       locator=${H2_OFERTA_DIA}
    Sleep                               2


Clicar no banner do "${FRASE}"
    Click Element                       locator=${OFERTA_DIA_IMG}
    Sleep                               2
    Wait Until Page Contains            text=${FRASE}
    Wait Until Element Is Visible       locator=${HEADER_OFERTA}

Verificar se aparece o botão "Informática"
    Element Should Be Visible           locator=${CATEGORIA_INFORMATICA}
    Click Element                       locator=${CATEGORIA_INFORMATICA}
    Sleep                               2

Verificar se aparece o banner com "Oferta em Laptops"
    Execute JavaScript                  window.scrollTo(0,400)    
    Element Should Be Visible           ${OFERTA_LACTOPS}    
    Click Element                       ${OFERTA_LACTOPS}    
    Element Should Be Visible           locator=${H2_HEADER}
    Scroll Element Into View            id:prodDetails
    Sleep                               2 

Entrar no menu "Eletrônicos"
    Click Element                     locator=${MENU_ELETRONICOS}

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible           locator=//a[@aria-label='${NOME_CATEGORIA}']
    Execute JavaScript                  window.scrollTo(0,200)
    Sleep                               2
    Execute JavaScript                  window.scrollTo(0,0)


Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input Text                        locator=twotabsearchtextbox    text=${PRODUTO}
    
Clicar no botão de pesquisa
    Click Element                     locator=nav-search-submit-button

Verificar o resultado da pesquisa se está listando o produto "${PRODUTO}"
    Wait Until Element Is Visible    locator=${LOCALIZAR_PRODUTO}
    Execute JavaScript               window.scrollTo(0,150)
    Element Should Be Visible        locator=${LOCALIZAR_PRODUTO}

  