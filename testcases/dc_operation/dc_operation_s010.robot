*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S010
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All สร้าง Pouch (ข้ามภาค)
    [Tags]    DC_Operation    UAT

    Log    Prerequisite
    prerequisite.DC_Operation_S002
    ${tracking_i}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S010['sender_name']}

    Log    S010
    prerequisite.DC_Operation_S010