*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    Reset Cut Off Time
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S019
    [Tags]    DC_Operation    UAT
    Step Test:    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    # Expected
    Sleep    2
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Login Page

    Step Test:    Step No.2 เข้าสู่ระบบลูกค้าธุรกิจ
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    # Expected
    b2c_home_page.Verify Company profile page
    ...    ${DC_Operation_S019['company_name']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019   Verify Home Page

    Step Test:    Step No.3 เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019   Verify Call Car Pick Up Page

    Step Test:    Step No.4 คลิกปุ่ม +เพิ่ม
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
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019   Verify Parcel Pickup Schedule Popup

    Step Test:    Step No.5 ระบุข้อมูล
    ${tomorrow}    Set Tomorrow Date
    ${today}    Set Today
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${DC_Operation_S019['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${DC_Operation_S019['parcel_pickup_time']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Status
    ...    ${call_car_pick_up.status['parcel_in_progress']}
    ...    ${DC_Operation_S019.call_car_pick_up['receiving_type']}
    ...    ${tomorrow}
    ...    ${DC_Operation_S019['verify_pickup_time']}
    ...    ${call_car_pick_up['text_parcel_pickup_date']}
    ...    ${call_car_pick_up['text_cut_off_time']}
    ...    ${today}
    ...    ${call_car_pick_up['text_parcel_number']}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${call_car_pick_up['text_price']}
    ...    ${call_car_pick_up.default['price']}
    ...    ${call_car_pick_up['text_pickup_location']}
    ...    ${DC_Operation_S019.call_car_pick_up['company_address']}
    ...    ${DC_Operation_S019.call_car_pick_up['sub_district']}
    ...    ${DC_Operation_S019.call_car_pick_up['district']}
    ...    ${DC_Operation_S019.call_car_pick_up['province']}
    ...    ${DC_Operation_S019.call_car_pick_up['postcode']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019   Verify Add Special Pickup Round Success

    Step Test:    Step No.6 เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery    
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Booking Page

    Step Test:    Step No.7 คลิกปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add    
    # Expected
    # b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Term & Condition

    Step Test:    Step No.8 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Select Parcel Type

    Step Test:    Step No.9 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${DC_Operation_S019['parcel_type']}
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
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Create Parcel Page Sender Step

    Step Test:    Step No.10 คลิกปุ่ม x เพื่อปิด popup
    b2c_booking_delivery_page.Click Close X Popup
    # Expected
    b2c_booking_delivery_page.Click Latest Booking Created    ## ใช้แก้ชั่วคราว
    b2c_booking_detail_page.Verify Booking List In Booking Detail Page
    ...    ${Booking['text_booking_id_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_booking_time_label']}
    ...    ${Booking['text_shipping_origin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Booking Detail Page

    Step Test:    Step No.11 คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Verify Popup To Edit Booking List
    ...    ${Booking['text_parcel_type_label']}
    ...    ${Booking['text_booking_name_label']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Edit Booking Popup

    Step Test:    Step No.12 คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    b2c_booking_detail_page.Select Pickup Schedule Tab
    # Expected
    b2c_booking_detail_page.Verify Display Pickup Schedule Data
    ...    ${DC_Operation_S019.call_car_pick_up['car_type']}
    ...    ${tomorrow}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${today}
    ...    ${call_car_pick_up.default['price']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Display Pickup Schedule Data

    Step Test:    Step No.13 เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    b2c_booking_detail_page.Select Parcel Pickup Schedule
    b2c_booking_detail_page.Click Save Button In Edit Booking List Popup
    ${booking_id}    Get Booking ID
    # Expected
    b2c_booking_detail_page.Verify Complete Select Parcel Pickup Schedule And Save
    ...    ${today}
    ...    ${DC_Operation_S019['shipping_origin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Complete Select Parcel Pickup Schedule And Save

    Step Test:    Step No.14 คลิกปุ่ม Import File
    b2c_booking_detail_page.Click Import File Button
    b2c_booking_detail_page.Verify Import File Popup
    ...    ${Booking['text_import']}
    ...    ${Booking['text_btn_template']}
    ...    ${Booking['text_import_time']}
    ...    ${Booking['text_file_name']}
    ...    ${Booking['text_import_result']}
    ...    ${Booking['text_file_import_error']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Import File Popup

    Step Test:    Step No.15 คลิกปุ่ม Import 
    Step Test:    Step No.16 เลือกไฟล์ "Booking Dry Template Test DC"
    b2c_booking_detail_page.Import Excel File Of Dry Parcel Template    ${path_excel_booking_chilled_template}
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page After Import File
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${call_car_pick_up.text_parcel_id_start_with['chilled']}
    ...    ${DC_Operation_S019['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Import File Success

    Step Test:    Step No.17 cut off time
    dps_home_page.Set Cut Off Time
    ...    ${DB_URI}
    ...    ${DATABASE_NAME}
    ...    ${COLLECTION}
    ...    ${QUERY}
    # Expected
    Reload Page
    b2c_booking_detail_page.Verify Booking Detail Page After Import File
    ...    ${Booking['text_parcel_status_waiting_entering']}    #${Booking['text_waiting_confirm_parcel_pickup']}
    ...    ${call_car_pick_up.text_parcel_id_start_with['chilled']}
    ...    ${DC_Operation_S019['parcel_number']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Parcel Status After Cut Off Time
    b2c_home_page.Click Book Parcel Delivery    
    # Expected
    b2c_booking_delivery_page.Verify Booking Status After Cutt Off Time    
    ...    ${booking_id}
    ...    ${Booking['text_parcel_status_call_car']}    #${Booking['text_waiting_confirm_parcel_pickup']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Booking Status After Cut Off Time

    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Parcel Pickup Status After Cut Off Time
    ...    ${call_car_pick_up.status['arrange_car']}
    ...    ${tomorrow}
    ...    ${today}
    ...    ${booking_id}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Parcel Pickup Status After Cut Off Time

    Step Test:    Step No.18 เปิด URL DPS
    Open Chrome Browser    chrome    #headlesschrome    #chrome
    common.Open URL    ${DPS_UAT_URL}

    Step Test:    Step No.19 เข้าสู่ระบบ
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Homepage Title

    Step Test:    Step No.20 เลือก role แอดมินคลัง
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    # Expected
    dps_home_page.Verify Role Change In Profile    ${dc_operation.role['admin']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Role Change In Profile

    Step Test:    Step No.21 เลือกเมนู "ตรวจสอบรอบเข้ารับพัสดุ"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['check_receiving_cycle']}  
    # Expected
    # dps_check_receiving_cycle_page.Verify Check Receiving Cycle Page    
    # ...    ${dc_operation.title['check_receiving_cycle']}
    # ...    ${dc_operation.Check_Receiving_Cycle_Tab['all_parcels_received']}
    # ...    ${DC_Operation_S019.receiving_cycle['company_name']}
    # ...    ${DC_Operation_S019.receiving_cycle['branch']}
    # ...    ${DC_Operation_S019.receiving_cycle['company_address']}
    # ...    ${DC_Operation_S019.receiving_cycle['sub_district']}
    # ...    ${DC_Operation_S019.receiving_cycle['district']}
    # ...    ${DC_Operation_S019.receiving_cycle['province']}
    # ...    ${DC_Operation_S019.receiving_cycle['postcode']}
    # ...    ${DC_Operation_S019.receiving_cycle['receiving_time']}
    # ...    ${DC_Operation_S019.receiving_cycle['receiving_type']}
    # ...    ${DC_Operation_S019.receiving_cycle['courier']}
    # ...    ${DC_Operation_S019.receiving_cycle['number_of_parcel']}
    # ...    ${DC_Operation_S019.receiving_cycle.status['waiting']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S019    Verify Check Receiving Cycle Page
