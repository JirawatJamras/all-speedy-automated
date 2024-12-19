*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser 

*** Test Cases ***
DC_Operation_S015
    [Documentation]    ลูกค้า C (ส่งพัสดุที่ร้าน 7-11) --> พัสดุ Partnership dropoff ปลายทางบ้าน
    [Tags]    DC_Operation    Dry_B2C_Send_Parcel_7Shop    Regression
    skip
