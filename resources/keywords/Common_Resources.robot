*** Settings ***
Library    SeleniumLibrary
Resource   ../pages/Ensure_user_Is_logged_in.robot
Resource   ../pages/Login_User.robot
Resource   api_keywords.robot
Resource   ../../variables/Account_Overview_Locators.robot

*** Variables ***
# Fallback application URL (also defined in locators). Can be overridden by importing resource with different value.
${APP_URL}    https://parabank.parasoft.com/parabank
${Log_Out}    xpath=//a[text()="Log Out"]


*** Keywords ***
Open Application
    [Arguments]    ${browser}=Edge
    Open Browser    ${APP_URL}    ${browser}
    Maximize Browser Window

Close Application
    Close All Browsers

Get Account Details
    Wait Until Element Is Visible    ${ACCOUNT_OVERVIEW}
    Click Element    ${ACCOUNT_OVERVIEW}
    Sleep  2s
    ${account_id}=    Get Text    ${Acc_id_path}
    ${acc_balance}=    Get Text    ${Acc_balance_path}
    Set Suite Variable    ${ACCOUNT_ID}    ${account_id}
    Set Suite Variable    ${ACCOUNT_BALANCE}    ${acc_balance}
    Log To Console    ${account_id}

API test setup
    Open Application
    Ensure User Is Logged In
    Sleep    3s
    ${customer_id}=   Login With API    west5    1234
    Set Suite Variable    ${CUSTOMER_ID}    ${customer_id}
    Get Account Details
    Close Application


