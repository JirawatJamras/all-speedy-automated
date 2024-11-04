*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_s002 [Part1]    
    [Tags]    DC_Operation    UAT    PART1
    Log    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    # Expected
    Sleep    2
    common.Verify Capture Screenshot    DC_Operation_s002    Verify Login Page

    Log    Step No.2 เข้าสู่ระบบลูกค้าธุรกิจ
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    # Expected
    b2c_home_page.Verify Company profile page
    ...    ${dc_operation_002['company_name']}

    common.Verify Capture Screenshot    DC_Operation_s002   Verify Home Page

    Log    Step No.3 เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    DC_Operation_s002   Verify Call Car Pick Up Page

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
    common.Verify Capture Screenshot    DC_Operation_s002   Verify Parcel Pickup Schedule Popup

    Log    Step No.5 ระบุข้อมูล
    ${tomorrow}    Set Tomorrow Date
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${dc_operation_002['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${dc_operation_002['parcel_pickup_time']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Add Special Pickup Round Success
    common.Verify Capture Screenshot    DC_Operation_s002   Verify Add Special Pickup Round Success

    Log    Step No.6 เลือกเมนู "จองการจัดส่งพัสดุ"
    # b2c_home_page.Click Book Parcel Delivery    
    # #Expected
    # b2c_booking_delivery_page.Verify Booking Page For Business Customer
    # common.Verify Capture Screenshot    DC_Operation_s002    Verify Booking Page
    
    Log    Step No.7 คลิกปุ่ม "+ เพิ่ม"
    # b2c_booking_delivery_page.Click Button To Add    
    # #Expected
    # b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    # common.Verify Capture Screenshot    DC_Operation_s002    Verify Term & Condition

    Log    Step No.8 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    # b2c_booking_delivery_page.Click Accept Terms of Service
    # #Expected   
    # b2c_booking_delivery_page.Verify Select Parcel Type
    # common.Verify Capture Screenshot    DC_Operation_s002    Verify Select Parcel Type

    Log    Step No.9 กดปุ่ม "พัสดุทั่วไป"
    # b2c_booking_delivery_page.Select Parcel Type    ${dc_operation_002['parcel_type']}
    # #Expected
    # b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    # ...    ${Booking['text_title']}
    # ...    ${Booking['text_parcel_sender_information']}
    # ...    ${Booking['text_phone_sender']}
    # ...    ${Booking['text_name_sender']}
    # ...    ${Booking['text_address_sender']}
    # ...    ${Booking['text_postcode_sender']}
    # b2c_booking_delivery_page.Verify Data Sender
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    # common.Verify Capture Screenshot    DC_Operation_s002    Verify Create Parcel Page Sender Step

    Log    Step No.10 คลิกปุ่ม x เพื่อปิด popup
    # b2c_booking_delivery_page.Click Close X Popup
    # #Expected

    Log    Step No.11 คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    # b2c_booking_delivery_page.Click Latest Booking Created    ## ใช้แก้ชั่วคราว
    # Sleep    5s
    # b2c_booking_detail_page.Click Edit Booking List
    # b2c_booking_detail_page.Verify Edit Booking List Popup    
    # ...    ${dc_operation_002['parcel_type']}
    # ...    ${dc_operation_002['booking_name']}
    # ...    ${Booking['text_shipping_origin_aria']}
    # common.Verify Capture Screenshot    DC_Operation_s002    Verify Edit Booking Popup

    Log    Step No.12 คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    # b2c_booking_detail_page.Select Pickup Schedule Tab
    # #Expected
    # b2c_booking_detail_page.Verify Display Pickup Schedule Data
    # ...    ${booking.pickup_schedule['special_car_pickup']}   
    # ...    ${booking.pickup_schedule['pickup_date']}
    # ...    ${booking.pickup_schedule['parcel_number']}
    # ...    ${booking.pickup_schedule.default['parcel_number']}
    # ...    ${booking.pickup_schedule['cut_off_time']}
    # ...    ${booking.pickup_schedule.default['cut_off_time']}
    # ...    ${booking.pickup_schedule['price']}
    # ...    ${booking.pickup_schedule.default['price']}
    # common.Verify Capture Screenshot    DC_Operation_s002    Verify Display Pickup Schedule Data

    Log    Step No.13 เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    # b2c_booking_detail_page.Select Parcel Pickup Schedule
    # b2c_booking_detail_page.Click Save Button In Edit Booking List Popup
    # #Expected
    # b2c_booking_detail_page.Verify Complete Select Parcel Pickup Schedule And Save
    # ...    ${booking['text_booking_time_label']}
    # ...    ${booking['text_shipping_origin']}
    # ...    ${dc_operation_002['shipping_origin']}
    # common.Verify Capture Screenshot    DC_Operation_s002    Verify Complete Select Parcel Pickup Schedule And Save

    Log    Step No.14 คลิกปุ่ม Import File
    # b2c_booking_detail_page.Click Import File Button
    # b2c_booking_detail_page.Verify Display Import File Popup
    # common.Verify Capture Screenshot    DC_Operation_001    Verify Display Import File Popup

    Log    Step No.15 คลิกปุ่ม Import 
    # Wait Until Element Is Visible    //button//label[@for='InputFile' and text()='Import']    timeout=30s
    # # Click Element    //input[@id='InputFile']/..

    # ## step 16-17
    # ##TBC

DC_Operation_s002 [Part2]    
    [Tags]    DC_Operation    UAT    PART2
    ### รอหลัง cut off time ###
    Log    Step No.18 เปิด URL DPS
    common.Open URL    ${DPS_UAT_URL}

    Log    Step No.19_1 เข้าสู่ระบบ
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # Expected
    # dps_home_page.dps_login_page.Verify Homepage Title    ${dc_operaion['homepage']}
    # common.Verify Capture Screenshot    DC_Operation_002    Verify Homepage Title

    Log    Step No.19_2 เลือก role แอดมินคลัง
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}
    # Expected
    dps_home_page.Verify Role Change In Profile    ${dc_operation.role['admin']}
    common.Verify Capture Screenshot    DC_Operation_002    Verify Role Change In Profile

    Log    Step No.20 เลือกเมนู "ตรวจสอบรอบเข้ารับพัสดุ"
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['check_receiving_cycle']}
    # Expected
    dps_check_receiving_cycle.Verify Check Receiving Cycle Page    
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['all_parcels_received']}
    ...    ${dc_operation_002.receiving_cycle['company_name']}
    ...    ${dc_operation_002.receiving_cycle['branch']}
    ...    ${dc_operation_002.receiving_cycle['company_address']}
    ...    ${dc_operation_002.receiving_cycle['sub_district']}
    ...    ${dc_operation_002.receiving_cycle['district']}
    ...    ${dc_operation_002.receiving_cycle['province']}
    ...    ${dc_operation_002.receiving_cycle['postcode']}
    ...    ${dc_operation_002.receiving_cycle['receiving_time']}
    ...    ${dc_operation_002.receiving_cycle['receiving_type']}
    ...    ${dc_operation_002.receiving_cycle['courier']}
    ...    ${dc_operation_002.receiving_cycle['number_of_parcel']}
    ...    ${dc_operation_002.receiving_cycle['status']}
    common.Verify Capture Screenshot    DC_Operation_s002    Verify Check Receiving Cycle Page

    Log    Step No.21 คลิกแท็บ "รายการรอคลังยืนยัน"
    dps_check_receiving_cycle.Select Check Receiving Cycle Tab    ${dc_operaion.Check_Receiving_Cycle_Tab['inventory_confirm_list']}
    # Expected
    # Inprogress 
    dps_check_receiving_cycle.Verify Inventory Confirm List Tab
    ...    ${dc_operation.title['check_receiving_cycle']}
    ...    ${dc_operation.Check_Receiving_Cycle_Tab['inventory_confirm_list']}
    ...    ${dc_operation_002.receiving_cycle['company_name']}
    ...    ${dc_operation_002.receiving_cycle['company_address']}
    ...    ${dc_operation_002.receiving_cycle['sub_district']}
    ...    ${dc_operation_002.receiving_cycle['district']}
    ...    ${dc_operation_002.receiving_cycle['province']}
    ...    ${dc_operation_002.receiving_cycle['postcode']}
    ...    ${dc_operation_002.receiving_cycle['receiving_time']}
    ...    ${dc_operation_002.receiving_cycle['receiving_type']}
    ...    ${dc_operation_002.receiving_cycle['courier']}
    ...    ${dc_operation_002.receiving_cycle['number_of_parcel']}
    ...    ${dc_operation_002.receiving_cycle['status']}
    common.Verify Capture Screenshot    DC_Operation_s002    Verify Inventory Confirm List Tab

    Log    Step No.22 คลิกไอคอนรูปดินสอ ด้านขวาสุดของรายการ
    dps_check_receiving_cycle.Click Pencil Icon
    # Expected
    # Inprogress
    dps_check_receiving_cycle.Verify Parcel Pickup Details Popup
    ...    ${dc_operation['parcel_pickup_details']}
    ...    ${dc_operation['button_export']}
    ...    ${dc_operation['vehicle_type']}
    ## เหลือ Verify รายละเอียด ##
    common.Verify Capture Screenshot    DC_Operation_s002    Verify Parcel Pickup Details Popup
    
    Log    Step No.23 คลิกปุ่ม Export
    dps_check_receiving_cycle.Click Export Button On Parcel Pickup Details Popup
    # Expected
    # Inprogress

    Log    Step No.24 คลิกปุ่ม อนุมัติ
    dps_check_receiving_cycle.Click Approve Button On Parcel Pickup Details Popup
    # Expected
    # Inprogress

    Log    Step No.25 กลับ Speed D "เรียกรถเข้ารับพัสดุ"
    Switch Window	MAIN
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    Sleep    10s
    # Expected
    # Inprogress

    Log    Step No.26 เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    # Expected
    # Inprogress