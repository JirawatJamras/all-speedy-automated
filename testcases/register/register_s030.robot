*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S030
    [Documentation]    Customer : คำขอแก้ไขข้อมูลผู้ติดต่อ
    [Tags]    Register    Customer_Login    UAT
    skip