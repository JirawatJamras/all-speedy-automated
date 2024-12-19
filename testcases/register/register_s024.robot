*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
Register_S024
    [Documentation]    Customer : จัดการผู้ใช้งาน Super User
    [Tags]    Register    Customer_Login    Regression
    skip
