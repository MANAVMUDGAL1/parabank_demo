*** Settings ***
Resource    ../../variables/Registrations_Users_Locators.robot
Library     SeleniumLibrary

*** Keywords ***
User Registration
    
    Click Element    ${Register}
    Sleep    2s
    
    Input Text    ${FIRST_NAME}      west3
    Input Text    ${LAST_NAME}       side3
    Input Text    ${ADDRESS}         jaipur
    Input Text    ${CITY}            jaipur
    Input Text    ${STATE}           raj
    Input Text    ${ZIP_CODE}        10001
    Input Text    ${Phone}           9876543210
    Input Text    ${SSN}             123456789
    Input Text    ${Reg_USERNAME}        west5
    Input Text    ${Reg_PASSWORD}        1234
    Input Text    ${Reg_CONFIRM_PASSWORD}    1234

    Click Button    ${REGISTER_BUTTON}

    Sleep  5s