*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    Reset Cut Off Time
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S019
    [Documentation]    คลัง Chilled ปฏิเสธรอบรถเข้ารับพัสดุที่บ้านลูกค้า (Key Account)
    [Tags]    DC_Operation    Chilled_Rejected_Request_Pickup_Schedule    Regression
    skip
