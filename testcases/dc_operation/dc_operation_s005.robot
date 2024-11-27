*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S005
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All ไม่สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    UAT

    Log    Pre Condition

    ${tracking_d}=    Set Variable    SPBD241100012704
    ${today}    Set Today

    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก -> เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Defect141    Defect187
    # Expected
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S005.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    home  # ${DC_Operation_S005.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S005.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    1.Verify Homepage
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    1.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Defect139    Defect188
    # Expected
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    home  # ${DC_Operation_S005.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S005.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S005.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005   2.Verify Import Task Tab


    Log    Step No.3 เข้าเมนู Scan -> กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ d" -> กดค้นหา หรือกด Enter
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan In Tab
    # dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_d}
    # dps_scan_page.Click Search Button [Scan In Page]
    # sleep    5s
    # Defect248    Defect249
    # Expected
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ROUTE    #${dc_operation.scan_in_title_parcel_detail['route']}

    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${EMPTY}    #${DC_Operation_S005.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['parcel_status']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    18-11-2567
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['send_parcel_to']}
    
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}

    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['store']}
    # ...    ทดสอบพัสดุ Express ส่งบ้านไม่สร้าง Pouch    #${DC_Operation_S005.scan_in_data_label_detail['customer']}
    # ...    0900987354    # Expected Result is (เบอร์โทรที่ระบุในไฟล์ Excel Template ขั้นตอน Booking)
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['symbol']}

    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    3.Data Parcel Details In Scan Page

    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}

    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S005.scan_in_sender_data['name']}
    # ...    0959494989    # Expected Result is ${DC_Operation_S005.scan_in_sender_data['phone']}
    # ...    -    #${DC_Operation_S005.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['address']}

    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    3.Data Sender Details In Scan Page

    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}

    # dps_scan_page.Verify Data Recevier In Scan Page
    # ...    ${DC_Operation_S005.scan_in_receiver_data['name']}
    # ...    0900987354    # ${DC_Operation_S005.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['address']}

    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    3.Data Receiver Details In Scan Page

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    # dps_scan_page.Click Print Label
    # Sleep    5s
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    4.Verify Click Print Label


    Log    Step No.5 คลิกปุ่มพิมพ์
    # common.Robot Skip Step Print Label
    # Expected
    # dps_scan_page.Verify Print Label Success Popup
    # ...    ${dc_operation['text_print_label_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    5.Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    # dps_scan_page.Click Close Print Label Success Popup
    # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    6.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    #  dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    # dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    7.Verify History Parcel Page

    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    # dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_d}
    # dps_history_parcel_page.Click Edit History Parcel    ${tracking_d}
    # Switch Window    NEW
    # Defect201
    # Expected
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S005['timeline_in_history_parcel']}    4    #5
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    8.Verify Timeline


    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Defect141    Defect187
    # Expected
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S005.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    9.Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    9.Verify Data In All Task Tab 2

    Log    Step No.10 เลือกแท็บงานส่งออก
    # dps_home_page.Select Tab Export Task
    # Defect169
    # Expected
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S005.data_in_export_task_tab['export_to']}
    # ...    ${DC_Operation_S005.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_export_task_tab['parcel_owner']}

    Log    Step No.11 เข้าเมนู Scan และ เลือกแท็บ Scan out
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan Out Tab
    # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify Section Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['pouch_number']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['parcel_size']}
    # ...    16-11-2567
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['parcel_status']}

    Log    Step No.12 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ d" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    # dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_d}
    # dps_scan_page.Click Search Button [Scan Out Page]
    # Defect255
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
    # ...    ${DC_Operation_S007.scan_out_list_data['pouch_number']}
    # ...    ${tracking_d}
    # ...    คลัง DC BB    #${DC_Operation_S005.scan_out_list_data['receive_parcel_from']}
    # ...    ${DC_Operation_S005.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S005.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S005.scan_out_list_data['parcel_size']}
    # ...    20-11-2567
    # ...    ${DC_Operation_S005.scan_out_list_data['parcel_status']}

    Log    Step No.13 กดปุ่ม ยืนยัน Scan Out
    # dps_scan_page.Click Confirm Scan Out Button
    # Expected
    # dps_scan_page.Verify Popup Confirm Scan Out 
    # ...    ${dc_operation.scan_out_title['text_popup_comfirm']}

    Log    Step No.14 กดปุ่ม ยืนยัน
    # dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    # dps_scan_page.Verify Popup Save Data Success
    # ...    ${dc_operation['text_save_success']}

    Log    Step No.15 คลิกที่ Pop up
    # dps_scan_page.Click Popup Save Data Success
    # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab


    Log    Step No.16 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    # dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}

    Log    Step No.17 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    # dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_d}
    # dps_history_parcel_page.Click Edit History Parcel    ${tracking_d}
    # Switch Window    NEW
    # Expected
    # dps_history_parcel_page.Verify Timeline    ${DC_Operation_S005['timeline_in_history_parcel']}    5    #6


    Log    Step No.18 คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan Out Tab
    # dps_scan_page.Click Waiting Delivery List Button
    # Expected
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S005.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['transport']}
    # ...    20-11-2567    #${DC_Operation_S005.wait_derivery_data_list['date']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['status']}

    Log    Step No.19 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    # dps_wait_delivery.Click Print Button By Data
    # ...    ${DC_Operation_S005.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['transport']}
    # ...    20-11-2567    #${DC_Operation_S005.wait_derivery_data_list['date']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['status']}
    # sleep    5s

    Log    Step No.20 กดปุ่ม พิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Robot Skip Step Print Label
    # Expected
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S005.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['transport']}
    # ...    20-11-2567    #${DC_Operation_S005.wait_derivery_data_list['date']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['status_after_print']}
    # sleep    5s

    Log    Step No.21 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCSB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    # Defect256
    # Expected
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S005.data_in_all_task_tab['task_type']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_status']}

    Log    Step No.22 เลือกแท็บงานรับเข้า
    # dps_home_page.Select Tab Import Task
    # Defect188
    # Expected
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S005.data_in_import_task_tab['import_from']}
    # ...    ${DC_Operation_S005.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_import_task_tab['parcel_owner']}

    Log    Step No.23 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ d" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan In Tab
    # dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    # dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_d}
    # dps_scan_page.Click Search Button [Scan In Page]
    # sleep    5s
    # Expected
    # Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ROUTE    #${dc_operation.scan_in_title_parcel_detail['route']}

    # Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${EMPTY}    #${DC_Operation_S005.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    พัสดุถึงคลังปลายทาง    #${DC_Operation_S005.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    18-11-2567
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['send_parcel_to']}
    
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}

    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['customer2']}
    # ...    0900987354    # Expected Result is (เบอร์โทรที่ระบุในไฟล์ Excel Template ขั้นตอน Booking)
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['symbol']}

    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}

    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S005.scan_in_sender_data['name']}
    # ...    0959494989    # Expected Result is ${DC_Operation_S005.scan_in_sender_data['phone']}
    # ...    -    #${DC_Operation_S005.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['address']}

    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}

    # dps_scan_page.Verify Data Recevier In Scan Page
    # ...    ${DC_Operation_S005.scan_in_receiver_data['name']}
    # ...    0900987354    # ${DC_Operation_S005.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['address']}

    Log    Step No.24 คลิกปุ่ม ยืนยัน Scan in
    # dps_scan_page.Click Accept Scan In
    # Defect222
    # Expected
    # dps_scan_page.Verify Accept Scan In Success Popup
    # ...    ยืนยันรับเข้าพัสดุ เรียบร้อยแล้ว    # Expected is: ${dc_operation['text_accept_scan_in_success']}

    Log    Step No.25 คลิกที่ Pop up
    # dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab


    Log    Step No.26 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}   
    # Expected
    # dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}

    Log    Step No.27 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    # dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_d}
    # dps_history_parcel_page.Click Edit History Parcel    ${tracking_d}
    # Switch Window    NEW
    # Expected
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S005['timeline_in_history_parcel']}    7
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    Verify Timeline

    Log    Step No.28 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCSB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    # dps_home_page.Select Tab All Task
    # Expected
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    งานส่งออก    #${DC_Operation_S005.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    -    #${DC_Operation_S005.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to4']}    #${DC_Operation_S005.data_in_all_task_tab['export_to']}
    # ...    CP ALL    #${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    พัสดุ     #${DC_Operation_S005.data_in_all_task_tab['parcel_status4']}

    Log    Step No.29 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    dps_home_page.Verify Label In Send Task Tab
    ...    ${dc_operation.label_send_task_tab['send_to']}
    ...    ${dc_operation.label_send_task_tab['store_code']}
    ...    ${dc_operation.label_send_task_tab['customer_type']}
    ...    ${dc_operation.label_send_task_tab['transport']}
    ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    dps_home_page.Verify Data In Send Task Tab
    ...    ${DC_Operation_S005.data_in_send_task_tab['send_to']}
    ...    ${DC_Operation_S005.data_in_send_task_tab['store_code']}
    ...    ${EMPTY}    #${DC_Operation_S005.data_in_send_task_tab['customer_type']}
    ...    Flash    #${DC_Operation_S005.data_in_send_task_tab['transport']}
