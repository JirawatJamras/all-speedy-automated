*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S021
    [Documentation]    RM : การปฎิเสธลูกค้าในข้อมูลลูกค้า
    [Tags]    Register    RM    UAT
    skip