*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Validate Transfer Details
    [Arguments]    ${from_account_}    ${to_account_}    ${amount_}

    Page Should Contain    Transfer Complete!
    Page Should Contain    ${from_account_}
    Page Should Contain    ${to_account_}
    Page Should Contain    $${amount_}.00
    Page Should Contain    See Account Activity for more details.

    Page Should Contain    See Account Activity for more details.