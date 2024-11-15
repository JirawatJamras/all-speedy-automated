*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S017
    [Documentation]    คลัง Dry การ Reprint ใบปะหน้าพัสดุ กรณีไม่แก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in
    [Tags]    DC_Operation    UAT
    ${tracking_i}=    Set Variable    SPBD241100010275
    ${pouch_number}=    Set Variable    P112442823

    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    # dps_home_page.Click Dropdown For Select Role
    # dps_home_page.Select Role    ${dc_operation.role['admin']}

    Sleep    5s
    Go To    https://dps-uat.allspeedy.co.th/pouch
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น RDC LP ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 2-5
    # dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory    ${DC_Operation_S017.check_close_pouch['inventory']}    DC_Operation_S017

    Log    Step No.6 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan In Tab
    # dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100010314
    # dps_scan_page.Click Search Button [Scan In Page]
    # Sleep  5s
    # ${pouch_number}    Get Pouch Number
    # # Defect143
    # # Expected
    # # Verify Create Pouch Destination DCSB Popup
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Create Pouch Destination DCSB Popup

    Log    Step No.7 คลิกปุ่มตกลง
    # # # Defect143    Defect155    Defect156    Defect158    Defect159    Defect165    Defect168    Defect171
    # # # Click Accept    
    # # # Expected
    # # # รอโค้ด verify จากพี่พี

    Log    Step No.8 คลิกปุ่ม ยืนยัน/Print Label
    # dps_parcel_detail_page.Click Print Label
    
    Log    Step No.9 คลิกปุ่มพิมพ์
    # # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # # Defect142
    # # Expected
    # # dps_parcel_detail_page.Verify Print Label Success Popup
    # # ...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Print Label Success Popup

    # # Defect145    Unable to click on popup, but anable to click on close button (X) to close popup.
    Log    Step No.10 คลิกที่ x Pop up
    # dps_parcel_detail_page.Click Close Print Label Success Popup
    # # # Expected
    # # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.11 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    ${tracking_i}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Data In Table

    Log    Step No.12 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Defect209    Defect210
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
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['route']}
    ...    14/11/2567 14:21
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['date_in_system']}
    ...    16/11/2567
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['sla_text']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    CP ALL  # ${DC_Operation_S017.value_parcel_details_in_warehouse['shipping_by']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Sender In Warehouse Details
    ...    ${DC_Operation_S017.value_sender_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_sender_in_warehouse['phone']}
    ...    ลำพยา เมืองนครปฐม นครปฐม 73000  # ${DC_Operation_S017.value_sender_in_warehouse['address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Receiver In Warehouse Details
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['phone']}
    ...    01015 สาขา เวียงป่าเป้า เวียง เวียงป่าเป้า เชียงราย 57170  # ${DC_Operation_S017.value_receiver_in_warehouse['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Parcel Details In Warehouse
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Sender And Receiver In Warehouse

    Log    Step No.13 คลิกปุ่ม Dropdown Reprint
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Dropdown
    ...    ${dc_operation.dropdown_reprint_label['parcel_label']}
    ...    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    ...    ${dc_operation.dropdown_reprint_label['pouch_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017   Verify Reprint Label Dropdown

    Log    Step No.14 คลิกที่ใบปะหน้าพัสดุ
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_label']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017   Verify Reprint Parcel Label

    Log    Step No.15 คลิกที่ใบคัดแยกพัสดุ
    dps_history_parcel_page.Click Cancel Reprint Label Button    ${dc_operation.card_reprint_label['text_parcel_label']}
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017   Verify Reprint Parcel Sorting Sheet

    Log    Step No.16 คลิกที่ใบ Label Pouch
    dps_history_parcel_page.Click Cancel Reprint Label Button    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['pouch_label']}
    # Defect219
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017   Verify Popup Error When Click Print Pouch Label And Pouch Is Not Closed

    Log    Step No.17 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    Close Window
    Switch Window    MAIN
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    # Expected
    # dps_pouch_page.Verify Pouch In Pouch Page
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S017.data_in_pouch_list['crossdock_warehouse']}
    # ...    ${DC_Operation_S017.data_in_pouch_list['destination_warehouse']}
    # ...    ${DC_Operation_S017.data_in_pouch_list['status']}
    # ...    14-11-2567
    # ...    ${dc_operation['icon_pencil']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Pouch In Pouch Page

    Log    Step No.18 คลิกที่ไอคอนรูปดินสอ
    # dps_pouch_page.Proceed Pouch By Pouch Number    ${pouch_number}
    # Expected
    # dps_pouch_page.Verify Label Of Information Section In Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['crossdock_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_status']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['parcel_amount']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['destination_warehouse']}

    Log    Step No.19 คลิกปุ่มปิด Pouch/Print Label

    Log    Step No.20 ปิด Pouch/Print Label

    Log    Step No.21 คลิกปุ่มพิมพ์

    Log    Step No.22 กดปุ่ม x

    Log    Step No.23 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    ${tracking_i}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Data In Table After Close Pouch

    Log    Step No.24 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Defect209    Defect210
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
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['route']}
    ...    14/11/2567 14:21
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['date_in_system']}
    ...    16/11/2567
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['sla_text']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_store']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    CP ALL  # ${DC_Operation_S017.value_parcel_details_in_warehouse['shipping_by']}
    ...    ${DC_Operation_S017.value_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Sender In Warehouse Details
    ...    ${DC_Operation_S017.value_sender_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_sender_in_warehouse['phone']}
    ...    ลำพยา เมืองนครปฐม นครปฐม 73000  # ${DC_Operation_S017.value_sender_in_warehouse['address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Receiver In Warehouse Details
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['name']}
    ...    ${DC_Operation_S017.value_receiver_in_warehouse['phone']}
    ...    01015 สาขา เวียงป่าเป้า เวียง เวียงป่าเป้า เชียงราย 57170  # ${DC_Operation_S017.value_receiver_in_warehouse['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Parcel Details In Warehouse After Close Pouch
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Sender And Receiver In Warehouse After Close Pouch

    Log    Step No.25 คลิกปุ่ม Dropdown Reprint
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Dropdown
    ...    ${dc_operation.dropdown_reprint_label['parcel_label']}
    ...    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    ...    ${dc_operation.dropdown_reprint_label['pouch_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017   Verify Reprint Label Dropdown After Close Pouch

    Log    Step No.26 คลิกที่ใบ Label Pouch
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['pouch_label']}
    # Expected
    dps_history_parcel_page.Verify Reprint Pouch Label Popup
    ...    ${dc_operation.card_reprint_label['text_pouch_label']}
    ...    ${DC_Operation_S017.data_in_pouch_label['destination_warehourse']}
    ...    ${DC_Operation_S017.data_in_pouch_label['route']}
    ...    ${DC_Operation_S017.data_in_pouch_label['destination_warehourse_symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Reprint Pouch Label
    