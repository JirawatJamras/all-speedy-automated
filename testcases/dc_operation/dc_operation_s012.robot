*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S012
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All (in area)
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
    dps_home_page.Select Tab All Task
    # Defect138    Defect141
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
    # ...    ${DC_Operation_S012.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S012.data_in_all_task_tab['parcel_owner']}
    # ...    home  # ${DC_Operation_S012.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S012.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['pouch_number']}
    # ...    SPCD241000006135
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S012.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    DC_Operation_S012    Verify Homepage
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    DC_Operation_S012    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Defect139
    # Expected
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    home  # ${DC_Operation_S012.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S012.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S012.data_in_import_task_tab['parcel_owner']}
    # ...    0  # ${DC_Operation_S012.data_in_import_task_tab['number_of_pouch']}
    # ...    498  # ${DC_Operation_S012.data_in_import_task_tab['number_of_pieces']}
    # ...    498  # ${DC_Operation_S012.data_in_import_task_tab['number_of_scanned_items']}
    # common.Verify Capture Screenshot    DC_Operation_S012    Verify Data In Import Task Tab

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ b" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100001156
    dps_scan_page.Click Search Button
    dps_home_page.Wait Until Page Loaded
    # Defect155    Defect156
    # Expected
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.label_sender_scan_in_tab['title']}
    ...    ${dc_operation.label_sender_scan_in_tab['name']}
    ...    ${dc_operation.label_sender_scan_in_tab['phone']}
    ...    ${dc_operation.label_sender_scan_in_tab['shipping_origin']}
    ...    ${dc_operation.label_sender_scan_in_tab['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S012.sender_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S012.sender_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S012.sender_data_in_scan_in_tab['shipping_origin']}
    ...    ${DC_Operation_S012.sender_data_in_scan_in_tab['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.label_receiver_scan_in_tab['title']}
    ...    ${dc_operation.label_receiver_scan_in_tab['name']}
    ...    ${dc_operation.label_receiver_scan_in_tab['phone']}
    ...    ${dc_operation.label_receiver_scan_in_tab['shipping_destination']}
    ...    ${dc_operation.label_receiver_scan_in_tab['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ${DC_Operation_S012.receiver_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S012.receiver_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S012.receiver_data_in_scan_in_tab['shipping_destination']}
    ...    ${DC_Operation_S012.receiver_data_in_scan_in_tab['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Sender Data In Scan In

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    dps_parcel_detail_page.Click Print Label

    Log    Step No.5 คลิกปุ่มพิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    dps_parcel_detail_page.Click ESC On Keyboard
    # Defect142
    # Expected
    dps_parcel_detail_page.Verify Print Label Success Popup
    ...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ Pop up
    # Defect145    Unable to click on popup, but anable to click on close button (X) to close popup.
    dps_parcel_detail_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Tab All Task
    dps_home_page.Select Filter Button
    dps_home_page.Input Fiter Parcel Status
    ...    ${DC_Operation_S012.filter['task_type']}
    ...    ${DC_Operation_S012.filter['parcel_status']}
    dps_home_page.Select Filter Button
    # Defect138    Defect141
    # Expected
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S012.data_in_all_task_tab_after_scan['task_type']}
    # ...    speedy  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['parcel_owner']}
    # ...    -  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['import_from']}
    # ...    home  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['export_to']}
    # ...    CPALL  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['transport']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab_after_scan['pouch_number']}
    # ...    SPCD241000006512
    # ...    พัสดุรอนำจ่ายโดยคลัง  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    DC_Operation_S012    Verify Homepage
    # common.Scroll Window To Vertical    750
    # common.Verify Capture Screenshot    DC_Operation_S012    Verify Data In All Task Tab After Scan Parcel

    Log    Step No.8 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Defect147    Defect148    Defect149
    # Expected
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    store  # ${DC_Operation_S012.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S012.data_in_send_task_tab['store_code']}
    # # ...    ${DC_Operation_S012.data_in_send_task_tab['customer_type']}
    # ...    CPALL  # ${DC_Operation_S012.data_in_send_task_tab['transport']}
    # ...    -
    # ...    29  # ${DC_Operation_S012.data_in_send_task_tab['number_of_pieces']}
    # ...    29
    # common.Scroll Window To Vertical    750
    # common.Verify Capture Screenshot    DC_Operation_S012    Verify Data In Send Task Tab