*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot




Test Setup    Api test setup


*** Test Cases ***
Return Account type via API Test

    Get Account type via API    ${CUSTOMER_ID}    ${ACCOUNT_ID}
