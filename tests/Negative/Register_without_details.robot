*** Settings ***
Resource    ../../variables/Registrations_Users_Locators.robot
Resource    ../../resources/keywords/Common_Resources.robot
Library     SeleniumLibrary

Test Setup    Open Application
Test Teardown    Close Application

*** Test Cases ***
Registration - Empty Required Fields Show Errors

    Click Link    ${Register}

    Click Button    ${Register_Button}

    Sleep  2s


    Page Should Contain    First name is required.
    Page Should Contain    Last name is required.
    Page Should Contain    Address is required.
    Page Should Contain    City is required.
    Page Should Contain    State is required.
    Page Should Contain    Zip Code is required.
    Page Should Contain    Social Security Number is required.
    Page Should Contain    Username is required.
    Page Should Contain    Password is required.