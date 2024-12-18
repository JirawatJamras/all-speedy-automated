*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S012
    [Documentation]    RM : ปฎิเสธ Pre-Register (ลูกค้าบุคคลธรรมดา)
    [Tags]    Register    RM    Regression
    skip