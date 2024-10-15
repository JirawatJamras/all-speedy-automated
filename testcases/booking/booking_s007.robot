*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome   #headlesschrome    
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***

Booking_S007
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (เลือกจากรายการโปรด)(บันทึกร่าง) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > ไม่เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก L (มีประกัน ไม่มี COD เเละใส่หมายเหตุ) - Promotion (มี)
    [Tags]    Booking    UAT
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    #Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    Booking_S007    Verify Booking Page For Business Customer

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    #Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${current_date_thai}${Booking['text_version']}
    common.Verify Capture Screenshot    Booking_S007    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    #Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S007    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S007['parcel_type']}
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
    common.Verify Capture Screenshot    Booking_S007    Verify Create Parcel Page Sender Step
    
    Log    Step No.5 ขั้นตอนข้อมูลผู้รับพัสดุ กดปุ่ม "เลือกจากรายการโปรด"
    b2c_booking_delivery_page.Click Choose Favorites
    #Expected
    b2c_booking_delivery_page.Verify Favorites Sender PopUp    
    ...    ${Booking_S007['sender_phone']}
    ...    ${Booking_S007['sender_name']}
    ...    ${Booking_S007['sender_address']}
    ...    ${Booking_S007['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S007    Verify Click Choose Favorites

    Log    Step No.6 กดเลือกรายการ 
    b2c_booking_delivery_page.Click Choose Favorites Sender List
    ...    ${Booking_S007['sender_phone']}
    ...    ${Booking_S007['sender_name']}
    ...    ${Booking_S007['sender_address']}
    ...    ${Booking_S007['sender_postcode_full']}
    #Expected 
    b2c_booking_delivery_page.Verify Choose Sender From Favorites
    ...    ${Booking_S007['sender_phone']}
    ...    ${Booking_S007['sender_name']}
    ...    ${Booking_S007['sender_address']}
    ...    ${Booking_S007['sender_postcode_full']}
    #not finish
    b2c_booking_delivery_page.Verify Favorites Icon Red Heart    
    common.Verify Capture Screenshot    Booking_S007    Verify After Create Parcel Page Sender Step

    Log    Step No.7 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    #Expected
    b2c_booking_detail_page.Verify Booking Detail Page After Draft
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking.text_blank['text_business_customer_parcel_id_4_start_unit']}
    ...    ${Booking_S005['img_sender_heart']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['img_receiver_heart']}
    ...    ${Booking.text_blank['receiver_name']}
    ...    ${Booking.text_blank['receiver_phone']}
    ...    ${Booking.text_blank['receiver_address']}
    ...    ${Booking.text_blank['receiver_postcode_full']}
    ...    ${Booking.text_blank['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['insurance_fee_value']}
    ...    ${Booking.text_blank['cod_fee_value']}
    common.Verify Capture Screenshot    Booking_S007    Verify Draft Paecel



