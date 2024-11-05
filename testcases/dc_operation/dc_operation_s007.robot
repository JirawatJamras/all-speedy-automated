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
    dps_home_page.Wait Until Page Loaded
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
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S007.data_in_all_task_tab['parcel_status']}
    ...    SPCD241000006135
    ...    ${DC_Operation_S006.data_in_all_task_tab['pouch_number']}
    ...    CPALL  # ${DC_Operation_S007.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S007.data_in_all_task_tab['export_to']}
    ...    home  # ${DC_Operation_S007.data_in_all_task_tab['import_from']}
    ...    speedy  # ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S007.data_in_all_task_tab['task_type']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    DC_Operation_S007    Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    DC_Operation_S007    Verify Data In All Task Tab

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

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ f" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100000140
    dps_scan_page.Click Search Button
    # Expected
    dps_scan_page.Verify Title Parcel Details In Scan Page
    ...    ${dc_operation.scan_in_title_paecel_detail['title']}
    ...    ${dc_operation.scan_in_title_paecel_detail['parcel_id']}
    ...    ${dc_operation.scan_in_title_paecel_detail['customer_id']}
    ...    ${dc_operation.scan_in_title_paecel_detail['parcel_size']}
    ...    ${dc_operation.scan_in_title_paecel_detail['warehouse_crossdock']}
    ...    ${dc_operation.scan_in_title_paecel_detail['warehouse_destination']}
    ...    ${dc_operation.scan_in_title_paecel_detail['parcel_status']}
    ...    ${dc_operation.scan_in_title_paecel_detail['courier']}
    ...    ${dc_operation.scan_in_title_paecel_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_paecel_detail['receiving_date']}
    ...    ${dc_operation.scan_in_title_paecel_detail['warehouse_source']}
    ...    ${dc_operation.scan_in_title_paecel_detail['send_parcel_to']}
    ...    ROUTE    # Expected Result is ${dc_operation.scan_in_title_paecel_detail['route']}
    dps_scan_page.Verify Data Parcel Details In Scan Page
    ...    SPBD241100000140
    ...    B2C0002400563    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['customer_id']}
    ...    90 ซม. กล่อง M    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['parcel_size']}
    ...    ${DC_Operation_S007.scan_in_data_paecel_detail['warehouse_crossdock']}
    ...    ${DC_Operation_S007.scan_in_data_paecel_detail['warehouse_destination']}
    ...    พนักงานขนส่งอยู่ระหว่างไปรับพัสดุ     # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['parcel_status']}
    ...    ${DC_Operation_S007.scan_in_data_paecel_detail['courier']}
    ...    ${DC_Operation_S007.scan_in_data_paecel_detail['pouch_number']}
    ...    01-11-2567 14:06:18
    ...    ${DC_Operation_S007.scan_in_data_paecel_detail['warehouse_source']}
    ...    STORE (07004)    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['send_parcel_to']}
    ...    4629    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['route']}
    dps_scan_page.Verify Title Label Parcel In Scan Page
    ...    ROUTE
    ...    STORE
    ...    CUSTOMER
    ...    PHONE
    ...    POUCH NO.
    ...    WH
    dps_scan_page.Verify Data Label Parcel In Scan Page
    ...    4629
    ...    07004 (กล่อง M)
    ...    ทดสอบพัสดุ In area
    ...    0900987355
    ...    -
    ...    undefined undefined - -- DC BB
    ...    รูปดาว


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
    ...    DCBB  # ${DC_Operation_S007.data_in_import_task_tab['import_from']}
    ...    CPALL  # ${DC_Operation_S007.data_in_import_task_tab['transport']}
    ...    speedy  # ${DC_Operation_S007.data_in_import_task_tab['parcel_owner']}
    ...    0  # ${DC_Operation_S007.data_in_import_task_tab['number_of_pouch']}
    ...    1  # ${DC_Operation_S007.data_in_import_task_tab['number_of_pieces']}
    ...    1  # ${DC_Operation_S007.data_in_import_task_tab['number_of_scanned_items']}

    Log    Step No.9

    Log    Step No.10

