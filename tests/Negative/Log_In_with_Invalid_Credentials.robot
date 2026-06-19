*** Settings ***
Resource    ../../variables/Login_User_Registration_Locators.robot
Resource    ../../resources/keywords/Common_Resources.robot
Library     SeleniumLibrary

Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Login With Invalid Credentials




    Input Text    ${Username}    Manav
    Input Text    ${Password}    1234
    Click Element    ${LOGIN_BUTTON}


    Sleep  2s


    Page Should Contain    The username and password could not be verified.

