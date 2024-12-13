*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S038
    [Documentation]    RM : ปฎิเสธคำขอแก้ไขข้อมูลที่อยู่บริษัท
    [Tags]    Register    RM    Regression
    skip