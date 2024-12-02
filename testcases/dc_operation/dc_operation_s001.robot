*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser


*** Test Cases ***
DC_Operation_S001
    [Tags]    DC_Operation    Dry_Rejected_Request_Pickup_Schedule    UAT    Defect043    Defect144    Defect150    Defect192    Defect207    Defect221
    Set Today
    Log    Reset Cut Off Time To 23:59
    dps_home_page.Reset Cut Off Time

    Log    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    # Expected
    Sleep    2
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    1.Verify Login Page

    Log    Step No.2 เข้าสู่ระบบลูกค้าธุรกิจ
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    # Expected
    b2c_home_page.Verify Company Profile Page    ${DC_Operation_S001['company_name']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001   2.Verify Home Page

    Log    Step No.3 เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001   3.Verify Call Car Pick Up Page

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
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001   4.Verify Parcel Pickup Schedule Popup

    Log    Step No.5 ระบุข้อมูล
    Set Tomorrow Date
    Set Today
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${DC_Operation_S001['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${DC_Operation_S001['parcel_pickup_time']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Add Parcel Pickup
    ...    ${call_car_pick_up.status['parcel_in_progress']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_type']}
    ...    ${tomorrow}
    ...    ${DC_Operation_S001['verify_pickup_time']}
    ...    ${today}
    ...    ${call_car_pick_up['text_parcel_number']}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${call_car_pick_up['text_price']}
    ...    ${call_car_pick_up.default['price']}
    ...    ${call_car_pick_up['text_pickup_location']}
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001   5.Verify Add Special Pickup Round Success

    Log    Step No.6 เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery    
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    6.Verify Booking Page
    
    Log    Step No.7 คลิกปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add   
    # Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    7.Verify Term & Condition

    Log    Step No.8 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    8.Verify Select Parcel Type

    Log    Step No.9 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${DC_Operation_S001['parcel_type']}
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
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    9.Verify Create Parcel Page Sender Step

    Log    Step No.10 คลิกปุ่ม x เพื่อปิด popup
    b2c_booking_delivery_page.Click Close X Popup
    # Expected
    b2c_booking_detail_page.Verify Booking List In Booking Detail Page
    ...    ${Booking['text_booking_id_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_booking_time_label']}
    ...    ${Booking['text_shipping_origin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    10.Verify Booking Detail Page

    Log    Step No.11 คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Verify Popup To Edit Booking List
    ...    ${Booking['text_parcel_type_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    11.Verify Edit Booking Popup

    Log    Step No.12 คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    b2c_booking_detail_page.Select Pickup Schedule Tab
    # Expected
    b2c_booking_detail_page.Verify Display Pickup Schedule Data
    ...    ${DC_Operation_S001.receiving_cycle['car_type']}
    ...    ${tomorrow}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${today}
    ...    ${call_car_pick_up.default['price']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    12.Verify Display Pickup Schedule Data

    Log    Step No.13 เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    b2c_booking_detail_page.Select Parcel Pickup Schedule
    b2c_booking_detail_page.Click Save Button In Edit Booking List Popup
    ${booking_id}    Get Booking ID
    # Expected
    b2c_booking_detail_page.Verify Complete Select Parcel Pickup Schedule And Save
    ...    ${today}
    ...    ${DC_Operation_S001.receiving_cycle['company_name']}
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    13.Verify Complete Select Parcel Pickup Schedule And Save

    Log    Step No.14 คลิกปุ่ม Import File
    b2c_booking_detail_page.Click Import File Button
    b2c_booking_detail_page.Verify Import File Popup
    ...    ${Booking['text_import']}
    ...    ${Booking['text_btn_template']}
    ...    ${Booking['text_import_time']}
    ...    ${Booking['text_file_name']}
    ...    ${Booking['text_import_result']}
    ...    ${Booking['text_file_import_error']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    14.Verify Import File Popup

    Log    Step No.15 คลิกปุ่ม Import 
    Log    Step No.16 เลือกไฟล์ "Booking Dry Template Test DC"
    b2c_booking_detail_page.Import Excel File Of Dry Parcel Template    ${path_excel_booking_dry_template}
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page After Import File
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${call_car_pick_up.text_parcel_id_start_with['dry']}
    ...    ${DC_Operation_S001['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    16.Verify Import File Success

    Log    Step No.17 Cut Off Time
    dps_home_page.Set Cut Off Time
    ...    ${DB_URI}
    ...    ${DATABASE_NAME}
    ...    ${COLLECTION}
    ...    ${QUERY}
    # Expected
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Status After Cut Off Time
    ...    ${call_car_pick_up.status['arrange_car']}
    ...    ${tomorrow}
    ...    ${today}
    ...    ${booking_id}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S001['verify_pickup_time']}
    ...    ${DC_Operation_S001['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    17.Verify Parcel Pickup Status After Cut Off Time
    b2c_home_page.Click Book Parcel Delivery    
    b2c_booking_delivery_page.Verify Booking Status After Cut Off Time    
    ...    ${booking_id}
    ...    ${Booking['text_waiting_confirm_parcel_pickup']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    17.Verify Booking Status After Cut Off Time
    b2c_booking_delivery_page.Select Booking With Booking ID    
    ...    ${booking_id}
    ...    ${Booking['text_waiting_confirm_parcel_pickup']}
    b2c_booking_detail_page.Verify Booking Detail Page After Import File
    ...    ${Booking['text_waiting_confirm_parcel_pickup']}
    ...    ${call_car_pick_up.text_parcel_id_start_with['dry']}
    ...    ${DC_Operation_S001['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    17.Verify Parcel Status After Cut Off Time

    Log    Step No.18 เปิด URL DPS
    Go To    ${DPS_UAT_URL}
    # Expected
    dps_landing_page.Verify Go Login Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    18.Verify Go Login DPS Page

    Log    Step No.19 เข้าสู่ระบบ
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    19.Verify Homepage Title

    Log    Step No.20 เลือก Role แอดมินคลัง
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    # Expected
    dps_home_page.Verify Role Change In Profile    ${dc_operation.role['admin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    20.Verify Role Change In Profile

    Log    Step No.21 เลือกเมนู "ตรวจสอบรอบเข้ารับพัสดุ"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['check_receiving_cycle']}  
    # Expected
    dps_check_receiving_cycle_page.Verify Check Parcel Pickup Schedule
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    21.Verify Check Parcel Pickup Schedule

    Log    Step No.22 คลิก Dropdown เลือกคลัง เป็น "คลัง DC MC"
    dps_check_receiving_cycle_page.Click Dropdown Select Warehouse List    ${DC_Operation.selected_warehouse_list['text_warehouse_DC_MC']}
    # Expected
    dps_check_receiving_cycle_page.Verify Pickup Schedule Of DC MC Warehouse
    ...    ${DC_Operation_S001.receiving_cycle['company_name']}
    ...    ${DC_Operation_S001.receiving_cycle['branch']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    22.Verify Pickup Schedule Of DC MC Warehouse

    Log    Step No.23 คลิก Dropdown เลือกคลัง เป็น "คลัง DC BB"
    dps_check_receiving_cycle_page.Click Dropdown Select Warehouse List    ${DC_Operation.selected_warehouse_list['text_warehouse_DC_BB']}
    # Expected
    dps_check_receiving_cycle_page.Verify Check Receiving Cycle Page    
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['all_parcels_received']}
    ...    ${DC_Operation_S001.receiving_cycle['company_name']}
    ...    ${DC_Operation_S001.receiving_cycle['branch']}
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S001.receiving_cycle['courier']}
    ...    ${DC_Operation_S001.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['waiting']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    23.Verify Check Receiving Cycle Page

    Log    Step No.24 คลิกแท็บ "รายการรอคลังยืนยัน"
    dps_check_receiving_cycle_page.Select Waiting Warehouse Confirm List Tab   
    # Expected
    dps_check_receiving_cycle_page.Verify Warehouse Confirm List Tab 
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['waiting_inventory_confirm_list']}
    ...    ${DC_Operation_S001.receiving_cycle['company_name']}   
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S001.receiving_cycle['courier']}
    ...    ${DC_Operation_S001.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['waiting']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    24.Verify Warehouse Confirm List Tab

    Log    Step No.25 คลิกไอคอนรูปดินสอ ด้านขวาสุดของรายการ
    dps_check_receiving_cycle_page.Click Pencil Icon  
    ...    ${booking_id}
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['waiting_inventory_confirm_list']}
    ...    ${DC_Operation_S001.receiving_cycle['company_name']}   
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S001.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['waiting']}
    # Expected
    dps_check_receiving_cycle_page.Verify Parcel Pickup Details Popup
    ...    ${DC_Operation_S001.receiving_cycle['company_name']} 
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    ...    ${tomorrow}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S001.receiving_cycle['car_type']}
    ...    ${DC_Operation_S001.receiving_cycle['courier']}
    ...    ${DC_Operation_S001.receiving_cycle['number_of_parcel']}
    ...    ${DC_Operation.status['waiting']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    25.Verify Parcel Pickup Details Popup

    Log    Step No.26 คลิกปุ่ม ไม่อนุมัติ
    dps_check_receiving_cycle_page.Click Unapproved Button On Parcel Pickup Details Popup
    # Expected
    dps_check_receiving_cycle_page.Verify Data Saved Success Popup
    dps_check_receiving_cycle_page.Select All Parcels Received List Tab
    dps_check_receiving_cycle_page.Verify Pickup Schedule Change Status
    ...    ${DC_Operation_S001.receiving_cycle['company_name']}
    ...    ${DC_Operation_S001.receiving_cycle['branch']}
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_time']}
    ...    ${DC_Operation_S001.receiving_cycle['receiving_type']}
    ...    ${DC_Operation_S001.receiving_cycle['number_of_parcel']}
    ...    ${today}
    ...    ${DC_Operation.status['canceled']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    26.Verify Pickup Schedule Change Status To Cancel

    Log    Step No.27 กลับ Speed D "เรียกรถเข้ารับพัสดุ"
    Go To    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Canceled Status
    ...    ${DC_Operation_S001.receiving_cycle['receiving_type']}
    ...    ${tomorrow}
    ...    ${DC_Operation_S001['verify_pickup_time']}
    ...    ${today}
    ...    ${call_car_pick_up['text_parcel_number']}
    ...    ${DC_Operation_S001['parcel_number']}
    ...    ${call_car_pick_up['text_price']}
    ...    ${call_car_pick_up.default['price']}
    ...    ${call_car_pick_up['text_pickup_location']}
    ...    ${DC_Operation_S001.receiving_cycle['company_address']}
    ...    ${DC_Operation_S001.receiving_cycle['sub_district']}
    ...    ${DC_Operation_S001.receiving_cycle['district']}
    ...    ${DC_Operation_S001.receiving_cycle['province']}
    ...    ${DC_Operation_S001.receiving_cycle['postcode']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    27.Verify Parcel Pickup Schedule Change Status To Cancel

    Log    Step No.28 เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery 
    # Expected
    b2c_booking_delivery_page.Verify Booking Status After Cut Off Time    
    ...    ${booking_id}
    ...    ${Booking['text_parcel_status_call_car']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    28.Verify Booking Change Status To Call Car

    Log    Step No.29 คลิกเลือกรายการ Booking
    b2c_booking_delivery_page.Select Booking With Booking ID    
    ...    ${booking_id}
    ...    ${Booking['text_parcel_status_call_car']}
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page After Canceled
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${call_car_pick_up.text_parcel_id_start_with['dry']}
    ...    ${DC_Operation_S001['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    29.Verify Booking Detail After Canceled

    Log    Step No.30 คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    b2c_booking_detail_page.Verify Popup To Edit Booking List
    ...    ${Booking['text_parcel_type_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    30.Verify Popup To Edit Booking List After Canceled

    Log    Step No.31 คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    b2c_booking_detail_page.Select Pickup Schedule Tab
    # Expected
    b2c_booking_detail_page.Verify Display Pickup Schedule Data After Canceled
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S001    31.Verify Display Pickup Schedule Data After Canceled
