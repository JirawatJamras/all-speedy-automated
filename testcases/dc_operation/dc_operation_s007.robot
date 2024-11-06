*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

DC_Operation_S007
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All ไม่สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    UAT
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Wait Until Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Defect138    Defect141
    # Expected
    Filter Data By Parcel Number [All Task Tab]    SPCD241000006135
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task Tab
    ...    งานรับเข้า    # ${DC_Operation_S007.data_in_all_task_tab['task_type']}
    ...    speedy    # ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    ...    home    # ${DC_Operation_S007.data_in_all_task_tab['import_from']}
    ...    -    #${DC_Operation_S007.data_in_all_task_tab['export_to']}
    ...    CPALL  # ${DC_Operation_S007.data_in_all_task_tab['transport']}
    ...    -    #${DC_Operation_S007.data_in_all_task_tab['pouch_number']}
    ...    SPCD241000006135
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S007.data_in_all_task_tab['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    DC_Operation_S007    Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    DC_Operation_S007    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    # dps_home_page.Verify Data In Import Task Tab
    # ...    501  # ${DC_Operation_S007.data_in_import_task_tab['number_of_scanned_items']}
    # ...    501  # ${DC_Operation_S007.data_in_import_task_tab['number_of_pieces']}
    # ...    0  # ${DC_Operation_S007.data_in_import_task_tab['number_of_pouch']}
    # ...    speedy  # ${DC_Operation_S007.data_in_import_task_tab['parcel_owner']}
    # ...    CPALL  # ${DC_Operation_S007.data_in_import_task_tab['transport']}
    # ...    home  # ${DC_Operation_S007.data_in_import_task_tab['import_from']}

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ f" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    SPCD241000008174
    dps_scan_page.Click Search Button [Scan In Page]
    dps_home_page.Wait Until Page Loaded
    # Expected
    dps_scan_page.Verify Title Parcel Details In Scan Page Store Destination
    ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_crossdock']}
    ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_destination']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_source']}
    ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    ...    ROUTE    # Expected Result is ${dc_operation.scan_in_title_parcel_detail['route']}
    dps_scan_page.Verify Data Parcel Details In Scan Page Store Destination
    ...    SPCD241000008174
    ...    fee (0988797374)    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['customer_id']}
    ...    51 ซม. ซอง A4    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['parcel_size']}
    ...    -    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['warehouse_crossdock']}
    ...    DC SB    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['warehouse_destination']}
    ...    รอปริ้นใบลาเบลติดหน้ากล่อง     # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['parcel_status']}
    ...    CP ALL    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['courier']}
    ...    -    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['pouch_number']}
    ...    18-10-2567 14:37:59
    ...    DCBB    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['warehouse_source']}
    ...    STORE (15888)    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['send_parcel_to']}
    ...    0060    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['route']}
    dps_scan_page.Verify Title Label Parcel In Scan Page Store Destination
    ...    ROUTE    # Expected Result is ${dc_operation.scan_in_title_label_detail['route']}
    ...    STORE    # Expected Result is ${dc_operation.scan_in_title_label_detail['store']}
    ...    CUSTOMER    # Expected Result is ${dc_operation.scan_in_title_label_detail['customer']}
    ...    PHONE    # Expected Result is ${dc_operation.scan_in_title_label_detail['phone']}
    ...    POUCH NO.    # Expected Result is ${dc_operation.scan_in_title_label_detail['pounch_number']}
    ...    WH    # Expected Result is ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page Store Destination
    ...    0060    # Expected Result is ${DC_Operation_S007.scan_in_data_label_detail['route']}
    ...    15888 (ซอง A4)     # Expected Result is ${DC_Operation_S007.scan_in_data_label_detail['store']}
    ...    feee    # Expected Result is ${DC_Operation_S007.scan_in_data_label_detail['customer']}
    ...    0988797374    # Expected Result is (เบอร์โทรที่ระบุในไฟล์ Excel Template ขั้นตอน Booking)
    ...    -    # Expected Result is ${DC_Operation_S007.scan_in_data_paecel_detail['pouch_number']}
    ...    DC BB - -- DC SB    # Expected Result is ${DC_Operation_S007.scan_in_data_label_detail['wh']}
    ...    รูปดาว    # Expected Result is ${DC_Operation_S007.scan_in_data_label_detail['symbol']}
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    fee    # Expected Result is ${DC_Operation_S007.sender_data_in_scan_in_tab['name']}
    ...    0988797374    # Expected Result is ${DC_Operation_S007.sender_data_in_scan_in_tab['phone']}
    ...     สาขา ตลาดบางบัวทอง จุด 2 (13462)    # Expected Result is ${DC_Operation_S007.sender_data_in_scan_in_tab['shipping_origin']}
    ...    11 คลองเตย คลองเตย กรุงเทพมหานคร 10110    # Expected Result is ${DC_Operation_S007.sender_data_in_scan_in_tab['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    feee    # Expected Result is ${DC_Operation_S007.receiver_data_in_scan_in_tab['name']}
    ...    0988797374    # Expected Result is ${DC_Operation_S007.receiver_data_in_scan_in_tab['phone']}
    ...    ร้าน    # Expected Result is ${DC_Operation_S007.receiver_data_in_scan_in_tab['shipping_destination']}
    ...    15888 CP TOWER สีลม สีลม บางรัก กรุงเทพมหานคร 10500    # Expected Result is ${DC_Operation_S007.receiver_data_in_scan_in_tab['address']}

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    ## dps_parcel_detail_page.Click Print Label
    ## Sleep    10s

    Log    Step No.5 คลิกปุ่มพิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    ## dps_parcel_detail_page.Click ESC On Keyboard
    # Defect142
    # Expected
    ##dps_parcel_detail_page.Verify Print Label Success Popup
    ##...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    ##common.Verify Capture Screenshot    DC_Operation_S007    Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ Pop up
    # Defect145    Unable to click on popup, but anable to click on close button (X) to close popup.
    ##dps_parcel_detail_page.Click Close Print Label Success Popup
    # Expected
    ##dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    ##common.Verify Capture Screenshot    DC_Operation_S007    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Defect141
    # Expected
    Filter Data By Parcel Number [All Task Tab]    SPCD241000006135
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task Tab
    ...    งานรับเข้า    # ${DC_Operation_S007.data_in_all_task_tab['task_type']}
    ...    speedy    # ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    ...    home    # ${DC_Operation_S007.data_in_all_task_tab['import_from']}
    ...    -    #${DC_Operation_S007.data_in_all_task_tab['export_to']}
    ...    CPALL  # ${DC_Operation_S007.data_in_all_task_tab['transport']}
    ...    -    #${DC_Operation_S007.data_in_all_task_tab['pouch_number']}
    ...    SPCD241000006135
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S007.data_in_all_task_tab['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    DC_Operation_S007    Verify Homepage After Scan-in
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    DC_Operation_S007    Verify Data In All Task Tab After Scan-in


    Log    Step No.8 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    dps_home_page.Verify Label In Export Task Tab
    ...    ${dc_operation.label_export_task_tab['export_to']}
    ...    ${dc_operation.label_export_task_tab['transport']}
    ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    dps_home_page.Verify Data In Export Task Tab
    ...    DCSB  # ${DC_Operation_S007.data_in_export_task_tab['import_from']}
    ...    CPALL  # ${DC_Operation_S007.data_in_export_task_tab['transport']}
    ...    speedy  # ${DC_Operation_S007.data_in_export_task_tab['parcel_owner']}
    ...    0  # ${DC_Operation_S007.data_in_export_task_tab['number_of_pouch']}
    ...    7  # ${DC_Operation_S007.data_in_export_task_tab['number_of_pieces']}
    ...    7  # ${DC_Operation_S007.data_in_export_task_tab['number_of_scanned_items']}

    Log    Step No.9 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab





    Log    Step No.10

