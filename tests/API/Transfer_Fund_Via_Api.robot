*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot
Resource    ../../resources/pages/Create_Checking_Account_page.robot
Resource    ../../resources/pages/Create_Saving_Account_page.robot



Test Setup    Api test setup


*** Test Cases ***
Transfer Fund Via Api
    [Documentation]    Simple test: transfer fund via API and verify the response
    Open Application
    Ensure User Is Logged In
    ${From_acc_id}=   Create Checking Account
    ${To_acc_id}=     Create Saving Account
    Transfer Funds via API   ${From_acc_id}    ${To_acc_id}    1000


