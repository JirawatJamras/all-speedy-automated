*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
Register_S018
    [Documentation]    RM : สร้างและปฎิเสธคำขอที่มีการส่งกลับแก้ไข Full-Register (Outbound) ลูกค้าบุคคลธรรมดา
    [Tags]    Register    RM    Regression
    skip