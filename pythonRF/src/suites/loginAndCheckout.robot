*** Settings ***
Resource    ../main.robot

*** Test Cases ***
Cenário 01: Criar um usuário - sucesso
    Abrir o browser
    Dado Acessar a página de login do sistema
    E criar um novo usuario
    Quando preencher o formulario e cadastrar    ${True}
    Entao validar se usuario foi criado com sucesso
    E fechar o browser

Cenário 02: Criar um usuário - insucesso
    Abrir o browser
    Dado Acessar a página de login do sistema
    E criar um novo usuario
    Quando preencher o formulario e cadastrar    ${False}
    Entao validar a mensagem de insucesso
    E fechar o browser

Cenário 03: Login com user ja cadastrado
    Abrir o browser
    Dado Acessar a página de login do sistema
    E inserir os dados de login
    E fechar o browser

Cenário 04: Criar um usuário e realizar a compra de um produto
    Abrir o browser
    Dado Acessar a página de login do sistema
    E criar um novo usuario
    Quando preencher o formulario e cadastrar    ${True}
    Entao validar se usuario foi criado com sucesso
    E adicionar um produto na categoria    WOMEN
    E fechar o browser