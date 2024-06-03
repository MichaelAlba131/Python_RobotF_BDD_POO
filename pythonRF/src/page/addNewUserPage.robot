*** Settings ***
Library  SeleniumLibrary


*** Variables ***
&{addNewUser}
...    URL=http://www.automationpractice.pl/index.php
...    inputCreateAccont_Email=//input[@id='email_create']
...    buttonCreateAnAccount=//button[@id='SubmitCreate']
...    radioTitle=//div[@id ='uniform-id_gender1']
...    inputFirstName=//input[@id ='customer_firstname']
...    inputLastName=//input[@id ='customer_lastname']
...    actionButtonEmail=//input[@id ='email']
...    actionButtonPassword=//input[@id ='passwd']
...    selectBirthDay=//select[@id ='days']
...    selectBirthMonth=//select[@id ='months']
...    selectBirthYear=//select[@id ='years']
...    buttonRegister=//button[@id ='submitAccount']

*** Keywords ***
E criar um novo usuario
    ${random_value} =  Evaluate  random.randint(0, 100000)
    Input Text  ${addNewUser.inputCreateAccont_Email}   michael.alba${random_value}@uorak.com
    Click Element  ${addNewUser.buttonCreateAnAccount}

Quando preencher o formulario e cadastrar
    [Arguments]  ${fillAll}
    BuiltIn.Sleep  3s
    Wait Until Page Contains Element  ${addNewUser.radioTitle}
    Click Element  ${addNewUser.radioTitle}
    Run Keyword If  ${fillAll}    Preencher Campos do formulario de cadastro
    Click Element  ${addNewUser.buttonRegister}

Preencher Campos do formulario de cadastro
    Input Text  ${addNewUser.inputFirstName}   Michael
    Input Text  ${addNewUser.inputLastName}   Alba
    Click Element  ${addNewUser.actionButtonEmail}
    Input Text  ${addNewUser.actionButtonPassword}  Teste@123
    Select From List By Index  ${addNewUser.selectBirthDay}   5
    Select From List By Index  ${addNewUser.selectBirthMonth}   2
    Select From List By Value  ${addNewUser.selectBirthYear}   1994

Entao validar se usuario foi criado com sucesso
    Page Should Contain  Your account has been created.

Entao validar a mensagem de insucesso
    Page Should Contain  There are 3 error