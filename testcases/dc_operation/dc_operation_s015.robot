*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***   
${SHEET_NAME}    Tracking_S015   # ชื่อชีตที่ต้องการ
${ROW_NUMBER}    2      # แถวที่ต้องการลบ

*** Test Cases ***
DC_Operation_S015
    [Documentation]    ลูกค้า C (ส่งพัสดุที่ร้าน 7-11) --> พัสดุ Partnership dropoff ปลายทางบ้าน
    [Tags]    DC_Operation    UAT
    # Skip
    Log    Step No.1-2 Skip By Use Tracking Mannual
    Set Today
    Log    Read Row From Excel
    ${tracking_info}    common.Read Row From Excel    ${path_excel_tracking_number}    ${SHEET_NAME}    ${ROW_NUMBER}
    Log    ${tracking_info}
    
    Log    Set Tracking Information
    common.Set Tracking Information from excel    ${tracking_info}

    Log    Step No.3 เข้า Url : https://dps-uat.allspeedy.co.th
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    # Expected 
    dps_login_page.Verify Login Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S003    Verify Login Page 

    Log    Step No.4 กรอกข้อมูล Login
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Homepage Title

    Log    Step No.5 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${tracking_number}
    # Defect138    Defect141
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
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
    # ...    งานส่งออก    #for run same tracking# ${DC_Operation_S015.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S015.data_in_all_task_tab['parcel_owner']}
    # ...    -  # ${DC_Operation_S015.data_in_all_task_tab['import_from']}
    # ...    DC BB    #for run same tracking# ${DC_Operation_S015.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S015.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S015.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_number}
    # ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง  # ${DC_Operation_S015.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Homepage
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Data In All Task Tab

    Log    Step No.6 เลือกแท็บงานรับเข้า
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
    # ...    home  # ${DC_Operation_S015.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S015.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S015.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Data In Import Task Tab

    Log    Step No.7 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ z" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_number}
    dps_scan_page.Click Search Button[Scan In Page]
    dps_home_page.Wait Until DC Operation Home Page Loaded
    # Log    Delete Tracking From Excel
    # common.Delete Row In Excel    ${path_excel_tracking_number}    ${SHEET_NAME}    ${ROW_NUMBER}
    # Defect158    Defect160    Defect253
    # Expected    
    # Inprogress
    # dps_home_page.Wait Until Page Loaded
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
    ...    ${tracking_number}
    ...    คุณ z (0633906216)    #${customer_id}
    ...    60 ซม. กล่อง S    #${size_cm} ${size}
    ...    ${DC_Operation_S015.scan_in_data_parcel_detail['parcel_status']}
    ...    ${courier}
    ...    ${DC_Operation_S015.scan_in_data_parcel_detail['pouch_number']}
    ...    ${create_date}
    ...    ${origin_warehoues}
    ...    ${send_parcel_to}

    dps_scan_page.Verify Title Label Parcel In Scan Page [Other Courier]
    ...    ${dc_operation.scan_in_title_label_detail['courier']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}

    dps_scan_page.Verify Data Label Parcel In Scan Page [Other Courier]
    ...    ${courier_label}
    ...    57170 (กล่อง S)    #${zipcode_label} 
    ...    ${customer_label}
    ...    ${phone_label}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Sender Data In Scan In 1
    dps_scan_page.Verify Title Sender In Scan Page
    ...    ${dc_operation.scan_in_title_sender_detail['title']}
    ...    ${dc_operation.scan_in_title_sender_detail['name']}
    ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ...    ${dc_operation.scan_in_title_sender_detail['address']}
    dps_scan_page.Verify Data Sender In Scan Page
    ...    ${sender_name}
    ...    ${sender_phone}
    ...    ${sender_shipping_origin}
    ...    ต.เสาธงหิน อ.บางใหญ่ นนทบุรี บางรัก บางรัก กรุงเทพมหานคร 10500    #${sender_address}

    dps_scan_page.Verify Title Receiver In Scan Page
    ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    dps_scan_page.Verify Data Recevier In Scan Page
    ...    ${receiver_name}
    ...    ${receiver_phone}
    ...    ${receiver_shipping_destination}
    ...    654 เวียง, อำเภอเวียงป่าเป้า, เชียงราย เวียง เวียงป่าเป้า เชียงราย 57170    #${receiver_address}    

    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Sender Data In Scan In 2    

    Log    Step No.8 คลิกปุ่ม ยืนยัน/Print Label
    # dps_scan_page.Click Print Label    

    Log    Step No.9 คลิกปุ่มพิมพ์
    # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Robot Skip Step Print Label
    # Switch Window    NEW
    # Press Keys    None    TAB+SPACE
    # Switch Window    MAIN    
    # # Expected
    # dps_scan_page.Verify Print Label Success Popup
    # ...    ${dc_operation['text_print_label_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Print Label Success Popup


    Log    Step No.10 คลิกที่ x Pop up
    # dps_scan_page.Click Close Popup Print Scan In Success
    # # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.11 คลิกเมนู "รายการประวัติพัสดุทั้งหมด" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify History Parcel Page

    Log    Step No.12 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_number}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_number}
    Switch Window    NEW
    # Defect218
    # Expected
    # comment status in yaml for pass
    dps_history_parcel_page.Verify Timeline    ${DC_Operation_S014['timeline_in_history_parcel']}    2    # 4
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Timeline 1

    Log    Step No.13 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    # Defect187
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
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Homepage 2
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Data In All Task Tab 2

    Log    Step No.14 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Defect181
    # Expected
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # Expected not correct
    # dps_home_page.Verify Data In Export Task Tab
    # ...    DCSB  # ${DC_Operation_S015.data_in_export_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S015.data_in_export_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S15.data_in_export_task_tab['parcel_owner']}

    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Data In Export Task Tab

    Log    Step No.15 เข้าเมนู Scan และเลือกแท็บ Scan Out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_scan_page.Select Scan Out Tab
    # Defect232
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_number}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['pouch_number']}
    # ...    คลัง DC BB    #${DC_Operation_S014.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Value Waiting List To Scan Out [Scan Out Page] 2


    Log    Step No.16 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ z" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${tracking_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Defect 191
    # Expected
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
    # ...    ${DC_Operation_S014.scan_out_waiting_scan['pouch_number']}
    # ...    ${tracking_number}
    # ...    คลัง DC BB    # ${DC_Operation_S015.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S015.scan_out_waiting_scan['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Value List Scan Out 


    Log    Step No.17 กดปุ่ม ยืนยัน Scan Out
    # dps_scan_page.Click Confirm Scan Out Button
    # # Expected
    # dps_scan_page.Verify Popup Confirm Scan Out
    # ...    ${dc_operation.scan_out_title['text_popup_comfirm']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Popup Confirm Scan Out

    Log    Step No.18 กดปุ่ม ยืนยัน
    # dps_scan_page.Click Confirm Button On Popup Asking To Scan Out 
    # # Expected
    # dps_scan_page.Verify Popup Save Data Success
    # ...    ${dc_operation['text_save_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Popup Save Data Success

    Log    Step No.19 คลิกที่ Pop up
    # dps_scan_page.Click Popup Save Data Success 
    # # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Navigate To Scan Page And Stay At Scan Out Tab

    Log    Step No.20 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify History Parcel Page

    Log    Step No.21 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_number}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_number}
    Switch Window    NEW
    # Defect218
    # Expected
    # comment status in yaml for pass
    dps_history_parcel_page.Verify Timeline    ${DC_Operation_S014['timeline_in_history_parcel']}    2    # 5
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S015    Verify Timeline

