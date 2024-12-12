*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S002
    [Documentation]    คลัง Dry ยืนยันรอบรถเข้ารับพัสดุที่บ้านลูกค้า (Key Account)
    [Tags]    DC_Operation    Dry_Approved_Request_Pickup_Schedule    UAT    Defect043    Defect144    Defect150    Defect192
    prerequisite.DC_Operation_S002