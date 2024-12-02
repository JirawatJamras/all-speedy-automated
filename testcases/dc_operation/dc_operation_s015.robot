*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***   
${SHEET_NAME}    Tracking_S015   # ชื่อชีตที่ต้องการ
${ROW_NUMBER}    2      # แถวที่ต้องการลบ

*** Test Cases ***
DC_Operation_S015
    [Documentation]    ลูกค้า C (ส่งพัสดุที่ร้าน 7-11) --> พัสดุ Partnership dropoff ปลายทางบ้าน
    [Tags]    DC_Operation    Dry_B2C_Send_Parcel_7Shop    UAT
    skip
