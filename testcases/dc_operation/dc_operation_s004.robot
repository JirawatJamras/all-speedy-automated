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
    # รอ Operation_S002
    # ${ParcelsData}    Get Parcels And Sender Names    B2411000294
    # ${parcel_code}    Get Parcel Codes By Sender Name    ${ParcelsData}    คุณ e




    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Defect141
    # Expected
    Filter Data By Parcel Number [All Task Tab]    SPCD241000006731
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task Tab
    ...    ${DC_Operation_S006.data_in_all_task_tab['task_type']}
    ...    speedy  # ${DC_Operation_S006.data_in_all_task_tab['parcel_owner']}
    ...    home  # ${DC_Operation_S006.data_in_all_task_tab['import_from']}
    ...    ${DC_Operation_S006.data_in_all_task_tab['export_to']}
    ...    CPALL  # ${DC_Operation_S006.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S006.data_in_all_task_tab['pouch_number']}
    ...    SPCD241000006731
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S006.data_in_all_task_tab['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    dps_home_page.Verify Data In Import Task Tab
    ...    501  # ${DC_Operation_S007.data_in_import_task_tab['number_of_scanned_items']}
    ...    501  # ${DC_Operation_S007.data_in_import_task_tab['number_of_pieces']}
    ...    0  # ${DC_Operation_S007.data_in_import_task_tab['number_of_pouch']}
    ...    speedy  # ${DC_Operation_S007.data_in_import_task_tab['parcel_owner']}
    ...    CPALL  # ${DC_Operation_S007.data_in_import_task_tab['transport']}
    ...    home  # ${DC_Operation_S007.data_in_import_task_tab['import_from']}

