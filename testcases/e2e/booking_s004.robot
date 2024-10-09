*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S004
    [Documentation]    "ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (ไม่เพิ่มเป็นรายการโปรด) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > เลือกจากรายการโปรด) - รายละเอียดพัสดุ เลือก XS (ไม่มีประกัน มี COD เเละไม่ใส่หมายเหตุ)(บันทึกร่าง) - Promotion (ไม่มี)"
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
    b2c_booking_delivery_page.Verify Booking Page    ${Booking['text_title_booking']}
    common.Verify Capture Screenshot    Booking_S004    Verify Booking Page

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    #Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}
    common.Verify Capture Screenshot    Booking_S004    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    #Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S004    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S004['parcel_type']}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    common.Verify Capture Screenshot    Booking_S004    Verify Create Parcel Page Sender Step

    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S004['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S004['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S004['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S004['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S002['sender_postcode_full']}
    #Expected
    common.Verify Capture Screenshot    Booking_S004    Verify After Create Parcel Page Sender Step

    Log    Step No.6 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step   
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    ...    ${Booking['text_postcode_receiver']}
    common.Verify Capture Screenshot    Booking_S004    Verify Create Parcel Page Receiver Step

    Log    Step No.7 กดปุ่ม "เลือกจากรายการโปรด"
    b2c_booking_delivery_page.Click Choose Favorites
    #Expected
    b2c_booking_delivery_page.Verify Favorites Receiver PopUp
    ...    ${Booking_S004['receiver_name']}
    ...    ${Booking_S004['receiver_phone']}
    ...    ${Booking_S004['receiver_address']}
    common.Verify Capture Screenshot    Booking_S004    Verify Favorites Receiver PopUp

    Log    Step No.8 กดเลือกรายการ - สมใจ ดีดีดี 47 หมู่ 4 พ้อแดง หลังสวน ชุมพร 86110
    b2c_booking_delivery_page.Click Choose Favorites Receiver List  
    ...    ${Booking_S004['receiver_name']}
    ...    ${Booking_S004['receiver_phone']}
    ...    ${Booking_S004['receiver_address']}
    b2c_booking_delivery_page.Click Accept Favorites List
    #Expected
    b2c_booking_delivery_page.Verify Choose Receiver From Favorites
    ...    ${Booking_S004['receiver_name']}
    ...    ${Booking_S004['receiver_phone']}
    ...    ${Booking_S004['receiver_address']}
    ...    ${Booking_S004['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S004    Verify Choose Receiver From Favorites

    Log    Step No.9 กดปุ่ม "ถัดไป"
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
    common.Verify Capture Screenshot    Booking_S004    Verify Create Parcel Page Detail Step

    Log    Step No.10 "ขั้นตอนรายละเอียดพัสดุ กรอกข้อมูล ขนาดพัสดุ : กล่อง XS COD : 5,000.00"
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S004['parcel_size']}
    b2c_booking_delivery_page.Input COD    ${Booking_S004['parcel_cod']}
    common.Verify Capture Screenshot    Booking_S004    Verify Select Parcel Size And Input COD

    Log    Step No.11 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    #Expected
    b2c_booking_detail_page.Verify Booking list Page
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking_S004['img_sender_heart']}
    ...    ${Booking_S004['sender_name']}
    ...    ${Booking_S004['sender_phone']}
    ...    ${Booking_S004['img_receiver_heart']}
    ...    ${Booking_S004['receiver_name']}
    ...    ${Booking_S004['receiver_phone']}
    ...    ${Booking_S004['receiver_address']}
    ...    ${Booking_S004['receiver_postcode_full']}
    ...    ${Booking_S004['parcel_size']}
    ...    ${Booking.text_blank['discount_value']}
    ...    ${Booking.text_blank['insurance_fee_value']}
    ...    ${Booking_S004['parcel_cod_verrify']}
    common.Verify Capture Screenshot    Booking_S004    Verify Draft Paecel
