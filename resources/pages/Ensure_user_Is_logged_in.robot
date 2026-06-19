*** Settings ***
Resource    ../../resources/pages/User_Registrations_Page.robot
Resource    Login_User.robot
Library    SeleniumLibrary




*** Keywords ***
Ensure User Is Logged In

    Login User
    Sleep  3s

    ${error1}=    Run Keyword And Return Status
    ...    Page Should Contain    Log Out

    IF    '${error1}' == 'False'
        User Registration
    END