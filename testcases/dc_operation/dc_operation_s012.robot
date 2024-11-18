*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S012
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All (in area)
    [Tags]    DC_Operation    UAT    In_Review
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # dps_home_page.Select Tab All Task
    # dps_home_page.Filter Data By Parcel Number [All Task Tab]    SPBD241100002656
    # # Defect138    Defect141
    # # Expected
    # # dps_home_page.Verify Homepage
    # # ...    ${dc_operation.breadcrumb['homepage']}
    # # ...    ${dc_operation.title['homepage']}
    # # dps_home_page.Verify Label In All Task Tab
    # # ...    ${dc_operation.label_all_task_tab['task_type']}
    # # ...    ${dc_operation.label_all_task_tab['parcel_owner']}
    # # ...    ${dc_operation.label_all_task_tab['import_from']}
    # # ...    ${dc_operation.label_all_task_tab['export_to']}
    # # ...    ${dc_operation.label_all_task_tab['transport']}
    # # ...    ${dc_operation.label_all_task_tab['pouch_number']}
    # # ...    ${dc_operation.label_all_task_tab['parcel_number']}
    # # ...    ${dc_operation.label_all_task_tab['parcel_status']}
    # # dps_home_page.Verify Data In All Task Tab
    # # ...    ${DC_Operation_S012.data_in_all_task_tab['task_type']}
    # # ...    speedy  # ${DC_Operation_S012.data_in_all_task_tab['parcel_owner']}
    # # ...    home  # ${DC_Operation_S012.data_in_all_task_tab['import_from']}
    # # ...    ${DC_Operation_S012.data_in_all_task_tab['export_to']}
    # # ...    CPALL  # ${DC_Operation_S012.data_in_all_task_tab['transport']}
    # # ...    ${DC_Operation_S012.data_in_all_task_tab['pouch_number']}
    # # ...    SPBD241100002656
    # # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S012.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Homepage 1
    # common.Scroll Window To Vertical    750
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    # dps_home_page.Select Tab Import Task
    # # Defect139    Defect188
    # # Expected
    # # dps_home_page.Verify Label In Import Task Tab
    # # ...    ${dc_operation.label_import_task_tab['import_from']}
    # # ...    ${dc_operation.label_import_task_tab['transport']}
    # # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # # dps_home_page.Verify Data In Import Task Tab
    # # ...    home  # ${DC_Operation_S012.data_in_import_task_tab['import_from']}
    # # ...    CPALL  # ${DC_Operation_S012.data_in_import_task_tab['transport']}
    # # ...    speedy  # ${DC_Operation_S012.data_in_import_task_tab['parcel_owner']}
    # # ...    0  # ${DC_Operation_S012.data_in_import_task_tab['number_of_pouch']}
    # # # ...    1025  # ${DC_Operation_S012.data_in_import_task_tab['number_of_pieces']}
    # # # ...    1025  # ${DC_Operation_S012.data_in_import_task_tab['number_of_scanned_items']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Data In Import Task Tab

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ b" และ กดค้นหา หรือกด Enter
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan In Tab
    # dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100002422
    # dps_scan_page.Click Search Button [Scan In Page]
    # dps_home_page.Wait Until Page Loaded
    # # Defect155    Defect156    Defect157    Defect158    Defect165    Defect168
    # # Expected
    # # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['source_warehouse']}
    # # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # # ...    ROUTE  # ${dc_operation.scan_in_title_parcel_detail['route']}   
    # # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # # ...    SPBD241100002422
    # # ...    B2C0002400563  # ${DC_Operation_S012.parcel_detail_in_scan_in_tab['customer_id']}
    # # ...    ${DC_Operation_S012.parcel_detail_in_scan_in_tab['parcel_size']}
    # # ...    ${DC_Operation_S012.parcel_detail_in_scan_in_tab['crossdock_warehouse']}
    # # ...    DC BB  # ${DC_Operation_S012.parcel_detail_in_scan_in_tab['destination_warehouse']}
    # # ...    พัสดุถึงคลังปลายทาง  # ${DC_Operation_S012.parcel_detail_in_scan_in_tab['parcel_status']}
    # # ...    CP ALL  # ${DC_Operation_S012.parcel_detail_in_scan_in_tab['courier']}
    # # ...    ${DC_Operation_S012.parcel_detail_in_scan_in_tab['pouch_number']}
    # # ...    06-11-2567  # ${DC_Operation_S012.parcel_detail_in_scan_in_tab['receiving_date']}
    # # ...    ${DC_Operation_S012.parcel_detail_in_scan_in_tab['source_warehouse']}
    # # ...    STORE (07004)  # ${DC_Operation_S012.parcel_detail_in_scan_in_tab['send_parcel_to']}
    # # dps_scan_page.Verify Title Label Parcel In Scan Page [Other Courier]
    # # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # # ...    POUCH NO.  # ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # # ...    ${DC_Operation_S012.label_detail_in_scan_in_tab['store_code']}
    # # ...    ${DC_Operation_S012.label_detail_in_scan_in_tab['customer']}
    # # ...    ${DC_Operation_S012.label_detail_in_scan_in_tab['phone']}
    # # ...    ${DC_Operation_S012.label_detail_in_scan_in_tab['pouch_number']}
    # # ...    DC BB - -- DC BB  # ${DC_Operation_S012.label_detail_in_scan_in_tab['wh']}
    # # ...    ${DC_Operation_S012.label_detail_in_scan_in_tab['symbol']}
    # # dps_scan_page.Verify Title Sender In Scan Page
    # # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # # dps_scan_page.Verify Data Sender In Scan Page
    # # ...    ${DC_Operation_S012.sender_data_in_scan_in_tab['name']}
    # # ...    ${DC_Operation_S012.sender_data_in_scan_in_tab['phone']}
    # # ...    บริษัท TecheX  # ${DC_Operation_S012.sender_data_in_scan_in_tab['shipping_origin']}
    # # ...    74 ลำพยา เมืองนครปฐม นครปฐม 73000  # ${DC_Operation_S012.sender_data_in_scan_in_tab['address']}
    # # dps_scan_page.Verify Title Receiver In Scan Page
    # # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # # dps_scan_page.Verify Data Recevier In Scan Page
    # # ...    ${DC_Operation_S012.receiver_data_in_scan_in_tab['name']}
    # # ...    ${DC_Operation_S012.receiver_data_in_scan_in_tab['phone']}
    # # ...    ร้าน  # ${DC_Operation_S012.receiver_data_in_scan_in_tab['shipping_destination']}
    # # ...    07004 สาขา เรวดี (ตลาดเปรมสุข) ตลาดขวัญ เมืองนนทบุรี นนทบุรี 11000  # ${DC_Operation_S012.receiver_data_in_scan_in_tab['address']}
    # common.Scroll Window To Vertical    425
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Parcel Details After Scanning

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    # dps_scan_page.Click Print Label

    Log    Step No.5 คลิกปุ่มพิมพ์
    # dps_parcel_detail_page.Click ESC On Keyboard
    # # Expected
    # dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    # dps_scan_page.Click Close Print Label Success Popup
    # # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify History Parcel Page

    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    SPBD241100002666
    dps_history_parcel_page.Click Edit History Parcel    SPBD241100002666
    Switch Window    NEW
    # Defect201    Defect202    Defect206
    # Expected
    dps_history_parcel_page.Verify Timeline  ${DC_Operation_S012['timeline_in_history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Timeline

    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # dps_home_page.Select Tab All Task
    # dps_home_page.Filter Data By Parcel Number [All Task Tab]    SPBD241100009191
    # # Defect138    Defect141    Defect179    Defect187
    # # Expected
    # # dps_home_page.Verify Homepage
    # # ...    ${dc_operation.breadcrumb['homepage']}
    # # ...    ${dc_operation.title['homepage']}
    # # dps_home_page.Verify Data In All Task Tab
    # # ...    ${DC_Operation_S012.data_in_all_task_tab_after_scan['task_type']}
    # # ...    speedy  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['parcel_owner']}
    # # ...    -  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['import_from']}
    # # ...    home  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['export_to']}
    # # ...    CPALL  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['transport']}
    # # ...    ${DC_Operation_S012.data_in_all_task_tab_after_scan['pouch_number']}
    # # ...    SPBD241100009191
    # # ...    พัสดุรอนำจ่ายโดยคลัง  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['parcel_status']}
    # # common.Scroll Window To Vertical    0
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Homepage 2
    # # common.Scroll Window To Vertical    750
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Data In All Task Tab After Scan Parcel

    Log    Step No.10 เลือกแท็บงานนำจ่าย
    # dps_home_page.Select Tab Send Task
    # # Defect147    Defect148    Defect149    Defect190
    # # Expected
    # # dps_home_page.Verify Label In Send Task Tab
    # # ...    ${dc_operation.label_send_task_tab['send_to']}
    # # ...    ${dc_operation.label_send_task_tab['store_code']}
    # # ...    ${dc_operation.label_send_task_tab['transport']}
    # # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # # dps_home_page.Verify Data In Send Task Tab
    # # ...    store  # ${DC_Operation_S012.data_in_send_task_tab['send_to']}
    # # ...    ${DC_Operation_S012.data_in_send_task_tab['store_code']}
    # # # ...    ${DC_Operation_S012.data_in_send_task_tab['customer_type']}
    # # ...    CPALL  # ${DC_Operation_S012.data_in_send_task_tab['transport']}
    # # ...    -
    # # # ...    29  # ${DC_Operation_S012.data_in_send_task_tab['number_of_pieces']}
    # # # ...    29
    # # common.Scroll Window To Vertical    750
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    Verify Data In Send Task Tab
