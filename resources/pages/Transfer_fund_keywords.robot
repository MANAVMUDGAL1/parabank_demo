*** Settings ***
Resource    ../../variables/Transfer_fund_locators.robot
Library     SeleniumLibrary

*** Keywords ***
Transfer Funds from one account to another
    [Arguments]    ${from_account_id}    ${to_account_id}    ${Amount_val}

    Click Element    ${Transfer_Fund_Button}
    Sleep    2s

    Input Text    ${Amount}    ${Amount_val}

    Select From List By Value    ${From_Account}    ${from_account_id}
    Select From List By Value    ${To_Account}      ${to_account_id}

    ${selected_from}=    Get Selected List Value    ${From_Account}
    ${selected_to}=      Get Selected List Value    ${To_Account}

    Click Button    ${Transfer}

    RETURN    ${selected_from}    ${selected_to}    ${Amount_val}




