*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S023
    [Documentation]    Customer : การ Login เข้าใช้งานระบบสำหรับลูกค้าธุรกิจ
    [Tags]    Register    Customer_Login    Regression
    skip