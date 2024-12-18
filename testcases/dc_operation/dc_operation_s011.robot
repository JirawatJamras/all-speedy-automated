*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    dps_home_page.Reset Cut Off Time    17:00
                  ...    AND    Close Browser

*** Test Cases ***

DC_Operation_S011
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All ไม่สร้าง Pouch (ข้ามภาค)
    [Tags]    DC_Operation    Dry_B2C_Request_Pickup    Regression    Defect139    Defect141    Defect155    Defect187    Defect188    Defect189    Defect190    
    ...    Defect201    Defect232    Defect238    Defect243    Defect249    Defect255    Defect265    Defect271    Defect273    Defect274    Defect280    
    ...    Defect289    Defect291
        
    Log    Prerequisite
    prerequisite.DC_Operation_S002

    Log    S011
    prerequisite.DC_Operation_S011