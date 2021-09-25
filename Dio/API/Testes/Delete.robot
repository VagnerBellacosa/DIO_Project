*** Settings ***
Resource    ../resources/services.robot


*** Test Cases ***

#Deletar o registro informando um id válido 
Deletar um Id Válido
    
    ${resp}=    Deletar um Registro       35           200
      
    Log   ${resp.text}

#Deletar um registro informando um Id inexistente 
Deletar Informações de um Id Inexistente

    ${resp}=    Deletar um Registro      0              404
   
    Log   ${resp.text}

#Deletar um registro informando um Id inexistente 
Deletar Informações de um Id Inválido

    ${resp}=    Deletar um Registro        xx              400
   
    Log   ${resp.text}

