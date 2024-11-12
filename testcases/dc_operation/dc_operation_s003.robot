*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    Reset Cut Off Time
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S003
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางบ้าน ส่งโดย Courier
    [Tags]    DC_Operation    UAT
    
    Log    Prerequisite S002
    Step Test:    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab

    Step Test:    Step เข้าสู่ระบบลูกค้าธุรกิจ
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    # Expected
    b2c_home_page.Verify Company profile page
    ...    ${DC_Operation_S002['company_name']}

    Step Test:    Step เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002   Verify Call Car Pick Up Page

    Step Test:    Step คลิกปุ่ม +เพิ่ม
    b2c_call_car_pick_up_parcel_page.Click Add Button


    Step Test:    Step ระบุข้อมูล
    ${tomorrow}    Set Tomorrow Date
    ${today}    Set Today
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${DC_Operation_S002['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${DC_Operation_S002['parcel_pickup_time']}
    b2c_call_car_pick_up_parcel_page.Click Save Button

    Step Test:    Step เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery    
    
    Step Test:    Step คลิกปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add   
    Sleep    2s

    Step Test:    Step กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    Verify Select Parcel Type

    Step Test:    Step กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${DC_Operation_S002['parcel_type']}

    Step Test:    Step คลิกปุ่ม x เพื่อปิด popup
    b2c_booking_delivery_page.Click Close X Popup
    # Defect068
    # Expected
    b2c_booking_delivery_page.Click Latest Booking Created    ## ใช้แก้ชั่วคราว
    b2c_booking_detail_page.Verify Booking List In Booking Detail Page
    ...    ${Booking['text_booking_id_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_booking_time_label']}
    ...    ${Booking['text_shipping_origin']}

    Step Test:    Step คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Verify Popup To Edit Booking List
    ...    ${Booking['text_parcel_type_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    Verify Edit Booking Popup

    Step Test:    Step คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    b2c_booking_detail_page.Select Pickup Schedule Tab
    # Expected
    b2c_booking_detail_page.Verify Display Pickup Schedule Data
    ...    ${DC_Operation_S002.call_car_pick_up['car_type']}
    ...    ${tomorrow}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${today}
    ...    ${call_car_pick_up.default['price']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    Verify Display Pickup Schedule Data

    Step Test:    Step เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    b2c_booking_detail_page.Select Parcel Pickup Schedule
    b2c_booking_detail_page.Click Save Button In Edit Booking List Popup
    ${booking_id}    Get Booking ID
    Log To Console    ${booking_id}
    # Defect144
    # Expected
    b2c_booking_detail_page.Verify Complete Select Parcel Pickup Schedule And Save
    ...    ${today}
    ...    ${DC_Operation_S002['shipping_origin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    Verify Complete Select Parcel Pickup Schedule And Save

    Step Test:    Step คลิกปุ่ม Import File
    b2c_booking_detail_page.Click Import File Button
    b2c_booking_detail_page.Verify Import File Popup
    ...    ${Booking['text_import']}
    ...    ${Booking['text_btn_template']}
    ...    ${Booking['text_import_time']}
    ...    ${Booking['text_file_name']}
    ...    ${Booking['text_import_result']}
    ...    ${Booking['text_file_import_error']}

    Step Test:    Step เลือกไฟล์ "Booking Dry Template Test DC"
    b2c_booking_detail_page.Import Excel File Of Dry Parcel Template    ${path_excel_booking_dry_template}


    Step Test:    Step cut off time
    dps_home_page.Set Cut Off Time
    ...    ${DB_URI}
    ...    ${DATABASE_NAME}
    ...    ${COLLECTION}
    ...    ${QUERY}
    # Expected
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Status After Cut Off Time
    ...    ${call_car_pick_up.status['arrange_car']}
    ...    ${tomorrow}
    ...    ${today}
    ...    ${booking_id}
    ...    ${DC_Operation_S002.call_car_pick_up['receiving_type']}
    ...    ${DC_Operation_S002['verify_pickup_time']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    Verify Parcel Pickup Status After Cut Off Time

    Step Test:    Step เปิด URL DPS
    Go To    ${DPS_UAT_URL}

    Step Test:    Step เข้าสู่ระบบ
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    dps_home_page.Wait Until Page Loaded
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}


    Step Test:    Step เลือก role แอดมินคลัง
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    # Expected
    dps_home_page.Verify Role Change In Profile    ${dc_operation.role['admin']}


   Log    Step เลือกเมนู "ตรวจสอบรอบเข้ารับพัสดุ"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['check_receiving_cycle']}  
    # Defect175    Defect192
    # Expected
    dps_check_receiving_cycle_page.Verify Check Receiving Cycle Page    
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['all_parcels_received']}
    ...    ${DC_Operation_S002.receiving_cycle['company_name']}
    ...    ${DC_Operation_S002.receiving_cycle['branch']}
    ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S002.receiving_cycle['district']}
    ...    ${DC_Operation_S002.receiving_cycle['province']}
    ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S002.receiving_cycle['courier']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['waiting']}

    Step Test:    Step คลิกแท็บ "รายการรอคลังยืนยัน"
    dps_check_receiving_cycle_page.Select Waiting Inventory Confirm List Tab   
    # Defect175    Defect192
    # Expected
    dps_check_receiving_cycle_page.Verify Inventory Confirm List Tab 
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['waiting_inventory_confirm_list']}
    ...    ${DC_Operation_S002.receiving_cycle['company_name']}   
    ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S002.receiving_cycle['district']}
    ...    ${DC_Operation_S002.receiving_cycle['province']}
    ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S002.receiving_cycle['courier']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['waiting']}

    Step Test:    Step คลิกไอคอนรูปดินสอ ด้านขวาสุดของรายการ
    dps_check_receiving_cycle_page.Click Pencil Icon    ${booking_id}
    # Defect178
    # Expected
    dps_check_receiving_cycle_page.Verify Parcel Pickup Details Popup
    ...    ${DC_Operation_S002.receiving_cycle['company_name']} 
    ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S002.receiving_cycle['district']}
    ...    ${DC_Operation_S002.receiving_cycle['province']}
    ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    ...    ${tomorrow}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S002.receiving_cycle['car_type']}
    ...    ${DC_Operation_S002.receiving_cycle['courier']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    ...    ${DC_Operation.status['waiting']}


    Step Test:    Step คลิกปุ่ม อนุมัติ
    dps_check_receiving_cycle_page.Click Approve Button On Parcel Pickup Details Popup
    # Expected
    dps_check_receiving_cycle_page.Verify Data Saved Success Popup
    dps_check_receiving_cycle_page.Select All Parcels Received List Tab
    dps_check_receiving_cycle_page.Verify Pickup Schedule Change Status
    ...    ${DC_Operation_S002.receiving_cycle['company_name']}
    ...    ${DC_Operation_S002.receiving_cycle['branch']}
    ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S002.receiving_cycle['district']}
    ...    ${DC_Operation_S002.receiving_cycle['province']}
    ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S002.receiving_cycle['courier']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['confirm']}
    
    Log    จัดเก็บค่า parcel id
    ${ParcelsData}=    common.Get Parcels And Sender Names    ${booking_id}
    Log    ${ParcelsData}
    
    # Log    Step เข้า Url : https://dps-uat.allspeedy.co.th
    # common.Open URL    ${DPS_UAT_URL}
    # dps_landing_page.Click Go Login Button
    # # Expected 
    # dps_login_page.Verify Login Page
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S003    Verify Login Page
    
    # Log    Step กรอกข้อมูล Login
    # dps_login_page.Input Email    ${dps_login_user_04['username']}
    # dps_login_page.Input Password    ${dps_login_user_04['password']}
    # dps_login_page.Click Log On Button
    # # Expected
    # dps_home_page.Wait Until Page Loaded
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S003    Verify Homepage Title

    Step Test:    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${DC_Operation_S003.parcel_detail_in_scan_in_tab['tracking']}
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
    # dps_home_page.Verify Data In All Task Tab
    # ...    งานส่งออก    #for run same tracking# ${DC_Operation_S003.data_in_all_task_tab['task_type']}
    # ...    speedy  # ${DC_Operation_S003.data_in_all_task_tab['parcel_owner']}
    # ...    -  # ${DC_Operation_S003.data_in_all_task_tab['import_from']}
    # ...    DC BB    #for run same tracking# ${DC_Operation_S003.data_in_all_task_tab['export_to']}
    # ...    CPALL  # ${DC_Operation_S003.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S003.data_in_all_task_tab['pouch_number']}
    # ...    ${DC_Operation_S013.parcel_detail_in_scan_in_tab['tracking']}
    # ...    พัสดุพร้อมให้พาร์ทเนอร์โลจิสติกนำส่ง  # ${DC_Operation_S003.data_in_all_task_tab['parcel_status']}
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S003    Verify Homepage
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S003    Verify Data In All Task Tab

    Step Test:    Step No.2 เลือกแท็บงานรับเข้า


    Step Test:    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter


    Step Test:    Step No.4 คลิกปุ่ม ยืนยัน/Print Label


    Step Test:    Step No.5 คลิกปุ่มพิมพ์


    Step Test:    Step No.6 คลิกที่ x Pop up


    Step Test:    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย

    Step Test:    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น


    Step Test:    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB


    Step Test:    Step No.10 เลือกแท็บงานส่งออก


    Step Test:    Step No.11 เข้าเมนู Scan และ เลือกแท็บ Scan out


    Step Test:    Step No.12


    Step Test:    Step No.13


    Step Test:    Step No.14


    Step Test:    Step No.15


    Step Test:    Step No.16


    Step Test:    Step No.17


    Step Test:    Step No.18


    Step Test:    Step No.19


    Step Test:    Step No.20



