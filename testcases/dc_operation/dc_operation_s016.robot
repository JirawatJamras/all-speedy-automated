*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S016
    [Documentation]    คลัง Dry การแก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in ที่คลังต้นทาง
    [Tags]    DC_Operation    UAT    Defect155    Defect160

    Log    Prerequisite S002
    prerequisite.DC_Operation_S002

    Log    Login
    prerequisite.DC_Operation_S016