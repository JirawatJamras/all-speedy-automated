*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome   #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***

Booking_S016
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (เลือกจากรายการโปรด) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก XL (มีประกัน มี COD เเละไม่ใส่หมายเหตุ)(บันทึกร่าง) - Promotion (ไม่มี)
    [Tags]    Booking    UAT    Pass_With_Condition
    Log    Prerequisite
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S013['parcel_type']}
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S013['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S013['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S013['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S013['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S013['sender_postcode_full']}
    b2c_create_parcel_page.Click Add To Favorites
    b2c_booking_delivery_page.Click Save Button
    b2c_booking_detail_page.Wait Until Loading Icon Success

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Booking Page For Business Customer

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    # Defect043
    # Expected
    # b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    # common.Verify Capture Screenshot    booking    Booking_S016    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S016['parcel_type']}
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
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Create Parcel Page Sender Step
    
    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Click Choose Favorites
    # Expected
    b2c_booking_delivery_page.Verify Favorites Sender PopUp    
    ...    ${Booking_S016['sender_phone']}
    ...    ${Booking_S016['sender_name']}
    ...    ${Booking_S016['sender_address']}
    ...    ${Booking_S016['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Click Choose Favorites

    Log    Step No.6 กดเลือกรายการ 
    b2c_booking_delivery_page.Click Choose Favorites Sender List
    ...    ${Booking_S016['sender_phone']}
    ...    ${Booking_S016['sender_name']}
    ...    ${Booking_S016['sender_address']}
    ...    ${Booking_S016['sender_postcode_full']}
    b2c_booking_delivery_page.Click Accept Favorites List
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S016['sender_phone']}
    ...    ${Booking_S016['sender_name']}
    ...    ${Booking_S016['sender_address']}
    ...    ${Booking_S016['sender_postcode_full']}
    b2c_booking_delivery_page.Verify Favorites Icon Red Heart  
    common.Verify Capture Screenshot    booking    Booking_S016    Verify After Create Parcel Page Sender Step

    Log    Step No.7 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    # Expected
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
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Create Parcel Page Receiver Step When Select Home

    Log    Step No.8 ขั้นตอนข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S016['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S016['receiver_name']}
    b2c_booking_delivery_page.Select Send To 7-ELEVEN Store Tab
    b2c_booking_delivery_page.Input Store Code Receiver    ${Booking_S016['receiver_store_code_5_digits']}
    b2c_booking_delivery_page.Click Store Receiver Lists    ${Booking_S016['receiver_store_address']}
    b2c_booking_delivery_page.Click Store On Map
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    # Expected
    b2c_booking_delivery_page.Verify Data Receiver When Select 7-ELEVEN Store
    ...    ${Booking_S016['receiver_phone']}
    ...    ${Booking_S016['receiver_name']}
    ...    ${Booking_S016['receiver_store_full']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify After Create Parcel Page Receiver Step

    Log    Step No.9 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
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
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Dry Parcel]
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Parcel Detail

    Log    Step No.10 ขั้นตอนรายละเอียดพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S016['parcel_size']}
    b2c_booking_delivery_page.Input Insurance   ${Booking_S016['parcel_insure']}
    b2c_booking_delivery_page.Input COD   ${Booking_S016['parcel_cod']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Select Parcel Size And Input Remark

    Log    Step No.11 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page After Draft When Select 7-ELEVEN Store
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking.text_blank['text_dry_parcel_id_4_start_unit']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S016['sender_name']}
    ...    ${Booking_S016['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking_S016['receiver_name']}
    ...    ${Booking_S016['receiver_phone']}
    ...    ${Booking_S016['receiver_store_address']}
    ...    ${Booking_S016['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking_S016['parcel_insure_verify']}
    ...    ${Booking_S016['parcel_cod_verify']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Draft Parcel After Input Parcel Detail

    Log    Step No.12 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
    ${booking_id}    Get Booking ID
    ${booking_time}    Get Booking Time
    ${booking_name}    Get Booking Name
    ${parcel_id}    Get Parcel ID
    b2c_booking_detail_page.Select Draft Booking
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S016['sender_phone']}
    ...    ${Booking_S016['sender_name']}
    ...    ${Booking_S016['sender_address']}
    ...    ${Booking_S016['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Data Sender

    Log    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To 7-ELEVEN Store Tab
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select 7-ELEVEN Store
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    b2c_booking_delivery_page.Verify Data Receiver When Select 7-ELEVEN Store
    ...    ${Booking_S016['receiver_phone']}
    ...    ${Booking_S016['receiver_name']}
    ...    ${Booking_S016['receiver_store_full']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Data Receiver When Select Home

    Log    Step No.14 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
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
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Dry Parcel]
    ...    ${Booking_S016['parcel_insure_verify2']}
    ...    ${Booking_S016['parcel_cod_verify2']}
    ...    ${EMPTY}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Parcel Detail Page of Create Parcel [Dry Parcel] 

    Log    Step No.15 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Defect045
    # Expected
    # b2c_booking_delivery_page.Verify Promotion Detail
    # ...    ${Booking['text_selected_coupon_and_code']}
    # ...    ${Booking['text_my_coupon_and_code']}
    # common.Verify Capture Screenshot    booking    Booking_S016    Verify Promotion

    Log    Step No.16 ขั้นตอน Promotion
    b2c_booking_delivery_page.Click Parcel Booking Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    ${booking_time}    Get Booking Time
    # Defect048
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S016['sender_name']}
    # ...    ${Booking_S016['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S016['receiver_name']}
    # ...    ${Booking_S016['receiver_phone']}
    # ...    ${Booking_S016['receiver_store_address']}
    # ...    ${Booking_S016['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking_S016['parcel_insure_verify']}
    # ...    ${Booking_S016['parcel_cod_verify']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S016['discount_amount']}
    # ...    ${Booking_S016['discount_value']}
    # ...    ${Booking_S016['insurance_fee_amount']}
    # ...    ${Booking_S016['insurance_fee_value']}
    # ...    ${Booking_S016['cod_fee_amount']}
    # ...    ${Booking_S016['cod_fee_value']}
    # ...    ${Booking_S016['total_price_amount']}
    # ...    ${Booking_S016['total_price_value']}
    # ...    ${Booking.text_blank['store_code']}
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    booking    Booking_S016    Verify Booking Summary After Booking Success
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    booking    Booking_S016    Verify Booking Detail Page After Booking Success

    Log    Step No.17 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Defect047
    # Expected
    # b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    # ...    ${booking_id}
    # ...    ${booking_time}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking_S016['booking_name']}
    # ...    ${Booking_S016['booking_item']}
    # ...    ${Booking_S016['booking_price']}
    # common.Verify Capture Screenshot    booking    Booking_S016    Verify Created Booking On Booking Delivery Page

    Log    Step No.18 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    # Defect048
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S016['sender_name']}
    # ...    ${Booking_S016['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S016['receiver_name']}
    # ...    ${Booking_S016['receiver_phone']}    
    # ...    ${Booking_S016['receiver_store_address']}
    # ...    ${Booking_S016['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking_S016['parcel_insure_verify']}
    # ...    ${Booking_S016['parcel_cod_verify']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S016['discount_amount']}
    # ...    ${Booking_S016['discount_value']}
    # ...    ${Booking_S016['insurance_fee_amount']}
    # ...    ${Booking_S016['insurance_fee_value']}
    # ...    ${Booking_S016['cod_fee_amount']}
    # ...    ${Booking_S016['cod_fee_value']}
    # ...    ${Booking_S016['total_price_amount']}
    # ...    ${Booking_S016['total_price_value']}
    # ...    ${EMPTY}
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    booking    Booking_S016    Verify Booking Summary
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    booking    Booking_S016    Verify Booking Detail Page
    
    Log    Step No.19 กดปุ่ม "แก้ไขรายการบุ๊คกิ้ง"
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    b2c_booking_detail_page.Verify Edit Booking List Popup    
    ...    ${Booking_S016['parcel_type']}
    ...    ${Booking_S016['booking_name']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Edit Booking List Popup  

    Log    Step No.20 "กรอกข้อมูลเพื้นที่ต้นทางการจัดส่ง"
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S016['shipping_origin']}
    b2c_booking_detail_page.Search Shipping Store    ${Booking_S016['store_code']}
    b2c_booking_detail_page.Click Select Store On Map
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
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
    ...    ${Booking_S016['sender_name']}
    ...    ${Booking_S016['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S016['receiver_name']}
    ...    ${Booking_S016['receiver_phone']}    
    ...    ${Booking_S016['receiver_store_address']}
    ...    ${Booking_S016['parcel_size']}
    ...    ${Booking_S016['parcel_price_verify']}
    ...    ${Booking_S016['parcel_insure_verify']}
    ...    ${Booking_S016['parcel_cod_verify']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking_S016['insurance_fee_amount']}
    ...    ${Booking_S016['insurance_fee_value']}
    ...    ${Booking_S016['cod_fee_amount']}
    ...    ${Booking_S016['cod_fee_value']}
    ...    ${Booking_S016['total_price_amount']}
    ...    ${Booking_S016['total_price_value2']}
    ...    ${Booking.origin_shipping['15888_store_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Booking Summary After Set Origin Shipping
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Booking Detail Page After Set Origin Shipping

    Log    Step No.21 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    b2c_booking_detail_page.Verify Parcel Label When Select 7-ELEVEN Store
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking.label['text_destination_deparment_code']}
    ...    ${Booking_S016['receiver_store_code_5_digits']}
    ...    ${Booking_S016['parcel_package_type']}
    ...    ${Booking_S016['parcel_size']}
    ...    ${Booking_S016['sender_name']}
    ...    ${Booking_S016['sender_phone']}
    ...    ${Booking_S016['sender_address']}
    ...    ${Booking_S016['sender_postcode_full']}
    ...    ${Booking_S016['receiver_name']}
    ...    ${Booking_S016['receiver_phone']}
    ...    ${Booking_S016['receiver_store_address']}
    ...    ${Booking_S016['parcel_cod_verify_label']}
    ...    ${Booking.label['parcel_buy_insure']}
    ...    ${Booking.text_blank['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Parcel Label

    Log    Step No.22 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S016    Verify Print Screen





