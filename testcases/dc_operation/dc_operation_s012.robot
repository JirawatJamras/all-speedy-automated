*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S012
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All (in area)
    [Tags]    DC_Operation    UAT    Defect138    Defect139    Defect141    Defect147    Defect148    Defect149    Defect155    Defect159    Defect160    Defect179    Defect187    Defect188    Defect190    Defect201    Defect206    Defect248    Defect254    Defect291

    Log    Prerequisite S002
    prerequisite.DC_Operation_S002

    Log    S012
    prerequisite.DC_Operation_S012