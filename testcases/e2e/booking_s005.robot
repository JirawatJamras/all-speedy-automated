*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
# Test Teardown     Close Browser

*** Test Cases ***
Booking_S005
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (เพิ่มเป็นรายการโปรด)(บันทึกร่าง) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > ไม่เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก S (ไม่มีประกัน มี COD เเละใส่หมายเหตุ) - Promotion (มี)
    [Tags]    Booking    UAT    Run
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    #Expected
    b2c_booking_delivery_page.Verify Booking Page    ${Booking['text_title_booking']}
    common.Verify Capture Screenshot    Booking_S005    Verify Booking Page

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    #Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}
    common.Verify Capture Screenshot    Booking_S005    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    #Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S005    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S005['parcel_type']}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    common.Verify Capture Screenshot    Booking_S005    Verify Create Parcel Page Sender Step

    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S005['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S005['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S005['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S005['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S005['sender_postcode_full']}
    b2c_create_parcel_page.Click Add To Favorites
    #Expected
    common.Verify Capture Screenshot    Booking_S005    Verify After Create Parcel Page Sender Step

    Log    Step No.6 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    #Expected
    b2c_booking_detail_page.Verify Booking list Page
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking_S005['img_sender_heart']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['img_receiver_heart']}
    ...    ${Booking.text_blank['receiver_name']}
    ...    ${Booking.text_blank['receiver_phone']}
    ...    ${Booking.text_blank['receiver_address']}
    ...    ${Booking.text_blank['receiver_postcode_full']}
    ...    ${Booking.text_blank['parcel_size']}
    ...    ${Booking.text_blank['discount_value']}
    ...    ${Booking.text_blank['insurance_fee_value']}
    ...    ${Booking.text_blank['cod_fee_value']}
    common.Verify Capture Screenshot    Booking_S005    Verify Draft Paecel

    Log    Step No.7 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
    ${booking_id}    Get Booking ID
    ${booking_time}    Get Booking Time
    ${booking_name}    Get Booking Name
    ${parcel_id}    Get Parcel ID
    b2c_booking_detail_page.Select Draft Booking
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Draft Parcel Sender
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_address']}
    ...    ${Booking_S005['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S005    Verify Draft Parcel Sender

    Log    Step No.8 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    #Expected
    b2c_booking_delivery_page.Verify Draft Paecel Receiver
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    common.Verify Capture Screenshot    Booking_S005    Verify Draft Paecel Receiver

    Log    Step No.9 ขั้นตอนข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S005['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S005['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S005['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S005['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S005['receiver_postcode_full']}
    #Expected
    common.Verify Capture Screenshot    Booking_S005    Verify After Create Parcel Page Receiver Step

    Log    Step No.10 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Detail Step
    ...    ${Booking.general_parcel['parcel_detail_A4']}
    ...    ${Booking.general_parcel['parcel_detail_A3']}
    ...    ${Booking.general_parcel['parcel_detail_XS']}
    ...    ${Booking.general_parcel['parcel_detail_S']}
    ...    ${Booking.general_parcel['parcel_detail_M']}
    ...    ${Booking.general_parcel['parcel_detail_L']}
    ...    ${Booking.general_parcel['parcel_detail_XL']}
    ...    ${Booking.general_parcel['parcel_detail_XXL']}
    ...    ${Booking['parcel_detail_insure_amount']}
    ...    ${Booking['parcel_detail_cod']}
    ...    ${Booking['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S005    Verify Paecel Detail

    Log    Step No.11 ขั้นตอนรายละเอียดพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S005['parcel_size']}
    b2c_booking_delivery_page.Input COD    ${Booking_S005['parcel_cod']}
    b2c_booking_delivery_page.Input Parcel Remark    ${Booking_S005['parcel_cod']}


    [Teardown]    common.Delete API Booking By Booking ID    ${booking_id}    # ใช้แค่ขณะ Develop Automate Testing เท่านั้น ***ต้องลบก่อนส่งมอบ