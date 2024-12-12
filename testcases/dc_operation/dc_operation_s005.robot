*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S005
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All ไม่สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    Dry_B2C_Request_Pickup    UAT    Defect139    Defect141    Defect155    Defect169    Defect187    Defect188    Defect189    
    ...    Defect190    Defect201    Defect212    Defect222    Defect249    Defect255    Defect265    Defect268    Defect289    Defect291

    Log    Prerequisite
    prerequisite.DC_Operation_S002

    Log    S005
    prerequisite.DC_Operation_S005