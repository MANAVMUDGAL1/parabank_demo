*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot




Test Setup    Api test setup


*** Test Cases ***
Retrieve Account List Successfully Test
    [Documentation]    Test to retrieve account list successfully
   Retrieve Account List Successfully    ${CUSTOMER_ID}