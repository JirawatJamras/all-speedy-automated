*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S016
    [Documentation]    RM : ปฎิเสธคำขอ Full-Register (Inbound) ที่มีการส่งกลับแก้ไข (ลูกค้าบุคคลธรรมดา)
    [Tags]    Register    RM    Regression
    skip