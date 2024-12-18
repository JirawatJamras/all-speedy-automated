*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S017
    [Documentation]    RM : สร้างและอนุมัติคำขอ Full-Register (Outbound) ลูกค้านิติบุคคล
    [Tags]    Register    RM    Regression
    skip