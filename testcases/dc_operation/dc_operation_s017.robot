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
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    # Log    Step No.1 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan In Tab
    # dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100002415
    # dps_scan_page.Click Search Button [Scan In Page]
    # Defect143
    # Expected
    # Verify Create Pouch Destination DCSB Popup
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Create Pouch Destination DCSB Popup

    # Log    Step No.2 คลิกปุ่มตกลง
    # # Defect143    Defect155    Defect156    Defect158    Defect159    Defect165    Defect168    Defect171
    # # Click Accept    
    # # Expected
    # # รอโค้ด verify จากพี่พี

    # Log    Step No.3 คลิกปุ่ม ยืนยัน/Print Label
    # dps_parcel_detail_page.Click Print Label
    
    # Log    Step No.4 คลิกปุ่มพิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # Defect142
    # Expected
    # dps_parcel_detail_page.Verify Print Label Success Popup
    # ...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Print Label Success Popup

    # Defect145    Unable to click on popup, but anable to click on close button (X) to close popup.
    # Log    Step No.5 คลิกที่ Pop up
    # dps_parcel_detail_page.Click Close Print Label Success Popup
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.6 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    SPBD241100002673  #SPBD241100002415
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    SPBD241100002673
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Data In Table

    Log    Step No.7 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Click Edit History Parcel    SPBD241100002673
    Go To    https://dps-uat.allspeedy.co.th/historyparcel/detailparcelinwarehouse?id=SPBD241100002673
    # Defect193    Defect194    Defect195    Defect196    Defect197
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
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Parcel Details In Warehouse
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Sender And Receiver In Warehouse
    
