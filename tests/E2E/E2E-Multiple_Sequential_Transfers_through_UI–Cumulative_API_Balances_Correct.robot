*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot
Resource    ../../resources/pages/Create_Checking_Account_page.robot
Resource    ../../resources/pages/Transfer_fund_keywords.robot

Test Setup    API Test Setup

*** Test Cases ***
Multiple Sequential Transfers Through UI Cumulative API Balances Correct

    Open Application
    Ensure User Is Logged In

    ${new_account_id}=    Create Checking Account

    ${source_before}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${ACCOUNT_ID}

    ${dest_before}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}

    Log To Console    SOURCE BEFORE: ${source_before}
    Log To Console    DEST BEFORE: ${dest_before}


    Transfer Funds from one account to another
    ...    ${ACCOUNT_ID}
    ...    ${new_account_id}
    ...    100

    Wait Until Page Contains    Transfer Complete!    10s


    Transfer Funds from one account to another
    ...    ${ACCOUNT_ID}
    ...    ${new_account_id}
    ...    200

    Wait Until Page Contains    Transfer Complete!    10s

    # Transfer 3
    Transfer Funds from one account to another
    ...    ${ACCOUNT_ID}
    ...    ${new_account_id}
    ...    50

    Wait Until Page Contains    Transfer Complete!    10s

    Sleep    3s

    ${source_after}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${ACCOUNT_ID}

    ${dest_after}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}

    Log To Console    SOURCE AFTER: ${source_after}
    Log To Console    DEST AFTER: ${dest_after}


    Should Be True    ${source_after} < ${source_before}
    Should Be True    ${dest_after} > ${dest_before}