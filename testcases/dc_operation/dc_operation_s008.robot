*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    dps_home_page.Reset Cut Off Time    17:00
                  ...    AND    Close Browser

*** Test Cases ***

DC_Operation_S008
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All สร้าง Pouch (ข้ามภาค)
    [Tags]    DC_Operation    Dry_B2C_Request_Pickup    Regression    Defect139    Defect141    Defect155    Defect177    Defect187    Defect188    Defect189    Defect190    
    ...    Defect201    Defect223    Defect230    Defect232    Defect237    Defect238    Defect239    Defect242    Defect243    Defect249    
    ...    Defect260    Defect265    Defect268    Defect270    Defect279    Defect280    Defect281    Defect285    Defect288    Defect289    
    ...    Defect290    Defect291

    Log    Prerequisite
    prerequisite.DC_Operation_S002

    Log    S008
    prerequisite.DC_Operation_S008