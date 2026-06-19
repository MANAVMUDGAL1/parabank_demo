*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot
Library    String
Resource   ../../variables/Account_Overview_Locators.robot

Test Setup    API Test Setup


*** Test Cases ***
Validate Account balance Deducted via Api Test
    ${balance}=    Get Account Balance via API    ${CUSTOMER_ID}    ${ACCOUNT_ID}

    Log To Console    RAW BALANCE: ${ACCOUNT_BALANCE}
    ${filtered_acc_balance}=    Replace String    ${ACCOUNT_BALANCE}    $    ${EMPTY}
    ${filtered_acc_balance}=    Convert To Number    ${filtered_acc_balance}
    Log To Console    CLEAN BALANCE: ${filtered_acc_balance}


    Should Be Equal As Numbers    ${balance}    ${filtered_acc_balance}



