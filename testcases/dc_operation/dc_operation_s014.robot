*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***   
${SHEET_NAME}    Tracking_S014   # ชื่อชีตที่ต้องการ
${ROW_NUMBER}    2      # แถวที่ต้องการลบ

*** Test Cases ***
DC_Operation_S014
    [Documentation]    ลูกค้า C (ส่งพัสดุที่ร้าน 7-11) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย Courier
    [Tags]    DC_Operation    UAT

    Log    Step No.1-15 Skip By Use Tracking Mannual
    ${today}    Set Today
    Log    Read Row From Excel
    ${tracking_info}    common.Read Row From Excel    ${path_excel_tracking_number}    ${SHEET_NAME}    ${ROW_NUMBER}
    Log    ${tracking_info}
    
    Log    Set Tracking Information
    common.Set Tracking Information from excel    ${tracking_info}

    Log    Step No.16 เข้า Url : https://dps-uat.allspeedy.co.th
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    # Expected 
    dps_login_page.Verify Login Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Login Page

    Log    Step No.17 กรอกข้อมูล Login
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Homepage Title

    Log    Step No.18 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${DC_Operation_S014.parcel_detail_in_scan_in_tab['tracking']}
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
    # ...    งานส่งออก    #for run same tracking# ${DC_Operation_S014.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S014.data_in_all_task_tab['parcel_owner']}
    # ...    -  # ${DC_Operation_S013.data_in_all_task_tab['import_from']}
    # ...    DC BB    #for run same tracking# ${DC_Operation_S014.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S014.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S014.data_in_all_task_tab['pouch_number']}
    # ...    ${DC_Operation_S014.parcel_detail_in_scan_in_tab['tracking']}
    # ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง  # ${DC_Operation_S014.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Homepage
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Data In All Task Tab


    Log    Step No.19 เลือกแท็บงานรับเข้า
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
    # ...    home  # ${DC_Operation_S013.data_in_import_task_tab['import_from']}
    # ...    CPALL  # ${DC_Operation_S013.data_in_import_task_tab['transport']}
    # ...    speedy  # ${DC_Operation_S013.data_in_import_task_tab['parcel_owner']}

    common.Verify Capture Screenshot    dc_operation    DC_Operation_S014    Verify Data In Import Task Tab

    Log    Step No.20 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter

    Log    Delete Tracking From Excel
    common.Delete Row In Excel    ${path_excel_tracking_number}    ${SHEET_NAME}    ${ROW_NUMBER}

    Log    Step No.21 คลิกปุ่ม ยืนยัน/Print Label


    Log    Step No.22 คลิกปุ่มพิมพ์


    Log    Step No.23 คลิกที่ x Pop up


    Log    Step No.24 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB


    Log    Step No.25 เลือกแท็บงานส่งออก


    Log    Step No.26 เข้าเมนู Scan และเลือกแท็บ Scan Out


    Log    Step No.27 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter


    Log    Step No.28 กดปุ่ม ยืนยัน Scan Out


    Log    Step No.29 กดปุ่ม ยืนยัน


    Log    Step No.30 คลิกที่ Pop up


    Log    Step No.31 คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ


    Log    Step No.32 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ


    Log    Step No.33 กดปุ่ม พิมพ์


