*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S044
    [Documentation]    RM : แก้ไขข้อมูลลูกค้าที่ต้องส่งอนุมัติ
    [Tags]    Register    RM    Regression
    skip