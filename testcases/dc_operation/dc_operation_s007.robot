*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S007
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All ไม่สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    UAT
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    sleep    15s
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Defect138    Defect141
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task Tab
    ...    ร้านรับพัสดุเข้าระบบ  # ${dc_operation_S007.data_in_all_task_tab['parcel_status']}
    ...    SPCD241000006135
    ...    ${dc_operation_S007.data_in_all_task_tab['pouch_number']}
    ...    CPALL  # ${dc_operation_S007.data_in_all_task_tab['transport']}
    ...    ${dc_operation_S007.data_in_all_task_tab['export_to']}
    ...    home  # ${dc_operation_S007.data_in_all_task_tab['import_from']}
    ...    speedy  # ${dc_operation_S007.data_in_all_task_tab['parcel_owner']}
    ...    ${dc_operation_S007.data_in_all_task_tab['task_type']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation_S007    Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation_S007    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    dps_home_page.Verify Data In Import Task Tab
    ...    501  # ${dc_operation_S007.data_in_import_task_tab['number_of_scanned_items']}
    ...    501  # ${dc_operation_S007.data_in_import_task_tab['number_of_pieces']}
    ...    0  # ${dc_operation_S007.data_in_import_task_tab['number_of_pouch']}
    ...    speedy  # ${dc_operation_S007.data_in_import_task_tab['parcel_owner']}
    ...    CPALL  # ${dc_operation_S007.data_in_import_task_tab['transport']}
    ...    home  # ${dc_operation_S007.data_in_import_task_tab['import_from']}

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ f" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100000140
    dps_scan_page.Click Search Button
    # Expected
    

    Log    Step No.4

    Log    Step No.5

    Log    Step No.6

    Log    Step No.7
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected

    Log    Step No.8
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Tab Export Task
    # Expected
    sleep    3s
    dps_home_page.Verify Label In Export Task Tab
    ...    ส่งออกไปยัง
    ...    ผ่านขนส่ง
    ...    Parcel Owner
    ...    จำนวน Pouch
    ...    จำนวนชิ้น
    ...    รวมรายการที่ต้องการสแกน
    dps_home_page.Verify Data In Export Task Tab
    ...    DCBB  # ${dc_operation_S007.data_in_import_task_tab['import_from']}
    ...    CPALL  # ${dc_operation_S007.data_in_import_task_tab['transport']}
    ...    speedy  # ${dc_operation_S007.data_in_import_task_tab['parcel_owner']}
    ...    0  # ${dc_operation_S007.data_in_import_task_tab['number_of_pouch']}
    ...    1  # ${dc_operation_S007.data_in_import_task_tab['number_of_pieces']}
    ...    1  # ${dc_operation_S007.data_in_import_task_tab['number_of_scanned_items']}

    Log    Step No.9

    Log    Step No.10

