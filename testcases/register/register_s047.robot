*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
Register_S047
    [Documentation]    Customer : ตรวจสอบข้อมูลบริษัท
    [Tags]    Register    Customer_Login    Regression
    skip