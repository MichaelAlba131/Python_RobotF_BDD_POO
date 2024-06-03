*** Settings ***
Resource    ../main.robot

*** Variables ***
&{hooks}
...    URL=http://www.automationpractice.pl/index.php
...    BROWSER=chrome

*** Keywords ***
Abrir o browser
    Open Browser  ${hooks.URL}  ${hooks.BROWSER}