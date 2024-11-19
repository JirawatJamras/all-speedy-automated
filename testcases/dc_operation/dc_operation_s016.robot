*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S016
    [Documentation]    คลัง Dry การแก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in ที่คลังต้นทาง
    [Tags]    DC_Operation    UAT    Fail
    ${tracking_a}=    Set Variable    SPBD241100012429

    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_a}
    dps_scan_page.Click Search Button [Scan In Page]
    dps_home_page.Wait Until Page Loaded
    # Defect155    Defect160
    # Expected
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
    ...    ${tracking_a}
    ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['customer_id']}
    ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['parcel_size']}
    ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['parcel_status']}
    ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['courier']}
    ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['pouch_number']}
    ...    15-11-2567 14:51:33
    ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['origin_warehouse']}
    ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['send_parcel_to']}
    dps_scan_page.Verify Title Label Parcel In Scan Page [Other Courier]
    ...    ${dc_operation.scan_in_title_label_detail['courier']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [Other Courier]
    ...    FLS  # ${DC_Operation_S016.label_detail_in_scan_in_tab['courier']}
    ...    ${DC_Operation_S016.label_detail_in_scan_in_tab['zipcode']} 
    ...    ${DC_Operation_S016.label_detail_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S016.label_detail_in_scan_in_tab['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['size_home']}    
    ...    ${DC_Operation_S016.label_detail_in_scan_in_tab['size']}
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S016.sender_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S016.sender_data_in_scan_in_tab['phone']}
    ...    -  # ${DC_Operation_S016.sender_data_in_scan_in_tab['shipping_origin']}
    ...    ${DC_Operation_S016.sender_data_in_scan_in_tab['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ${DC_Operation_S016.receiver_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S016.receiver_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S016.receiver_data_in_scan_in_tab['shipping_destination']}
    ...    ${DC_Operation_S016.receiver_data_in_scan_in_tab['address']}
    common.Scroll Window To Vertical    400
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    Verify Parcel Details After Scanning

    Log    Step No.2 คลิกที่ผลรวมของขนาดพัสดุ และ แก้ไขเป็นเลข 45
    dps_scan_page.Clear Input Parcel Size In Scan Page
    dps_scan_page.Input Parcel Size In Scan Page    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['value_parcel_size']}
    # Expected
    dps_scan_page.Verify Parcel Size Edited    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['text_parcel_size']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    Verify Parcel Size Edited

    Log    Step No.3 คลิก Dropdown Courier แก้ไขเป็น CP All
    dps_scan_page.Click Courier In Scan Page
    dps_scan_page.Select Courier In Dropdown In Scan Page    CP ALL  # ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['courier']}
    # Defect165
    # Expected
    dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    ...    ${dc_operation.scan_in_title_label_detail['route']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['zipcode']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['pouch_number']}
    ...    DC BB - - DC BB  # ${DC_Operation_S016.edit_courier_in_scan_in_tab['wh']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    Verify Parcel Label After Editing Courier

    Log    Step No.4 คลิก Dropdown คลังปลายทาง แก้ไขเป็น DCSB
    dps_scan_page.Click Destination Warehouse In Scan Page
    dps_scan_page.Select Destination Warehouse In Dropdown In Scan Page    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['destination_warehourse']}
    # Defect165
    # Expected
    dps_scan_page.Verify Title Label Parcel In Scan Page [Other Courier]
    ...    ${dc_operation.scan_in_title_label_detail['route']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['zipcode']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['pouch_number']}
    ...    DC BB - - DC SB  # ${DC_Operation_S016.edit_courier_in_scan_in_tab['wh']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['symbol_after_changing_warehourse']}
    common.Scroll Window To Vertical    400
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    Verify Parcel Label After Editing Destination Warehouse

    # Log    Step No.5 คลิกปุ่ม ยืนยัน/Print Label
    # dps_scan_page.Click Print Label

    # Log    Step No.6 คลิกปุ่มพิมพ์
    # # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # Defect142
    # Expected
    # dps_scan_page.Verify Print Label Success Popup
    # ...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    Verify Print Label Success Popup

    # Defect145    Unable to click on popup, but anable to click on close button (X) to close popup.
    # Log    Step No.7 คลิกที่ Pop up
    # dps_scan_page.Click Close Print Label Success Popup
    # # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    Verify Navigate To Scan Page And Stay At Scan In Tab
