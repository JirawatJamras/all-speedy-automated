*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***


*** Test Cases ***
Reject Pre Register (Individual)
    [Documentation]    E2E 1 Scenario
    [Tags]    Register    UAT
    Log    Scenario 1 RM : RM : ปฎิเสธ Pre-Register (ลูกค้าบุคคลธรรมดา)
    # Register_S002
    Register_S010

*** Keywords ***