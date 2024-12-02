*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

DC_Operation_S004
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    UAT    Defect139    Defect141    Defect155    Defect187    Defect188    Defect215    Defect249    Defect260    Defect201    Defect189    
    ...    Defect291    Defect265    Defect177    Defect223    Defect279    Defect290    Defect232    Defect270    Defect237    Defect242    Defect268    Defect288    Defect190

    Log    Prerequisite
    prerequisite.DC_Operation_S002

    Log    S004
    prerequisite.DC_Operation_S004