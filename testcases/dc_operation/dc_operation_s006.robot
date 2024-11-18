*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

DC_Operation_S006
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All สร้าง Pouch (ไม่ข้ามภาค)
    [Tags]    DC_Operation    UAT
    Log    Pre Condition
    # รอ Operation_S002
    # ${ParcelsData}    Get Parcels And Sender Names    B2411000294
    # ${parcel_code}    Get Parcel Codes By Sender Name    ${ParcelsData}    ${DC_Operation_S006['sender_name']}
    ${tracking_e}=    Set Variable    SPBD241100009760

    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    # dps_home_page.Click Dropdown For Select role
    # dps_home_page.Select Role    ${dc_operation.role['admin']}

    # Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # # Defect141
    # # Expected
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_e}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S006.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S006.data_in_all_task_tab['parcel_owner']}
    # ...    home  # ${DC_Operation_S006.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S006.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_e}
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S006.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Homepage
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Data In All Task Tab

    # Log    Step No.2 เลือกแท็บงานรับเข้า
    # dps_home_page.Select Tab Import Task
    # # Defect139
    # # Expected
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    home  # ${DC_Operation_S013.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S013.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S013.data_in_import_task_tab['parcel_owner']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Data In Import Task Tab

    Sleep    5s
    Go To    https://dps-uat.allspeedy.co.th/pouch
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}


    Log    Step No.3 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น DC SB ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 4-7
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory    ${DC_Operation_S006.check_close_pouch['inventory']}    DC_Operation_S006

    Log    Step No.8 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_e}
    dps_scan_page.Click Search Button [Scan In Page]
    # Defect143    # Unable to test this step becuase of website is not display 'Create pouch destination: DCSB' popup
    # Expected
    # Verify Create Pouch Destination DCSB Popup
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Create Pouch Destination DCSB Popup
    
    Log    Step No.9 คลิกปุ่มตกลง
    # Defect143    # Unable to test this step becuase of website is not display 'Create pouch destination: DCSB' popup
    # Click Accept    
    # Expected
    # รอโค้ด verify จากพี่พี


    # Log    Step No.5 คลิกปุ่ม ยืนยัน/Print Label
    # dps_scan_page.Click Print Label
    
    # Log    Step No.6 คลิกปุ่มพิมพ์
    # # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # # Defect142
    # # Expected
    # dps_scan_page.Verify Print Label Success Popup
    # ...    ${dc_operation['text_print_label_success']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Print Label Success Popup

    # Log    Step No.7 คลิกที่ x Pop up
    # dps_scan_page.Click Close Print Label Success Popup
    # # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Navigate To Scan Page And Stay At Scan In Tab

    # Log    Step No.8 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # # Defect141
    # # Expected
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_e}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S006.data_in_all_task_tab_after_scan['task_type']}
    # ...    speedy  # ${DC_Operation_S006.data_in_all_task_tab_after_scan['parcel_owner']}
    # ...    home  # ${DC_Operation_S006.data_in_all_task_tab_after_scan['import_from']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab_after_scan['export_to']}
    # ...    CPALL  # ${DC_Operation_S006.data_in_all_task_tab_after_scan['transport']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab_after_scan['pouch_number']}
    # ...    ${tracking_e}
    # ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S006.data_in_all_task_tab_after_scan['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Data In All Task Tab 1
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Data In All Task Tab 2

    # Log    Step No. 9 เลือกแท็บงานส่งออก
    # dps_home_page.Select Tab Export Task
    # # Expected
    # dps_home_page.Verify Data In Export Task Tab
    # ...    DCSB    #${DC_Operation_S006.data_in_export_task_tab['export_to']}
    # ...    CPALL    #${DC_Operation_S006.data_in_export_task_tab['transport']}
    # ...    speedy    #${DC_Operation_S006.data_in_export_task_tab['parcel_owner']}
    # ...    0    #${DC_Operation_S006.data_in_export_task_tab['number_of_pouch']}
    # ...    8    #${DC_Operation_S006.data_in_export_task_tab['number_of_pieces']}
    # ...    8    #${DC_Operation_S006.data_in_export_task_tab['number_of_scanned_items']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Data In Export Task Tab 1
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Data In Export Task Tab 2

    # Log    Step No. 10 เข้าเมนู Scan และ เลือกแท็บ Scan out
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan Out Tab
    # # Expected
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify Section Waiting List To Scan Out [Scan Out Page]
    # ...    SPBD241100002442
    # ...    P112473971
    # ...    คลัง DC BB    #${DC_Operation_S006.scan_out_waiting_scan['receive_parcel_from']}
    # ...    CP ALL    #${DC_Operation_S006.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['parcel_owner']}
    # ...    กล่อง XL    #${DC_Operation_S006.scan_out_waiting_scan['parcel_size']}
    # ...    07/11/2567
    # ...    พัสดุรอ Scan out ไปคลัง DC SB    #${DC_Operation_S006.scan_out_waiting_scan['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Section Waiting List To Scan Out [Scan Out Page] 1
    # Sleep    1s
    # common.Scroll Window To Vertical    1000
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Section Waiting List To Scan Out [Scan Out Page] 2

    # Log    Step No.11 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" และ กดค้นหา หรือกด Enter
    # dps_scan_page.Input Pouch Number [Scan Out Page]    SPBD241100002442
    # dps_scan_page.Click Search Button [Scan Out Page]
    # # Expected
    # dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup
    # ...    เลขพัสดุนี้อยู่ในถุงแล้ว ไม่สามารถ Scan รายชิ้นได้ (scan ทั้ง ถุง)    #${dc_operation['text_please_close_pouch_before_scan_out']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Close Pouch Before Scan Out Warning Popup

    # Log    Step No.12 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    # # Expected
    # dps_pouch_page.Verify Pouch In Pouch Page
    # ...    P112473971
    # ...    ${DC_Operation_S006.data_in_pouch['inventory_crossdock']}
    # ...    DC SB    #${DC_Operation_S006.data_in_pouch['destination_inventory']}
    # ...    ${DC_Operation_S006.data_in_pouch['parcel_amount']}
    # ...    ${DC_Operation_S006.data_in_pouch['status']}
    # ...    07-11-2567
    # ...    ${dc_operation['icon_pencil']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    Verify Pouch In Pouch Page

    # Log    Step No.13 คลิกที่ไอคอนรูปดินสอ
    # dps_pouch_page.Proceed Pouch By Pouch Number    P112473971
    # # Expected
    

    # Log    Step No.14 คลิกปุ่มปิด Pouch/Print Label
    # dps_pouch_page.Click Print Pouch Label
    # # Expected

    # Log    Step No.15 กดปุ่มพิมพ์
    # # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # # Defect142
    # # Expected

    # Log    Step No.16 เข้าเมนู Scan และ เลือกแท็บ Scan out
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan Out Tab
    # # Expected

    # Log    Step No.17 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    # dps_scan_page.Input Pouch Number [Scan Out Page]    P102416833
    # dps_scan_page.Click Search Button [Scan Out Page]
    # # Expected

    # Log    Step No.18 กดปุ่ม ยืนยัน Scan Out
    # dps_scan_page.Click Confirm Scan Out Button
    # # Expected

    # Log    Step No.19 กดปุ่ม ยืนยัน
    # dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # # Expected

    # Log    Step Np.20 คลิกที่ Pop up
    # dps_scan_page.Click Popup Save Data Success
    # # Expected

    # Log    Step No.21 คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    # dps_scan_page.Click Waiting Delivery List Button
    # # Expected

    # Log    Step No.22 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    # dps_scan_page.Click Print Button By Data
    # ...    คลัง DC SB
    # ...    CP ALL
    # ...    1
    # ...    -
    # ...    1
    # # Expected

    # Log    Step No.23 กดปุ่ม พิมพ์
    # # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # common.Click ESC On Keyboard
    # # Defect142
    # # Expected

    # Log    Step No.24 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # # Expected

    # Log    Step No.25 เลือกแท็บงานรับเข้า
    # dps_home_page.Select Tab Import Task
    # # Expected

    # Log    Step No.26 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" และ กดค้นหา หรือกด Enter
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    # dps_scan_page.Select Scan In Tab
    # dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_e}
    # dps_scan_page.Click Search Button [Scan In Page]
    # # Expected

    # Log    Step No.27 คลิกปุ่มตกลง

    # Log    Step No.28 กรอกหมายเลข Pouch ตาม Step ที่ 4 ข้อ 1.8

    # Log    Step No.29 คลิกปุ่มตกลง

    # Log    Step No.30 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" ในช่องค้นหาด้านล่างรายละเอียด Pouch และ กดค้นหา หรือกด Enter

    # Log    Step No.31 คลิกปุ่ม ยืนยัน Scan in

    # Log    Step No.32 คลิกที่ Pop up

    # Log    Step No.33 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    # dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # # Expected

    # Log    Step No.34 เลือกแท็บงานนำจ่าย
    # dps_home_page.Select Tab Send Task
    # # Expected