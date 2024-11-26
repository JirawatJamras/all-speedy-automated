*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S015
    [Documentation]    RM : อนุมัติคำขอ Full-Register (Inbound) ที่มีการส่งกลับแก้ไข (ลูกค้านิติบุคคล)
    [Tags]    Register    RM    UAT
    skip