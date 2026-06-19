*** Settings ***
Resource    ../../variables/Login_User_Registration_Locators.robot
Library    SeleniumLibrary

*** Keywords ***
Login User
    Input Text    ${Username}    west5
    Input Text    ${Password}    1234
    Click Button   ${Login_Button}
