*** Settings ***
Resource    ../../../resources/keywords/Common_Resources.robot
Resource    ../../../resources/pages/User_Registrations_Page.robot
Resource    ../../../resources/pages/Login_User.robot


Test Setup   Open Application
Test Teardown   Close Application


*** Test Cases ***
Verify User Registration

    User Registration
    Sleep    2s
    Wait Until Element Is Visible    ${Log_Out}     5s
    Click Element    ${Log_Out}
    Sleep  2s
    Login User
    Sleep    2s

