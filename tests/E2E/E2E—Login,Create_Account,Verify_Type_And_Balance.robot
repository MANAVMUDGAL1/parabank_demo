*** Settings ***
Library     SeleniumLibrary
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot
Resource    ../../resources/pages/Create_Saving_Account_page.robot

Test Setup    API Test Setup

*** Test Cases ***
E2E - Login Create Account Verify Type And Balance Via API

    Open Application
    Ensure User Is Logged In

    ${new_account_id}=    Create Saving Account

    Log To Console    NEW ACCOUNT: ${new_account_id}

    Validate Newly Created Account Exists in API    ${CUSTOMER_ID}  ${new_account_id}

    ${account_type}=    Get Account Type Via API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}

    Log To Console    ACCOUNT TYPE: ${account_type}

    Should Be Equal    ${account_type}    SAVINGS

    ${balance}=    Get Account Balance via API
    ...    ${CUSTOMER_ID}
    ...    ${new_account_id}

    Log To Console    BALANCE: ${balance}

    Should Be True    ${balance} >= 0

    Close Application