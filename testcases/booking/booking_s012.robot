*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S012
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (ไม่เพิ่มเป็นรายการโปรด) - ข้อมูลผู้รับพัสดุ (ส่งที่ร้าน 7-11 > เลือกจากรายการโปรด) - รายละเอียดพัสดุ เลือก XS (ไม่มีประกัน มี COD เเละไม่ใส่หมายเหตุ)(บันทึกร่าง) - Promotion (ไม่มี)
    [Tags]    Booking    UAT    In_Review
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Page For Business Customer

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    # Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    Booking_S012    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S012    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S012['parcel_type']}
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
    common.Verify Capture Screenshot    Booking_S012    Verify Create Parcel Page Sender Step

    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S012['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S012['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S012['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S012['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S012['sender_postcode_full']}
    # Expected
    common.Verify Capture Screenshot    Booking_S012    Verify After Create Parcel Page Sender Step

    Log    Step No.6 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select Home   
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    ...    ${Booking['text_postcode_receiver']}
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    common.Verify Capture Screenshot    Booking_S012    Verify Create Parcel Page Receiver Step When Select Home

    Log    Step No.7 ขั้นตอนข้อมูลผู้รับพัสดุ
    # เลือกจากรายการโปรด
    b2c_booking_delivery_page.Click Choose Favorites
    #Expected
    b2c_booking_delivery_page.Verify Favorites Receiver PopUp When Address At 7-ELEVEN Store
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_store_address']}
    common.Verify Capture Screenshot    Booking_S012    Verify Favorites Receiver PopUp

    Log    Step No.8 "กดเลือกรายการ"
    b2c_booking_delivery_page.Click Choose Favorites Receiver List When Address At 7-ELEVEN Store
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_store_address']}
    b2c_booking_delivery_page.Click Accept Favorites List
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select 7-ELEVEN Store
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    b2c_booking_delivery_page.Verify Data Receiver When Select 7-ELEVEN Store
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_store_full']}
    common.Verify Capture Screenshot    Booking_S012    Verify Choose Receiver From Favorites

    Log    Step No.9 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    b2c_booking_delivery_page.Verify Parcel Detail Page of Create Parcel [Dry Parcel]
    ...    ${Booking.dry_parcel['parcel_detail_A4']}
    ...    ${Booking.dry_parcel['parcel_detail_A3']}
    ...    ${Booking.dry_parcel['parcel_detail_XS']}
    ...    ${Booking.dry_parcel['parcel_detail_S']}
    ...    ${Booking.dry_parcel['parcel_detail_M']}
    ...    ${Booking.dry_parcel['parcel_detail_L']}
    ...    ${Booking.dry_parcel['parcel_detail_XL']}
    ...    ${Booking.dry_parcel['parcel_detail_XXL']}
    ...    ${Booking['parcel_detail_insure_amount']}
    ...    ${Booking['parcel_detail_cod']}
    ...    ${Booking['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S012    Verify Parcel Detail Page of Create Parcel [Dry Parcel]

    Log    Step No.10 "ขั้นตอนรายละเอียดพัสดุ"
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S012['parcel_size']}
    b2c_booking_delivery_page.Input COD    ${Booking_S012['parcel_cod']}
    common.Verify Capture Screenshot    Booking_S012    Verify Select Parcel Size And Input COD

    Log    Step No.11 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    #Expected
    b2c_booking_detail_page.Verify Booking Detail Page After Draft When Select 7-ELEVEN Store
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking.text_blank['text_dry_parcel_id_4_start_unit']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}    # Expected Result is ${Booking.img_not_favorite['img_sender_heart']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    01523 ปากน้ำหลังสวน ปากน้ำ หลังสวน ชุมพร 86150    # Expected is ${Booking_S012['receiver_store_address']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking_S012['parcel_cod_verify']}
    common.Verify Capture Screenshot    Booking_S012    Verify Draft Parcel

    Log    Step No.12 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
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
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_address']}
    ...    ${Booking_S012['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S012    Verify Data Sender

    Log    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select 7-ELEVEN Store
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    b2c_booking_delivery_page.Verify Data Receiver When Select 7-ELEVEN Store
    ...    ${Booking_S012['receiver_phone']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_store_full']}
    common.Verify Capture Screenshot    Booking_S012    Verify Create Parcel Page Receiver Step When Select Home

    Log    Step No.14 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    b2c_booking_delivery_page.Verify Parcel Detail Page of Create Parcel [Dry Parcel]
    ...    ${Booking.dry_parcel['parcel_detail_A4']}
    ...    ${Booking.dry_parcel['parcel_detail_A3']}
    ...    ${Booking.dry_parcel['parcel_detail_XS']}
    ...    ${Booking.dry_parcel['parcel_detail_S']}
    ...    ${Booking.dry_parcel['parcel_detail_M']}
    ...    ${Booking.dry_parcel['parcel_detail_L']}
    ...    ${Booking.dry_parcel['parcel_detail_XL']}
    ...    ${Booking.dry_parcel['parcel_detail_XXL']}
    ...    ${Booking['parcel_detail_insure_amount']}
    ...    ${Booking['parcel_detail_cod']}
    ...    ${Booking['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S012    Verify Parcel Detail Page of Create Parcel [Dry Parcel]

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
    ${booking_time}    Get Booking Time
    #Expected
    b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
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
    ...    01523 ปากน้ำหลังสวน ปากน้ำ หลังสวน ชุมพร 86150    # Expected is ${Booking_S012['receiver_store_address']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking_S012['parcel_cod_verify']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    0    # Expected Result is ${Booking_S012['cod_fee_amount']}
    ...    0.00    # Expected Result is ${Booking_S012['cod_fee_value']}
    ...    0    # Expected Result is ${Booking_S012['total_price_amount']}
    ...    0.00    # Expected Result is ${Booking_S012['total_price_value']}
    ...    ${EMPTY}    # Expected Result is ${Booking.text_blank['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Summary After Booking Success
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Detail Page After Booking Success

    Log    Step No.17 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    #Expected
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${booking_time}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking_S012['booking_name']}
    ...    ${Booking_S012['booking_item']}
    ...    0.00 บาท    # Expected result is: ${Booking.text_default['booking_price']}
    common.Verify Capture Screenshot    Booking_S012    Verify Created Booking On Booking Delivery Page

    Log    Step No.18 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
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
    ...    01523 ปากน้ำหลังสวน ปากน้ำ หลังสวน ชุมพร 86150    # Expected is ${Booking_S012['receiver_store_address']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking_S012['parcel_cod_verify']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking.text_default['total_price_amount']}
    ...    ${Booking.text_default['total_price_value']}
    ...    ${EMPTY}    # Expected Result is ${Booking.text_blank['store_code']}
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
    # เลือกร้าน 7-11 ต้นทาง
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S012['shipping_origin']}
    b2c_booking_detail_page.Search Shipping Store    ${Booking_S012['store_code']}
    b2c_booking_detail_page.Click Select Store On Map
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    ${booking_time}    Get Booking Time
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
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
    ...    01523 ปากน้ำหลังสวน ปากน้ำ หลังสวน ชุมพร 86150    # Expected is ${Booking_S012['receiver_store_address']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking_S012['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking_S012['parcel_cod_verify']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking_S012['cod_fee_amount']}
    ...    ${Booking_S012['cod_fee_value']}
    ...    ${Booking_S012['total_price_amount']}
    ...    ${Booking_S012['total_price_value2']}
    ...    ${Booking_S012['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Summary After Set Origin Shipping
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S012    Verify Booking Detail Page After Set Origin Shipping

    Log    Step No.21 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    b2c_booking_detail_page.Verify Parcel Label When Select 7-ELEVEN Store
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking.label['text_destination_deparment_code']}
    ...    ${Booking_S012['receiver_store_code_5_digits']}
    ...    ${Booking_S012['parcel_package_type']}
    ...    ${Booking_S012['parcel_size']}
    ...    ${Booking_S012['sender_name']}
    ...    ${Booking_S012['sender_phone']}
    ...    ${Booking_S012['sender_address']}
    ...    ${Booking_S012['sender_postcode_full']}
    ...    ${Booking_S012['receiver_name']}
    ...    ${Booking_S012['receiver_phone']}
    ...    01523 7-11 ปากน้ำหลังสวน ปากน้ำ หลังสวน ชุมพร 86150    #${Booking_S012['receiver_store_address']}
    ...    ${Booking_S012['parcel_cod_verify_label']}
    ...    ${Booking.label['parcel_not_buy_insure']}
    ...    ${Booking.text_blank['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S012    Verify Parcel Label

    Log    Step No.22 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    Booking_S012    Verify Print Screen