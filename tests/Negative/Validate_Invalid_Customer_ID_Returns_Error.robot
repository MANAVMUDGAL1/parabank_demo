*** Settings ***
Resource    ../../resources/keywords/api_keywords.robot
Resource    ../../resources/keywords/Common_Resources.robot




Test Setup    Api test setup



*** Test Cases ***
Validate Invalid Customer ID Returns Error Test
    Validate Invalid Customer ID Returns Error    999999999
