*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S012
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (ไม่เพิ่มเป็นรายการโปรด) - ข้อมูลผู้รับพัสดุ (ส่งที่ร้าน 7-11 > เลือกจากรายการโปรด) - รายละเอียดพัสดุ เลือก XS (ไม่มีประกัน มี COD เเละไม่ใส่หมายเหตุ)(บันทึกร่าง) - Promotion (ไม่มี)
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
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Page

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    #Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}
    common.Verify Capture Screenshot    Booking_S012    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    #Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S012    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S012['parcel_type']}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    common.Verify Capture Screenshot    Booking_S012    Verify Create Parcel Page Sender Step

    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S012['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S012['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S012['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S012['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S012['sender_postcode_full']}
    #Expected
    common.Verify Capture Screenshot    Booking_S012    Verify After Create Parcel Page Sender Step

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
    common.Verify Capture Screenshot    Booking_S012    Verify Create Parcel Page Receiver Step

    Log    Step No.7 กดปุ่ม "เลือกจากรายการโปรด"
    b2c_booking_delivery_page.Click Choose Favorites
    #Expected
    b2c_booking_delivery_page.Verify Favorites Receiver PopUp
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_address']}
    common.Verify Capture Screenshot    Booking_S012    Verify Favorites Receiver PopUp

    Log    Step No.8 "กดเลือกรายการ สมใจ ดีดีดี 01523 สาขา ปากน้ำหลังสวน ปากน้ำ หลังสวน ชุมพร 86150"
    b2c_booking_delivery_page.Click Choose Favorites Receiver List  
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_address']}
    b2c_booking_delivery_page.Click Accept Favorites List
    #Expected
    # b2c_booking_delivery_page.Verify Choose Receiver From Favorites
    # ...    ${Booking_S012['receiver_name']}
    # ...    ${Booking_S012['receiver_phone']}
    # ...    ${Booking_S012['receiver_address']}
    # ...    ${Booking_S012['receiver_postcode_full']}
    # common.Verify Capture Screenshot    Booking_S012    Verify Choose Receiver From Favorites

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
    common.Verify Capture Screenshot    Booking_S012    Verify Create Parcel Page Detail Step

    Log    Step No.10 "ขั้นตอนรายละเอียดพัสดุ กรอกข้อมูล ขนาดพัสดุ : กล่อง XS COD : 5,000.00"
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S012['parcel_size']}
    b2c_booking_delivery_page.Input COD    ${Booking_S012['parcel_cod']}
    common.Verify Capture Screenshot    Booking_S012    Verify Select Parcel Size And Input COD

    Log    Step No.11 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    #Expected
    b2c_booking_detail_page.Verify Booking list Page
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking_S012['img_sender_heart']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking_S012['img_receiver_heart']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_address']}
    ...    ${Booking_S012['receiver_postcode_full']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking.text_blank['discount_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking_S012['parcel_cod_verify']}
    common.Verify Capture Screenshot    Booking_S012    Verify Draft Paecel

    Log    Step No.12 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
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
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_address']}
    ...    ${Booking_S012['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S012    Verify Draft Parcel Sender

    Log    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step   
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    ...    ${Booking['text_postcode_receiver']}
    b2c_booking_delivery_page.Verify Draft Paecel Receiver
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_address']}
    ...    ${Booking_S012['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S003    Verify Create Parcel Page Receiver Step

    Log    Step No.14 กดปุ่ม "ถัดไป"
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
    common.Verify Capture Screenshot    Booking_S012    Verify Create Parcel Page Detail Step

    Log    Step No.15 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    b2c_booking_delivery_page.Verify Promotion Detail
    ...    ${Booking['text_selected_coupon_and_code']}
    ...    ${Booking['text_my_coupon_and_code']}
    common.Verify Capture Screenshot    Booking_S012    Verify Promotion

    Log    Step No.16 ขั้นตอน Promotion
    # - ไม่เลือก Promotion
    b2c_booking_delivery_page.Click Parcel Booking Button
    #Expected
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_Business_customer_parcel_id_4_start_unit']}
    ...    ${booking_name}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_address']}
    ...    ${Booking_S012['receiver_postcode_full']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking.text_default['total_price_amount']}
    ...    ${Booking.text_default['total_price_value']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Summary After Booking Success
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Detail Page After Booking Success

    Log    Step No.17 กดเมนู "จองการจัดส่งพัสดุ"
    # - ไม่เลือก Promotion
    b2c_home_page.Click Book Parcel Delivery
    #Expected
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${booking_time}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking_S012['booking_name']}
    ...    ${Booking_S012['booking_item']}
    ...    ${Booking_S012['booking_price']}
    common.Verify Capture Screenshot    Booking_S012    Verify Created Booking On Booking Delivery Page

    Log    Step No.18 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    Expected
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_Business_customer_parcel_id_4_start_unit']}
    ...    ${booking_name}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_address']}
    ...    ${Booking_S012['receiver_postcode_full']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking.text_default['total_price_amount']}
    ...    ${Booking.text_default['total_price_value']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Detail Page
    
    Log    Step No.19 กดปุ่ม "แก้ไขรายการบุ๊คกิ้ง"
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    b2c_booking_detail_page.Verify Edit Booking List Popup    
    ...    ${Booking_S012['parcel_type']}
    ...    ${Booking_S012['booking_name']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    Booking_S012    Verify Edit Booking List Popup  

    Log    Step No.20 "กรอกข้อมูลเพื้นที่ต้นทางการจัดส่ง"
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S012['shipping_origin']}
    b2c_booking_detail_page.Search Shipping Store    ${Booking_S012['store_code']}
    b2c_booking_detail_page.Click Select Store On Map
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    ${booking_time}    Get Booking Time
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_Business_customer_parcel_id_4_start_unit']}
    ...    ${booking_name}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_address']}
    ...    ${Booking_S012['receiver_postcode_full']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S012['total_price_amount']}
    ...    ${Booking_S012['total_price_value']}
    ...    ${Booking_S012['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Summary After Set Origin Shipping
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Detail Page After Set Origin Shipping

    Log    Step No.21 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    b2c_booking_detail_page.Verify Parcel Label
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking_S012['receiver_postcode_5_digits']}
    ...    ${Booking_S012['parcel_package_type']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking_S012['sender_address']}
    ...    ${Booking_S012['sender_postcode_full']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_address']}
    ...    ${Booking_S012['receiver_postcode_full']}
    ...    ${Booking.label['parcel_cod']}
    ...    ${Booking.label['parcel_insure']}
    ...    ${Booking.text_blank['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S012    Verify Parcel Label

    Log    Step No.22 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    b2c_booking_detail_page.Verify Timestamp After Print Label
    common.Verify Capture Screenshot    Booking_S012    Verify Print Screen


    [Teardown]    common.Delete API Booking By Booking ID    ${booking_id}    # ใช้แค่ขณะ Develop Automate Testing เท่านั้น ***ต้องลบก่อนส่งมอบ


