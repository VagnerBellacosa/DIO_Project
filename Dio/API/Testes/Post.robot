*** Settings ***
Resource    ../resources/services.robot


*** Test Cases ***

#Enviar um json para cadastro de informação válido
Enviar Dados para Cadastro Válido
    [Template]                       Enviar Dados para Cadastro
    {"id": 700, "name": "Teste601", "isCompleted": true}        201
    {"id": 701, "name": "Teste602", "isCompleted": true}        201
    {"id": 702, "name": "Teste603", "isCompleted": true}        201

#Enviar um json para cadastro inválido 
Enviar Dados para Cadastro Inválido
    [Template]                       Enviar Dados para Cadastro
    {"id": xx, "name": Teste601, "isCompleted": none}           415
   