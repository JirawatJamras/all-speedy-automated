*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S023
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Chilled ปลายทางบ้าน ส่งโดย CP All ไม่สร้าง Pouch (Express)
    [Tags]    DC_Operation    Chilled_B2C_Request_Pickup    Regression
    skip