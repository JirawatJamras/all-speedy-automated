*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_001 [Part1] 
    [Tags]    DC_Operation    UAT
    Log    Step No.1 เข้า URL All Speedy
    common.Open URL   ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    common.Verify Capture Screenshot    DC_Operation_001    Verify Login Page

    Log    Step No.2 เข้าสู่ระบบลูกค้าธุรกิจ
    b2c_login_page.Input Email                    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Verify My Profile Page
    ...    ${Booking['text_company_profile']}
    ...    ${Booking['text_profile']}
    ...    ${Booking['text_profile_name']}
    ...    ${Booking['text_profile_phone']}
    ...    ${Booking['text_profile_mail']}
    ...    ${Booking['text_profile_position']}
    ...    ${Booking_S001['sir_name']}
    ...    ${Booking_S001['company_name']}
    ...    ${Booking_S001['name']}
    ...    ${Booking_S001['phone']}
    ...    ${Booking_S001['email']}
    ...    ${Booking_S001['position']}
    common.Verify Capture Screenshot    DC_Operation_001   Verify Home Page

    Log    Step No.3 เลือกเมนูู "เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    DC_Operation_001   Verify Call Car Pick Up Page

    Log    Step No.4 คลิกปุ่ม +เพิ่ม
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Verify Popup Parcel Pickup Schedule
    common.Verify Capture Screenshot    DC_Operation_001   Verify Parcel Pickup Schedule Popup

    Log    Step No.5 ระบุข้อมูล
    ##เลือกประเภทพัสดุ
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${call_car_pick_up.parcel_type['dry']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${call_car_pick_up.parcel_pickup_time['morning']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    b2c_call_car_pick_up_parcel_page.Verify Add Special Pickup Round Success   ##TBC##
    ...    ${call_car_pick_up.car_round_name['special']}
    ...    ${call_car_pick_up.parcel_pickup_time_schedule['morning']}
    common.Verify Capture Screenshot    DC_Operation_001   Verify Add Special Pickup Round Success

    Log    Step No.6 เลือกเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery    
    #Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    DC_Operation_001    Verify Booking Page
    
    Log    Step No.7 คลิกปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add    
    #Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    DC_Operation_001    Verify Term & Condition

    Log    Step No.8 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    #Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    DC_Operation_001    Verify Select Parcel Type

    Log    Step No.9 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${dc_operaion_001['parcel_type']}
    #Expected
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
    common.Verify Capture Screenshot    DC_Operation_001    Verify Create Parcel Page Sender Step

    Log    Step No.10 คลิกปุ่ม x เพื่อปิด popup
    b2c_booking_delivery_page.Click Close X Popup
    # Expected

    Log    Step No.11 คลิกไอคอนรูปดินสอ ด้านข้างข้อความรายการบุ๊คกิ้ง
    b2c_booking_delivery_page.Click Latest Booking Created    ## ใช้แก้ชั่วคราว
    Sleep    5s
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Verify Edit Booking List Popup    
    ...    ${dc_operaion_001['parcel_type']}
    ...    ${dc_operaion_001['booking_name']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    DC_Operation_001    Verify Edit Booking Popup

    Log    Step No.12 คลิกแท็บ "รอบรถเข้ารับพัสดุ"
    b2c_booking_detail_page.Select Pickup Schedule Tab
    #Expected
    b2c_booking_detail_page.Verify Display Pickup Schedule Data
    ...    ${booking.pickup_schedule['special_car_pickup']}   
    ...    ${booking.pickup_schedule['pickup_date']}
    ...    ${booking.pickup_schedule['parcel_number']}
    ...    ${booking.pickup_schedule.default['parcel_number']}
    ...    ${booking.pickup_schedule['cut_off_time']}
    ...    ${booking.pickup_schedule.default['cut_off_time']}
    ...    ${booking.pickup_schedule['price']}
    ...    ${booking.pickup_schedule.default['price']}
    common.Verify Capture Screenshot    DC_Operation_001    Verify Display Pickup Schedule Data

    Log    Step No.13 เลือกรายการรอบรถที่สร้างไว้ใน Step 5 และกดปุ่มบันทึก
    b2c_booking_detail_page.Select Parcel Pickup Schedule
    b2c_booking_detail_page.Click Save Button In Edit Booking List Popup

    Log    Step No.14 คลิกปุ่ม Import File
    b2c_booking_detail_page.Click Import File Button
    b2c_booking_detail_page.Verify Display Import File Popup
    common.Verify Capture Screenshot    DC_Operation_001    Verify Display Import File Popup