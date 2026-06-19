*** Settings ***
Resource    ../../../resources/keywords/Common_Resources.robot
Resource    ../../../resources/pages/Login_User.robot
Resource    ../../../resources/pages/Create_Saving_Account_page.robot
Resource    ../../../resources/pages/Ensure_user_Is_logged_in.robot

Test Setup    Open Application
Test Teardown    Close Application


*** Test Cases ***

Checking Saving Account Test
    Ensure User Is Logged In
    Create Saving Account


