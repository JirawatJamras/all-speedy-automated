*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    Reset Cut Off Time
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_s026
    [Tags]    DC_Operation    UAT    test
    Log    Prerequisite S002
    Log    Step Login All Speedy
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    Log    Step เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    Log    Step คลิกปุ่ม +เพิ่ม
    b2c_call_car_pick_up_parcel_page.Click Add Button
    Log    Step ระบุข้อมูล
    ${tomorrow}    Set Tomorrow Date
    ${today}    Set Today
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${DC_Operation_S002['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${DC_Operation_S002['parcel_pickup_time']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    Log    Step เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_home_page.Click Book Parcel Delivery    
    Log    Step คลิกปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add   
    Log    Step กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    Log    Step กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${DC_Operation_S002['parcel_type']}
    Log    Step คลิกปุ่ม x เพื่อปิด popup
    b2c_booking_delivery_page.Click Close X Popup
    Log    Step คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_booking_detail_page.Click Edit Booking List
    Log    Step คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    b2c_booking_detail_page.Select Pickup Schedule Tab
    b2c_booking_detail_page.Verify Display Pickup Schedule Data
    ...    ${DC_Operation_S002.receiving_cycle['car_type']}
    ...    ${tomorrow}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${today}
    ...    ${call_car_pick_up.default['price']}
    Log    Step เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    b2c_booking_detail_page.Select Parcel Pickup Schedule
    b2c_booking_detail_page.Click Save Button In Edit Booking List Popup
    ${booking_id}    Get Booking ID
    Log To Console    ${booking_id}
    Log    Step คลิกปุ่ม Import File
    b2c_booking_detail_page.Click Import File Button
    Log    Step เลือกไฟล์ "Booking Dry Template Test DC"
    b2c_booking_detail_page.Import Excel File Of Dry Parcel Template    ${path_excel_booking_dry_template}
    b2c_booking_detail_page.Verify Booking Detail Page After Import File
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${call_car_pick_up.text_parcel_id_start_with['dry']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    Log    เก็บ parcel id และ ชื่อผู้ส่ง
    ${ParcelsData}    Get Parcels And Sender Names    ${booking_id}
    Log To Console    ${ParcelsData}
    Log    Step cut off time
    dps_home_page.Set Cut Off Time
    ...    ${DB_URI}
    ...    ${DATABASE_NAME}
    ...    ${COLLECTION}
    ...    ${QUERY}
    Reload Page
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Status After Cut Off Time
    ...    ${call_car_pick_up.status['arrange_car']}
    ...    ${tomorrow}
    ...    ${today}
    ...    ${booking_id}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S002['verify_pickup_time']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}

    Log    Step เปิด URL DPS
    Go To    ${DPS_UAT_URL}
    Log    Step Login DPS
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    Log    Step เลือก role แอดมินคลัง
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    dps_home_page.Verify Role Change In Profile    ${dc_operation.role['admin']}
    Log    Step เลือกเมนู "ตรวจสอบรอบเข้ารับพัสดุ"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['check_receiving_cycle']}  
    Log    Step คลิกแท็บ "รายการรอคลังยืนยัน"
    dps_check_receiving_cycle_page.Select Waiting Inventory Confirm List Tab
    dps_check_receiving_cycle_page.Verify Inventory Confirm List Tab 
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['waiting_inventory_confirm_list']}
    ...    ${DC_Operation_S002.receiving_cycle['company_name']}   
    ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S002.receiving_cycle['district']}
    ...    ${DC_Operation_S002.receiving_cycle['province']}
    ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S002.receiving_cycle['courier']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['waiting']}
    Log    Step คลิกไอคอนรูปดินสอ ด้านขวาสุดของรายการ
    dps_check_receiving_cycle_page.Click Pencil Icon    ${booking_id}
    Log    Step คลิกปุ่ม อนุมัติ
    dps_check_receiving_cycle_page.Click Approve Button On Parcel Pickup Details Popup
    dps_check_receiving_cycle_page.Verify Data Saved Success Popup
    ${parcel_code_J}    Get Parcel Codes By Sender Name    ${ParcelsData}    ${DC_Operation_S026['sender_name']}
    Log To Console    ${parcel_code_J}

    Log    Step No.1 เข้าเมนู Scan ,กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ j", กดค้นหา
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${parcel_code_J}
    dps_scan_page.Click Search Button [Scan In Page]
    # Defect158
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
    ...    ROUTE    # Expected Result is ${dc_operation.scan_in_title_parcel_detail['route']}
    dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    ...    ${parcel_code_J}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['crossdock_warehouse']}
    ...    RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['destination_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_status']}
    ...    CP ALL    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['courier']}
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
    ...    DC BB - AC - RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_label_detail['wh']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Data Parcel Details In Scan Page
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # Defect155
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S026['sender_name']}
    ...    ${DC_Operation_S026.sender_data_in_scan_in_tab['phone']}
    ...    -  ##${DC_Operation_S026.sender_data_in_scan_in_tab['shipping_origin']}
    ...    ${DC_Operation_S026.sender_data_in_scan_in_tab['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Data Sender Details In Scan Page
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ${DC_Operation_S026.receiver_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S026.receiver_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S026.receiver_data_in_scan_in_tab['shipping_destination']}
    ...    ${DC_Operation_S026.receiver_data_in_scan_in_tab['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Data Recevier Details In Scan Page

    Log    Step No.2 คลิกปุ่ม "สร้าง" บริเวณกล่อง Pouch
    dps_scan_page.Click Create Pouch Button
    # Defect227  ขาด pouch number ยังไม่ได้เขียน verify
    # Expected
    dps_scan_page.Verify Create Pouch Popup
    ...    DC BB  #${DC_Operation_S026.scan_in_data_parcel_detail['origin_warehouse']}
    ...    RDC LP  #${DC_Operation_S026.scan_in_data_parcel_detail['destination_warehouse']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Create Pouch Popup

    Log    Step No.3 คลิกปุ่มตกลง
    dps_scan_page.Click Confirm Button To Create Pouch
    ${pouch_number}    Get Pouch Number In Scan Page
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Pouch Detail In Scan Page

    Log    Step No.4 คลิกที่กล่อง Pouch
    dps_scan_page.Click Pouch Box    ${pouch_number}    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S026.pouch['number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Pouch Detail After Click Pouch Box 1st time
    Scroll Window To Vertical    0
    dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    ...    ${parcel_code_J}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['crossdock_warehouse']}
    ...    RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['destination_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_status']}
    ...    CP ALL    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['courier']}
    ...    ${pouch_number}
    ...    ${today}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['origin_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['send_parcel_to']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S026.scan_in_data_label_detail['store']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['customer']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['phone']}
    ...    ${pouch_number}
    ...    DC BB - AC - RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_label_detail['wh']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Parcel Details After Click Pouch Box 1st time

    Log    Step No.5 คลิกที่กล่อง Pouch ครั้งที่ 2
    dps_scan_page.Click Pouch Box    ${pouch_number}    ${DC_Operation_S026.pouch['number_of_parcel']}
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Pouch Detail After Click Pouch Box 2nd time
    Scroll Window To Vertical    0
    dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    ...    ${parcel_code_J}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['crossdock_warehouse']}
    ...    RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['destination_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_status']}
    ...    CP ALL    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['courier']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['pouch_number']}
    ...    ${today}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['origin_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['send_parcel_to']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S026.scan_in_data_label_detail['store']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['customer']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['phone']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['pouch_number']}
    ...    DC BB - AC - RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_label_detail['wh']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Parcel Details After Click Pouch Box 2nd time

    Log    Step No.6 คลิกที่กล่อง Pouch ครั้งที่ 3
    dps_scan_page.Click Pouch Box    ${pouch_number}    ${dc_operation.label_pouch_detail['default_number_of_parcel']}
    # Expected
    dps_scan_page.Verify Pouch Detail In Scan Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S026.pouch['number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Pouch Detail After Click Pouch Box 3rd time
    Scroll Window To Vertical    0
    dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    ...    ${parcel_code_J}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['customer_id']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_size']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['crossdock_warehouse']}
    ...    RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['destination_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['parcel_status']}
    ...    CP ALL    # Expected Result is ${DC_Operation_S026.scan_in_data_parcel_detail['courier']}
    ...    ${pouch_number}
    ...    ${today}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['origin_warehouse']}
    ...    ${DC_Operation_S026.scan_in_data_parcel_detail['send_parcel_to']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S026.scan_in_data_label_detail['store']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['customer']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['phone']}
    ...    ${pouch_number}
    ...    DC BB - AC - RDC LP    # Expected Result is ${DC_Operation_S026.scan_in_data_label_detail['wh']}
    ...    ${DC_Operation_S026.scan_in_data_label_detail['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Parcel Details After Click Pouch Box 3rd time

    Log    Step No.7 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.8 คลิกปุ่มพิมพ์
    # common.Click ESC On Keyboard
    Switch Window  NEW
    Press Keys  None  TAB+SPACE
    Switch Window  MAIN
    # Expected
    dps_scan_page.Verify Print Label Success Popup
    ...    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Print Label Success Popup

    Log    Step No.9 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.10 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    ${parcel_code_J}
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    ${parcel_code_J}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Data In Table

    Log    Step No.11 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Click Edit History Parcel    ${parcel_code_J}
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
    ...    ${parcel_code_J}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['parcel_status']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['customer_type']}
    ...    ${pouch_number}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['parcel_size']}
    ...    ${today_repattern}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['origin_store']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['destination_store']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    CP ALL  # ${DC_Operation_S026.value_parcel_details_in_warehouse['shipping_by']}
    ...    ${DC_Operation_S026.value_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Sender In Warehouse Details
    ...    ${DC_Operation_S026.value_sender_in_warehouse['name']}
    ...    ${DC_Operation_S026.value_sender_in_warehouse['phone']}
    ...    ลำพยา เมืองนครปฐม นครปฐม 73000  # ${DC_Operation_S026.value_sender_in_warehouse['address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Receiver In Warehouse Details
    ...    ${DC_Operation_S026.value_receiver_in_warehouse['name']}
    ...    ${DC_Operation_S026.value_receiver_in_warehouse['phone']}
    ...    ${DC_Operation_S026.value_receiver_in_warehouse['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Parcel Details In Warehouse
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026    Verify Sender And Receiver In Warehouse

    Log    Step No.12 คลิกปุ่ม Dropdown Reprint
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Dropdown
    ...    ${dc_operation.dropdown_reprint_label['parcel_label']}
    ...    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    ...    ${pouch_number}
    ...    ${dc_operation.dropdown_reprint_label['pouch_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026   Verify Reprint Label Dropdown

    Log    Step No.13 คลิกที่ใบคัดแยกพัสดุ
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026   Verify Reprint Parcel Sorting Sheet

    Log    Step No.14 คลิกที่ใบ Label Pouch
    dps_history_parcel_page.Click Cancel Reprint Label Button    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['pouch_label']}
    # Defect219
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S026   Verify Popup Error When Click Print Pouch Label And Pouch Is Not Closed
