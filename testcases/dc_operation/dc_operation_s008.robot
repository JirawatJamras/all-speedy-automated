*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

DC_Operation_S008
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All สร้าง Pouch (ข้ามภาค)
    [Tags]    DC_Operation    UAT

    Log    Prerequisite
    # DC_Operation_S002
    # ${tracking_g}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S008['sender_name']}
    ${tracking_g}=    Set Variable    SPBD241100021155    # Hard code for development.

    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Defect141
    # Expected
    Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S008.data_in_all_task_tab['task_type1']}
    # ...    speedy  # ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    # ...    home  # ${DC_Operation_S008.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['export_to1']}
    # ...    CPALL  # ${DC_Operation_S008.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['pouch_number1']}
    # ...    ${tracking_g}
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S008.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Defect139
    # Expected
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    home  # ${DC_Operation_S008.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S008.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S008.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008   Verify Import Task Tab

    Log    Step No.3 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น RDC LP ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 4-7
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory
    ...    ${DC_Operation_S008.check_close_pouch['inventory']}
    ...    ${dc_operation['text_warning_confirm_to_close_pouch']}
    ...    ${dc_operation['text_transaction_complete']}
    ...    DC_Operation_S008

    Log    Step No.8 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Create Pouch Popup After Scan In    ${DC_Operation_S008['destination_warehouse']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Create Pouch Destination DCSB Popup
    
    Log    Step No.9 คลิกปุ่มตกลง
    dps_scan_page.Click Accept Button On Popup For Creating Pouch  
    # Expected    
    dps_home_page.Wait Until Page Loaded
    ${pouch_number}    Get Pouch Number And Verify Pouch Format
    dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    ...    ROUTE    # Expected Result is ${dc_operation.scan_in_title_parcel_detail['route']}
    dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    ...    ${tracking_g}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['crossdock_warehouse']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['destination_warehouse']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_status']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['courier']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['pouch_number']}
    ...    ${today}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['origin_warehouse']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['send_parcel_to']}
    
    dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    ...    ${dc_operation.scan_in_title_label_detail['route']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S008.scan_in_data_label_detail['zipcode']}
    ...    ${DC_Operation_S008.scan_in_data_label_detail['customer']}
    ...    ${DC_Operation_S008.scan_in_data_label_detail['phone']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['pouch_number']}
    ...    ${DC_Operation_S008.scan_in_data_label_detail['wh']}
    ...    ${DC_Operation_S008.scan_in_data_label_detail['symbol']}    

    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S008.scan_in_sender_data['name']}
    ...    ${DC_Operation_S008.scan_in_sender_data['phone']}
    ...    -    #${DC_Operation_S008.scan_in_sender_data['shipping_origin']}
    ...    ${DC_Operation_S008.scan_in_sender_data['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Receiver In Scan Page
    ...    ${DC_Operation_S008.scan_in_receiver_data['name']}
    ...    ${DC_Operation_S008.scan_in_receiver_data['phone']}
    ...    ${DC_Operation_S008.scan_in_receiver_data['shipping_destination']}
    ...    ${DC_Operation_S008.scan_in_receiver_data['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Sender Data In Scan In

    Log    Step No.10 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.11 คลิกปุ่มพิมพ์
    common.Click ESC On Keyboard
    # Expected
    dps_scan_page.Verify Print Label Success Popup
    ...    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Print Label Success Popup

    Log    Step No.12 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.13 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify History Parcel Page

    Log    Step No.14 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Defect201
    # Expected
    dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S008['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}e
    dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}    5    #6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Timeline

    Log    Step No.15 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Defect141
    # Expected
    Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['task_type2']}
    # ...    speedy  # ${DC_Operation_S008.data_in_all_task_tab_after_scan['parcel_owner']}
    # ...    home  # ${DC_Operation_S008.data_in_all_task_tab_after_scan['import_from']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['export_to2']}
    # ...    CPALL  # ${DC_Operation_S008.data_in_all_task_tab_after_scan['transport']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['pouch_number']}
    # ...    ${tracking_g}
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S008.data_in_all_task_tab_after_scan['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Data In All Task Tab 2

    Log    Step No.16 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Defect188
    # Expected
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    DCSB  # ${DC_Operation_S008.data_in_export_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S008.data_in_export_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S008.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Data In Export Task Tab 2

    Log    Step No. 17 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_g}
    # ...    ${pouch_number}
    # ...    คลัง DC BB    #${DC_Operation_S008.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.18 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup
    ...    ไม่สามารถ scan tracking ได้เนื่องจากพัสดุอยู่ใน pouch กรุณา scan pouch    #${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Close Pouch Before Scan Out Warning Popup

    Lop    Step No.19 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    # Expected
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S008.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['status_on']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Pouch In Pouch Page

    Log    Step No.20 คลิกที่ไอคอนรูปดินสอ
    dps_pouch_page.Proceed Pouch By Pouch Number    ${pouch_number}
    # Defect223    Defect279
    # Expected
    dps_pouch_page.Verify Label Of Information Section In Pouch Detail Popup
    ...    ${dc_operation.label_pouch_in_pouch_detail['title_detail_pouch']}
    ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_number']}
    ...    ${dc_operation.label_pouch_in_pouch_detail['crossdock_warehouse']}
    ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_status']}
    ...    ${dc_operation.label_pouch_in_pouch_detail['parcel_amount']}
    ...    ${dc_operation.label_pouch_in_pouch_detail['origin_warehouse']}
    ...    ${dc_operation.label_pouch_in_pouch_detail['destination_warehouse']}
    dps_pouch_page.Verify Data Of Information Section In Pouch Detail Popup
    ...    ${pouch_number}
    ...    ${DC_Operation_S008.data_in_pouch_detail['crossdock_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_detail['pouch_status']}
    ...    ${DC_Operation_S008.data_in_pouch_detail['origin_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_detail['destination_warehouse']}
    dps_pouch_page.Verify Label Section In Pouch Detail Popup
    ...    ${DC_Operation_S008.data_in_pouch_detail['label_destination_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_detail['label_number']}
    ...    ${DC_Operation_S008.data_in_pouch_detail['label_route']}
    ...    ${DC_Operation_S008.data_in_pouch_detail['label_simbol']}
    ...    ${pouch_number}
    dps_pouch_page.Verify Label In Table On Pouch Detail Popup
    ...    ${dc_operation.label_pouch_in_pouch_detail['title_parcel_in_pouch_list']}
    ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pouch_number']}
    ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['destination_warehouse']}
    ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pickup_place']}
    ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['type']}
    ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['parcel_status']}
    ...    ${dc_operation['text_close_pouch_and_print_label']}
    dps_pouch_page.Verify Data In Table On Pouch Detail Popup
    ...    ${tracking_g}
    ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['destination_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['pickup_place']}
    ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['type']}
    ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Pouch Detail Popup

    Log    Step No.21 คลิกปุ่มปิด Pouch/Print Label
    dps_pouch_page.Click Print Pouch Label
    # Expected
    dps_pouch_page.Verify Warning Confirm To Close Pouch
    ...    ${dc_operation['text_warning_confirm_to_close_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Warning Confirm To Close Pouch

    Log    Step No.22 ปิด Pouch/Print Label
    dps_pouch_page.Click Close Pouch/Print Label Btton On Warning Popup

    Log    Step No.23 คลิกปุ่มพิมพ์
    Sleep    5s
    Click ESC On Keyboard
    # Expected
    dps_pouch_page.Verify Transaction Complete Popup
    ...    ${dc_operation['text_transaction_complete']}
    common.Verify Capture Screenshot  dc_operation    DC_Operation_S008    Verify Transaction Complete Popup

    Log    Step No.24 คลิกที่ x Pop up
    dps_pouch_page.CLick Close Button
    # Expected
    Reload Page
    dps_pouch_page.Verify Transaction Complete Popup Was Closed
    dps_pouch_page.Verify Navigate To Pouch Page Success
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S008.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['status_off']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008   Verify Transaction Complete Popup Was Closed
# Inprogress
    Log    Step No.25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    ...    ${tracking_g}
    ...    ${pouch_number}
    ...    คลัง DC BB    #${DC_Operation_S008.scan_out_waiting_scan['receive_parcel_from']}
    ...    CP ALL    #${DC_Operation_S008.scan_out_waiting_scan['transport']}
    ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_owner']}
    ...    กล่อง A4    #${DC_Operation_S008.scan_out_waiting_scan['parcel_size']}
    ...    ${today}
    ...    พัสดุรอ Scan out ไปคลัง DC SB    #${DC_Operation_S008.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Section Waiting List To Scan Out After Close Pouch [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Section Waiting List To Scan Out After Close Pouch [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup
    ...    ไม่สามารถ scan tracking ได้เนื่องจากพัสดุอยู่ใน pouch กรุณา scan pouch    #${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.27 กดปุ่มตกลง
    #
    # Expected
    #

    Log    Step No.28 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected 
    dps_scan_page.Verify Label Scan Out
    ...    ${dc_operation.scan_out_title['pouch_number']}
    ...    ${dc_operation.scan_out_title['parcel_id']}
    ...    ${dc_operation.scan_out_title['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title['transport']}
    ...    ${dc_operation.scan_out_title['parcel_owner']}
    ...    ${dc_operation.scan_out_title['parcel_size']}
    ...    ${dc_operation.scan_out_title['date']}
    ...    ${dc_operation.scan_out_title['parcel_status']}
    dps_scan_page.Verify Value List Scan Out 
    ...    ${pouch_number}
    ...    ${tracking_g}
    ...    คลัง DC BB
    ...    Flash
    ...    Speedy
    ...    กล่อง L
    ...    2024-11-07     # 2024-11-07 09:40:51
    ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Value List Scan Out

    Log    Step No.29 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out
    ...    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Popup Confirm Scan Out

    Log    Step No.30 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success
    ...    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Popup Save Data Success

    Log    Step No.31 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Navigate To Scan Page After Scan Out

    Log    Step No.32 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify History Parcel Page After Scan Out

    Log    Step No.33 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Timeline After Scan Out

    Log    Step No.34 เข้าเมนู Scan เลือกแท็บ Scan Out และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    dps_wait_delivery.Verify Label Delivery List
    ...    ${dc_operation.label_delivery_list['export_to']}
    ...    ${dc_operation.label_delivery_list['transport']}
    ...    ${dc_operation.label_delivery_list['parcel_number']}
    ...    ${dc_operation.label_delivery_list['pouch_number']}
    ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    ...    ${dc_operation.label_delivery_list['title_date']}
    ...    ${dc_operation.label_delivery_list['title_status']}
    dps_wait_delivery.Verify Data Delivery List
    ...    ${DC_Operation_S008.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['transport']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['date']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Delivery List Page

    Log    Step No.35 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    dps_wait_delivery.Click Print Button By Data
    ...    ${DC_Operation_S008.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['transport']}
    ...    16-11-2567    #${DC_Operation_S008.wait_derivery_data_list['date']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['status']}

    Log    Step No.36 กดปุ่ม พิมพ์
    Sleep    5s
    common.Click ESC On Keyboard
    # Expected
    dps_wait_delivery.Verify Data Delivery List
    ...    ${DC_Operation_S008.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['transport']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['date']}
    ...    ${DC_Operation_S008.wait_derivery_data_list['status_after_print']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Delivery List Page After Print

    Log    Step No.37 เข้าเมนูหน้าหลัก, เลือกคลังที่ดำเนินงานเป็น "AC และ คลิกแท็บงานรับเข้า
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    dps_home_page.Select Tab Import Task
    # Expected
        dps_home_page.Verify Label In Import Task Tab
    ...    ${dc_operation.label_import_task_tab['import_from']}
    ...    ${dc_operation.label_import_task_tab['transport']}
    ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    dps_home_page.Verify Data In Import Task Tab
    ...    home  # ${DC_Operation_S008.data_in_import_task_tab['import_from']}
    ...    CPALL  # ${DC_Operation_S008.data_in_import_task_tab['transport']}
    ...    speedy  # ${DC_Operation_S008.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Import Task Tab

    Log    Step No.38 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Parcel Is On Pouch Warning Popup    พัสดุชิ้นนี้อยู่ใน "ถุง" กรุณา Scan ด้วยเลขถุง เท่านั้น    #${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Parcel Is On Pouch Warning Popup

    Log    Step No.39 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.40 กรอกหมายเลข Pouch และ คลิกปุ่มตกลง หรือ Enter
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Verify Label Scan In Warehouse AC
    ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_id']}
    ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['pouch_number']}
    ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receive_parcel_from']}
    ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_size']}
    ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receiving_date']}
    ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_status']}
    Verify Data List Scan In Warehouse AC
    ...    ${tracking_g}
    ...    ${DC_Operation_S008.scan_in_value_waiting_scan_warehouse_ac['pouch_number']}
    ...    ${DC_Operation_S008.scan_in_value_waiting_scan_warehouse_ac['receive_parcel_from']}
    ...    ${DC_Operation_S008.scan_in_value_waiting_scan_warehouse_ac['parcel_size']}
    ...    2024-11-18
    ...    ${DC_Operation_S008.scan_in_value_waiting_scan_warehouse_ac['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify List Scan In Warehouse AC
    
    Log    Step No.41 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify History Parcel Page After Scan Out

    Log    Step No.41 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}    6    #9
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Timeline After Scan Out

    Log    Step No.42 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Defect281
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    ...    ${DC_Operation_S008.scan_out_waiting_scan['tracking_number']}
    ...    ${pouch_number}
    ...    คลัง DC BB    #${DC_Operation_S008.scan_out_waiting_scan['receive_parcel_from2']}
    ...    ${DC_Operation_S008.scan_out_waiting_scan['transport']}
    ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_owner']}
    ...    กล่อง A4    #${DC_Operation_S008.scan_out_waiting_scan['parcel_size2']}
    ...    ${today}
    ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.43 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup
    ...    ไม่สามารถ scan tracking ได้เนื่องจากพัสดุอยู่ใน pouch กรุณา scan pouch    #${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.44 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Defect232    Defect285
    # Expected 
    # dps_scan_page.Verify Label Scan Out
    # ...    ${dc_operation.scan_out_title['pouch_number']}
    # ...    ${dc_operation.scan_out_title['parcel_id']}
    # ...    ${dc_operation.scan_out_title['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title['transport']}
    # ...    ${dc_operation.scan_out_title['parcel_owner']}
    # ...    ${dc_operation.scan_out_title['parcel_size']}
    # ...    ${dc_operation.scan_out_title['date']}
    # ...    ${dc_operation.scan_out_title['parcel_status']}
    # dps_scan_page.Verify Value List Scan Out 
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_out_list_data['tracking_number']}
    # ...    คลัง DC BB    #${DC_Operation_S008.scan_out_list_data['receive_parcel_from2']}
    # ...    CPALL    #${DC_Operation_S008.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    พัสดุถึงคลังข้ามภาค AC    #${DC_Operation_S008.scan_out_list_data['parcel_status2']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Value List Scan Out

    Log    Step No.45 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out
    ...    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Popup Confirm Scan Out

    Log    Step No.46 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success
    ...    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Popup Save Data Success


    Log    Step No.47 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Navigate To Scan Page After Scan Out

    Log    Step No.48 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify History Parcel Page After Scan Out

    Log    Step No.49 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Timeline After Scan Out

    Log    Step No.43 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    dps_scan_page.Verify Section Waiting List To Scan Out [Scan Out Page]
    ...    ${parcel_j}
    ...    # ${DC_Operation_S008.scan_out_waiting_scan['pouch_number']}
    ...    # ${DC_Operation_S008.scan_out_waiting_scan['import_from']}
    ...    # ${DC_Operation_S008.scan_out_waiting_scan['deliver']}
    ...    # ${DC_Operation_S008.scan_out_waiting_scan['parcel_owner']}
    ...    # ${DC_Operation_S008.scan_out_waiting_scan['parcel_size']}
    ...    16-11-2567
    ...    # ${DC_Operation_S008.scan_out_waiting_scan['parcel_status']}  
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.44 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup
    ...    ไม่สามารถ scan tracking ได้เนื่องจากพัสดุอยู่ใน pouch กรุณา scan pouch    #${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.45 กดปุ่มตกลง
    #
    # Expected
    #

    Log    Step No.46 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected 
    dps_scan_page.Verify Label Scan Out
    ...    ${dc_operation.scan_out_title['pouch_number']}
    ...    ${dc_operation.scan_out_title['parcel_id']}
    ...    ${dc_operation.scan_out_title['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title['transport']}
    ...    ${dc_operation.scan_out_title['parcel_owner']}
    ...    ${dc_operation.scan_out_title['parcel_size']}
    ...    ${dc_operation.scan_out_title['date']}
    ...    ${dc_operation.scan_out_title['parcel_status']}
    dps_scan_page.Verify Value List Scan Out 
    ...    ${pouch_number}
    ...    ${tracking_g}
    ...    คลัง DC BB
    ...    Flash
    ...    Speedy
    ...    กล่อง L
    ...    2024-11-07     # 2024-11-07 09:40:51
    ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Value List Scan Out

    Log    Step No.47 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out
    ...    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Popup Confirm Scan Out

    Log    Step No.48 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success
    ...    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Popup Save Data Success


    Log    Step No.49 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Navigate To Scan Page After Scan Out

    Log    Step No.50 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify History Parcel Page After Scan Out

    Log    Step No.51 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Timeline After Scan Out

    Log    Step No.52 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    # Expected
    Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    #

    Log    Step No.53 เลือก Dropdown ดูข้อมูลคลัง RDCLP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    # Expected
    Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task Tab
    ...    ${DC_Operation_S008.data_in_all_task_tab['task_type']}
    ...    speedy  # ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    ...    home  # ${DC_Operation_S008.data_in_all_task_tab['import_from']}
    ...    ${DC_Operation_S008.data_in_all_task_tab['export_to']}
    ...    CPALL  # ${DC_Operation_S008.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S008.data_in_all_task_tab['pouch_number']}
    ...    ${tracking_g}
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S008.data_in_all_task_tab['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Data In All Task Tab

    Log    Step No.54 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Defect139
    # Expected
    dps_home_page.Verify Label In Import Task Tab
    ...    ${dc_operation.label_import_task_tab['import_from']}
    ...    ${dc_operation.label_import_task_tab['transport']}
    ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    dps_home_page.Verify Data In Import Task Tab
    ...    home  # ${DC_Operation_S008.data_in_import_task_tab['import_from']}
    ...    CPALL  # ${DC_Operation_S008.data_in_import_task_tab['transport']}
    ...    speedy  # ${DC_Operation_S008.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Import Task Tab

    Log    Step No.55 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Parcel Is On Pouch Warning Popup    พัสดุชิ้นนี้อยู่ใน "ถุง" กรุณา Scan ด้วยเลขถุง เท่านั้น    #${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Parcel Is On Pouch Warning Popup

    Log    Step No.56 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.57 กรอกหมายเลข Pouch และ คลิกปุ่มตกลง หรือ Enter
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Unbox Pouch And Scan Piece By Piece    ${dc_operation['text_unbox_pouch_and_scan_piece_by_piece']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Unbox Pouch And Scan Piece By Piece

    Log    Step No.58 คลิกปุ่มตกลง
    dps_scan_page.Click Confirm Button On Unbox Pouch And Scan Piece By Piece Popup
    # Expected
    #

    Log    Step No.59 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" ในช่องค้นหาด้านล่างรายละเอียด Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number In Search Bar On Pouch Detail Section    ${tracking_g}
    #
    # Expected
    dps_home_page.Wait Until Page Loaded
    dps_scan_page.Verify Title Parcel Details In Scan Page [Other Courier]
    ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    dps_scan_page.Verify Data Parcel Details In Scan Page [Other Courier]
    ...    ${tracking_g}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_status']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['courier']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['pouch_number']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['receiving_date']}
    ...    ${DC_Operation_S008.scan_in_data_parcel_detail['origin_warehouse']}
    ...    HOME (11120)    # ${DC_Operation_S008.scan_in_data_parcel_detail['send_parcel_to']}
    dps_scan_page.Verify Title Label Parcel In Scan Page [Other Courier]
    ...    ${dc_operation.scan_in_title_label_detail['courier']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [Other Courier]
    ...    ${DC_Operation_S008.scan_in_data_label_detail['courier']}
    ...    ${DC_Operation_S008.scan_in_data_label_detail['zipcode']} 
    ...    ${DC_Operation_S008.scan_in_data_label_detail['customer']}
    ...    ${DC_Operation_S008.scan_in_data_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['size_home']}    
    ...    ${DC_Operation_S008.scan_in_data_label_detail['size']}
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S008.scan_in_sender_data['name']}
    ...    ${DC_Operation_S008.scan_in_sender_data['phone']}
    ...    ${DC_Operation_S008.scan_in_sender_data['shipping_origin']}
    ...    ${DC_Operation_S008.scan_in_sender_data['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Receiver In Scan Page
    ...    ${DC_Operation_S008.scan_in_receiver_data['name']}
    ...    ${DC_Operation_S008.scan_in_receiver_data['phone']}
    ...    ${DC_Operation_S008.scan_in_receiver_data['shipping_destination']}
    ...    ${DC_Operation_S008.scan_in_receiver_data['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Sender Data In Scan In

    Log    Step No.60 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    dps_scan_page.Verify Accept Scan In Success Popup
    ...    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Accept Scan In Success Popup

    Log    Step No.61 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Accept Scan In Success Popup After Scan In At RDC LP Warehouse

    Log    Step No.62 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify History Parcel Page After Scan Out

    Log    Step No.63 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Timeline After Scan Out

    Log    Step No.64 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDC LP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    # Expected
    Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task Tab
    ...    ${DC_Operation_S008.data_in_all_task_tab['task_type']}
    ...    speedy  # ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    ...    home  # ${DC_Operation_S008.data_in_all_task_tab['import_from']}
    ...    ${DC_Operation_S008.data_in_all_task_tab['export_to']}
    ...    CPALL  # ${DC_Operation_S008.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S008.data_in_all_task_tab['pouch_number']}
    ...    ${tracking_g}
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S008.data_in_all_task_tab['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Data In All Task Tab

    Log    Step No.65 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    dps_home_page.Verify Label In Send Task Tab
    ...    ${dc_operation.label_send_task_tab['send_to']}
    ...    ${dc_operation.label_send_task_tab['store_code']}
    ...    ${dc_operation.label_send_task_tab['transport']}
    ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    dps_home_page.Verify Data In Send Task Tab
    ...    ${DC_Operation_S008.data_in_send_task_tab['send_to']}
    ...    ${DC_Operation_S008.data_in_send_task_tab['store_code']}
    ...    ${DC_Operation_S008.data_in_send_task_tab['customer_type']}
    ...    ${DC_Operation_S008.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    Verify Send Task Tab