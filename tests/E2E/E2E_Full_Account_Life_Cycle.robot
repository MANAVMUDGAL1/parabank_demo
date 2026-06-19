*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot
Resource    ../../resources/pages/Create_Checking_Account_page.robot
Resource    ../../resources/pages/Transfer_fund_keywords.robot

Test Setup    API Test Setup

*** Test Cases ***
E2E - Full Account Lifecycle Create Transfer Validate UI API

    Open Application
    Ensure User Is Logged In


    ${source_before}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${ACCOUNT_ID}


    ${new_account_id}=    Create Checking Account


    Validate Newly Created Account Exists in API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}


    ${account_type}=    Get Account Type Via API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}

    Should Be Equal    ${account_type}    CHECKING


    ${new_before}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}


    ${from_acc}    ${to_acc}    ${amount}=    Transfer Funds from one account to another   ${ACCOUNT_ID}   ${new_account_id}   200

    Wait Until Page Contains    Transfer Complete!    10s

    Sleep    2s


    ${source_after}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${ACCOUNT_ID}

    ${new_after}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}

    Log To Console    SOURCE BEFORE: ${source_before}
    Log To Console    SOURCE AFTER: ${source_after}

    Log To Console    NEW BEFORE: ${new_before}
    Log To Console    NEW AFTER: ${new_after}


    Should Be True    ${source_after} < ${source_before}
    Should Be True    ${new_after} > ${new_before}

    Close Application