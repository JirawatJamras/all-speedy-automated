*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome   #headlesschrome   #chrome
                  ...    AND    Set Folder Result with date
Test Teardown    Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S042
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - เเก้ไขรายการ
    [Tags]    Booking    UAT    BEW
    Log    Prerequisite S003
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    # Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    
    # Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add

    # Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service

    # Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S003['parcel_type']}

    # Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S003['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S003['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S003['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S003['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S003['sender_postcode_full']}

    # Step No.6 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button

    # Step No.7 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
    ${booking_id}    Get Booking ID
    ${booking_time}    Get Booking Time
    ${booking_name}    Get Booking Name
    ${parcel_id}    Get Parcel ID
    b2c_booking_detail_page.Select Draft Booking

    # Step No.8 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab

    # Step No.9 ขั้นตอนข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S003['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S003['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S003['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S003['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S003['receiver_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Receiver

    # Step No.10 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button

    # Step No.11 ขั้นตอนรายละเอียดพัสดุ
    # เลือกขนาดพัสดุ : ซอง A3
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S003['parcel_size']}
    b2c_booking_delivery_page.Input Parcel Remark    ${Booking_S003['parcel_detail_remark']}

    # Step No.12 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button 

    # Step No.13 ขั้นตอน Promotion
    # ระบุโค้ดส่วนลด : SPBH5B
    b2c_booking_delivery_page.Input Promotion    ${Booking_S003['promotion']}
    b2c_booking_delivery_page.Click Use Code Button

    # Step No.14 กดปุ่ม "จองเลขพัสดุ"
    b2c_booking_delivery_page.Click Parcel Booking Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    ${booking_time}    Get Booking Time

    # Step No.15 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success

    # Step No.16 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    
    # Step No.17 กดปุ่ม "เเก้ไขรายการบุ๊คกิ้ง"
    b2c_booking_detail_page.Click Edit Booking List

    # Step No.18 "กรอกข้อมูลเพื้นที่ต้นทางการจัดส่ง"
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S003['shipping_origin']}
    b2c_booking_detail_page.Search Shipping Store    ${Booking_S003['store_code']}
    b2c_booking_detail_page.Click Select Store On Map
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    ${booking_time}    Get Booking Time

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    #Expected
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${booking_time}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking_S003['booking_name']}
    ...    ${Booking_S003['booking_item']}
    ...    ${Booking_S042['price_value']}
    common.Verify Capture Screenshot    Booking_S042    Verify Created Booking On Booking Delivery Page

    Log    Step No.2 กดรายการบุ๊คกิ้งที่มีสถานะ "รอส่งพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Booking With Waiting For Entering Parcel To System    ${booking_id}
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    ...    ${booking_name}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S003['sender_name']}
    ...    ${Booking_S003['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    ...    ${Booking_S003['parcel_size']}
    ...    ${Booking_S003['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S003['discount_amount']}
    ...    ${Booking_S003['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S003['total_price_amount']}
    ...    ${Booking_S003['total_price_value']}
    ...    ${Booking_S003['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S042    Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S042    Verify Booking Detail Page

    Log    Step No.3 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Parcel List With Waiting For Entering Parcel To System Status
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S003['sender_phone']}
    ...    ${Booking_S003['sender_name']}
    ...    ${Booking_S003['sender_address']}
    ...    ${Booking_S003['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S042    Verify Data Sender

    Log    Step No.4 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Sender
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S003['sender_phone']}
    ...    ${Booking_S003['sender_name']}
    ...    ${Booking_S003['sender_address']}
    ...    ${Booking_S003['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S042    Verify Can Edit Data Sender

    Log    Step No.5 เเก้ไข ข้อมูลผู้ส่งพัสดุ
    b2c_booking_detail_page.Edit Phone Sender    ${Booking_S042['sender_phone']}
    b2c_booking_detail_page.Edit Name Sender    ${Booking_S042['sender_name']}    
    b2c_booking_detail_page.Edit Address Sender    ${Booking_S042['sender_address']}
    b2c_booking_detail_page.Edit Postcode Sender    ${Booking_S042['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S042['sender_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Sender
    # Expected
    common.Verify Capture Screenshot    Booking_S042    Verify Edit Data Sender

    Log    Step No.6 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    ...    ${booking_name}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S042['sender_name']}
    ...    ${Booking_S042['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    ...    ${Booking_S003['parcel_size']}
    ...    ${Booking_S003['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S003['discount_amount']}
    ...    ${Booking_S003['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S003['total_price_amount']}
    ...    ${Booking_S003['total_price_value']}
    ...    ${Booking_S003['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S042    Verify Booking Summary After Edit Sender Data
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S042    Verify Booking Detail Page After Edit Sender Data

    Log    Step No.7 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Parcel List With Waiting For Entering Parcel To System Status
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S042['sender_phone']}
    ...    ${Booking_S042['sender_name']}
    ...    ${Booking_S042['sender_address']}
    ...    ${Booking_S042['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S042    Verify Data Sender After Edit Sender Data

    Log    Step No.8 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
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
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S042    Verify Data Receiver

    Log    Step No.9 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Receiver
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S042    Verify Can Edit Data Receiver

    Log    Step No.10 เเก้ไข ข้อมูลผู้รับพัสดุ
    b2c_booking_detail_page.Edit Phone Receiver    ${Booking_S042['receiver_phone']}
    b2c_booking_detail_page.Edit Name Receiver    ${Booking_S042['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_detail_page.Edit Address Receiver    ${Booking_S042['receiver_address']}
    b2c_booking_detail_page.Edit Postcode Receiver    ${Booking_S042['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S042['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S042    Verify Edit Data Receiver



