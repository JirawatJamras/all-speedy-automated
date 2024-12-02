*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    Reset Cut Off Time
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S019
    [Documentation]    คลัง Chilled ปฏิเสธรอบรถเข้ารับพัสดุที่บ้านลูกค้า (Key Account)
    [Tags]    DC_Operation    Chilled_Rejected_Request_Pickup_Schedule    UAT
    skip
