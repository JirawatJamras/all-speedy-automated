*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S014
    [Documentation]    Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้าบุคคลธรรมดา
    [Tags]    Register    Customer_Full_Register_Inbound    Regression
    skip