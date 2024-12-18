*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S013
    [Documentation]    Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้านิติบุคคล
    [Tags]    Register    Customer_Full_Register_Inbound    Regression
    skip