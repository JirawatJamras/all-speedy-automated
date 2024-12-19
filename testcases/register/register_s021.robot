*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
Register_S021
    [Documentation]    RM : การปฎิเสธลูกค้าในข้อมูลลูกค้า
    [Tags]    Register    RM    Regression
    skip