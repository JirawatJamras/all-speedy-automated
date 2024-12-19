*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
Register_S011
    [Documentation]    RM : อนุมัติ Pre-Register (ลูกค้าบุคคลธรรมดา)
    [Tags]    Register    RM    Regression
    skip