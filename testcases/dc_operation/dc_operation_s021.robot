*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S021
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Chilled ปลายทางบ้าน ส่งโดย Courier
    [Tags]    DC_Operation    Chilled_B2C_Request_Pickup    UAT
    skip