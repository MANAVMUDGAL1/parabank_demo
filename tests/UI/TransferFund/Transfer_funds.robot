*** Settings ***
Resource    ../../../resources/keywords/Common_Resources.robot
Resource    ../../../resources/pages/Create_Checking_Account_page.robot
Resource    ../../../resources/pages/Create_Saving_Account_page.robot
Resource    ../../../resources/pages/Transfer_fund_keywords.robot


Test Setup  Open Application
Test Teardown  Close Application


*** Test Cases ***
Fund Transfer Between Two Accounts
    Ensure User Is Logged In
    ${from}=  Create Saving Account
    ${to}=  Create Checking Account
    ${from_acc}    ${to_acc}    ${amt}=   Transfer Funds from one account to another   ${from}  ${to}  100
    Log To Console    From Account: ${from_acc}
    Log To Console    To Account: ${to_acc}
    Log To Console    Amount: ${amt}
    Wait Until Page Contains    Transfer Complete!    10s
