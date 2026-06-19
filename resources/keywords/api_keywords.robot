*** Settings ***
Resource   Common_Resources.robot
Library    RequestsLibrary
Library    SeleniumLibrary
Library    Collections
Library    XML

*** Variables ***
${API_URL}    https://parabank.parasoft.com/parabank/services/bank


*** Keywords ***
Login With API
    [Arguments]    ${username_}    ${password_}

    Create Session    para    ${API_URL}    verify=${False}

    ${response}=    GET On Session
    ...    para
    ...    /login/${username_}/${password_}

    Should Be Equal As Integers    ${response.status_code}    200

    ${xml}=    Parse XML    ${response.text}

    ${customer_id}=    Get Element Text    ${xml}    .//id



    RETURN    ${customer_id}





Retrieve Account List Successfully
    [Arguments]    ${c_id}
    Log To Console    CUSTOMER ID USED: ${c_id}
    Create Session    para    ${API_URL}

    ${response}=    GET On Session
    ...    para
    ...    /customers/${c_id}/accounts

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    ${response.text}



Validate Newly Created Account Exists in API
    [Arguments]    ${customer_id}    ${account_id}

    Create Session    para    ${API_URL}    verify=${False}

    ${response}=    GET On Session
    ...    para
    ...    /customers/${customer_id}/accounts

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    RESPONSE: ${response.text}

    Should Contain    ${response.text}    ${account_id}








Create Account via API
    [Arguments]    ${customer_id}    ${from_account_id}    ${type}

    Create Session    para    ${API_URL}    verify=${False}

    ${endpoint}=    Set Variable
    ...    /createAccount?customerId=${customer_id}&newAccountType=${type}&fromAccountId=${from_account_id}

    ${response}=    POST On Session    para    url=${endpoint}

    Should Be Equal As Integers    ${response.status_code}    200

    ${xml}=    Parse XML    ${response.text}

    ${account_id}=    Get Element Text    ${xml}    .//id

    RETURN    ${account_id}



Transfer Funds via API

    [Arguments]    ${from_account}    ${to_account}    ${amount}

    Create Session    para    ${API_URL}    verify=${False}

    ${params}=    Create Dictionary
    ...    fromAccountId=${from_account}
    ...    toAccountId=${to_account}
    ...    amount=${amount}

    ${response}=    POST On Session
    ...    para
    ...    /transfer
    ...    params=${params}

    Should Be Equal As Integers    ${response.status_code}    200

    Log To Console    Transfer Response: ${response.text}


Get Account Balance via API
    [Arguments]    ${customer_id}    ${account_id}

    Create Session    para    ${API_URL}    verify=${False}

    ${response}=    GET On Session
    ...    para
    ...    /accounts/${account_id}

    Should Be Equal As Integers    ${response.status_code}    200

    ${xml}=    Parse XML    ${response.text}

    ${balance}=    Get Element Text    ${xml}    .//balance

    ${balance}=    Convert To Number    ${balance}

    RETURN    ${balance}


Validate Invalid Customer ID Returns Error
    [Arguments]    ${customer_id}

    Create Session    para    ${API_URL}    verify=${False}

    ${response}=    GET On Session
    ...    para
    ...    /customers/${customer_id}/accounts
    ...    expected_status=any

    Log To Console    STATUS: ${response.status_code}
    Log To Console    RESPONSE: ${response.text}

    Should Be Equal As Integers    ${response.status_code}    400


Get Account Type Via API
    [Arguments]    ${customer_id}    ${account_id}

    Create Session    para    ${API_URL}    verify=${False}

    ${response}=    GET On Session
    ...    para
    ...    /customers/${customer_id}/accounts

    Should Be Equal As Integers    ${response.status_code}    200

    ${xml}=    Parse XML    ${response.text}

    ${account}=    Get Element
    ...    ${xml}
    ...    .//account[id='${account_id}']

    ${type}=    Get Element Text
    ...    ${account}
    ...    type

    Log To Console    ACCOUNT TYPE: ${type}

    RETURN    ${type}