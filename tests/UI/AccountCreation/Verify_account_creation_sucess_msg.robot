*** Settings ***
Resource    ../../../resources/keywords/Common_Resources.robot
Resource    ../../../resources/pages/User_Registrations_Page.robot
Resource    ../../../resources/pages/Create_Saving_Account_page.robot
Resource    ../../../resources/pages/Login_User.robot


Test Setup   Open Application
Test Teardown   Close Application


*** Test Cases ***
Verify User Registration
    Ensure User Is Logged In
    Create Saving Account
    Wait Until Page Contains    Congratulations, your account is now open.    10s

