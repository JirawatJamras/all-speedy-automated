*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S020
    [Documentation]    RM : การ Update Vendor Code ในข้อมูลลูกค้า
    [Tags]    Register    RM    UAT
    skip
    common.Open URL    
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Customer Information Sub-Menu