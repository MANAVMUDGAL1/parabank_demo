*** Settings ***
Resource    ../../variables/Opening_new_account_locators.robot
Library  SeleniumLibrary

*** Keywords ***
Create Checking Account
    Wait Until Element Is Visible    ${Open_new_account}
    Click Element    ${Open_new_account}
    Sleep    2s
    Select From List By Value    ${Account_type}    0
    Click Element    ${Open_new_account_button}
    Wait Until Element Is Visible    xpath=(//a[contains(@href,'activity')])[1]

    ${A_id}=    Get Text    xpath=//a[@id="newAccountId"]

    Log To Console    NEW ACCOUNT ID: ${A_id}

    RETURN    ${A_id}
