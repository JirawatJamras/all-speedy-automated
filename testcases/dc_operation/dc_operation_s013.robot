*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S013
    [Documentation]    ลูกค้า B (ส่งพัสดุที่ร้าน 7-11) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย Courier
    [Tags]    DC_Operation    UAT

    Log    Step No.1-16 Skip By Use Tracking Mannual

    Log    Step No.17 เข้า Url : https://dps-uat.allspeedy.co.th
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    # Expected 
    dps_login_page.Verify Login Page
    common.Verify Capture Screenshot    DC_Operation_S013    Verify Login Page
    
    Log    Step No.18 กรอกข้อมูล Login
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    dps_home_page.Wait Until Page Loaded
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    common.Verify Capture Screenshot    DC_Operation_S013    Verify Homepage Title

    Log    Step No.19 เข้าเมนูหน้าหลัก เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['tracking']}
    # Defect138    Defect141
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Label In All Task Tab
    ...    ${dc_operation.label_all_task_tab['task_type']}
    ...    ${dc_operation.label_all_task_tab['parcel_owner']}
    ...    ${dc_operation.label_all_task_tab['import_from']}
    ...    ${dc_operation.label_all_task_tab['export_to']}
    ...    ${dc_operation.label_all_task_tab['transport']}
    ...    ${dc_operation.label_all_task_tab['pouch_number']}
    ...    ${dc_operation.label_all_task_tab['parcel_number']}
    ...    ${dc_operation.label_all_task_tab['parcel_status']}
    dps_home_page.Verify Data In All Task Tab
    ...    งานส่งออก    #for run same tracking# ${DC_Operation_S013.data_in_all_task_tab['task_type']}
    ...    speedy  # ${DC_Operation_S013.data_in_all_task_tab['parcel_owner']}
    ...    -  # ${DC_Operation_S013.data_in_all_task_tab['import_from']}
    ...    DC BB    #for run same tracking# ${DC_Operation_S013.data_in_all_task_tab['export_to']}
    ...    CPALL  # ${DC_Operation_S013.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S013.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['tracking']}
    ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง  # ${DC_Operation_S013.data_in_all_task_tab['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    DC_Operation_S013    Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    DC_Operation_S013    Verify Data In All Task Tab

    Log    Step No.20 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Defect139
    # Expected
    dps_home_page.Verify Label In Import Task Tab
    ...    ${dc_operation.label_import_task_tab['import_from']}
    ...    ${dc_operation.label_import_task_tab['transport']}
    ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    home  # ${DC_Operation_S013.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S013.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S013.data_in_import_task_tab['parcel_owner']}
    # ...    0  # ${DC_Operation_S013.data_in_import_task_tab['number_of_pouch']}
    # ...    737  # ${DC_Operation_S013.data_in_import_task_tab['number_of_pieces']}
    # ...    737  # ${DC_Operation_S013.data_in_import_task_tab['number_of_scanned_items']}
    common.Verify Capture Screenshot    DC_Operation_S013    Verify Data In Import Task Tab

    Log    Step No.21 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['tracking']}
    dps_scan_page.Click Search Button[Scan In Page]
    dps_home_page.Wait Until Page Loaded
    # Defect158    Defect159    Defect160
    # Expected    
    # Inprogress
   dps_scan_page.Verify Title Parcel Details In Scan Page Home Destination
    ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_source']}
    ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}

    dps_scan_page.Verify Data Parcel Details In Scan Page Home Destination
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['tracking']}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['customer_id']}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_size']}
    ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง  # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_status']}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['courier']}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['pouch_number']}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['receiving_date']}
    ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['warehouse_source']}
    ...    HOME (11120)    # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['send_parcel_to']}

    dps_scan_page.Verify Title Label Parcel In Scan Page Home Destination
    ...    ${dc_operation.scan_in_title_label_detail['courier']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}


    dps_scan_page.Verify Data Label Parcel In Scan Page Home Destination
    ...    FLS  # ${DC_Operation_S013.label_detail_in_scan_in_tab['courier']}
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['zipcode']} 
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['size']}    
    ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['size']}

    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}

    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['shipping_origin']}
    ...    ${DC_Operation_S013.sender_data_in_scan_in_tab['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['name']}
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['shipping_destination']}
    ...    ${DC_Operation_S013.receiver_data_in_scan_in_tab['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    DC_Operation_S013    Verify Sender Data In Scan In

    Log    Step No.22 คลิกปุ่ม ยืนยัน/Print Label
    dps_parcel_detail_page.Click Print Label

    Log    Step No.23 คลิกปุ่มพิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    dps_parcel_detail_page.Click ESC On Keyboard
    # Defect142
    # Expected
    dps_parcel_detail_page.Verify Print Label Success Popup
    ...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Print Label Success Popup

    Log    Step No.24 คลิกที่ Pop up
    dps_scan_page.Click Close Popup Print Scan In Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No. check timelline
    # Waiting Step

    Log    Step No.25 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    
    Log    Step No.26 เลือกแท็บงานส่งออก

    Log    Step No.27 เข้าเมนู Scan และ เลือกแท็บ Scan out

    Log    Step No.28 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter

    Log    Step No.29 กดปุ่ม ยืนยัน Scan Out

    Log    Step No.30 กดปุ่ม ยืนยัน

    Log    Step No.31 คลิกที่ Pop up

    Log    Step No.32 คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ

    Log    Step No.33 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ

    Log    Step No.34 กดปุ่ม พิมพ์




