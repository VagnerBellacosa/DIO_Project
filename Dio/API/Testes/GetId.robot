*** Settings ***
Resource    ../resources/services.robot


*** Test Cases ***

#Enviar uma requisição informando um id válido 
Apresentar Informações Cadastradas de um Id Válido
    
    ${resp}=    Listar Informações por Id       301     200
      
    Log   ${resp.text}

#Enviar um Id inexistente - teste irá falhar
Apresentar Informações Cadastradas de um Id Inexistente

    ${resp}=    Listar Informações por Id        0      404
    
    Log   ${resp.text}

#Enviar um Id inválido - teste irá falhar
Apresentar Informações Cadastradas de um Id Inválido

    ${resp}=    Listar Informações por Id        xx         400
      
    Log   ${resp.text}

