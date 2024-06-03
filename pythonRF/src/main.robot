*** Settings ***
Library  SeleniumLibrary

### Shared ###
Resource    shared/hooks.robot

### Pages ###
Resource    page/addNewUserPage.robot
Resource    page/checkoutPage.robot
Resource    page/loginPage.robot