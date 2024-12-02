*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

DC_Operation_S006
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    UAT    Defect139    Defect141    Defect177    Defect187    Defect188    Defect189    Defect190    Defect201
    ...    Defect215    Defect223    Defect232    Defect237    Defect242    Defect249    Defect260    Defect265    Defect268    Defect279
    ...    Defect288    Defect290    Defect291    Defect230    Defect269    Defect155    Defect289

    Log    Prerequisite
    prerequisite.DC_Operation_S002

    Log    S006
    prerequisite.DC_Operation_S006