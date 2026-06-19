*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot




Test Setup    Api test setup



*** Test Cases ***
Validate Newly Created Account Exists in API Test
    Validate Newly Created Account Exists in API    ${CUSTOMER_ID}    ${ACCOUNT_ID}
