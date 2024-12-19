*** Settings ***
Resource          ../../../resources/init_website.robot
Resource          ../../../resources/import.robot

*** Keywords ***
DC_Operation_S002
    Log    Reset Cut Off Time To 23:59    #เพื่อที่จะสามารถรันโรบอทได้หลัง 17:00
    dps_home_page.Reset Cut Off Time     23:59

    Log    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_URL}
    register_general_customers_page.Select Business Customers Tab
    Sleep    2s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    1.Verify Login Page

    Log    Step No.2 เข้าสู่ระบบลูกค้าธุรกิจ
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    # Expected
    b2c_home_page.Verify Company Profile Page    ${DC_Operation_S002['company_name']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002   2.Verify Home Page

    Log    Step No.3 เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002   3.Verify Call Car Pick Up Page

    Log    Step No.4 คลิกปุ่ม +เพิ่ม
    b2c_call_car_pick_up_parcel_page.Click Add Button
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Popup Parcel Pickup Schedule
    ...    ${call_car_pick_up['text_parcel_pickup_schedule']}
    ...    ${call_car_pick_up['text_car_round_name']}
    ...    ${call_car_pick_up['text_parcel_type']}
    ...    ${call_car_pick_up['text_parcel_pickup_date']}
    ...    ${call_car_pick_up['text_parcel_pickup_time']}
    ...    ${call_car_pick_up['button_save']}
    ...    ${call_car_pick_up['button_cancel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002   4.Verify Parcel Pickup Schedule Popup

    Log    Step No.5 ระบุข้อมูล
    Set Tomorrow Date
    Set Today
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${DC_Operation_S002['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${DC_Operation_S002['parcel_pickup_time']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Add Parcel Pickup
    ...    ${call_car_pick_up.status['parcel_in_progress']}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${tomorrow}
    ...    ${DC_Operation_S002['verify_pickup_time']}
    ...    ${today}
    ...    ${call_car_pick_up['text_parcel_number']}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${call_car_pick_up['text_price']}
    ...    ${call_car_pick_up.default['price']}
    ...    ${call_car_pick_up['text_pickup_location']}
    ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S002.receiving_cycle['district']}
    ...    ${DC_Operation_S002.receiving_cycle['province']}
    ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002   5.Verify Add Special Pickup Round Success

    Log    Step No.6 เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery    
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    6.Verify Booking Page
    
    Log    Step No.7 คลิกปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    Sleep    2s
    # Expected
    Log Defect No:  Defect043
    # b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    7.Verify Term & Condition

    Log    Step No.8 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    8.Verify Select Parcel Type

    Log    Step No.9 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${DC_Operation_S002['parcel_type']}
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    9.Verify Create Parcel Page Sender Step

    Log    Step No.10 คลิกปุ่ม x เพื่อปิด popup
    b2c_booking_delivery_page.Click Close X Popup
    # Expected
    b2c_booking_detail_page.Verify Booking List In Booking Detail Page
    ...    ${Booking['text_booking_id_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_booking_time_label']}
    ...    ${Booking['text_shipping_origin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    10.Verify Booking Detail Page

    Log    Step No.11 คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    b2c_booking_detail_page.Verify Popup To Edit Booking List
    ...    ${Booking['text_parcel_type_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    11.Verify Edit Booking Popup

    Log    Step No.12 คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    b2c_booking_detail_page.Select Pickup Schedule Tab
    # Expected
    b2c_booking_detail_page.Verify Display Pickup Schedule Data
    ...    ${DC_Operation_S002.receiving_cycle['car_type']}
    ...    ${tomorrow}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${today}
    ...    ${call_car_pick_up.default['price']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    12.Verify Display Pickup Schedule Data

    Log    Step No.13 เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    b2c_booking_detail_page.Select Parcel Pickup Schedule
    b2c_booking_detail_page.Click Save Button In Edit Booking List Popup
    ${booking_id}    Get Booking ID
    # Expected
    Log Defect No:  Defect144
    # b2c_booking_detail_page.Verify Complete Select Parcel Pickup Schedule And Save
    # ...    ${today}
    # ...    ${DC_Operation_S002.receiving_cycle['company_name']}
    # ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    # ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    # ...    ${DC_Operation_S002.receiving_cycle['district']}
    # ...    ${DC_Operation_S002.receiving_cycle['province']}
    # ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    13.Verify Complete Select Parcel Pickup Schedule And Save

    Log    Step No.14 คลิกปุ่ม Import File
    b2c_booking_detail_page.Click Import File Button
    # Expected
    b2c_booking_detail_page.Verify Import File Popup
    ...    ${Booking['text_import']}
    ...    ${Booking['text_btn_template']}
    ...    ${Booking['text_import_time']}
    ...    ${Booking['text_file_name']}
    ...    ${Booking['text_import_result']}
    ...    ${Booking['text_file_import_error']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    14.Verify Import File Popup

    Log    Step No.15 คลิกปุ่ม Import 
    Log    Step No.16 เลือกไฟล์ "Booking Dry Template Test DC"
    b2c_booking_detail_page.Import Excel File Of Dry Parcel Template    ${path_excel_booking_dry_template}
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page After Import File
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${call_car_pick_up.text_parcel_id_start_with['dry']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    16.Verify Import File Success

    Log    เก็บ Parcel ID และ ชื่อผู้ส่ง
    ${ParcelsData}    Get Parcels And Sender Names    ${booking_id}
    Log To Console    ${ParcelsData}
    Set Global Variable    ${Global_ParcelsData}    ${ParcelsData}

    Log    Step No.17 Set Cut Off Time To Current Time    #ถ้าเปลี่ยนเวลาจากเวลาปัจจุบันเป็นเวลาอื่่น จะส่งผลให้ Fail ที่ Keyword Verify Parcel Pickup Status After Cut Off Time
    ${current_date}    common.Get Current Date For Cut Off Time
    dps_home_page.Set Cut Off Time    ${current_date}
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    Log Defect No:  Defect150
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Status After Cut Off Time
    ...    ${call_car_pick_up.status['arrange_car']}
    ...    ${tomorrow}
    ...    ${today}
    ...    ${booking_id}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S002['verify_pickup_time']}
    ...    ${DC_Operation_S002['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    17.1.Verify Parcel Pickup Status After Cut Off Time
    b2c_home_page.Click Book Parcel Delivery    
    b2c_booking_delivery_page.Verify Booking Status After Cut Off Time    
    ...    ${booking_id}
    ...    ${Booking['text_waiting_confirm_parcel_pickup']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    17.2.Verify Booking Status After Cut Off Time
    b2c_booking_delivery_page.Select Booking With Booking ID    
    ...    ${booking_id}
    # b2c_booking_detail_page.Verify Booking Detail Page After Import File
    # ...    ${Booking['text_waiting_confirm_parcel_pickup']}
    # ...    ${call_car_pick_up.text_parcel_id_start_with['dry']}
    # ...    ${DC_Operation_S002['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    17.3.Verify Parcel Status After Cut Off Time

    Log    Step No.18 เปิด URL DPS
    common.Open URL    ${DPS_URL}
    # Expected
    dps_landing_page.Verify Go Login Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    18.Verify Go Login DPS Page

    Log    Step No.19_1 เข้าสู่ระบบ
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    19.1.Verify Homepage Title

    Log    Step No.19_2 เลือก Role แอดมินคลัง
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    # Expected
    dps_home_page.Verify Role Change In Profile    ${dc_operation.role['admin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    19.2.Verify Role Change In Profile

    Log    Step No.20 เลือกเมนู "ตรวจสอบรอบเข้ารับพัสดุ"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['check_receiving_cycle']}  
    # Expected
    Log Defect No:  Defect192
    # dps_check_receiving_cycle_page.Verify Check Receiving Cycle Page    
    # ...    ${dc_operation.title['check_receiving_cycle']}
    # ...    ${dc_operation.Check_Receiving_Cycle_Tab['all_parcels_received']}
    # ...    ${DC_Operation_S002.receiving_cycle['company_name']}
    # ...    ${DC_Operation_S002.receiving_cycle['branch']}
    # ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    # ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    # ...    ${DC_Operation_S002.receiving_cycle['district']}
    # ...    ${DC_Operation_S002.receiving_cycle['province']}
    # ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    # ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    # ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    # ...    ${DC_Operation_S002.receiving_cycle['courier']}
    # ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    # ...    ${today}
    # ...    ${DC_Operation.status['waiting']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    20.Verify Check Receiving Cycle Page

    Log    Step No.21 คลิกแท็บ "รายการรอคลังยืนยัน"
    dps_check_receiving_cycle_page.Select Waiting Warehouse Confirm List Tab   
    # Expected
    Log Defect No:  Defect192
    # dps_check_receiving_cycle_page.Verify Warehouse Confirm List Tab 
    # ...    ${dc_operation.title['check_receiving_cycle']}
    # ...    ${dc_operation.Check_Receiving_Cycle_Tab['waiting_inventory_confirm_list']}
    # ...    ${DC_Operation_S002.receiving_cycle['company_name']}   
    # ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    # ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    # ...    ${DC_Operation_S002.receiving_cycle['district']}
    # ...    ${DC_Operation_S002.receiving_cycle['province']}
    # ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    # ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    # ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    # ...    ${DC_Operation_S002.receiving_cycle['courier']}
    # ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    # ...    ${today}
    # ...    ${DC_Operation.status['waiting']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    21.Verify Warehouse Confirm List Tab

    Log    Step No.22 คลิกไอคอนรูปดินสอ ด้านขวาสุดของรายการ
    dps_check_receiving_cycle_page.Click Pencil Icon    
    ...    ${booking_id}
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
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['waiting']}
    # Expected
    Log Defect No:  Defect192
    # dps_check_receiving_cycle_page.Verify Parcel Pickup Details Popup
    # ...    ${DC_Operation_S002.receiving_cycle['company_name']} 
    # ...    ${DC_Operation_S002.receiving_cycle['company_address']}
    # ...    ${DC_Operation_S002.receiving_cycle['sub_district']}
    # ...    ${DC_Operation_S002.receiving_cycle['district']}
    # ...    ${DC_Operation_S002.receiving_cycle['province']}
    # ...    ${DC_Operation_S002.receiving_cycle['postcode']}
    # ...    ${tomorrow}
    # ...    ${DC_Operation_S002.receiving_cycle['receiving_time']}
    # ...    ${DC_Operation_S002.receiving_cycle['car_type']}
    # ...    ${DC_Operation_S002.receiving_cycle['courier']}
    # ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    # ...    ${DC_Operation.status['waiting']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    22.Verify Parcel Pickup Details Popup
    
    Log    Step No.23 คลิกปุ่ม Export
    dps_check_receiving_cycle_page.Click Export Button On Parcel Pickup Details Popup
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    23.Verify Click Export Button

    Log    Step No.24 คลิกปุ่ม อนุมัติ
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
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['confirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    24.Verify Pickup Schedule Change Status To Confirm

    Log    Step No.25 กลับ Speed D "เรียกรถเข้ารับพัสดุ"
    common.Open URL    ${B2C_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    Sleep    3s
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Schedule Change Status To Confirm
    ...    ${call_car_pick_up.status['confirm']}
    ...    ${tomorrow}
    ...    ${today}
    ...    ${booking_id}
    ...    ${DC_Operation_S002.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S002['verify_pickup_time']}
    ...    ${DC_Operation_S002.receiving_cycle['number_of_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S002    25.Verify Parcel Pickup Schedule Change Status To Confirm
    
DC_Operation_S004
    ${tracking_c}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S004['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${tracking_c}
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
    # ...    ${DC_Operation_S004.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    1.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S004.data_in_import_task_tab['import_from1']}
    # ...    ${DC_Operation_S004.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S004.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004   2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    3.Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น DC SB ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 4-7
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory
    ...    ${DC_Operation_S004.check_close_pouch['inventory']}
    ...    ${dc_operation['text_warning_confirm_to_close_pouch']}
    ...    ${dc_operation['text_transaction_complete']}
    ...    DC_Operation_S004

    Log    Step No.8 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ c" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_c}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Create Pouch Popup After Scan In    ${DC_Operation_S004['destination_warehouse']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    8.Verify Create Pouch Destination DCSB Popup
    
    Log    Step No.9 คลิกปุ่มตกลง
    dps_scan_page.Click Accept Button On Popup For Creating Pouch
    ${pouch_number}    Get Pouch Number And Verify Pouch Format
    Set Suite Variable    ${global_pouch_number}    ${pouch_number}
    # Expected
    Log Defect No:  Defect155,Defect215,Defect249,Defet260
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['parcel_status1']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['zipcode']}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    9.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S004.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S004.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S004.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S004.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    9.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S004.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S004.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S004.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S004.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    9.3.Data Receiver Details In Scan Page

    Log    Step No.10 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.11 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    11.Verify Print Label Success Popup

    Log    Step No.12 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    12.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.13 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    13.Verify History Parcel Page

    Log    Step No.14 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_c}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_c}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S004['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S004['timeline_in_history_parcel']}    6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    14.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.15 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_c}
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
    # ...    ${DC_Operation_S004.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    15.1.Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    15.2.Verify Data In All Task Tab 2

    Log    Step No.16 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect189,Defect187
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S004.data_in_export_task_tab['export_to']}
    # ...    ${DC_Operation_S004.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S004.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    16.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    16.2.Verify Data In Export Task Tab 2

    Log    Step No. 17 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_c}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    17.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    17.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.18 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ c" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_c}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect177
    # dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    18.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.19 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    Filter Data By Destination Inventory [Pouch Page]    ${DC_Operation_S004['destination_warehouse']}
    # Expected
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S004.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S004.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S004.data_in_pouch_list['status_on']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    19.Verify Pouch In Pouch Page

    Log    Step No.20 คลิกที่ไอคอนรูปดินสอ
    dps_pouch_page.Proceed Pouch By Pouch Number    ${pouch_number}
    # Expected
    Log Defect No:  Defect215,Defect223,Defect279,Defect290
    # dps_pouch_page.Verify Label Of Information Section In Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_detail_pouch']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['crossdock_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_status']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['parcel_amount']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Data Of Information Section In Pouch Detail Popup
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S004.data_in_pouch_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail['pouch_status']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail['origin_warehouse']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Label Section In Pouch Detail Popup
    # ...    ${DC_Operation_S004.data_in_pouch_detail['label_destination_warehouse']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail['label_number']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail['label_route']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail['label_symbol']}
    # ...    ${pouch_number}
    # dps_pouch_page.Verify Label In Table On Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_parcel_in_pouch_list']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pickup_place']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['type']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['parcel_status']}
    # ...    ${dc_operation['text_close_pouch_and_print_label']}
    # dps_pouch_page.Verify Data In Table On Pouch Detail Popup
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.data_in_pouch_detail.data_in_table['destination_warehouse']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail.data_in_table['pickup_place']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail.data_in_table['type']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail.data_in_table['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    20.Verify Pouch Detail Popup

    Log    Step No.21 คลิกปุ่มปิด Pouch/Print Label
    dps_pouch_page.Click Print Pouch Label
    # Expected
    dps_pouch_page.Verify Warning Confirm To Close Pouch    ${dc_operation['text_warning_confirm_to_close_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    21.Verify Warning Confirm To Close Pouch

    Log    Step No.22 ปิด Pouch/Print Label
    dps_pouch_page.Click Close Pouch/Print Label Button On Warning Popup

    Log    Step No.23 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_pouch_page.Verify Transaction Complete Popup    ${dc_operation['text_transaction_complete']}
    common.Verify Capture Screenshot  dc_operation    DC_Operation_S004    23.Verify Transaction Complete Popup

    Log    Step No.24 คลิกที่ x Pop up
    dps_pouch_page.CLick Close Button
    # Expected
    Reload Page
    dps_pouch_page.Verify Transaction Complete Popup Was Closed
    dps_pouch_page.Verify Navigate To Pouch Page Success
    dps_pouch_page.Filter Data By Destination Inventory [Pouch Page]    ${DC_Operation_S004['destination_warehouse']}
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S004.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S004.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S004.data_in_pouch_list['status_off']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004   24.Verify Transaction Complete Popup Was Closed

    Log    Step No. 25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_c}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S004.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    25.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    25.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ c" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_c}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_unable_to_scan_trcking_becuase_parcel_is_in_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    26.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.27 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Click Clear Button [Scan Out]
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232
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
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S004.scan_out_list_data['tracking_number']}
    # ...    ${DC_Operation_S004.scan_out_list_data['receive_parcel_from']}
    # ...    ${DC_Operation_S004.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S004.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S004.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S004.scan_out_list_data['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    27.Verify Value List Scan Out

    Log    Step No.28 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    28.Verify Popup Confirm Scan Out

    Log    Step No.29 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    29.Verify Popup Save Data Success

    Log    Step No.30 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    30.Verify Navigate To Scan Page After Scan Out

    Log    Step No.31 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    31.Verify History Parcel Page After Scan Out

    Log    Step No.32 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_c}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_c}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect270
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S004['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S004['timeline_in_history_parcel']}    7
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    32.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.33 เข้าเมนู Scan เลือกแท็บ Scan Out และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S004.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S004.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S004.wait_derivery_data_list['status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    33.Verify Delivery List Page

    Log    Step No.34 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    Log Defect No:  Defect289
    # dps_wait_delivery.Click Print Button By Data
    # ...    ${DC_Operation_S004.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S004.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S004.wait_derivery_data_list['status']}

    Log    Step No.35 กดปุ่ม พิมพ์
    common.Robot Skip Step Print Label
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S004.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S004.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S004.wait_derivery_data_list['status_after_print']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    35.Verify Delivery List Page After Print

    Log    Step No.36 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_c}
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
    # ...    ${DC_Operation_S004.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_status3']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    36.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    36.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log   Step No.37 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S004.data_in_import_task_tab['import_from2']}
    # ...    ${DC_Operation_S004.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S004.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    37.Verify Import Task Tab At Destination Warehouse

    Log    Step No.38 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ c" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_c}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect237
    # dps_scan_page.Verify Parcel Is On Pouch Warning Popup    ${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    38.Verify Parcel Is On Pouch Warning Popup

    Log    Step No.39 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    39.Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.40 กรอกหมายเลข pouch
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Unbox Pouch And Scan Piece By Piece    ${dc_operation['text_unbox_pouch_and_scan_piece_by_piece']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    40.Verify Unbox Pouch And Scan Piece By Piece

    Log    Step No.41 คลิกปุ่มยืนยัน
    dps_scan_page.Click Confirm Button On Unbox Pouch And Scan Piece By Piece Popup
    # Expected
    Log Defect No:  Defect242
    # dps_scan_page.Verify Label Pouch Detail In Scan In Page
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['pouch_number']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['parcel_in_pouch_amount']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['courier']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['date_delivery_origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Data Pouch Detail In Scan In Page
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S004.data_in_pouch_detail_scan_in_page['parcel_amount']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail_scan_in_page['courier']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail_scan_in_page['origin_warehoues']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S004.data_in_pouch_detail_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Label Parcel In Pouch In Scan In Page
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_number']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['destination_warehourse']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_size']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['type']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_status']}
    # dps_scan_page.Verify Data Parcel In Pouch In Scan In Page
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.data_in_parcel_in_pouch_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S004.data_in_parcel_in_pouch_scan_in_page['parcel_size']}
    # ...    ${DC_Operation_S004.data_in_parcel_in_pouch_scan_in_page['type']}
    # ...    ${DC_Operation_S004.data_in_parcel_in_pouch_scan_in_page['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    41.Verify Scan In Page After Scan Pouch At DC SB Warehouse

    Log    Step No.42 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ c" ในช่องค้นหาด้านล่างรายละเอียด Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number In Search Bar On Pouch Detail Section    ${tracking_c}
    dps_scan_page.Click Search Button Of Pouch Detail Section
    # Expected
    Log Defect No:  Defect155,Defect215,Defect249,Defect260,Defect268
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S004.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['zipcode']}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S004.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    42.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S004.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S004.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S004.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S004.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    42.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S004.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S004.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S004.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S004.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    42.3.Data Receiver Details In Scan Page

    Log    Step No.43 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    dps_scan_page.Verify Accept Scan In Success Popup    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    43.Verify Accept Scan In Success Popup

    Log    Step No.44 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    Log Defect No:  Defect288
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    44.Verify Navigate To Scan Page And Stay At Scan In Tab At Destination Warehouse

    Log    Step No.45 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    45.Verify History Parcel Page After Scan In

    Log    Step No.46 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_c}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_c}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect270
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S004['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S004['timeline_in_history_parcel']}    9
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    46.Verify Timeline After Scan In At Destination Warehouse
    Close Window
    Switch Window    MAIN

    Log    Step No.47 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_c}
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
    # ...    ${DC_Operation_S004.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['export_to3']}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_c}
    # ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_status4']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    47.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    47.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log    Step No.48 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S004.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S004.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S004.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S004.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    48.Verify Send Task Tab

DC_Operation_S005
    ${tracking_d}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S005['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก -> เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
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
    # ...    ${DC_Operation_S005.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    1.1.Verify Homepage
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S005.data_in_import_task_tab['import_from1']}
    # ...    ${DC_Operation_S005.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005   2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนู Scan -> กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ d" -> กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_d}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect155,Defect249
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['parcel_status1']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    3.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S005.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    3.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S005.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    3.3.Data Receiver Details In Scan Page

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label
    Sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    4.Verify Click Print Label

    Log    Step No.5 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup
    ...    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    5.Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    6.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
     dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    7.Verify History Parcel Page

    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_d}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_d}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S005['timeline_in_history_parcel']}    5
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    8.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
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
    # ...    ${DC_Operation_S005.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to4']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    9.1.Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    9.2.Verify Data In All Task Tab 2

    Log    Step No.10 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect169,Defect189,Defect291
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S005.data_in_export_task_tab['export_to']}
    # ...    ${DC_Operation_S005.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    10.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    10.2.Verify Data In Export Task Tab 2

    Log    Step No.11 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['pouch_number']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S005.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005   11.1.Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    11.2.Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.12 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ d" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_d}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect255
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
    # ...    ${DC_Operation_S007.scan_out_list_data['pouch_number']}
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.scan_out_list_data['receive_parcel_from']}
    # ...    ${DC_Operation_S005.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S005.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S005.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S005.scan_out_list_data['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    12.Verify Section Scan Out [Scan Out Page]

    Log    Step No.13 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    13.Verify Popup Confirm Scan Out

    Log    Step No.14 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    14.Verify Popup Save Data Success

    Log    Step No.15 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    15.Verify Navigate To Scan Page After Scan Out

    Log    Step No.16 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    16.Verify History Parcel Page After Scan Out

    Log    Step No.17 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_d}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_d}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline    ${DC_Operation_S005['timeline_in_history_parcel']}    6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    17.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.18 คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    sleep    5s
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S005.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['status1']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    18.Verify Delivery List Page

    Log    Step No.19 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    # dps_wait_delivery.Click Print Button By Data
    # ...    ${DC_Operation_S005.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['status1']}
    # sleep    5s

    Log    Step No.20 กดปุ่ม พิมพ์
    # common.Robot Skip Step Print Label
    # Expected
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S005.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S005.wait_derivery_data_list['status2']}
    # sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    20.Verify Delivery List Page After Print


    Log    Step No.21 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCSB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    # Expected
    Log Defect No:  Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
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
    # ...    ${DC_Operation_S005.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    21.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    21.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log    Step No.22 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S005.data_in_import_task_tab['import_from1']}
    # ...    ${DC_Operation_S005.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    22.Verify Import Task Tab At Destination Warehouse

    Log    Step No.23 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ d" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_d}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect155,Defect212,Defect249,Defect268
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['zipcode']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S005.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S005.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    23.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S005.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S005.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    23.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S005.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S005.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    23.3.Data Receiver Details In Scan Page

    Log    Step No.24 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    Log Defect No:  Defect222
    # dps_scan_page.Verify Accept Scan In Success Popup    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    24.Verify Accept Scan In Success Popup

    Log    Step No.25 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    25.Verify Navigate To Scan Page And Stay At Scan In Tab At Destination Warehouse

    Log    Step No.26 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}   
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    26.Verify History Parcel Page After Scan In

    Log    Step No.27 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_d}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_d}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S005['timeline_in_history_parcel']}    7
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    27.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.28 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCSB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    dps_home_page.Select Tab All Task
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_d}
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
    # ...    ${DC_Operation_S005.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['export_to3']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_d}
    # ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_status4']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    28.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    28.2.Verify Data In All Task Tab


    Log    Step No.29 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['customer_type']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S005.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S005.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S005.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S005.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S005    29.Verify Send Task Tab

DC_Operation_S006
    ${tracking_e}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S006['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_e}
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
    # ...    ${DC_Operation_S006.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    1.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S006.data_in_import_task_tab['import_from1']}
    # ...    ${DC_Operation_S006.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S006.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006   2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    3.Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น DC SB ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 4-7
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory
    ...    ${DC_Operation_S006.check_close_pouch['inventory']}
    ...    ${dc_operation['text_warning_confirm_to_close_pouch']}
    ...    ${dc_operation['text_transaction_complete']}
    ...    DC_Operation_S006

    Log    Step No.8 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_e}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Create Pouch Popup After Scan In    ${DC_Operation_S006['destination_warehouse']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S004    8.Verify Create Pouch Destination DCSB Popup
    
    Log    Step No.9 คลิกปุ่มตกลง
    dps_scan_page.Click Accept Button On Popup For Creating Pouch
    ${pouch_number}    Get Pouch Number And Verify Pouch Format
    # Expected
    Log Defect No:  Defect155,Defect215,Defect249,Defect260
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['parcel_status1']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    9.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S006.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S006.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S006.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S006.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    9.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S006.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S006.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S006.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S006.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    9.3.Data Receiver Details In Scan Page

    Log    Step No.10 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.11 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    11.Verify Print Label Success Popup

    Log    Step No.12 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    12.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.13 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    13.Verify History Parcel Page

    Log    Step No.14 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_e}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_e}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S006['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S006['timeline_in_history_parcel']}    6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    14.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.15 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_e}
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
    # ...    ${DC_Operation_S006.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    15.1.Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    15.2.Verify Data In All Task Tab 2

    Log    Step No.16 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect189,Defect291
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S006.data_in_export_task_tab['export_to']}
    # ...    ${DC_Operation_S006.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S006.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    16.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    16.2.Verify Data In Export Task Tab 2

    Log    Step No. 17 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_e}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    17.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    17.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.18 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_e}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect177
    # dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    18.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.19 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    Filter Data By Destination Inventory [Pouch Page]    ${DC_Operation_S006['destination_warehouse']}
    # Expected
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S006.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S006.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S006.data_in_pouch_list['status_on']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    19.Verify Pouch In Pouch Page

    Log    Step No.20 คลิกที่ไอคอนรูปดินสอ
    dps_pouch_page.Proceed Pouch By Pouch Number    ${pouch_number}
    # Expected
    Log Defect No:  Defect215,Defect223,Defect279,Defect290
    # dps_pouch_page.Verify Label Of Information Section In Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_detail_pouch']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['crossdock_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_status']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['parcel_amount']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Data Of Information Section In Pouch Detail Popup
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S006.data_in_pouch_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail['pouch_status']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail['origin_warehouse']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Label Section In Pouch Detail Popup
    # ...    ${DC_Operation_S006.data_in_pouch_detail['label_destination_warehouse']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail['label_number']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail['label_route']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail['label_symbol']}
    # ...    ${pouch_number}
    # dps_pouch_page.Verify Label In Table On Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_parcel_in_pouch_list']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pickup_place']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['type']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['parcel_status']}
    # ...    ${dc_operation['text_close_pouch_and_print_label']}
    # dps_pouch_page.Verify Data In Table On Pouch Detail Popup
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.data_in_pouch_detail.data_in_table['destination_warehouse']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail.data_in_table['pickup_place']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail.data_in_table['type']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail.data_in_table['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    20.Verify Pouch Detail Popup

    Log    Step No.21 ปิด Pouch/Print Label
    dps_pouch_page.Click Print Pouch Label
    # Expected
    dps_pouch_page.Verify Warning Confirm To Close Pouch    ${dc_operation['text_warning_confirm_to_close_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    21.Verify Warning Confirm To Close Pouch

    Log    Step No.22 ปิด Pouch/Print Label
    dps_pouch_page.Click Close Pouch/Print Label Button On Warning Popup

    Log    Step No.23 คลิกปุ่มพิมพ์
    Sleep    5s
    common.Robot Skip Step Print Label
    # Expected
    dps_pouch_page.Verify Transaction Complete Popup    ${dc_operation['text_transaction_complete']}
    common.Verify Capture Screenshot  dc_operation    DC_Operation_S006    23.Verify Transaction Complete Popup

    Log    Step No.24 คลิกที่ x Pop up
    dps_pouch_page.CLick Close Button
    # Expected
    Reload Page
    dps_pouch_page.Verify Transaction Complete Popup Was Closed
    dps_pouch_page.Verify Navigate To Pouch Page Success
    dps_pouch_page.Filter Data By Destination Inventory [Pouch Page]    ${DC_Operation_S006['destination_warehouse']}
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S006.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S006.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S006.data_in_pouch_list['status_off']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006   24.Verify Transaction Complete Popup Was Closed

    Log    Step No. 25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_e}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S006.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    25.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    25.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232
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
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S006.scan_out_list_data['tracking_number']}
    # ...    ${DC_Operation_S006.scan_out_list_data['receive_parcel_from']}
    # ...    ${DC_Operation_S006.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S006.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S006.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S006.scan_out_list_data['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    26.Verify Value List Scan Out

    Log    Step No.27 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    27.Verify Popup Confirm Scan Out

    Log    Step No.28 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    28.Verify Popup Save Data Success

    Log    Step No.29 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    29.Verify Navigate To Scan Page After Scan Out

    Log    Step No.30 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    30.Verify History Parcel Page After Scan Out

    Log    Step No.31 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_e}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_e}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S006['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S006['timeline_in_history_parcel']}    7
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    31.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.32 เข้าเมนู Scan เลือกแท็บ Scan Out และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S006.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S006.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S006.wait_derivery_data_list['status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    32.Verify Delivery List Page

    Log    Step No.33 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    Log Defect No:  Defect289
    # dps_wait_delivery.Click Print Button By Data
    # ...    ${DC_Operation_S006.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S006.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S006.wait_derivery_data_list['status']}

    Log    Step No.34 กดปุ่ม พิมพ์
    common.Robot Skip Step Print Label
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S006.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S006.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S006.wait_derivery_data_list['status_after_print']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    34.Verify Delivery List Page After Print

    Log    Step No.35 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_e}
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
    # ...    ${DC_Operation_S006.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_status3']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    35.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    35.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log   Step No.36 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S006.data_in_import_task_tab['import_from2']}
    # ...    ${DC_Operation_S006.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S006.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    36.Verify Import Task Tab At Destination Warehouse

    Log    Step No.37 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_e}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect237
    # dps_scan_page.Verify Parcel Is On Pouch Warning Popup    ${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    37.Verify Parcel Is On Pouch Warning Popup

    Log    Step No.38 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    38.Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.39 กรอกหมายเลข pouch
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Unbox Pouch And Scan Piece By Piece    ${dc_operation['text_unbox_pouch_and_scan_piece_by_piece']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    39.Verify Unbox Pouch And Scan Piece By Piece

    Log    Step No.40 คลิกปุ่มยืนยัน
    dps_scan_page.Click Confirm Button On Unbox Pouch And Scan Piece By Piece Popup
    # Expected
    Log Defect No:  Defect242
    # dps_scan_page.Verify Label Pouch Detail In Scan In Page
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['pouch_number']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['parcel_in_pouch_amount']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['courier']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['date_delivery_origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Data Pouch Detail In Scan In Page
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S006.data_in_pouch_detail_scan_in_page['parcel_amount']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail_scan_in_page['courier']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail_scan_in_page['origin_warehoues']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S006.data_in_pouch_detail_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Label Parcel In Pouch In Scan In Page
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_number']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['destination_warehourse']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_size']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['type']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_status']}
    # dps_scan_page.Verify Data Parcel In Pouch In Scan In Page
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.data_in_parcel_in_pouch_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S006.data_in_parcel_in_pouch_scan_in_page['parcel_size']}
    # ...    ${DC_Operation_S006.data_in_parcel_in_pouch_scan_in_page['type']}
    # ...    ${DC_Operation_S006.data_in_parcel_in_pouch_scan_in_page['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    40.Verify Scan In Page After Scan Pouch At DC SB Warehouse

    Log    Step No.41 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ e" ในช่องค้นหาด้านล่างรายละเอียด Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number In Search Bar On Pouch Detail Section    ${tracking_e}
    dps_scan_page.Click Search Button Of Pouch Detail Section
    # Expected
    Log Defect No:  Defect155,Defect215,Defect249,Defect260,Defect268
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S006.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S006.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    41.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S006.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S006.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S006.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S006.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    41.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S006.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S006.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S006.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S006.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    41.3.Data Receiver Details In Scan Page

    Log    Step No.42 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    Log Defect No:  Defect288
    # dps_scan_page.Verify Accept Scan In Success Popup    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    42.Verify Accept Scan In Success Popup

    Log    Step No.43 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    43.Verify Navigate To Scan Page And Stay At Scan In Tab At Destination Warehouse

    Log    Step No.44 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    44.Verify History Parcel Page After Scan In

    Log    Step No.45 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_e}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_e}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230,Defect269
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S006['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S006['timeline_in_history_parcel']}    9
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    45.Verify Timeline After Scan In At Destination Warehouse
    Close Window
    Switch Window    MAIN

    Log    Step No.46 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_e}
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
    # ...    ${DC_Operation_S006.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['export_to3']}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_e}
    # ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_status4']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    46.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    46.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log    Step No.47 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S006.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S006.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S006.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S006.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S006    47.Verify Send Task Tab

DC_Operation_S007
    ${tracking_f}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S007['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_f}
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
    # ...    ${DC_Operation_S007.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    1.1.Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S007.data_in_import_task_tab['import_from']}
    # ...    ${DC_Operation_S007.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S007.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007   2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ f" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_f}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect155,Defect249
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['parcel_status1']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    3.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S007.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S007.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S007.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S007.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    3.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S007.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S007.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S007.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S007.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    3.3.Data Receiver Details In Scan Page

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label
    Sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    4.Verify Click Print Label

    Log    Step No.5 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    5.Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    6.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    7.Verify History Parcel Page

    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_f}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_f}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S007['timeline_in_history_parcel']}    5
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    8.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_f}
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
    # ...    ${DC_Operation_S007.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    9.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    9.2.Verify Data In All Task Tab

    Log    Step No.10 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect169,Defect189
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S007.data_in_export_task_tab['import_from']}
    # ...    ${DC_Operation_S007.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S007.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    10.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    10.2.Verify Data In Export Task Tab 2

    Log    Step No.11 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect232,Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.scan_out_waiting_scan['pouch_number']}
    # ...    ${DC_Operation_S007.scan_out_waiting_scan['import_from']}
    # ...    ${DC_Operation_S007.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S007.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S007.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S007.scan_out_waiting_scan['parcel_status']}  
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    11.1.Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    11.2.Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.12 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ f" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_f}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect255
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
    # ...    ${DC_Operation_S007.scan_out_list_data['pouch_number']}
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.scan_out_list_data['import_from']}
    # ...    ${DC_Operation_S007.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S007.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S007.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S007.scan_out_list_data['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    12.Verify Section Scan Out [Scan Out Page]

    Log    Step No.13 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    13.Verify Popup Confirm Scan Out

    Log    Step No.14 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    14.Verify Popup Save Data Success

    Log    Step No.15 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab    
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    15.Verify Navigate To Scan Page After Scan Out

    Log    Step No.16 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    16.Verify History Parcel Page

    Log    Step No.17 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_f}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_f}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S007['timeline_in_history_parcel']}    6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    17.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.18 คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S007.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S007.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S007.wait_derivery_data_list['status1']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    18.Verify Delivery List Page

    Log    Step No.19 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    dps_wait_delivery.Click Print Button By Data
    ...    ${DC_Operation_S007.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S007.wait_derivery_data_list['transport']}
    ...    ${today}
    ...    ${DC_Operation_S007.wait_derivery_data_list['status1']}

    Log    Step No.20 กดปุ่ม พิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_wait_delivery.Verify Data Delivery List
    ...    ${DC_Operation_S007.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S007.wait_derivery_data_list['transport']}
    ...    ${today}
    ...    ${DC_Operation_S007.wait_derivery_data_list['status2']}
    sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    20.Verify Delivery List Page After Print

    Log    Step No.21 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_f}
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
    # ...    ${DC_Operation_S007.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_status3']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    21.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    21.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log    Step No.22 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S007.data_in_import_task_tab['import_from']}
    # ...    ${DC_Operation_S007.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S007.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    22.Verify Import Task Tab At Destination Warehouse

    Log    Step No.23 เข้าเมนู Scan เลือกแท็บ Scan in, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ f" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_f}
    dps_scan_page.Click Search Button [Scan In Page]
    dps_home_page.Wait Until Page Loaded
    # Expected
    Log Defect No:  Defect155,Defect212,Defect249,Defect268
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S007.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S007.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    23.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S007.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S007.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S007.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S007.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    23.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S007.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S007.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S007.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S007.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    23.3.Data Receiver Details In Scan Page


    Log    Step No.24 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    Log Defect No:  Defect222
    # dps_scan_page.Verify Accept Scan In Success Popup    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    24.Verify Accept Scan In Success Popup

    Log    Step No.25 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    25.Verify Navigate To Scan Page And Stay At Scan In Tab At Destination Warehouse

    Log    Step No.26 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    26.Verify History Parcel Page
    
    Log    Step No.27 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_f}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_f}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S007['timeline_in_history_parcel']}    8
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    27.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.28 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCSB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_f}
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
    # ...    ${DC_Operation_S007.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['export_to3']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_f}
    # ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_status4']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    28.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    28.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log    Step No.29 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S007.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S007.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S007.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S007.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S007    29.Verify Send Task Tab

DC_Operation_S008
    Log    Pre Condition
    ${tracking_g}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S008['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
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
    # ...    ${DC_Operation_S008.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['pouch_number1']}
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    1.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S008.data_in_import_task_tab['import_from1']}
    # ...    ${DC_Operation_S008.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008   2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    3.Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น RDC LP ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 4-7
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory
    ...    ${DC_Operation_S008.check_close_pouch['inventory']}
    ...    ${dc_operation['text_warning_confirm_to_close_pouch']}
    ...    ${dc_operation['text_transaction_complete']}
    ...    DC_Operation_S008

    Log    Step No.8 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Create Pouch Popup After Scan In    ${DC_Operation_S008['destination_warehouse']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    8.Verify Create Pouch Destination DCSB Popup
    
    Log    Step No.9 คลิกปุ่มตกลง
    dps_scan_page.Click Accept Button On Popup For Creating Pouch
    # Expected
    Log Defect No:  Defect155,Defect260
    ${pouch_number}    Get Pouch Number And Verify Pouch Format
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_status1']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['zipcode']}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['symbol']}    
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    9.1.Verify Data In Scan In Page 1
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S008.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S008.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S008.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S008.scan_in_sender_data['address']}
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S008.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S008.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S008.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S008.scan_in_receiver_data['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    9.2.Verify Data In Scan In Page 2

    Log    Step No.10 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.11 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    11.Verify Print Label Success Popup

    Log    Step No.12 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    12.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.13 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    13.Verify History Parcel Page

    Log    Step No.14 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S008['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}    6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    14.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.15 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['task_type2']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['parcel_owner']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['import_from1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['export_to2']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['transport']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['pouch_number']}
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.data_in_all_task_tab_after_scan['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    15.1.Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    15.2.Verify Data In All Task Tab 2

    Log    Step No.16 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect189,Defect291
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S008.data_in_export_task_tab['import_from']}
    # ...    ${DC_Operation_S008.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    16.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    16.2.Verify Data In Export Task Tab 2

    Log    Step No. 17 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_g}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['receive_parcel_from1']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_size1']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    17.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    17.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.18 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect177
    # dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    18.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.19 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    # Expected
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S008.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['status_on']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    19.Verify Pouch In Pouch Page

    Log    Step No.20 คลิกที่ไอคอนรูปดินสอ
    dps_pouch_page.Proceed Pouch By Pouch Number    ${pouch_number}
    # Expected
    Log Defect No:  Defect223,Defect279,Defect290
    # dps_pouch_page.Verify Label Of Information Section In Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_detail_pouch']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['crossdock_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_status']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['parcel_amount']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Data Of Information Section In Pouch Detail Popup
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.data_in_pouch_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail['pouch_status']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail['origin_warehouse']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Label Section In Pouch Detail Popup
    # ...    ${DC_Operation_S008.data_in_pouch_detail['label_destination_warehouse']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail['label_number']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail['label_route']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail['label_symbol']}
    # ...    ${pouch_number}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    20.1.Verify Pouch Detail Popup 1
    # dps_pouch_page.Verify Label In Table On Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_parcel_in_pouch_list']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pickup_place']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['type']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['parcel_status']}
    # ...    ${dc_operation['text_close_pouch_and_print_label']}
    # dps_pouch_page.Verify Data In Table On Pouch Detail Popup
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['destination_warehouse']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['pickup_place']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['type']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail.data_in_table['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    20.2.Verify Pouch Detail Popup 2

    Log    Step No.21 คลิกปุ่มปิด Pouch/Print Label
    dps_pouch_page.Click Print Pouch Label
    # Expected
    dps_pouch_page.Verify Warning Confirm To Close Pouch    ${dc_operation['text_warning_confirm_to_close_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    21.Verify Warning Confirm To Close Pouch

    Log    Step No.22 ปิด Pouch/Print Label
    dps_pouch_page.Click Close Pouch/Print Label Button On Warning Popup

    Log    Step No.23 คลิกปุ่มพิมพ์
    Sleep    5s
    common.Robot Skip Step Print Label
    # Expected
    dps_pouch_page.Verify Transaction Complete Popup    ${dc_operation['text_transaction_complete']}
    common.Verify Capture Screenshot  dc_operation    DC_Operation_S008    23.Verify Transaction Complete Popup

    Log    Step No.24 คลิกที่ x Pop up
    dps_pouch_page.CLick Close Button
    # Expected
    Reload Page
    dps_pouch_page.Verify Transaction Complete Popup Was Closed
    dps_pouch_page.Verify Navigate To Pouch Page Success
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S008.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S008.data_in_pouch_list['status_off']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008   24.Verify Transaction Complete Popup Was Closed

    Log    Step No.25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_g}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['receive_parcel_from']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    25.1.Verify Section Waiting List To Scan Out After Close Pouch [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    25.2.Verify Section Waiting List To Scan Out After Close Pouch [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_unable_to_scan_trcking_becuase_parcel_is_in_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    26.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.27 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Click Clear Button [Scan Out]
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232
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
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_out_list_data['tracking_number']}
    # ...    ${DC_Operation_S008.scan_out_list_data['receive_parcel_from1']}
    # ...    ${DC_Operation_S008.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_status1']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    27.Verify Value List Scan Out

    Log    Step No.28 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    28.Verify Popup Confirm Scan Out

    Log    Step No.29 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    29.Verify Popup Save Data Success

    Log    Step No.30 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    30.Verify Navigate To Scan Page After Scan Out

    Log    Step No.31 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    31.Verify History Parcel Page After Scan Out 1

    Log    Step No.32 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230,Defect270
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S008['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}    7
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    32.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.33 เข้าเมนู Scan เลือกแท็บ Scan Out และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S008.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S008.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.wait_derivery_data_list['status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    33.Verify Delivery List Page

    Log    Step No.34 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    Log Defect No:  Defect289
    # dps_wait_delivery.Click Print Button By Data
    # ...    ${DC_Operation_S008.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S008.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.wait_derivery_data_list['status']}

    Log    Step No.35 กดปุ่ม พิมพ์
    common.Robot Skip Step Print Label
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S008.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S008.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.wait_derivery_data_list['status_after_print']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    35.Verify Delivery List Page After Print

    Log    Step No.36 เข้าเมนูหน้าหลัก, เลือกคลังที่ดำเนินงานเป็น "AC และ คลิกแท็บงานรับเข้า
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S008.data_in_import_task_tab['import_from3']}
    # ...    ${DC_Operation_S008.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_import_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    36.1.Verify Homepage 
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    36.2.Verify Data In Import Task Tab 

    Log    Step No.37 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect237
    # dps_scan_page.Verify Parcel Is On Pouch Warning Popup    ${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    37.Verify Parcel Is On Pouch Warning Popup

    Log    Step No.38 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    38.Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.39 กรอกหมายเลข Pouch และ คลิกปุ่มตกลง หรือ Enter
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect238
    # dps_scan_page.Verify Label Scan In Warehouse AC
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_id']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['pouch_number']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receive_parcel_from']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_size']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receiving_date']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_status']}
    # dps_scan_page.Verify Data List Scan In Warehouse AC
    # ...    ${DC_Operation_S008.scan_in_data_warehouse_ac['tracking_number']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_in_data_warehouse_ac['receive_parcel_from']}
    # ...    ${DC_Operation_S008.scan_in_data_warehouse_ac['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_in_data_warehouse_ac['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    39.Verify List Scan In Warehouse AC
    
    Log    Step No.40 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    40.Verify History Parcel Page After Scan Out 2

    Log    Step No.41 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230,Defect239,Defect270
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S008['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}    9
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    41.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.42 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect281
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['tracking_number']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['receive_parcel_from2']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_size2']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_out_waiting_scan['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    42.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    42.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.43 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    43.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.44 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Click Clear Button [Scan Out]
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232,Defect285
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
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_out_list_data['tracking_number']}
    # ...    ${DC_Operation_S008.scan_out_list_data['receive_parcel_from2']}
    # ...    ${DC_Operation_S008.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_out_list_data['parcel_status2']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    44.Verify Value List Scan Out

    Log    Step No.45 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    45.Verify Popup Confirm Scan Out

    Log    Step No.46 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    46.Verify Popup Save Data Success

    Log    Step No.47 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    47.Verify Navigate To Scan Page After Scan Out

    Log    Step No.48 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    48.Verify History Parcel Page After Scan Out 3

    Log    Step No.49 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230,Defect270
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S008['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}    10
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    49.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.50 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC SB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_SB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Parcel Is Not Visible [All Task Tab]
    # ...    ${DC_Operation_S008.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    50.1.Verify Data In All Task Tab Warehouse DCSB 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008   50.2.Verify Data In All Task Tab Warehouse DCSB 2

    Log    Step No.51 เลือก Dropdown ดูข้อมูลคลัง RDC LP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S008.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_status3']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    51.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    51.2.Verify Data In All Task Tab

    Log    Step No.52 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S008.data_in_import_task_tab['import_from2']}
    # ...    ${DC_Operation_S008.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    52.Verify Import Task Tab

    Log    Step No.53 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_g}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect237
    # dps_scan_page.Verify Parcel Is On Pouch Warning Popup    ${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    53.Verify Parcel Is On Pouch Warning Popup

    Log    Step No.54 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    54.Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.55 กรอกหมายเลข Pouch และ คลิกปุ่มตกลง หรือ Enter
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Unbox Pouch And Scan Piece By Piece    ${dc_operation['text_unbox_pouch_and_scan_piece_by_piece']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    55.Verify Unbox Pouch And Scan Piece By Piece

    Log    Step No.56 คลิกปุ่มยืนยัน
    dps_scan_page.Click Confirm Button On Unbox Pouch And Scan Piece By Piece Popup
    # Expected
    Log Defect No:  Defect242
    # dps_scan_page.Verify Label Pouch Detail In Scan In Page
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['pouch_number']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['parcel_in_pouch_amount']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['courier']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['date_delivery_origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Data Pouch Detail In Scan In Page
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.data_in_pouch_detail_scan_in_page['parcel_amount']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail_scan_in_page['courier']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail_scan_in_page['origin_warehoues']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S008.data_in_pouch_detail_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Label Parcel In Pouch In Scan In Page
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_number']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['destination_warehourse']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_size']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['type']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_status']}
    # dps_scan_page.Verify Data Parcel In Pouch In Scan In Page
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.data_in_parcel_in_pouch_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S008.data_in_parcel_in_pouch_scan_in_page['parcel_size']}
    # ...    ${DC_Operation_S008.data_in_parcel_in_pouch_scan_in_page['type']}
    # ...    ${DC_Operation_S008.data_in_parcel_in_pouch_scan_in_page['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    56.Verify Scan In Page After Scan Pouch At RDC LP Warehouse

    Log    Step No.57 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ g" ในช่องค้นหาด้านล่างรายละเอียด Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number In Search Bar On Pouch Detail Section    ${tracking_g}
    dps_scan_page.Click Search Button Of Pouch Detail Section
    # Expected
    Log Defect No:  Defect155,Defect243,Defect260,Defect268
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S008.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['zipcode']}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S008.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    57.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S008.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S008.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S008.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S008.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S008   57.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S008.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S008.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S008.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S008.scan_in_receiver_data['address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    57.3.Verify Data Receiver In Scan Page

    Log    Step No.58 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    dps_scan_page.Verify Accept Scan In Success Popup    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    58.Verify Accept Scan In Success Popup

    Log    Step No.59 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    Log Defect No:  Defect288
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    59.Verify Accept Scan In Success Popup After Scan In At RDC LP Warehouse

    Log    Step No.60 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    60.Verify History Parcel Page After Scan Out 4

    Log    Step No.61 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_g}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_g}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect230,Defect239,Defect270
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S008['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S008['timeline_in_history_parcel']}    12
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    61.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.62 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDC LP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_g}
    # dps_home_page.Verify Homepage
    # ...    ${dc_operation.breadcrumb['homepage']}
    # ...    ${dc_operation.title['homepage']}
    # dps_home_page.Verify Data In All Task Tab
    # ...    ${DC_Operation_S008.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_g}
    # ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_status4']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    62.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    62.2.Verify Data In All Task Tab

    Log    Step No.63 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S008.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S008.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S008.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S008.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S008    63.Verify Send Task Tab

DC_Operation_S009
    ${tracking_h}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S009['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_h}
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
    # ...    ${DC_Operation_S009.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    1.1.Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S009.data_in_import_task_tab['import_from1']}
    # ...    ${DC_Operation_S009.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_h}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect155,Defect249
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['parcel_status1']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['zipcode']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    3.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S009.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S009.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S009.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S009.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    3.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S009.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S009.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S009.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S009.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    3.3.Data Receiver Details In Scan Page

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label
    Sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    4.Verify Click Print Label

    Log    Step No.5 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    5.Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    6.Verify Navigate To Scan Page And Stay At Scan In Tab
    
    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    7.Verify History Parcel Page
    
    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_h}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_h}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}    5
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    8.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_h}
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
    # ...    ${DC_Operation_S009.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    9.1.Verify Homepage After Scan-in
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    9.2.Verify Data In All Task Tab After Scan-in

    Log    Step No.10 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect189,Defect291
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S009.data_in_export_task_tab['export_to']}
    # ...    ${DC_Operation_S009.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    10.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    10.2.Verify Data In Export Task Tab 2

    Log    Step No.11 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect232,Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['pouch_number']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['import_from1']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    11.1.Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    11.2.Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.12 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_h}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect255
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
    # ...    ${DC_Operation_S009.scan_out_list_data['pouch_number']}
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.scan_out_list_data['import_from1']}
    # ...    ${DC_Operation_S009.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S009.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S009.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S009.scan_out_list_data['parcel_status1']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    12.Verify Section Scan Out [Scan Out Page]

    Log    Step No.13 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    13.Verify Popup Confirm Scan Out

    Log    Step No.14 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    14.Verify Popup Save Data Success

    Log    Step No.15 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    15.Verify Navigate To Scan Page After Scan Out


    Log    Step No.16 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    16.Verify History Parcel Page

    Log    Step No.17 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_h}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_h}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}     6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    17.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.18 เข้าเมนู Scan > Scan Out > รายการรอขนส่งเข้ารับ และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    Log Defect No:  Defect289
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
    # ...    ${today}
    # ...    ${DC_Operation_S009.wait_derivery_data_list['status1']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    18.Verify Delivery List Page

    Log    Step No.19 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    dps_wait_delivery.Click Print Button By Data
    ...    ${DC_Operation_S009.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S009.wait_derivery_data_list['transport']}
    ...    ${today}
    ...    ${DC_Operation_S009.wait_derivery_data_list['status1']}

    Log    Step No.20 กดปุ่ม พิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_wait_delivery.Verify Data Delivery List
    ...    ${DC_Operation_S009.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S009.wait_derivery_data_list['transport']}
    ...    ${today}
    ...    ${DC_Operation_S009.wait_derivery_data_list['status2']}
    sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    20.Verify Delivery List Page After Print


    Log    Step No.21 เข้าเมนูหน้าหลัก, เลือกคลังที่ดำเนินงานเป็น "AC" และ เลือกแท็บงานรับเข้า
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S009.data_in_import_task_tab['import_from2']}
    # ...    ${DC_Operation_S009.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_import_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    21.1.Verify Homepage 
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    21.2.Verify Data In Import Task Tab 

    Log    Step No.22 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}    
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_h}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect238,Defect271
    # dps_scan_page.Verify Label Scan In Warehouse AC
    # ...    ${dc_operation.scan_in_title_warehouse_ac['parcel_id']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['pouch_number']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['receive_parcel_from']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['parcel_size']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['receiving_date']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['parcel_status']}
    # dps_scan_page.Verify Data List Scan In Warehouse AC
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.scan_in_data_warehouse_ac['pouch_number']}
    # ...    ${dc_operation.scan_in_data_warehouse_ac['receive_parcel_from']}
    # ...    ${DC_Operation_S009.scan_in_data_warehouse_ac['parcel_size']}
    # ...    ${today}
    # ...    ${dc_operation.scan_in_data_warehouse_ac['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    22.Verify Scan In Page Warehouse AC

    Log    Step No.23 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    23.Verify History Parcel Page
   
    Log    Step No.24 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_h}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_h}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}    8
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    24.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    # Expected
    Log Defect No:  Defect274
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['pouch_number']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['import_from2']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S009.scan_out_waiting_scan['parcel_status2']}    
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    25.1.Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    25.2.Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" และ กดค้นหา หรือกด Enter
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_h}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232
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
    # ...    ${DC_Operation_S009.scan_out_list_data['pouch_number']}
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.scan_out_list_data['import_from2']}
    # ...    ${DC_Operation_S009.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S009.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S009.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S009.scan_out_list_data['parcel_status2']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    26.Verify Section Scan Out [Scan Out Page]

    Log    Step No.27 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    27.Verify Popup Confirm Scan Out

    Log    Step No.28 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    28.Verify Popup Save Data Success

    Log    Step No.29 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    29.Verify Navigate To Scan Page After Scan Out


    Log    Step No.30 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    30.Verify History Parcel Page
   
    Log    Step No.31 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_h}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_h}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect273
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}    9
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    31.Verify Timeline
    Close Window
    Switch Window    MAIN
    
    Log    Step No.32 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDCLP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']} 
    # Expected
    Log Defect No:  Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_h}
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
    # ...    ${DC_Operation_S009.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_status3']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    32.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    32.2.Verify Data In All Task Tab

    Log    Step No.33 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S009.data_in_import_task_tab['import_from3']}
    # ...    ${DC_Operation_S009.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    33.Verify Import Task Tab At Destination Warehouse

    Log    Step No.34 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ h" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_h}
    dps_scan_page.Click Search Button [Scan In Page]
    sleep    5s
    # Expected
    Log Defect No:  Defect243,Defect249
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['zipcode']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S009.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S009.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    34.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S009.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S009.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S009.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S009.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    34.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S009.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S009.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S009.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S009.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    34.3.Data Receiver Details In Scan Page

    Log    Step No.35 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    dps_scan_page.Verify Accept Scan In Success Popup
    ...     ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    35.Verify Accept Scan In Success Popup

    Log    Step No.36 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    36.Verify Navigate To Scan Page And Stay At Scan In Tab At Destination Warehouse

    Log    Step No.37 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    37.Verify History Parcel Page

    Log    Step No.38 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_h}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_h}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S009['timeline_in_history_parcel']}    11
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    38.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.39 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDCLP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_h}
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
    # ...    ${DC_Operation_S009.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['import_from3']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['export_to3']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_h}
    # ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_status4']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    39.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    39.2.Verify Data In All Task Tab

    Log    Step No.40 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
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
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S009    40.Verify Send Task Tab


DC_Operation_S010
    ${tracking_i}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S010['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_i}
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
    # ...    ${DC_Operation_S010.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    1.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S010.data_in_import_task_tab['import_from1']}
    # ...    ${DC_Operation_S010.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S010.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010   2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนูจัดการ Pouch และ คลิก Dropdown เลือกสิทธิ์คลังเป็น DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    dps_pouch_page.Click Dropdown Select Warehouse List    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_pouch_page.Verify Navigate To Pouch Page Success
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    3.Verify Navigate To Pouch Page Success

    Log    ตรวจสอบ Pouch ที่มีคลังปลายทางเป็น RDC LP ที่ถูกเปิดอยู่ และถ้ามี Pouch ที่เปิดอยู่จะดำเนินการต่อใน Step No. 4-7
    dps_pouch_page.Check Open Pouch And Close Pouch By Destination Inventory
    ...    ${DC_Operation_S010.check_close_pouch['inventory']}
    ...    ${dc_operation['text_warning_confirm_to_close_pouch']}
    ...    ${dc_operation['text_transaction_complete']}
    ...    DC_Operation_S010

    Log    Step No.8 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_i}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Create Pouch Popup After Scan In    ${DC_Operation_S010['destination_warehouse']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    8.Verify Create Pouch Destination DCSB Popup
    
    Log    Step No.9 คลิกปุ่มตกลง
    dps_scan_page.Click Accept Button On Popup For Creating Pouch
    ${pouch_number}    Get Pouch Number And Verify Pouch Format   
    # Expected
    Log Defect No:  Defect155,Defect249
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['parcel_status1']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    9.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S010.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S010.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S010.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S010.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    9.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S010.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S010.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S010.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S010.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    9.3.Data Receiver Details In Scan Page

    Log    Step No.10 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.11 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    11.Verify Print Label Success Popup

    Log    Step No.12 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    12.Verify Navigate To Scan Page After Scan In

    Log    Step No.13 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    13.Verify History Parcel Page

    Log    Step No.14 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S010['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S010['timeline_in_history_parcel']}    6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    14.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.15 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_i}
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
    # ...    ${DC_Operation_S010.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['import_from1']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    15.1.Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    15.2.Verify Data In All Task Tab 2

    Log    Step No.16 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect189,Defect291
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S010.data_in_export_task_tab['export_to']}
    # ...    ${DC_Operation_S010.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S010.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    16.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    16.2.Verify Data In Export Task Tab 2

    Log    Step No. 17 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_i}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['receive_parcel_from1']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_size1']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    17.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    17.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.18 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_i}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect177
    # dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_please_close_pouch_before_scan_out']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    18.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.19 เลือกเมนู จัดการ Pouch ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['pouch']}
    Filter Data By Destination Inventory [Pouch Page]    ${DC_Operation_S010['destination_warehouse']}
    # Expected
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S010.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S010.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S010.data_in_pouch_list['status_on']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    19.Verify Pouch In Pouch Page

    Log    Step No.20 คลิกที่ไอคอนรูปดินสอ
    dps_pouch_page.Proceed Pouch By Pouch Number    ${pouch_number}
    # Expected
    Log Defect No:  Defect223
    # dps_pouch_page.Verify Label Of Information Section In Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_detail_pouch']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['crossdock_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['pouch_status']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['parcel_amount']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Data Of Information Section In Pouch Detail Popup
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.data_in_pouch_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail['pouch_status']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail['origin_warehouse']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail['destination_warehouse']}
    # dps_pouch_page.Verify Label Section In Pouch Detail Popup
    # ...    ${DC_Operation_S010.data_in_pouch_detail['label_destination_warehouse']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail['label_number']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail['label_route']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail['label_symbol']}
    # ...    ${pouch_number}
    # dps_pouch_page.Verify Label In Table On Pouch Detail Popup
    # ...    ${dc_operation.label_pouch_in_pouch_detail['title_parcel_in_pouch_list']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pouch_number']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['pickup_place']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['type']}
    # ...    ${dc_operation.label_pouch_in_pouch_detail.table_header_in_pouch_detail['parcel_status']}
    # ...    ${dc_operation['text_close_pouch_and_print_label']}
    # dps_pouch_page.Verify Data In Table On Pouch Detail Popup
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.data_in_pouch_detail.data_in_table['destination_warehouse']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail.data_in_table['pickup_place']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail.data_in_table['type']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail.data_in_table['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    20.Verify Pouch Detail Popup

    Log    Step No.21 คลิกปุ่มปิด Pouch/Print Label
    dps_pouch_page.Click Print Pouch Label
    # Expected
    dps_pouch_page.Verify Warning Confirm To Close Pouch    ${dc_operation['text_warning_confirm_to_close_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    21.Verify Warning Confirm To Close Pouch

    Log    Step No.22 ปิด Pouch/Print Label
    dps_pouch_page.Click Close Pouch/Print Label Button On Warning Popup

    Log    Step No.23 คลิกปุ่มพิมพ์
    Sleep    5s
    common.Robot Skip Step Print Label
    # Expected
    dps_pouch_page.Verify Transaction Complete Popup    ${dc_operation['text_transaction_complete']}
    common.Verify Capture Screenshot  dc_operation    DC_Operation_S010    23.Verify Transaction Complete Popup

    Log    Step No.24 คลิกที่ x Pop up
    dps_pouch_page.CLick Close Button
    # Expected
    Reload Page
    dps_pouch_page.Verify Transaction Complete Popup Was Closed
    dps_pouch_page.Verify Navigate To Pouch Page Success
    Filter Data By Destination Inventory [Pouch Page]    ${DC_Operation_S010['destination_warehouse']}
    dps_pouch_page.Verify Pouch In Pouch Page
    ...    ${pouch_number}
    ...    ${DC_Operation_S010.data_in_pouch_list['crossdock_warehouse']}
    ...    ${DC_Operation_S010.data_in_pouch_list['destination_warehouse']}
    ...    ${DC_Operation_S010.data_in_pouch_list['status_off']}
    ...    ${today}
    ...    ${dc_operation['icon_pencil']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010   24.Verify Transaction Complete Popup Was Closed

    Log    Step No. 25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_i}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['receive_parcel_from1']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_size1']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    25.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    25.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232
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
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_out_list_data['tracking_number']}
    # ...    ${DC_Operation_S010.scan_out_list_data['receive_parcel_from1']}
    # ...    ${DC_Operation_S010.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S010.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S010.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_out_list_data['parcel_status1']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    26.Verify Value List Scan Out

    Log    Step No.27 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    27.Verify Popup Confirm Scan Out

    Log    Step No.28 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    28.Verify Popup Save Data Success

    Log    Step No.29 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    29.Verify Navigate To Scan Page After Scan Out

    Log    Step No.30 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    30.Verify History Parcel Page After Scan Out

    Log    Step No.31 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S010['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S010['timeline_in_history_parcel']}    7
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    31.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.32 เข้าเมนู Scan เลือกแท็บ Scan Out และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S010.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S010.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.wait_derivery_data_list['status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    32.Verify Delivery List Page

    Log    Step No.33 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    Log Defect No:  Defect289
    # dps_wait_delivery.Click Print Button By Data
    # ...    ${DC_Operation_S010.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S010.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.wait_derivery_data_list['status']}

    Log    Step No.34 กดปุ่ม พิมพ์
    common.Robot Skip Step Print Label
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S010.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S010.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.wait_derivery_data_list['status_after_print']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    34.Verify Delivery List Page After Print

    Log    Step No.35 เข้าเมนู Scan และ เลือกคลังที่ดำเนินงานเป็น "AC"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    # Expected
    Log Defect No:  Defect280
    # dps_scan_page.Verify Label Wait Scan In Warehouse AC
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_id']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['pouch_number']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receive_parcel_from']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_size']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receiving_date']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_status']}
    # dps_scan_page.Verify Data List Wait Scan In Warehouse AC
    # ...    ${DC_Operation_S010.scan_in_data_waiting_scan_warehouse_ac['tracking_number']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_in_data_waiting_scan_warehouse_ac['receive_parcel_from']}
    # ...    ${DC_Operation_S010.scan_in_data_waiting_scan_warehouse_ac['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_in_data_waiting_scan_warehouse_ac['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    35.Verify Scan In page At AC Warehouse

    Log    Step No.36 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_i}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect237
    # dps_scan_page.Verify Parcel Is On Pouch Warning Popup    ${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    36.Verify Parcel Is On Pouch Warning Popup

    Log    Step No.37 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    37.Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.38 กรอกหมายเลข Pouch และ คลิกปุ่มตกลง หรือ Enter
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect238
    # Verify Label Scan In Warehouse AC
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_id']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['pouch_number']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receive_parcel_from']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_size']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receiving_date']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_status']}
    # Verify Data List Scan In Warehouse AC
    # ...    ${DC_Operation_S010.scan_in_data_warehouse_ac['tracking_number']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_in_data_warehouse_ac['receive_parcel_from']}
    # ...    ${DC_Operation_S010.scan_in_data_warehouse_ac['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_in_data_warehouse_ac['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    38.Verify List Scan In Warehouse AC
    
    Log    Step No.39 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    39.Verify History Parcel Page After Scan Out

    Log    Step No.40 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S010['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S010['timeline_in_history_parcel']}    9
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    40.Verify Timeline After Scan In At Destination Warehouse
    Close Window
    Switch Window    MAIN

    Log    Step No.41 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect281
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['tracking_number']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['receive_parcel_from2']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_size2']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_out_waiting_scan['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    41.1.Verify Value Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    41.2.Verify Value Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.42 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number [Scan Out Page]    ${tracking_i}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    dps_scan_page.Verify Close Pouch Before Scan Out Warning Popup    ${dc_operation['text_unable_to_scan_trcking_becuase_parcel_is_in_pouch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    42.Verify Close Pouch Before Scan Out Warning Popup

    Log    Step No.43 กรอกหมายเลข Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Click Clear Button [Scan Out]
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232,Defect285
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
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_out_list_data['tracking_number']}
    # ...    ${DC_Operation_S010.scan_out_list_data['receive_parcel_from2']}
    # ...    ${DC_Operation_S010.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S010.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S010.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_out_list_data['parcel_status2']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    43.Verify Value List Scan Out

    Log    Step No.44 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    44.Verify Popup Confirm Scan Out

    Log    Step No.45 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    45.Verify Popup Save Data Success

    Log    Step No.46 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    46.Verify Navigate To Scan Page After Scan Out

    Log    Step No.47 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    47.Verify History Parcel Page After Scan Out

    Log    Step No.48 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S010['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S010['timeline_in_history_parcel']}    7
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    48.Verify Timeline After Scan Out
    Close Window
    Switch Window    MAIN

    Log    Step No.49 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDC LP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_i}
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
    # ...    ${DC_Operation_S010.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['import_from3']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_status5']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    49.1.Verify Data In All Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    49.2.Verify Data In All Task Tab 2

    Log    Step No.50 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S010.data_in_import_task_tab['import_from3']}
    # ...    ${DC_Operation_S010.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S010.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010   50.Verify Import Task Tab

    Log    Step No.51 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_i}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect237
    # dps_scan_page.Verify Parcel Is On Pouch Warning Popup    ${dc_operation['text_parcel_is_on_pouch_warning']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    51.Verify Parcel Is On Pouch Warning Popup

    Log    Step No.52 คลิกปุ่มตกลง
    dps_scan_page.Click Agree On Parcel Is On Pouch Warning Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    52.Verify Navigate To Scan Page After Close Parcel Is On Pouch Warning Popup

    Log    Step No.53 กรอกหมายเลข Pouch และ คลิกปุ่มตกลง หรือ Enter
    dps_scan_page.Input Pouch Number [Scan In Page]    ${pouch_number}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    dps_scan_page.Verify Unbox Pouch And Scan Piece By Piece    ${dc_operation['text_unbox_pouch_and_scan_piece_by_piece']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    53.Verify Unbox Pouch And Scan Piece By Piece

    Log    Step No.54 คลิกปุ่มยืนยัน
    dps_scan_page.Click Confirm Button On Unbox Pouch And Scan Piece By Piece Popup
    # Expected
    Log Defect No:  Defect242
    # dps_scan_page.Verify Label Pouch Detail In Scan In Page
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['pouch_number']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['parcel_in_pouch_amount']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['courier']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['date_delivery_origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['origin_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['destination_warehouse']}
    # ...    ${dc_operation.label_pouch_detail_in_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Data Pouch Detail In Scan In Page
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.data_in_pouch_detail_scan_in_page['parcel_amount']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail_scan_in_page['courier']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail_scan_in_page['origin_warehoues']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S010.data_in_pouch_detail_scan_in_page['crossdock_warehouse']}
    # dps_scan_page.Verify Label Parcel In Pouch In Scan In Page
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_number']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['destination_warehourse']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_size']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['type']}
    # ...    ${dc_operation.label_parcel_in_pouch_in_scan_in_page['parcel_status']}
    # dps_scan_page.Verify Data Parcel In Pouch In Scan In Page
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.data_in_parcel_in_pouch_scan_in_page['destination_warehourse']}
    # ...    ${DC_Operation_S010.data_in_parcel_in_pouch_scan_in_page['parcel_size']}
    # ...    ${DC_Operation_S010.data_in_parcel_in_pouch_scan_in_page['type']}
    # ...    ${DC_Operation_S010.data_in_parcel_in_pouch_scan_in_page['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    54.Verify Scan In Page After Scan Pouch At DC SB Warehouse

    Log    Step No.55 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" ในช่องค้นหาด้านล่างรายละเอียด Pouch และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Tracking Number In Search Bar On Pouch Detail Section    ${tracking_i}
    dps_scan_page.Click Search Button Of Pouch Detail Section
    # Expected
    Log Defect No:  Defect155,Defect243
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['courier']}
    # ...    ${pouch_number}
    # ...    ${today}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S010.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['phone']}
    # ...    ${pouch_number}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S010.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    55.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S010.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S010.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S010.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S010.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    55.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S010.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S010.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S010.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S010.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    55.3.Data Receiver Details In Scan Page

    Log    Step No.56 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    dps_scan_page.Verify Accept Scan In Success Popup    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    56.Verify Accept Scan In Success Popup

    Log    Step No.57 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    Log Defect No:  Defect288
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    57.Verify Accept Scan In Success Popup After Scan In At RDC LP Warehouse

    Log    Step No.58 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    58.Verify History Parcel Page After Scan Out

    Log    Step No.59 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_i}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_i}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect239
    # dps_history_parcel_page.Set Pouch Number In Timeline List    ${DC_Operation_S010['timeline_in_history_parcel']}    สเเกนเข้า POUCH    ${pouch_number}
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S010['timeline_in_history_parcel']}    12
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    59.Verify Timeline After Scan In At Destination Warehouse
    Close Window
    Switch Window    MAIN

    Log    Step No.60 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDC LP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']} 
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_i}
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
    # ...    ${DC_Operation_S010.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['import_from3']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['export_to3']}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['transport']}
    # ...    ${pouch_number}
    # ...    ${tracking_i}
    # ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_status6']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    60.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    60.2.Verify Data In All Task Tab After Print Waiting Delivery

    Log    Step No.61 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S010.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S010.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S010.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S010.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S010    61.Verify Send Task Tab

DC_Operation_S011
    ${tracking_j}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S011['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_j}
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
    # ...    ${DC_Operation_S011.data_in_all_task_tab['task_type']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['export_to']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    1.1.Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S011.data_in_import_task_tab['import_from']}
    # ...    ${DC_Operation_S011.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S011.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    2.Verify Import Task Tab

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ j" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_j}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect155,Defect249
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['parcel_status']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    3.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S011.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S011.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S011.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S011.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    3.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S011.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S011.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S011.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S011.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    3.3.Data Receiver Details In Scan Page

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label
    Sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    4.Verify Click Print Label

    Log    Step No.5 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    5.Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    6.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    7.Verify History Parcel Page

    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_j}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_j}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S011['timeline_in_history_parcel']}    5
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    8.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCBB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}   
    # Expected
    Log Defect No:  Defect141,Defect187
    # Filter Data By Parcel Number [All Task Tab]    ${tracking_j}
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
    # ...    ${DC_Operation_S011.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    9.1.Verify Homepage After Scan-in
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    9.2.Verify Data In All Task Tab After Scan-in

    Log    Step No.10 เลือกแท็บงานส่งออก
    dps_home_page.Select Tab Export Task
    # Expected
    Log Defect No:  Defect189,Defect291
    # dps_home_page.Verify Label In Export Task Tab
    # ...    ${dc_operation.label_export_task_tab['export_to']}
    # ...    ${dc_operation.label_export_task_tab['transport']}
    # ...    ${dc_operation.label_export_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_export_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_export_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Export Task Tab
    # ...    ${DC_Operation_S011.data_in_export_task_tab['export_to']}
    # ...    ${DC_Operation_S011.data_in_export_task_tab['transport']}
    # ...    ${DC_Operation_S011.data_in_export_task_tab['parcel_owner']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    10.1.Verify Data In Export Task Tab 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    10.2.Verify Data In Export Task Tab 2

    Log    Step No.11 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    # Expected
    Log Defect No:  Defect232,Defect265
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['pouch_number']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['import_from']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    11.1.Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    11.2.Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.12 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ j" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${tracking_j}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect255
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
    # ...    ${DC_Operation_S011.scan_out_list_data['pouch_number']}
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_out_list_data['import_from']}
    # ...    ${DC_Operation_S011.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S011.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S011.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_out_list_data['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    12.Verify Section Scan Out [Scan Out Page]

    Log    Step No.13 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    13.Verify Popup Confirm Scan Out

    Log    Step No.14 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    14.Verify Popup Save Data Success

    Log    Step No.15 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    15.Verify Navigate To Scan Page After Scan Out

    Log    Step No.16 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    16.Verify History Parcel Page

    Log    Step No.17 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_j}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_j}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S011['timeline_in_history_parcel']}    6
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    17.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.18 เข้าเมนู Scan > Scan Out > รายการรอขนส่งเข้ารับ และ คลิกปุ่ม "รายการรอขนส่งเข้ารับ" ด้านล่างของหน้าจอ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Click Waiting Delivery List Button
    # Expected
    Log Defect No:  Defect289
    # dps_wait_delivery.Verify Label Delivery List
    # ...    ${dc_operation.label_delivery_list['export_to']}
    # ...    ${dc_operation.label_delivery_list['transport']}
    # ...    ${dc_operation.label_delivery_list['parcel_number']}
    # ...    ${dc_operation.label_delivery_list['pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_parcel_and_pouch_number']}
    # ...    ${dc_operation.label_delivery_list['title_date']}
    # ...    ${dc_operation.label_delivery_list['title_status']}
    # dps_wait_delivery.Verify Data Delivery List
    # ...    ${DC_Operation_S011.wait_derivery_data_list['export_to']}
    # ...    ${DC_Operation_S011.wait_derivery_data_list['transport']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.wait_derivery_data_list['status1']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    18.Verify Delivery List Page

    Log    Step No.19 คลิกไอคอนเครื่องพิมพ์ ด้านหลังรายการ
    dps_wait_delivery.Click Print Button By Data
    ...    ${DC_Operation_S011.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S011.wait_derivery_data_list['transport']}
    ...    ${today}
    ...    ${DC_Operation_S011.wait_derivery_data_list['status1']}
    sleep    5s

    Log    Step No.20 กดปุ่ม พิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_wait_delivery.Verify Data Delivery List
    ...    ${DC_Operation_S011.wait_derivery_data_list['export_to']}
    ...    ${DC_Operation_S011.wait_derivery_data_list['transport']}
    ...    ${today}
    ...    ${DC_Operation_S011.wait_derivery_data_list['status2']}
    sleep    5s
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    20.Verify Delivery List Page After Print

    Log    Step No.21 เข้าเมนู Scan, เลือกคลังที่ดำเนินงานเป็น "AC"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    # Expected
    Log Defect No:  Defect238,Defect280
    # dps_scan_page.Verify Label Wait Scan In Warehouse AC
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_id']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['pouch_number']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receive_parcel_from']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_size']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['receiving_date']}
    # ...    ${dc_operation.scan_in_title_waiting_scan_warehouse_ac['parcel_status']}
    # dps_scan_page.Verify Data List Wait Scan In Warehouse AC
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_in_data_waiting_scan_warehouse_ac['pouch_number']}
    # ...    ${DC_Operation_S011.scan_in_data_waiting_scan_warehouse_ac['receive_parcel_from']}
    # ...    ${DC_Operation_S011.scan_in_data_waiting_scan_warehouse_ac['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_in_data_waiting_scan_warehouse_ac['parcel_status']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    21.1.Verify Homepage After Print Waiting Delivery
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    21.2.Verify Data In Import Task Tab After Print Waiting Delivery


    Log    Step No.22 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ j" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_j}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect271
    # dps_scan_page.Verify Label Scan In Warehouse AC
    # ...    ${dc_operation.scan_in_title_warehouse_ac['parcel_id']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['pouch_number']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['receive_parcel_from']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['parcel_size']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['receiving_date']}
    # ...    ${dc_operation.scan_in_title_warehouse_ac['parcel_status']}
    # dps_scan_page.Verify Data List Scan In Warehouse AC
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_in_data_warehouse_ac['pouch_number']}
    # ...    ${DC_Operation_S011.scan_in_data_warehouse_ac['receive_parcel_from']}
    # ...    ${DC_Operation_S011.scan_in_data_warehouse_ac['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_in_data_warehouse_ac['parcel_status']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    22.Verify Scan In Page Warehouse AC

    Log    Step No.23 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    23.Verify History Parcel Page

    Log    Step No.24 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_j}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_j}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S011['timeline_in_history_parcel']}    8
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    24.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.25 เข้าเมนู Scan และ เลือกแท็บ Scan out
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_AC']}
    # Expected
    Log Defect No:  Defect274
    # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    # dps_scan_page.Verify label Waiting List To Scan Out [Scan Out Page]
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    # ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
    # dps_scan_page.Verify Value Waiting List To Scan Out [Scan Out Page]
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['pouch_number']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['import_from2']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['transport']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['parcel_owner']}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_out_waiting_scan['parcel_status2']}  
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    25.1.Verify Section Waiting List To Scan Out [Scan Out Page] 1
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    25.2.Verify Section Waiting List To Scan Out [Scan Out Page] 2

    Log    Step No.26 กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ j" และ กดค้นหา หรือกด Enter
    dps_scan_page.Input Pouch Number [Scan Out Page]    ${tracking_j}
    dps_scan_page.Click Search Button [Scan Out Page]
    # Expected
    Log Defect No:  Defect232
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
    # ...    ${DC_Operation_S011.scan_out_list_data['pouch_number']}
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_out_list_data['import_from2']}
    # ...    ${DC_Operation_S011.scan_out_list_data['transport']}
    # ...    ${DC_Operation_S011.scan_out_list_data['parcel_owner']}
    # ...    ${DC_Operation_S011.scan_out_list_data['parcel_size']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_out_list_data['parcel_status2']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    26.Verify Section Scan Out [Scan Out Page]

    Log    Step No.27 กดปุ่ม ยืนยัน Scan Out
    dps_scan_page.Click Confirm Scan Out Button
    # Expected
    dps_scan_page.Verify Popup Confirm Scan Out    ${dc_operation.scan_out_title['text_popup_comfirm']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    27.Verify Popup Confirm Scan Out

    Log    Step No.28 กดปุ่ม ยืนยัน
    dps_scan_page.Click Confirm Button On Popup Asking To Scan Out
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    28.Verify Popup Save Data Success

    Log    Step No.29 คลิกที่ Pop up
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan Out Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    29.Verify Navigate To Scan Page After Scan Out

    Log    Step No.30 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    30.Verify History Parcel Page

    Log    Step No.31 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_j}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_j}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect273
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S011['timeline_in_history_parcel']}    9
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    31.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.32 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง RDCLP
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']} 
    # Expected
    Log Defect No:  Defect187
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
    # ...    ${DC_Operation_S011.data_in_all_task_tab['task_type']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['export_to']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_status3']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    32.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    32.2.Verify Data In All Task Tab

    Log    Step No.33 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S011.data_in_import_task_tab['import_from2']}
    # ...    ${DC_Operation_S011.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S011.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    33.Verify Import Task Tab At Destination Warehouse


    Log    Step No.34 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ j" ในช่องค้นหา และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_RDC_LP']}
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_j}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect243,Defect249
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['parcel_status2']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['store']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S011.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S011.scan_in_data_label_detail['symbol']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    34.1.Data Parcel Details In Scan Page
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S011.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S011.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S011.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S011.scan_in_sender_data['address']}
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    34.2.Data Sender Details In Scan Page
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S011.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S011.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S011.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S011.scan_in_receiver_data['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    34.3.Data Receiver Details In Scan Page

    Log    Step No.35 คลิกปุ่ม ยืนยัน Scan in
    dps_scan_page.Click Accept Scan In
    # Expected
    dps_scan_page.Verify Accept Scan In Success Popup    ${dc_operation['text_accept_scan_in_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    35.Verify Accept Scan In Success Popup

    Log    Step No.36 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected 
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    36.Verify Navigate To Scan Page And Stay At Scan In Tab At Destination Warehouse

    Log    Step No.37 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}   
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    37.Verify History Parcel Page

    Log    Step No.38 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_j}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_j}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201,Defect273
    # dps_history_parcel_page.Verify Timeline  ${DC_Operation_S011['timeline_in_history_parcel']}    11
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    38.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.39 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']} 
    # Expected
    Log Defect No:  Defect187
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
    # ...    ${DC_Operation_S011.data_in_all_task_tab['task_type3']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['import_from2']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['export_to3']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_j}
    # ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_status4']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    39.1.Verify Homepage
    Sleep    1s
    common.Scroll Window To Vertical    1000
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    39.2.Verify Data In All Task Tab

    Log    Step No.40 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_send_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S011.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S011.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S011.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S011.data_in_send_task_tab['transport']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S011    40.Verify Send Task Tab

DC_Operation_S012
    ${tracking_b}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S012['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${tracking_b}
    # Expected
    Log Defect No:  Defect138,Defect141,Defect187
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
    # ...    ${DC_Operation_S012.data_in_all_task_tab['task_type1']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['export_to1']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_b}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['parcel_status1']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    1.1.Verify Homepage 1st Time
    common.Scroll Window To Vertical    750
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    1.2.Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    Log Defect No:  Defect139,Defect188,Defect291
    # dps_home_page.Verify Label In Import Task Tab
    # ...    ${dc_operation.label_import_task_tab['import_from']}
    # ...    ${dc_operation.label_import_task_tab['transport']}
    # ...    ${dc_operation.label_import_task_tab['parcel_owner']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pouch']}
    # ...    ${dc_operation.label_import_task_tab['number_of_pieces']}
    # ...    ${dc_operation.label_import_task_tab['number_of_scanned_items']}
    # dps_home_page.Verify Data In Import Task Tab
    # ...    ${DC_Operation_S012.data_in_import_task_tab['import_from']}
    # ...    ${DC_Operation_S012.data_in_import_task_tab['transport']}
    # ...    ${DC_Operation_S012.data_in_import_task_tab['parcel_owner']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    2.Verify Data In Import Task Tab

    Log    Step No.3 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ b" และ กดค้นหา หรือกด Enter
    Set Today
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_b}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect155,Defect159,Defect248,Defect254
    # dps_scan_page.Verify Title Parcel Details In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['route']}   
    # dps_scan_page.Verify Data Parcel Details In Scan Page [CP All Courier]
    # ...    ${tracking_b}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['crossdock_warehouse']}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['destination_warehouse']}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['parcel_status']}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S012.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['route']}
    # ...    ${dc_operation.scan_in_title_label_detail['store']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_label_detail['wh']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    # ...    ${DC_Operation_S012.scan_in_data_label_detail['store_code']}
    # ...    ${DC_Operation_S012.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S012.scan_in_data_label_detail['phone']}
    # ...    ${DC_Operation_S012.scan_in_data_label_detail['pouch_number']}
    # ...    ${DC_Operation_S012.scan_in_data_label_detail['wh']}
    # ...    ${DC_Operation_S012.scan_in_data_label_detail['symbol']}
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S012.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S012.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S012.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S012.scan_in_sender_data['address']}
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S012.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S012.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S012.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S012.scan_in_receiver_data['address']}
    common.Scroll Window To Vertical    430
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    3.Verify Parcel Details After Scanning

    Log    Step No.4 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.5 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    5.Verify Print Label Success Popup

    Log    Step No.6 คลิกที่ x Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    6.Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.7 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    # Expected
    dps_history_parcel_page.Verify History Parcel Page    ${dc_operation.title['history_parcel']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    7.Verify History Parcel Page

    Log    Step No.8 ค้นหาหมายเลข Tracking และ คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_b}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_b}
    Switch Window    NEW
    # Expected
    Log Defect No:  Defect201
    # dps_history_parcel_page.Verify Timeline    ${DC_Operation_S012['timeline_in_history_parcel']}    5
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    8.Verify Timeline
    Close Window
    Switch Window    MAIN

    Log    Step No.9 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DC BB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    dps_home_page.Filter Data By Parcel Number [All Task Tab]    ${tracking_b}
    # Expected
    Log Defect No:  Defect138,Defect141,Defect179,Defect187
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
    # ...    ${DC_Operation_S012.data_in_all_task_tab['task_type2']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['parcel_owner']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['import_from']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['export_to2']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['transport']}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['pouch_number']}
    # ...    ${tracking_b}
    # ...    ${DC_Operation_S012.data_in_all_task_tab['parcel_status2']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    9.1.Verify Homepage 2nd Time
    common.Scroll Window To Vertical    750
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    9.2.Verify Data In All Task Tab After Scan Parcel

    Log    Step No.10 เลือกแท็บงานนำจ่าย
    dps_home_page.Select Tab Send Task
    # Expected
    Log Defect No:  Defect147,Defect148,Defect149,Defect190,Defect291
    # dps_home_page.Verify Label In Send Task Tab
    # ...    ${dc_operation.label_send_task_tab['send_to']}
    # ...    ${dc_operation.label_send_task_tab['store_code']}
    # ...    ${dc_operation.label_send_task_tab['customer_type']}
    # ...    ${dc_operation.label_send_task_tab['transport']}
    # ...    ${dc_operation.label_send_task_tab['number_of_pieces']}
    # dps_home_page.Verify Data In Send Task Tab
    # ...    ${DC_Operation_S012.data_in_send_task_tab['send_to']}
    # ...    ${DC_Operation_S012.data_in_send_task_tab['store_code']}
    # ...    ${DC_Operation_S012.data_in_send_task_tab['customer_type']}
    # ...    ${DC_Operation_S012.data_in_send_task_tab['transport']}
    common.Scroll Window To Vertical    750
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S012    10.Verify Data In Send Task Tab

DC_Operation_S016
    ${tracking_a}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S016['sender_name']}
    common.Open URL    ${DPS_URL}
    dps_landing_page.Click Go Login Button
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ a" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    ${tracking_a}
    dps_scan_page.Click Search Button [Scan In Page]
    # Expected
    Log Defect No:  Defect155,Defect160
    # dps_scan_page.Verify Title Parcel Details In Scan Page [Other Courier]
    # ...    ${dc_operation.scan_in_title_parcel_detail['title']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['courier']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    # ...    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Data Parcel Details In Scan Page [Other Courier]
    # ...    ${tracking_a}
    # ...    ${DC_Operation_S016.scan_in_data_parcel_detail['customer_id']}
    # ...    ${DC_Operation_S016.scan_in_data_parcel_detail['parcel_size']}
    # ...    ${DC_Operation_S016.scan_in_data_parcel_detail['parcel_status']}
    # ...    ${DC_Operation_S016.scan_in_data_parcel_detail['courier']}
    # ...    ${DC_Operation_S016.scan_in_data_parcel_detail['pouch_number']}
    # ...    ${today}
    # ...    ${DC_Operation_S016.scan_in_data_parcel_detail['origin_warehouse']}
    # ...    ${DC_Operation_S016.scan_in_data_parcel_detail['send_parcel_to']}
    # dps_scan_page.Verify Title Label Parcel In Scan Page [Other Courier]
    # ...    ${dc_operation.scan_in_title_label_detail['courier']}
    # ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    # ...    ${dc_operation.scan_in_title_label_detail['customer']}
    # ...    ${dc_operation.scan_in_title_label_detail['phone']}
    # dps_scan_page.Verify Data Label Parcel In Scan Page [Other Courier]
    # ...    ${DC_Operation_S016.scan_in_data_label_detail['courier']}
    # ...    ${DC_Operation_S016.scan_in_data_label_detail['zipcode']} 
    # ...    ${DC_Operation_S016.scan_in_data_label_detail['customer']}
    # ...    ${DC_Operation_S016.scan_in_data_label_detail['phone']}
    # dps_scan_page.Verify Title Sender In Scan Page
    # ...    ${dc_operation.scan_in_title_sender_detail['title']}
    # ...    ${dc_operation.scan_in_title_sender_detail['name']}
    # ...    ${dc_operation.scan_in_title_sender_detail['phone']}
    # ...    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    # ...    ${dc_operation.scan_in_title_sender_detail['address']}
    # dps_scan_page.Verify Data Sender In Scan Page
    # ...    ${DC_Operation_S016.scan_in_sender_data['name']}
    # ...    ${DC_Operation_S016.scan_in_sender_data['phone']}
    # ...    ${DC_Operation_S016.scan_in_sender_data['shipping_origin']}
    # ...    ${DC_Operation_S016.scan_in_sender_data['address']}
    # dps_scan_page.Verify Title Receiver In Scan Page
    # ...    ${dc_operation.scan_in_title_receiver_detail['title']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['name']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['phone']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    # ...    ${dc_operation.scan_in_title_receiver_detail['address']}
    # dps_scan_page.Verify Data Receiver In Scan Page
    # ...    ${DC_Operation_S016.scan_in_receiver_data['name']}
    # ...    ${DC_Operation_S016.scan_in_receiver_data['phone']}
    # ...    ${DC_Operation_S016.scan_in_receiver_data['shipping_destination']}
    # ...    ${DC_Operation_S016.scan_in_receiver_data['address']}
    common.Scroll Window To Vertical    400
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    1.Verify Parcel Details After Scanning

    Log    Step No.2 คลิกที่ผลรวมของขนาดพัสดุ และ แก้ไขเป็นเลข 45
    dps_scan_page.Clear Input Parcel Size In Scan Page
    dps_scan_page.Input Parcel Size In Scan Page    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['value_parcel_size']}
    # Expected
    dps_scan_page.Verify Parcel Size Edited    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['text_parcel_size']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    2.Verify Parcel Size Edited

    Log    Step No.3 คลิก Dropdown Courier แก้ไขเป็น CP All
    dps_scan_page.Click Courier In Scan Page
    dps_scan_page.Select Courier In Dropdown In Scan Page    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['courier']}
    # Expected
    dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    ...    ${dc_operation.scan_in_title_label_detail['route']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['zipcode']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['pouch_number']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['wh']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['symbol']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    3.Verify Parcel Label After Editing Courier

    Log    Step No.4 คลิก Dropdown คลังปลายทาง แก้ไขเป็น DCSB
    dps_scan_page.Click Destination Warehouse In Scan Page
    dps_scan_page.Select Destination Warehouse In Dropdown In Scan Page    ${DC_Operation_S016.edit_parcel_detail_in_scan_in_tab['destination_warehourse']}
    # Expected
    dps_scan_page.Verify Title Label Parcel In Scan Page [CP All Courier]
    ...    ${dc_operation.scan_in_title_label_detail['route']}
    ...    ${dc_operation.scan_in_title_label_detail['zipcode']}
    ...    ${dc_operation.scan_in_title_label_detail['customer']}
    ...    ${dc_operation.scan_in_title_label_detail['phone']}
    ...    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ...    ${dc_operation.scan_in_title_label_detail['wh']}
    dps_scan_page.Verify Data Label Parcel In Scan Page [CP All Courier]
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['zipcode']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['customer']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['phone']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['pouch_number']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['wh_after_changing_warehouse']}
    ...    ${DC_Operation_S016.edit_courier_in_scan_in_tab['symbol_after_changing_warehourse']}
    common.Scroll Window To Vertical    400
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    4.Verify Parcel Label After Editing Destination Warehouse

    Log    Step No.5 คลิกปุ่ม ยืนยัน/Print Label
    dps_scan_page.Click Print Label

    Log    Step No.6 คลิกปุ่มพิมพ์
    common.Robot Skip Step Print Label
    # Expected
    dps_scan_page.Verify Print Label Success Popup    ${dc_operation['text_print_label_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    6.Verify Print Label Success Popup

    Log    Step No.7 คลิกที่ Pop up
    dps_scan_page.Click Close Print Label Success Popup
    # Expected
    dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S016    7.Verify Navigate To Scan Page And Stay At Scan In Tab