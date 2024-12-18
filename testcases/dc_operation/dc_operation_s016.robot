*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    dps_home_page.Reset Cut Off Time    17:00
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S016
    [Documentation]    คลัง Dry การแก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in ที่คลังต้นทาง
    [Tags]    DC_Operation    Dry_Edit_Size_Parcel    Regression    Defect155    Defect160

    Log    Prerequisite S002
    prerequisite.DC_Operation_S002

    Log    Login
    prerequisite.DC_Operation_S016