*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S017
    [Documentation]    คลัง Dry การ Reprint ใบปะหน้าพัสดุ กรณีไม่แก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in
    [Tags]    DC_Operation    Dry_Reprint_Label    UAT    Defect155    Defect209    Defect219    Defect223    Defect260

    Log    Prerequisite S002
    prerequisite.DC_Operation_S002

    Log    Login
    ${tracking_i}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S017['sender_name']}
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    1.Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น RDC LP ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 2-5
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory [Reprint Label]
    ...    ${DC_Operation_S017.check_close_pouch['inventory']}
    ...    ${dc_operation['text_warning_confirm_to_close_pouch']}
    ...    ${dc_operation['text_transaction_complete']}
    ...    DC_Operation_S017

    Log    Step No.6 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_i}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Create Pouch Popup Confirmation
    ...    ${dc_operation.create_pouch_confirmation['text_create_pouch']}
    ...    ${dc_operation.create_pouch_confirmation['title_destination_pouch']}
    ...    ${dc_operation.create_pouch_confirmation['value_destination_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    6.Verify Create Pouch Destination DCSB Popup

    Log    Step No.7 คลิกปุ่ม "ยืนยัน"
    dps_scan_page.Click Confirm Button To Create Pouch Popup Confirmation
    Sleep  5s
    ${pouch_number}    Get Pouch Number And Verify Pouch Format
    Set Today
    # Expected
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
    ...    ${dc_operation.scan_in_title_parcel_detail['route']}   
    dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    ...    ${tracking_i}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['crossdock_warehouse']}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['destination_warehouse']}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['parcel_status']}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['courier']}
    ...    ${pouch_number}
    ...    ${today}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['origin_warehouse']}
    ...    ${DC_Operation_S017.scan_in_data_parcel_detail['send_parcel_to']}
    dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    ...    ${dc_operation.scan_in_title_label_detail['route']}
    ...    ${dc_operation.scan_in_title_label_detail['store']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S017.scan_in_data_label_detail['store_code']}
    ...    ${DC_Operation_S017.scan_in_data_label_detail['customer']}
    ...    ${DC_Operation_S017.scan_in_data_label_detail['phone']}
    ...    ${pouch_number}
    ...    ${DC_Operation_S017.scan_in_data_label_detail['wh']}
    ...    ${DC_Operation_S017.scan_in_data_label_detail['symbol']}
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S017.scan_in_sender_data['name']}
    ...    ${DC_Operation_S017.scan_in_sender_data['phone']}
    ...    ${DC_Operation_S017.scan_in_sender_data['shipping_origin']}
    ...    ${DC_Operation_S017.scan_in_sender_data['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Receiver In Scan Page
    ...    ${DC_Operation_S017.scan_in_receiver_data['name']}
    ...    ${DC_Operation_S017.scan_in_receiver_data['phone']}
    ...    ${DC_Operation_S017.scan_in_receiver_data['shipping_destination']}
    ...    ${DC_Operation_S017.scan_in_receiver_data['address']}
    common.Scroll Window To Vertical    425
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    7.Verify Parcel Details After Scanning

    Log    Step No.8 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label
    
    Log    Step No.9 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    9.Verify Print Label Success Popup

    Log    Step No.10 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    10.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.11 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    ${tracking_i}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    11.Verify Data In Table

    Log    Step No.12 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    Set Today
    ${today_repattern}    Set Date Pattern    ${today}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline In Warehouse Details    ${dc_operation.label_parcel_details_in_warehouse['timeline']}
    dps_history_parcel_page.Verify Title Parcel Details In Warehouse Details  
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_detail']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['tracking_number']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_status']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['customer_type']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['pouch_number']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_size']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['route']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['check_in_date']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['date_in_system']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['sla_date']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['sla_text']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['origin_store']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['destination_store']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['shipping_by']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Data Parcel Details In Warehouse Details
    ...    ${tracking_i}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['parcel_status']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['customer_type']}
    ...    ${pouch_number}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['parcel_size']}
    ...    ${today_repattern}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['shipping_by']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Sender In Warehouse Details
    ...    ${DC_Operation_S017.value_sender_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_sender_in_warehouse['phone']}
    ...    ${DC_Operation_S017.value_sender_in_warehouse['address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Receiver In Warehouse Details
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['phone']}
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    12.Verify Parcel Details In Warehouse
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    12.Verify Sender And Receiver In Warehouse

    Log    Step No.13 คลิกปุ่ม Dropdown Reprint
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Dropdown
    ...    ${dc_operation.dropdown_reprint_label['parcel_label']}
    ...    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    ...    ${pouch_number}
    ...    ${dc_operation.dropdown_reprint_label['pouch_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    13.Verify Reprint Label Dropdown

    Log    Step No.14 คลิกที่ใบปะหน้าพัสดุ
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_label']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    14.Verify Reprint Parcel Label

    Log    Step No.15 คลิกที่ใบคัดแยกพัสดุ
    dps_history_parcel_page.Click Cancel Reprint Label Button    ${dc_operation.card_reprint_label['text_parcel_label']}
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    15.Verify Reprint Parcel Sorting Sheet

    Log    Step No.16 คลิกที่ใบ Label Pouch
    dps_history_parcel_page.Click Cancel Reprint Label Button    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['pouch_label']}
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    16.Verify Popup Error When Click Print Pouch Label And Pouch Is Not Closed
    Close Window
    Switch Window    MAIN

    Log    Step No.17 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    # Expected
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S017.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_list['status']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    17.Verify Pouch In Pouch Page

    Log    Step No.18 คลิกที่ไอคอนรูปดินสอ
    dps_pouch_page.Proceed Pouch By Pouch Number    ${pouch_number}
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
    ...    ${DC_Operation_S017.data_in_pouch_detail['crossdock_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_detail['pouch_status']}
    ...    ${DC_Operation_S017.data_in_pouch_detail['origin_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_detail['destination_warehouse']}
    dps_pouch_page.Verify Label Section In Pouch Detail Popup
    ...    ${DC_Operation_S017.data_in_pouch_detail['label_destination_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_detail['label_number']}
    ...    ${DC_Operation_S017.data_in_pouch_detail['label_route']}
    ...    ${DC_Operation_S017.data_in_pouch_detail['label_symbol']}
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
    ...    ${tracking_i}
    ...    ${DC_Operation_S017.data_in_pouch_detail.data_in_table['destination_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_detail.data_in_table['pickup_place']}
    ...    ${DC_Operation_S017.data_in_pouch_detail.data_in_table['type']}
    ...    ${DC_Operation_S017.data_in_pouch_detail.data_in_table['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    18.Verify Pouch Detail Popup

    Log    Step No.19 คลิกปุ่มปิด Pouch/Print Label
    dps_pouch_page.Click Print Pouch Label
    # Expected
    dps_pouch_page.Verify Warning Confirm To Close Pouch    ${dc_operation['text_warning_confirm_to_close_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    19.Verify Warning Confirm To Close Pouch

    Log    Step No.20 ปิด Pouch/Print Label
    dps_pouch_page.Click Close Pouch/Print Label Button On Warning Popup

    Log    Step No.21 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_pouch_page.Verify Transaction Complete Popup    ${dc_operation['text_transaction_complete']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    21.Verify Transaction Complete Popup

    Log    Step No.22 กดปุ่ม x
    dps_pouch_page.CLick Close Button
    # Expected
    Reload Page
    dps_pouch_page.Verify Transaction Complete Popup Was Closed
    dps_pouch_page.Verify Navigate To Pouch Page Success
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S017.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S017.data_in_pouch_list['status_off']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    22.Verify Transaction Complete Popup Was Closed

    Log    Step No.23 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    ${tracking_i}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    23.Verify Data In Table After Close Pouch

    Log    Step No.24 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline In Warehouse Details    ${dc_operation.label_parcel_details_in_warehouse['timeline']}
    dps_history_parcel_page.Verify Title Parcel Details In Warehouse Details  
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_detail']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['tracking_number']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_status']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['customer_type']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['pouch_number']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_size']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['route']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['check_in_date']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['date_in_system']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['sla_date']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['sla_text']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['origin_store']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['destination_store']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['shipping_by']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Data Parcel Details In Warehouse Details
    ...    ${tracking_i}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['parcel_status']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['customer_type']}
    ...    ${pouch_number}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['parcel_size']}
    ...    ${today_repattern}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['shipping_by']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Sender In Warehouse Details
    ...    ${DC_Operation_S017.value_sender_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_sender_in_warehouse['phone']}
    ...    ${DC_Operation_S017.value_sender_in_warehouse['address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Receiver In Warehouse Details
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['phone']}
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    24.Verify Parcel Details In Warehouse After Close Pouch
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    24.Verify Sender And Receiver In Warehouse After Close Pouch

    Log    Step No.25 คลิกปุ่ม Dropdown Reprint
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Dropdown
    ...    ${dc_operation.dropdown_reprint_label['parcel_label']}
    ...    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    ...    ${pouch_number}
    ...    ${dc_operation.dropdown_reprint_label['pouch_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017   25.Verify Reprint Label Dropdown After Close Pouch

    Log    Step No.26 คลิกที่ใบ Label Pouch
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['pouch_label']}
    # Expected
    dps_history_parcel_page.Verify Reprint Pouch Label Popup
    ...    ${dc_operation.card_reprint_label['text_pouch_label']}
    ...    ${DC_Operation_S017.data_in_pouch_label['destination_warehourse']}
    ...    ${DC_Operation_S017.data_in_pouch_label['route']}
    ...    ${DC_Operation_S017.data_in_pouch_label['destination_warehourse_symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    26.Verify Reprint Pouch Label