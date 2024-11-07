*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S016
    [Documentation]    คลัง Dry การแก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in ที่คลังต้นทาง
    [Tags]    DC_Operation    UAT
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Wait Until Page Loaded
    dps_home_page.Click Dropdown For Select Role

    Log    Step No.16-1 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100000382
    dps_scan_page.Click Search Button [Scan In Page]
    dps_home_page.Wait Until Page Loaded
    # Defect158    Defect160    Defect162    Defect171
    # Expected
    # dps_scan_page.Verify Title Parcel Details In Scan Page
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_crossdock']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_destination']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_source']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # # ...    ROUTE  # ${dc_operation.scan_in_title_parcel_detail['route']}   
    # dps_scan_page.Verify Data Parcel Details In Scan Page
    # ...    SPBD241100000382
    # ...    B2C0002400563  # ${DC_Operation_S016.parcel_detail_in_scan_in_tab['customer_id']}
    # ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['parcel_size']}
    # # ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['warehouse_crossdock']}
    # # ...    DC BB  # ${DC_Operation_S016.parcel_detail_in_scan_in_tab['warehouse_destination']}
    # ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['parcel_status']}
    # ...    Flash  # ${DC_Operation_S016.parcel_detail_in_scan_in_tab['courier']}
    # ...    ${DC_Operation_S016.parcel_detail_in_scan_in_tab['pouch_number']}
    # # ...    04-11-2567 10:14:13  # ${DC_Operation_S016.parcel_detail_in_scan_in_tab['receiving_date']}
    # ...    DCBB  # ${DC_Operation_S016.parcel_detail_in_scan_in_tab['warehouse_source']}
    # ...    HOME (11120)  # ${DC_Operation_S016.parcel_detail_in_scan_in_tab['send_parcel_to']}
    # # ...    4629  # ${DC_Operation_S016.parcel_detail_in_scan_in_tab['route']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page Store Destination
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page Store Destination
    # ...    4629  # ${DC_Operation_S016.label_detail_in_scan_in_tab['route']}
    # ...    ${DC_Operation_S016.label_detail_in_scan_in_tab['store_code']}
    # ...    มิวครับ  # ${DC_Operation_S016.label_detail_in_scan_in_tab['customer']}
    # ...    0922585095  # ${DC_Operation_S016.label_detail_in_scan_in_tab['phone']}
    # ...    ${DC_Operation_S016.label_detail_in_scan_in_tab['pouch_number']}
    # ...    DC BB - -- DC BB  # ${DC_Operation_S016.label_detail_in_scan_in_tab['wh']}
    # # ...    ${DC_Operation_S016.label_detail_in_scan_in_tab['symbol']}
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    บริษัท ซีเอ็มเจ อินเตอร์เทรด จำกัด  # ${DC_Operation_S016.sender_data_in_scan_in_tab['name']}
    # ...    0816269941  # ${DC_Operation_S016.sender_data_in_scan_in_tab['phone']}
    # ...    สาขา คุณาลัย-บางใหญ่ (07465)  # ${DC_Operation_S016.sender_data_in_scan_in_tab['shipping_origin']}
    # ...    1349 ถนนสุทธิสารวินิจฉัย รัชดาภิเษก ดินแดง กรุงเทพมหานคร 10400  # ${DC_Operation_S016.sender_data_in_scan_in_tab['address']}
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Recevier In Scan Page
    # ...    มิวครับ  # ${DC_Operation_S016.receiver_data_in_scan_in_tab['name']}
    # ...    0922585095  # ${DC_Operation_S016.receiver_data_in_scan_in_tab['phone']}
    # ...    ร้าน  # ${DC_Operation_S016.receiver_data_in_scan_in_tab['shipping_destination']}
    # ...    undefined สาขา เรวดี (ตลาดเปรมสุข) ตลาดขวัญ เมืองนนทบุรี นนทบุรี 11000  # ${DC_Operation_S016.receiver_data_in_scan_in_tab['address']}
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    DC_Operation_S016    Verify Sender Data In Scan In

    Log    Step No.16-2 คลิกที่ผลรวมของขนาดพัสดุ และ แก้ไขเป็นเลข 45
    dps_scan_page.Clear Input Parcel Size In Scan Page
    dps_scan_page.Input Parcel Size In Scan Page    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['value_parcel_size']}
    # Expected
    dps_scan_page.Verify Parcel Size Edited    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['text_parcel_size']}
    common.Verify Capture Screenshot    DC_Operation_S016    Verify Parcel Size Edited

    Log    Step No.16-3 คลิก Dropdown Courier แก้ไขเป็น CP All
    dps_scan_page.Click Courier In Scan Page
    dps_scan_page.Select Courier In Dropdown In Scan Page    CP ALL  # ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['courier']}
    # Expected
    dps_scan_page.Verify Title Label Parcel In Scan Page Store Destination
    ...    ROUTE  # ${dc_operation.scan_in_title_label_detail['route']}
    ...    ZIPCODE  # ${dc_operation.scan_in_title_label_detail['store']}
    ...    CUSTOMER  # ${dc_operation.scan_in_title_label_detail['customer']}
    ...    PHONE  # ${dc_operation.scan_in_title_label_detail['phone']}
    ...    POUCH NO.  # ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page Store Destination
    ...    -  # ${DC_Operation_S016.edit_courier_in_scan_in_tab['route']}
    ...    11120 (กล่อง S)  # ${DC_Operation_S016.edit_courier_in_scan_in_tab['zipcode']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['pouch_number']}
    ...    DC BB - -- DC BB  # ${DC_Operation_S016.edit_courier_in_scan_in_tab['wh']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['symbol']}
    common.Verify Capture Screenshot    DC_Operation_S016    Verify Parcel Label After Editing Courier