*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date 
Test Teardown     Close Browser

*** Test Cases ***
Register_S048
    [Documentation]    RM : เปลี่ยนสถานะลูกค้าที่ไม่ Active เป็น Inactive
    [Tags]    Register    RM    Regression
    skip
