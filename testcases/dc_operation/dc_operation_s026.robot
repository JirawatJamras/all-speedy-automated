*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_s026
    [Documentation]    การนำพัสดุใส่ Pouch และนำออกจาก Pouch แบบ Manual ในขั้นตอนการ Scan in 
    [Tags]    DC_Operation    Pouch    UAT    Defect155    Defect209    Defect219    Defect227    Defect249
    Log    Prerequisite S002
    prerequisite.DC_Operation_S002

    ${tracking_j}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S026['sender_name']}
    ${today_repattern}    Set Date Pattern    ${today}

    Log    Login
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนู Scan ,กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ j", กดค้นหา
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_j}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_home_page.Wait Until Page Loaded
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
    ...    ${tracking_j}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['crossdock_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['destination_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_status']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['courier']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['pouch_number']}
    ...    ${today}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['origin_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['send_parcel_to']}
    dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    ...    ${dc_operation.scan_in_title_label_detail['route']}
    ...    ${dc_operation.scan_in_title_label_detail['store']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S026.scan_in_data_label_detail['store']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['customer']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['phone']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['pouch_number']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['wh']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    1.Data Parcel Details In Scan Page
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S026['sender_name']}
    ...    ${DC_Operation_S026.scan_in_sender_data['phone']}
    ...    ${DC_Operation_S026.scan_in_sender_data['shipping_origin']}
    ...    ${DC_Operation_S026.scan_in_sender_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    1.Data Sender Details In Scan Page
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Receiver In Scan Page
    ...    ${DC_Operation_S026.scan_in_receiver_data['name']}
    ...    ${DC_Operation_S026.scan_in_receiver_data['phone']}
    ...    ${DC_Operation_S026.scan_in_receiver_data['shipping_destination']}
    ...    ${DC_Operation_S026.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    1.Data Receiver Details In Scan Page

    Log    Step No.2 คลิกปุ่ม "สร้าง" บริเวณกล่อง Pouch
    dps_scan_page.Click Create Pouch Button
    # Expected
    dps_scan_page.Verify Create Pouch Popup
    ...    ${DC_Operation_S026.pouch['origin_warehouse']}
    ...    ${DC_Operation_S026.pouch['destination_warehouse']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    2.Verify Create Pouch Popup

    Log    Step No.3 คลิกปุ่มตกลง
    dps_scan_page.Click Confirm Button To Create Pouch
    ${pouch_number}    Get Pouch Number In Scan Page 
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    3.Verify Pouch Detail In Scan Page

    Log    Step No.4 คลิกที่กล่อง Pouch
    dps_scan_page.Click Pouch Box    ${pouch_number}    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S026.pouch['number_of_parcel']}
    dps_scan_page.Verify Pouch Number Data Parcel Details In Scan Page [CP All Courier]    ${pouch_number}
    dps_scan_page.Verify Pouch Number Data Label Parcel In Scan Page [CP All Courier]    ${pouch_number}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    4.Verify Parcel Details After Click Pouch Box 1st Time

    Log    Step No.5 คลิกที่กล่อง Pouch ครั้งที่ 2
    dps_scan_page.Click Pouch Box    ${pouch_number}    ${DC_Operation_S026.pouch['number_of_parcel']}
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    5.Verify Pouch Detail After Click Pouch Box 2nd Time
    Scroll Window To Vertical    0
    dps_scan_page.Verify Pouch Number Data Parcel Details In Scan Page [CP All Courier]    ${DC_Operation_S026.scan_in_data_parcel_detail['pouch_number']}
    dps_scan_page.Verify Pouch Number Data Label Parcel In Scan Page [CP All Courier]    ${DC_Operation_S026.scan_in_data_parcel_detail['pouch_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    5.Verify Parcel Details After Click Pouch Box 2nd Time

    Log    Step No.6 คลิกที่กล่อง Pouch ครั้งที่ 3
    dps_scan_page.Click Pouch Box    ${pouch_number}    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S026.pouch['number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    6.Verify Pouch Detail After Click Pouch Box 3rd Time
    Scroll Window To Vertical    0
    dps_scan_page.Verify Pouch Number Data Parcel Details In Scan Page [CP All Courier]    ${pouch_number}
    dps_scan_page.Verify Pouch Number Data Label Parcel In Scan Page [CP All Courier]    ${pouch_number}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    6.Verify Parcel Details After Click Pouch Box 3rd Time

    Log    Step No.7 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.8 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    8.Verify Print Label Success Popup

    Log    Step No.9 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    9.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.10 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_j}
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    ${tracking_j}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    10.Verify Data In Table

    Log    Step No.11 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_j}
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
    ...    ${tracking_j}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['parcel_status']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['customer_type']}
    ...    ${pouch_number}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['parcel_size']}
    ...    ${today_repattern}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['origin_store']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['destination_store']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['shipping_by']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Sender In Warehouse Details
    ...    ${DC_Operation_S026.value_sender_in_warehouse['name']}
    ...    ${DC_Operation_S026.value_sender_in_warehouse['phone']}
    ...    ${DC_Operation_S026.value_sender_in_warehouse['address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Receiver In Warehouse Details
    ...    ${DC_Operation_S026.value_receiver_in_warehouse['name']}
    ...    ${DC_Operation_S026.value_receiver_in_warehouse['phone']}
    ...    ${DC_Operation_S026.value_receiver_in_warehouse['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    11.Verify Parcel Details In Warehouse
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    11.Verify Sender And Receiver In Warehouse

    Log    Step No.12 คลิกปุ่ม Dropdown Reprint
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Dropdown
    ...    ${dc_operation.dropdown_reprint_label['parcel_label']}
    ...    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    ...    ${pouch_number}
    ...    ${dc_operation.dropdown_reprint_label['pouch_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026   12.Verify Reprint Label Dropdown

    Log    Step No.13 คลิกที่ใบคัดแยกพัสดุ
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026   13.Verify Reprint Parcel Sorting Sheet

    Log    Step No.14 คลิกที่ใบ Label Pouch
    dps_history_parcel_page.Click Cancel Reprint Label Button    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['pouch_label']}
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026   14.Verify Popup Error When Click Print Pouch Label And Pouch Is Not Closed
