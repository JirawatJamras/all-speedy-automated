*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

Library    OperatingSystem
Library    ExcelLibrary
Library    Collections

*** Variables ***   
${SHEET_NAME}    Tracking_S013   # ชื่อชีตที่ต้องการ
${ROW_NUMBER}    2      # แถวที่ต้องการลบ

*** Test Cases ***
DC_Operation_S013
    [Documentation]    ลูกค้า B (ส่งพัสดุที่ร้าน 7-11) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย Courier
    [Tags]    DC_Operation    UAT

    Log    Step No.1-16 Skip By Use Tracking From Excel
    
    Log    Read Row From Excel
    ${tracking_info}    common.Read Row From Excel    ${path_excel_tracking_number}    ${SHEET_NAME}    ${ROW_NUMBER}
    Log    ${tracking_info}
    
    Log    Set Tracking Information
    common.Set Tracking Information from excel    ${tracking_info}
    
    # Log    Delete Tracking From Excel
    # common.Delete Row In Excel    ${path_excel_tracking_number}    ${SHEET_NAME}    ${ROW_NUMBER}

    Log    Step No.17 เข้า Url : https://dps-uat.allspeedy.co.th
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    # Expected 
    dps_login_page.Verify Login Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Login Page
    
    Log    Step No.18 กรอกข้อมูล Login
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Homepage Title

    Log    Step No.19 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Select Tab All Task
    dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${tracking_number}
    # Defect138    Defect141
    # Inprogress
    # Expected
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Label In All Task Tab
    # ...    ${dc_operation.label_all_task_tab['task_type']}
    # ...    ${dc_operation.label_all_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_all_task_tab['import_from']}
    # ...    ${dc_operation.label_all_task_tab['export_to']}
    # ...    ${dc_operation.label_all_task_tab['transport']}
    # ...    ${dc_operation.label_all_task_tab['pouch_number']}
    # ...    ${dc_operation.label_all_task_tab['parcel_number']}
    # ...    ${dc_operation.label_all_task_tab['parcel_status']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    งานส่งออก    #for run same tracking# ${DC_Operation_S013.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S013.data_in_all_task_tab['parcel_owner']}
    # ...    -  # ${DC_Operation_S013.data_in_all_task_tab['import_from']}
    # ...    DC BB    #for run same tracking# ${DC_Operation_S013.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S013.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S013.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_number}
    # ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง  # ${DC_Operation_S013.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Homepage
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Data In All Task Tab

    Log    Step No.20 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Defect139
    # Inprogress
    # Expected
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
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Data In Import Task Tab

    Log    Step No.21 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_number}
    dps_scan_page.Click Search Button[Scan In Page]
    dps_home_page.Wait Until DC Operation Home Page Loaded
    Log    Delete Tracking From Excel
    common.Delete Row In Excel    ${path_excel_tracking_number}    ${SHEET_NAME}    ${ROW_NUMBER}
    # Defect158
    # Expected    
    # Inprogress
    # dps_home_page.Wait Until Page Loaded
    dps_scan_page.Verify Title Parcel Details In Scan Page Home Destination
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

    dps_scan_page.Verify Data Parcel Details In Scan Page Home Destination
    ...    ${tracking_number}
    ...    ${customer_id}
    ...    ${size_cm} ${size}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_status']}
    ...    ${courier}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['pouch_number']}
    ...    ${create_date}
    ...    ${origin_warehoues}
    ...    ${send_parcel_to}
    # Old
    # dps_scan_page.Verify Data Parcel Details In Scan Page Home Destination
    # ...    ${tracking_number}
    # ...    B2C0002400563    # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['customer_id']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_size']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_status']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['courier']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['pouch_number']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['receiving_date']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['origin_warehoues']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['send_parcel_to']}
    
    dps_scan_page.Verify Title Label Parcel In Scan Page [Other Courier]
    ...    ${dc_operation.scan_in_title_label_detail['courier']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}

    dps_scan_page.Verify Data Label Parcel In Scan Page [Other Courier]
    ...    FLS    #${courier_label}
    ...    ${zipcode_label} 
    ...    ${customer_label}
    ...    ${phone_label}

    # Old
    # dps_scan_page.Verify Data Label Parcel In Scan Page [Other Courier]
    # ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['courier']}
    # ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['zipcode']} 
    # ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['customer']}
    # ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['size_home']}    
    # ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['size']}

    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${sender_name}
    ...    ${sender_phone}
    ...    ${sender_shipping_origin}
    ...    ${sender_address}
    # Old
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['name']}
    # ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['phone']}
    # ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['shipping_origin']}
    # ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['address']}

    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ${receiver_name}
    ...    ${receiver_phone}
    ...    ${receiver_shipping_destination}
    ...    ${receiver_address}
    # Old
    # dps_scan_page.Verify Data Recevier In Scan Page
    # ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['name']}
    # ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['phone']}
    # ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['shipping_destination']}
    # ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Sender Data In Scan In

    Log    Step No.22 คลิกปุ่ม ยืนยัน/Print Label
    dps_parcel_detail_page.Click Print Label

    Log    Step No.23 คลิกปุ่มพิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # dps_parcel_detail_page.Click ESC On Keyboard
    Switch Window    NEW
    Press Keys    None    TAB+SPACE
    Switch Window    MAIN    
    # Expected
    dps_parcel_detail_page.Verify Print Label Success Popup
    ...    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Print Label Success Popup

    Log    Step No.24 คลิกที่ x Pop up
    dps_scan_page.Click Close Popup Print Scan In Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.25 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    # Expected
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Label In All Task Tab
    # ...    ${dc_operation.label_all_task_tab['task_type']}
    # ...    ${dc_operation.label_all_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_all_task_tab['import_from']}
    # ...    ${dc_operation.label_all_task_tab['export_to']}
    # ...    ${dc_operation.label_all_task_tab['transport']}
    # ...    ${dc_operation.label_all_task_tab['pouch_number']}
    # ...    ${dc_operation.label_all_task_tab['parcel_number']}
    # ...    ${dc_operation.label_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Homepage 2
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Data In All Task Tab 2

    Log    Step No.26 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Defect
    # Expected
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # Expected not correct
    # dps_home_page.Verify Data In Export Task Tab
    # ...    DCSB  # ${DC_Operation_S013.data_in_export_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S013.data_in_export_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S13.data_in_export_task_tab['parcel_owner']}

    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Data In Export Task Tab


    Log    Step No.27 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_scan_page.Select Scan Out Tab
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify Section Waiting List To Scan Out [Scan Out Page]
    # ...    ${DC_Operation_S013.scan_out_waiting_scan['tracking']}
    # ...    ${DC_Operation_S013.scan_out_waiting_scan['pouch_number']}
    # ...    คลัง DC BB    #${DC_Operation_S013.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S013.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S013.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S013.scan_out_waiting_scan['parcel_size']}
    # ...    ${DC_Operation_S013.scan_out_waiting_scan['update_date']}
    # ...    ${DC_Operation_S013.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Section Waiting List To Scan Out [Scan Out Page] 2


    Log    Step No.28 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${tracking_number}
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
    ...    ${DC_Operation_S013.scan_out_waiting_scan['pouch_number']}
    ...    ${tracking_number}
    ...    คลัง DC BB    # ${DC_Operation_S013.scan_out_waiting_scan['receive_parcel_from']}
    ...    ${DC_Operation_S013.scan_out_waiting_scan['transport']}
    ...    ${DC_Operation_S013.scan_out_waiting_scan['parcel_owner']}
    ...    ${DC_Operation_S013.scan_out_waiting_scan['parcel_size']}
    ...    2024-11-14    #${DC_Operation_S013.scan_out_waiting_scan['update_date']}
    ...    ${DC_Operation_S013.scan_out_waiting_scan['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S013    Verify Value List Scan Out 


    Log    Step No.29 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out

    Log    Step No.30 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out 
    # Expected
    dps_scan_page.Verify Popup Save Data Success

    Log    Step No.31 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success 
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab

    Log    Step No.32 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # Waiting Step

    Log    Step No.33 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    # Waiting Step

    Log    Step No.34 คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_scan_page.Click Waiting Delivery List Button 
    # Expected

    Log    Step No.35 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    #In progress 
    dps_scan_page.Click Print Button By Data
    ...    ${DC_Operation_S013.scan_out_print['export_to']}
    ...    ${DC_Operation_S013.scan_out_print['deliver']}
    # ...    ${DC_Operation_S013.scan_out_print['parcel_amount']}
    # ...    ${DC_Operation_S013.scan_out_print['pouch_amount']}
    # ...    ${DC_Operation_S013.scan_out_print['total_parcel_pouch']}
    # Expected

    Log    Step No.36 กดปุ่ม พิมพ์
    common.Click ESC On Keyboard
    # Expected




