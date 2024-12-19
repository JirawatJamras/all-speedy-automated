*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Run Keywords    dps_home_page.Reset Cut Off Time    17:00
                  ...    AND    Close Browser

*** Test Cases ***

DC_Operation_S004
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    Dry_B2C_Request_Pickup    Regression    Defect139    Defect141    Defect155    Defect187    Defect188    Defect215    Defect249    Defect260    
    ...    Defect201    Defect189    Defect291    Defect265    Defect177    Defect223    Defect279    Defect290    Defect232    Defect270
    ...    Defect237    Defect242    Defect268    Defect288    Defect190    Defect289

    Log    Prerequisite
    prerequisite.DC_Operation_S002

    Log    DC_Operation_S004
    prerequisite.DC_Operation_S004