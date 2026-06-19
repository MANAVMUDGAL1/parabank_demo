*** Settings ***
Resource    ../../../resources/keywords/Common_Resources.robot
Resource    ../../../resources/pages/Ensure_user_Is_logged_in.robot
Resource    ../../../resources/pages/Create_Checking_Account_page.robot
Resource    ../../../resources/pages/Create_Saving_Account_page.robot
Resource    ../../../resources/pages/Transfer_fund_keywords.robot
Resource    ../../../resources/pages/Validating_Details_Transfer_fund_page.robot


Test Setup  Open Application
Test Teardown  Close Application


*** Test Cases ***
Fund Transfer Between Two Accounts
    Ensure User Is Logged In
    ${from}=  Create Saving Account
    ${to}=  Create Checking Account
    ${from_acc}    ${to_acc}    ${amt}=   Transfer Funds from one account to another   ${from}   ${to}  100
    Sleep  2s
    Log To Console    ${from_acc}
    Log To Console    ${to_acc}
    Log To Console    ${amt}
    Validate Transfer Details    ${from_acc}    ${to_acc}    ${amt}

    Sleep    2s
