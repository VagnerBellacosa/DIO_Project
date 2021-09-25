*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    OperatingSystem

Resource    helpers.robot

*** Variables ***
${base_url}    https://testeapiqa.azurewebsites.net/api/TodoItems

*** Keywords ***

#Chama a API Get que retorna todas as informações cadastradas
Listar Informações Cadastradas 
    [Arguments]          ${code}
    &{headers}=    Create Dictionary    Content-Type=application/json    
    ${resp}=       Get      ${base_url}    
  
    Should Be Equal As Strings    ${resp.status_code}                ${code}

    [return]    ${resp} 

#Envio de Json para  cadastrar um novo elemento
Enviar Dados para Cadastro
    [Arguments]     ${json}         ${code}
    &{headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json         
    ${resp}=          Post                  ${base_url}         data=${json}      expected_status=${code}       
  
    Should Be Equal As Strings    ${resp.status_code}                ${code}
 
    Log  ${resp}
    [return]    ${resp} 

#Retornar as informações de um cadastro por Id
Listar Informações por Id 
    [Arguments]     ${id}       ${code}
    &{headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json         
    ${resp}=       Get      ${base_url}/${id}           expected_status=${code}
  
    Should Be Equal As Strings    ${resp.status_code}                ${code}
    
    [return]    ${resp} 

#Editar informações de um registro informando o Id e as novas informações
Editar Informações de um Registro
    [Arguments]     ${id}   ${json}     ${code}
    &{headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json         
    ${resp}=       Put      ${base_url}/${id}        headers=${headers}        data=${json}    expected_status=${code}        

    Should Be Equal As Strings    ${resp.status_code}                ${code}

    [return]    ${resp} 

#Deletar as informações de um cadastro informando um  Id
Deletar um Registro
    [Arguments]     ${id}       ${code}
    &{headers}=    Create Dictionary    Content-Type=application/json    Accept=application/json         
    ${resp}=       Delete      ${base_url}/${id}              expected_status=${code}

    Should Be Equal As Strings    ${resp.status_code}                ${code}

    [return]    ${resp} 
