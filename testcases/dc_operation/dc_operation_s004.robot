*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

DC_Operation_S004
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    UAT
    Log    Pre Condition
    #
    # รอ Operation_S002
    #
    #
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Step Test:    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    dps_home_page.Verify Data In All Task Tab
    ...    ${dc_operation_S012.data_in_all_task_tab['parcel_status']}
    ...    ${dc_operation_S012.data_in_all_task_tab['parcel_number']}
    ...    ${dc_operation_S012.data_in_all_task_tab['pouch_number']}
    ...    ${dc_operation_S012.data_in_all_task_tab['transport']}
    ...    ${dc_operation_S012.data_in_all_task_tab['sending_to']}
    ...    ${dc_operation_S012.data_in_all_task_tab['incoming_from']}
    ...    ${dc_operation_S012.data_in_all_task_tab['parcel_owner']}
    ...    ${dc_operation_S012.data_in_all_task_tab['task_type']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Data In All Task Tab


    Step Test:    Step No.2 เลือกแท็บงานรับเข้า
    

