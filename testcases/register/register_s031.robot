*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S031
    [Documentation]    Customer : คำขอแก้ไขข้อมูลธนาคาร
    [Tags]    Register    Customer_Login    UAT
    skip
