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
    ...    ${DC_Operation_S013.data_in_all_task_tab['task_type']}
    ...    speedy  # ${DC_Operation_S013.data_in_all_task_tab['parcel_owner']}
    ...    home  # ${DC_Operation_S013.data_in_all_task_tab['import_from']}
    ...    ${DC_Operation_S013.data_in_all_task_tab['export_to']}
    ...    CPALL  # ${DC_Operation_S013.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S013.data_in_all_task_tab['pouch_number']}
    ...    SPCD241000006135
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S013.data_in_all_task_tab['parcel_status']}
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
    dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100000493
    dps_scan_page.Click Search Button[Scan In Page]
    dps_home_page.Wait Until Page Loaded
    # Defect158    Defect159    Defect160    Defect161    Defect162
    # Expected    
    # Inprogress
#    dps_scan_page.Verify Title Parcel Details In Scan Page Home Destination
#     ...    ${dc_operation.scan_in_title_parcel_detail['title']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
#     #...    ${dc_operation.scan_in_title_parcel_detail['warehouse_crossdock']} # Defect162
#     #...    ${dc_operation.scan_in_title_parcel_detail['warehouse_destination']} # Defect162
#     ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_source']}
#     ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
#     #...    ${dc_operation.scan_in_title_parcel_detail['route']}   # Defect162
#     dps_scan_page.Verify Data Parcel Details In Scan Page Home Destination
#     ...    SPBD241100000493
#     ...    B2C0002400563  # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['customer_id']}
#     ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_size']}
#     #...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['warehouse_crossdock']} # Defect162
#     #...    DCBB  # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['warehouse_destination']} # Defect162
#     ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['parcel_status']}
#     ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['courier']}
#     ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['pouch_number']}
#     ...    04-11-2567 10:39:14  # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['receiving_date']}
#     ...    DC BB  # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['warehouse_source']}
#     ...    HOME (11120)  # ${DC_Operation_S013.parcel_detail_in_scan_in_tab['send_parcel_to']}
#     #...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['route']} # Defect162
#     dps_scan_page.Verify Title Label Parcel In Scan Page Home Destination
#     ...    COURIER    # ${dc_operation.scan_in_title_label_detail['courier']}
#     ...    ZIPCODE    #${dc_operation.scan_in_title_label_detail['zipcode']}
#     ...    CUSTOMER    #${dc_operation.scan_in_title_label_detail['customer']}
#     ...    PHONE    #${dc_operation.scan_in_title_label_detail['phone']}
#     #...    ${dc_operation.scan_in_title_label_detail['size']}

#     dps_scan_page.Verify Data Label Parcel In Scan Page Home Destination
#     ...    FLS  # ${DC_Operation_S013.label_detail_in_scan_in_tab['courier']}
#     ...    11120 (กล่อง L)    #${DC_Operation_S013.label_detail_in_scan_in_tab['zipcode']}
#     ...    นนทบุรี  # ${DC_Operation_S013.label_detail_in_scan_in_tab['province']}
#     ...    ${DC_Operation_S013.label_detail_in_scan_in_tab['customer']}
#     ...    0971971445  # ${DC_Operation_S013.label_detail_in_scan_in_tab['phone']}
#     #...    ${DC_Operation_S013.label_detail_in_scan_in_tab['size']}

    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    คุณ a  # ${DC_Operation_S013.sender_data_in_scan_in_tab['name']}
    ...    0633906216  # ${DC_Operation_S013.sender_data_in_scan_in_tab['phone']}
    ...    สาขา คุณาลัย-บางใหญ่ (07465)  # ${DC_Operation_S013.sender_data_in_scan_in_tab['shipping_origin']}
    ...    74 ลำพยา เมืองนครปฐม นครปฐม 73000  # ${DC_Operation_S013.sender_data_in_scan_in_tab['address']}
    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ทดสอบพัสดุCourier  # ${DC_Operation_S013.receiver_data_in_scan_in_tab['name']}
    ...    0971971445  # ${DC_Operation_S013.receiver_data_in_scan_in_tab['phone']}
    ...    บ้าน  # ${DC_Operation_S013.receiver_data_in_scan_in_tab['shipping_destination']}
    ...    554 หมู่ 3 ปากเกร็ด ปากเกร็ด นนทบุรี 11120  # ${DC_Operation_S013.receiver_data_in_scan_in_tab['address']}
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
    
    Log    Step No.25



