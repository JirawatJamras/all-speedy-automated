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
    # ${tracking_c}    Get Parcel Codes By Sender Name    ${ParcelsData}    ${DC_Operation_S004['sender_name']}
    ${tracking_c}=    Set Variable    SPBD241100009760

    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    # dps_home_page.Click Dropdown For Select role
    # dps_home_page.Select Role    ${dc_operation.role['admin']}

    # Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    # # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # # Defect141
    # # Expected
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_c}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S004.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S004.data_in_all_task_tab['parcel_owner']}
    # ...    home  # ${DC_Operation_S004.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S004.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_c}
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S004.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    Verify Homepage
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    Verify Data In All Task Tab

    # Log    Step No.2 เลือกแท็บงานรับเข้า
    # dps_home_page.Select Tab Import Task
    # # Defect139
    # # Expected
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    home  # ${DC_Operation_S013.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S013.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S013.data_in_import_task_tab['parcel_owner']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S004 

    Sleep    5s
    Go To    https://dps-uat.allspeedy.co.th/pouch
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}


    Log    Step No.3 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น DC SB ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 4-7
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory    ${DC_Operation_S004.check_close_pouch['inventory']}    DC_Operation_S004

    Log    Step No.8 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ c" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_c}
    dps_scan_page.Click Search Button [Scan In Page]
    # Defect143    # Unable to test this step becuase of website is not display 'Create pouch destination: DCSB' popup
    # Expected
    # Verify Create Pouch Destination DCSB Popup
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Create Pouch Destination DCSB Popup
    
    Log    Step No.9 คลิกปุ่มตกลง
    # Defect143    # Unable to test this step becuase of website is not display 'Create pouch destination: DCSB' popup
    # Click Accept    
    # Expected    
    dps_home_page.Wait Until Page Loaded
    dps_scan_page.Verify Title Parcel Details In Scan Page Home Destination
    ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_source']}
    ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page Home Destination
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['tracking']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['customer_id']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_size']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_status']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['courier']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['pouch_number']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['receiving_date']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['warehouse_source']}
    # ...    HOME (11120)    # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['send_parcel_to']}
    dps_scan_page.Verify Title Label Parcel In Scan Page Home Destination
    ...    ${dc_operation.scan_in_title_label_detail['courier']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    dps_scan_page.Verify Data Label Parcel In Scan Page Home Destination
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['courier']}
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['zipcode']} 
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['size_home']}    
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['size']}
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['shipping_origin']}
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['shipping_destination']}
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Sender Data In Scan In