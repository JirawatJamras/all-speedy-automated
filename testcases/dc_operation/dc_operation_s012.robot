*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Run Keywords    dps_home_page.Reset Cut Off Time    17:00
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S012
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All (in area)
    [Tags]    DC_Operation    Dry_B2C_Request_Pickup    Regression    Defect138    Defect139    Defect141    Defect147    Defect148    Defect149    Defect155    
    ...    Defect159    Defect160    Defect179    Defect187    Defect188    Defect190    Defect201    Defect248    Defect254    Defect291

    Log    Prerequisite S002
    prerequisite.DC_Operation_S002

    Log    S012
    prerequisite.DC_Operation_S012