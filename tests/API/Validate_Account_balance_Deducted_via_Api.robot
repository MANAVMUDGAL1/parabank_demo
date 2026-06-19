*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot
Resource    ../../resources/pages/Create_Saving_Account_page.robot

Test Setup    API Test Setup


*** Test Cases ***
Validate Account balance Deducted via Api Test

    ${before}=    Get Account Balance via API    ${CUSTOMER_ID}    ${ACCOUNT_ID}
    Log To Console    BEFORE BALANCE: ${before}
    Open Application
    Ensure User Is Logged In
    ${To_acc_id}=     Create Saving Account

    Log To Console    ${To_acc_id}
    Transfer Funds via API   ${ACCOUNT_ID}    ${To_acc_id}    50
    Sleep    2s
    ${after}=    Get Account Balance via API    ${CUSTOMER_ID}    ${ACCOUNT_ID}
    
    Log To Console    AFTER BALANCE: ${after}

    Should Be True    ${after} < ${before}



