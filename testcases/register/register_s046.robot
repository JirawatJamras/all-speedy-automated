*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date 
Test Teardown     Close Browser

*** Test Cases ***
Register_S046
    [Documentation]    RM : แก้ไขข้อมูลลูกค้าที่ไม่ต้องส่งอนุมัติ
    [Tags]    Register    RM    Regression
    skip