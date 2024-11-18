*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

DC_Operation_S009
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย CP All ไม่สร้าง Pouch (ข้ามภาค)
    [Tags]    DC_Operation    UAT
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    # sleep    5s
    # Go To    https://dps-uat.allspeedy.co.th/scan
    # dps_home_page.Click Dropdown For Select Role
    # dps_home_page.Select Role    ${dc_operation.role['admin']}

    ${parcel_h}=    Set Variable    SPBD241100012353


    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Defect138    Defect141
    # Expected
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    # Filter Data By Parcel Number [All Task Tab]    ${parcel_h}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    งานรับเข้า    # ${DC_Operation_S009.data_in_all_task_tab['task_type_import']}
    # ...    speedy    # ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    # ...    home    # ${DC_Operation_S009.data_in_all_task_tab['import_from']}
    # ...    -    #${DC_Operation_S009.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S009.data_in_all_task_tab['transport']}
    # ...    -    #${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    # ...    ${parcel_h}
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S009.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Homepage
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    home  # ${DC_Operation_S009.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S009.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S009.data_in_import_task_tab['parcel_owner']}

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" และ กดค้นหา หรือกด Enter
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan In Tab
    # dps_scan_page.Input Tracking Number [Scan In Page]    ${parcel_h}
    # dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    # dps_home_page.Wait Until Page Loaded
    # dps_scan_page.Verify Title Parcel Details In Scan Page [Other Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['warehouse_source']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}

    # dps_scan_page.Verify Data Parcel Details In Scan Page [Other Courier]
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['tracking']}
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['customer_id']}
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['parcel_size']}
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['parcel_status']}
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['courier']}
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['pouch_number']}
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['receiving_date']}
    # ...    ${DC_Operation_S009.parcel_detail_in_scan_in_tab['warehouse_source']}
    # ...    HOME (11120)    # ${DC_Operation_S009.parcel_detail_in_scan_in_tab['send_parcel_to']}

    # dps_scan_page.Verify Title Label Parcel In Scan Page Home Destination
    # ...    ${dc_operation.scan_in_title_label_detail['courier']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}

    # dps_scan_page.Verify Data Label Parcel In Scan Page Home Destination
    # ...    ${DC_Operation_S009.label_detail_in_scan_in_tab['courier']}
    # ...    ${DC_Operation_S009.label_detail_in_scan_in_tab['zipcode']} 
    # ...    ${DC_Operation_S009.label_detail_in_scan_in_tab['customer']}
    # ...    ${DC_Operation_S009.label_detail_in_scan_in_tab['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['size_home']}    
    # ...    ${DC_Operation_S009.label_detail_in_scan_in_tab['size']}

    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}

    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S009.sender_data_in_scan_in_tab['name']}
    # ...    ${DC_Operation_S009.sender_data_in_scan_in_tab['phone']}
    # ...    ${DC_Operation_S009.sender_data_in_scan_in_tab['shipping_origin']}
    # ...    ${DC_Operation_S009.sender_data_in_scan_in_tab['address']}
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Recevier In Scan Page
    # ...    ${DC_Operation_S009.receiver_data_in_scan_in_tab['name']}
    # ...    ${DC_Operation_S009.receiver_data_in_scan_in_tab['phone']}
    # ...    ${DC_Operation_S009.receiver_data_in_scan_in_tab['shipping_destination']}
    # ...    ${DC_Operation_S009.receiver_data_in_scan_in_tab['address']}
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Sender Data In Scan In

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    # dps_scan_page.Click Print Label
    ## Sleep    10s

    Log    Step No.5 คลิกปุ่มพิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # Defect142
    # Expected
    # dps_scan_page.Verify Print Label Success Popup
    # ...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    # Defect145    Unable to click on popup, but anable to click on close button (X) to close popup.
    # dps_scan_page.Click Close Print Label Success Popup
    # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Navigate To Scan Page And Stay At Scan In Tab
    
    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # Defect220
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}    #Expect Result is ประวัติพัสดุภายในคลัง
    # Expected
    # dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify History Parcel Page
    
    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    # dps_history_parcel_page.Filter Data By Parcel Number    ${parcel_h}
    # dps_history_parcel_page.Click Edit History Parcel    ${parcel_h}
    # Switch Window    NEW
    # Defect201    Defect202    Defect206
    # Expected
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Timeline

    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Defect141
    # Expected
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    # Filter Data By Parcel Number [All Task Tab]    ${parcel_h}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    งานส่งออก    # ${DC_Operation_S009.data_in_all_task_tab['task_type_export']}
    # ...    speedy    # ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    # ...    home    # ${DC_Operation_S009.data_in_all_task_tab['import_from']}
    # ...    -    #${DC_Operation_S009.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S009.data_in_all_task_tab['transport']}
    # ...    -    #${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    # ...    ${parcel_h}
    # ...    พัสดุรอ Scan out ไปคลัง (AC)  # ${DC_Operation_S009.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Homepage After Scan-in
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Data In All Task Tab After Scan-in

    Log    Step No.10 เลือกแท็บงานส่งออก
    # dps_home_page.Select Tab Export Task
    # Expected
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    DCSB  # ${DC_Operation_S009.data_in_export_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S009.data_in_export_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S009.data_in_export_task_tab['parcel_owner']}

    Log    Step No.11 เข้าเมนู Scan และ เลือกแท็บ Scan out
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan Out Tab
    # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify Section Waiting List To Scan Out [Scan Out Page]
    # ...    SPBD241100000487
    # ...    -
    # ...    คลัง DC BB    
    # ...    Flash   
    # ...    Speedy
    # ...    กล่อง L
    # ...    07/11/2567
    # ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง    
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Section Waiting List To Scan Out [Scan Out Page] 1
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.12 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    # dps_scan_page.Input Pouch Number [Scan Out Page]    ${parcel_h}
    # dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    # dps_scan_page.Verify Label Scan Out
    # ...    ${dc_operation.scan_out_title['pouch_number']}
    # ...    ${dc_operation.scan_out_title['parcel_id']}
    # ...    ${dc_operation.scan_out_title['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title['transport']}
    # ...    ${dc_operation.scan_out_title['parcel_owner']}
    # ...    ${dc_operation.scan_out_title['parcel_size']}
    # ...    ${dc_operation.scan_out_title['date']}
    # ...    ${dc_operation.scan_out_title['parcel_status']}
    # dps_scan_page.Verify Value List Scan Out 
    # ...    -
    # ...    SPBD241100000487
    # ...    Home
    # ...    CP All
    # ...    Speedy
    # ...    กล่อง XL
    # ...    2024-11-07     # 2024-11-07 09:40:51
    # ...    พัสดุรอ Scan out ไปคลัง (AC)

    Log    Step No.13 กดปุ่ม ยืนยัน Scan Out
    # dps_scan_page.Click Confirm Scan Out Button
    # Expected
    # dps_scan_page.Verify Popup Confirm Scan Out 

    Log    Step No.14 กดปุ่ม ยืนยัน
    # dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Defect170
    # Expected
    # dps_scan_page.Verify Popup Save Data Success

    Log    Step No.15 คลิกที่ Pop up
    # dps_scan_page.Click Popup Save Data Success
    # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab

    Log    Step No.16 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # Defect220
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}    #Expect Result is ประวัติพัสดุภายในคลัง
    # Expected
    # dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify History Parcel Page

    Log    Step No.17 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    # dps_history_parcel_page.Filter Data By Parcel Number    ${parcel_h}
    # dps_history_parcel_page.Click Edit History Parcel    ${parcel_h}
    # Switch Window    NEW
    # Defect201    Defect202    Defect206
    # Expected
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Timeline

    Log    Step No.18 เข้าเมนู Scan > Scan Out > รายการรอขนส่งเข้ารับ และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan Out Tab
    # dps_scan_page.Click Waiting Delivery List Button
    # Expected
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S009.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['transport']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['date']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['status']}

    Log    Step No.19 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    # dps_wait_delivery.Click Print Button By Data
    # ...    คลัง DC SB    #${DC_Operation_S009.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['transport']}
    # ...    14-11-2567    #${DC_Operation_S009.wait_derivery_data_list['date']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['status']}
    # sleep    5s

    Log    Step No.20 กดปุ่ม พิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # Defect142
    # Expected
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S009.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['transport']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['date']}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['status_after_print']}
    # sleep    5s

    Log    Step No.21 เข้าเมนูหน้าหลัก, เลือกคลังที่ดำเนินงานเป็น "AC" เลือกแท็บงานรับเข้า
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']} 
    dps_home_page.Select Tab Import Task
    # Expected

    Log    Step No.22 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    Click When Ready    //*[@id="__next"]/div/div/div[2]/main/div[2]/div[1]/div/div/button
    Click When Ready    //span[text()='AC']
    dps_scan_page.Input Tracking Number [Scan In Page]    ${parcel_h}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected

    Log    Step No.23 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # Defect220
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}    #Expect Result is ประวัติพัสดุภายในคลัง
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify History Parcel Page
   
    Log    Step No.24 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${parcel_h}
    dps_history_parcel_page.Click Edit History Parcel    ${parcel_h}
    Switch Window    NEW
    # Defect201    Defect202    Defect206
    # Expected
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Timeline

    Log    Step No.25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify Section Waiting List To Scan Out [Scan Out Page]
    # ...    SPBD241100000487
    # ...    -
    # ...    คลัง DC BB    
    # ...    Flash   
    # ...    Speedy
    # ...    กล่อง L
    # ...    07/11/2567
    # ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง    
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Section Waiting List To Scan Out [Scan Out Page] 1
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" และ กดค้นหา หรือกด Enter
    Click When Ready    //*[@id="__next"]/div/div/div[2]/main/div[2]/div[1]/div/div/button
    Click When Ready    //span[text()='AC']
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${parcel_h}
    dps_scan_page.Click Search Button [Scan Out Page]
    # # Expected
    dps_scan_page.Verify Label Scan Out
    ...    ${dc_operation.scan_out_title['pouch_number']}
    ...    ${dc_operation.scan_out_title['parcel_id']}
    ...    ${dc_operation.scan_out_title['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title['transport']}
    ...    ${dc_operation.scan_out_title['parcel_owner']}
    ...    ${dc_operation.scan_out_title['parcel_size']}
    ...    ${dc_operation.scan_out_title['date']}
    ...    ${dc_operation.scan_out_title['parcel_status']}
    # dps_scan_page.Verify Value List Scan Out 
    # ...    -
    # ...    SPBD241100000487
    # ...    คลัง DC BB
    # ...    Flash
    # ...    Speedy
    # ...    กล่อง L
    # ...    2024-11-07     # 2024-11-07 09:40:51
    # ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง

    Log    Step No.27 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out 

    Log    Step No.28 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success

    Log    Step No.29 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab

    Log    Step No.30 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # Defect220
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}    #Expect Result is ประวัติพัสดุภายในคลัง
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify History Parcel Page
   
    Log    Step No.31 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${parcel_h}
    dps_history_parcel_page.Click Edit History Parcel    ${parcel_h}
    Switch Window    NEW
    # Defect201    Defect202    Defect206
    # Expected
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Timeline

    Log    Step No.32 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDCLP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']} 
    # Expected
    # Defect141
    # Expected
    # Filter Data By Parcel Number [All Task Tab]    SPCD241000006135
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    งานรับเข้า    # ${DC_Operation_S009.data_in_all_task_tab['task_type']}
    # ...    speedy    # ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    # ...    home    # ${DC_Operation_S009.data_in_all_task_tab['import_from']}
    # ...    -    #${DC_Operation_S009.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S009.data_in_all_task_tab['transport']}
    # ...    -    #${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    # ...    SPCD241000006135
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S009.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Homepage After Print Waiting Delivery
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Data In All Task Tab After Print Waiting Delivery

    Log    Step No.33 เลือกแท็บงานรับเข้า
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
    # ...    home  # ${DC_Operation_S009.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S009.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S009.data_in_import_task_tab['parcel_owner']}

    Log    Step No.34 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    Click When Ready    //*[@id="__next"]/div/div/div[2]/main/div[2]/div[1]/div/div/button
    Click When Ready    //span[text()='คลัง RDC LP']
    dps_scan_page.Input Tracking Number [Scan In Page]    ${parcel_h}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected

    Log    Step No.35 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Defect222
    # Expected
    dps_scan_page.Verify Accept Scan In Success Popup
    ...    ยืนยันรับเข้าพัสดุ เรียบร้อยแล้ว    # Expected is: ${dc_operation['text_accept_scan_in_success']}

    Log    Step No.36 คลิกที่ี Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.37 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    # Defect220
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}    #Expect Result is ประวัติพัสดุภายในคลัง
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify History Parcel Page

    Log    Step No.38 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${parcel_h}
    dps_history_parcel_page.Click Edit History Parcel    ${parcel_h}
    Switch Window    NEW
    # Defect201    Defect202    Defect206
    # Expected
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    Verify Timeline

    Log    Step No.39 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDCLP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']} 
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    # Expected

    Log    Step No.40 เลือกแท็บงานนำจ่าย
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
    # ...    ${DC_Operation_S009.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S009.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S009.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S009.data_in_send_task_tab['transport']}
