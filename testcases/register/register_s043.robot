*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S043
    [Documentation]    RM : ปฎิเสธคำขอแก้ไขข้อมูลบริการ
    [Tags]    Register    RM    UAT
    skip