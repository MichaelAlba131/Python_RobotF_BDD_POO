*** Settings ***
Library  SeleniumLibrary

*** Variables ***
&{login}
...    buttonSigninMenu=//a[contains(text(),'Sign in')]
...    inputCreateAccont_Email=//input[@id='email_create']
...    buttonCreateAnAccount=//button[@id='SubmitCreate']
...    inputSignIn_Email=//input[@id='email']
...    inputSignIn_Password=//input[@id='passwd']
...    buttonSignIn=//button[@id='SubmitLogin']
...    email_sucess=teste_michael@uorak.com
...    password_sucess=teste@123
...    login.buttonSignIn=//*[@id="SubmitLogin"]/span

*** Keywords ***
Dado Acessar a página de login do sistema
    Click Element  ${login.buttonSigninMenu}

E inserir os dados de login
    Input Text  ${login.inputSignIn_Email}   ${login.email_sucess}
    Input Text  ${login.inputSignIn_Password}  ${login.password_sucess}
    Click Element  ${login.buttonSignIn}

E fechar o browser
    Close Browser