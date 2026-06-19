*** Settings ***
Resource    ../../resources/keywords/Common_Resources.robot
Resource    ../../resources/pages/Create_Checking_Account_page.robot
Resource    ../../resources/pages/Create_Saving_Account_page.robot
Resource    ../../resources/pages/Transfer_fund_keywords.robot


Test Setup  Open Application
Test Teardown  Close Application


*** Test Cases ***
Fund Transfer Between the same account Test
    [Tags]   failed
    Ensure User Is Logged In
    ${acc}=  Create Saving Account
    ${from_acc}    ${to_acc}    ${amt}=   Transfer Funds from one account to another   ${acc}  ${acc}  70
    Sleep    2s

