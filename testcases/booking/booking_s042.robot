*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome   #headlesschrome   #chrome
                  ...    AND    Set Folder Result with date
Test Teardown     Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S042
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - เเก้ไขรายการ
    [Tags]    Booking    UAT    Fail
    Log    Prerequisite S003
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S003['parcel_type']}
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S003['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S003['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S003['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S003['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S003['sender_postcode_full']}
    b2c_booking_delivery_page.Click Save Button
    ${booking_id}    Get Booking ID
    ${booking_time}    Get Booking Time
    ${booking_name}    Get Booking Name
    ${parcel_id}    Get Parcel ID
    b2c_booking_detail_page.Select Draft Booking
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S003['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S003['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S003['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S003['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S003['receiver_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S003['parcel_size']}
    b2c_booking_delivery_page.Input Parcel Remark    ${Booking_S003['parcel_detail_remark']}
    b2c_booking_delivery_page.Click Next Button 
    b2c_booking_delivery_page.Input Promotion    ${Booking_S003['promotion']}
    b2c_booking_delivery_page.Click Use Code Button
    b2c_booking_delivery_page.Click Parcel Booking Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    ${booking_time}    Get Booking Time
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S003['shipping_origin']}
    b2c_booking_detail_page.Search Shipping Store    ${Booking_S003['store_code']}
    b2c_booking_detail_page.Click Select Store On Map
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    ${booking_time}    Get Booking Time

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Defect117
    # Expected
    # b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    # ...    ${booking_id}
    # ...    ${booking_time}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking_S003['booking_name']}
    # ...    ${Booking_S003['booking_item']}
    # ...    ${Booking_S042.old['total_price_value']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Created Booking On Booking Delivery Page

    Log    Step No.2 กดรายการบุ๊คกิ้งที่มีสถานะ "รอส่งพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Booking With Waiting For Entering Parcel To System    ${booking_id}
    # Defect101
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S003['sender_name']}
    # ...    ${Booking_S003['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S003['receiver_name']}
    # ...    ${Booking_S003['receiver_phone']}
    # ...    ${Booking_S003['receiver_address']}
    # ...    ${Booking_S003['receiver_postcode_full']}
    # ...    ${Booking_S003['parcel_size']}
    # ...    ${Booking_S003['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S003['discount_amount']}
    # ...    ${Booking_S003['discount_value']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S003['total_price_amount']}
    # ...    ${Booking_S003['total_price_value']}
    # ...    ${Booking_S003['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Detail Page

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
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Data Sender

    Log    Step No.4 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Sender
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S003['sender_phone']}
    ...    ${Booking_S003['sender_name']}
    ...    ${Booking_S003['sender_address']}
    ...    ${Booking_S003['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Can Edit Data Sender

    Log    Step No.5 เเก้ไข ข้อมูลผู้ส่งพัสดุ
    b2c_booking_detail_page.Edit Phone Sender    ${Booking_S042['sender_phone']}
    # Defect119
    b2c_booking_detail_page.Edit Name Sender    ${Booking_S042['sender_name']}    
    b2c_booking_detail_page.Edit Address Sender    ${Booking_S042['sender_address']}
    b2c_booking_detail_page.Edit Postcode Sender    ${Booking_S042['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S042['sender_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Sender
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Edit Data Sender

    Log    Step No.6 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Defect101
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S042['sender_name']}
    # ...    ${Booking_S042['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S003['receiver_name']}
    # ...    ${Booking_S003['receiver_phone']}
    # ...    ${Booking_S003['receiver_address']}
    # ...    ${Booking_S003['receiver_postcode_full']}
    # ...    ${Booking_S003['parcel_size']}
    # ...    ${Booking_S003['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S003['discount_amount']}
    # ...    ${Booking_S003['discount_value']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S003['total_price_amount']}
    # ...    ${Booking_S003['total_price_value']}
    # ...    ${Booking_S003['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Summary After Edit Sender Data
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Detail Page After Edit Sender Data

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
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Data Sender After Edit Sender Data

    Log    Step No.8 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
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
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Data Receiver

    Log    Step No.9 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Receiver
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Can Edit Data Receiver

    Log    Step No.10 เเก้ไข ข้อมูลผู้รับพัสดุ
    b2c_booking_detail_page.Edit Phone Receiver    ${Booking_S042['receiver_phone']}
    # Defect119
    b2c_booking_detail_page.Edit Name Receiver    ${Booking_S042['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_detail_page.Edit Addres s Receiver    ${Booking_S042['receiver_address']}
    b2c_booking_detail_page.Edit Postcode Receiver    ${Booking_S042['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S042['receiver_postcode_full']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Edit Data Receiver

    Log    Step No.11 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Dfect101
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S042['sender_name']}
    # ...    ${Booking_S042['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S042['receiver_name']}
    # ...    ${Booking_S042['receiver_phone']}
    # ...    ${Booking_S042['receiver_address']}
    # ...    ${Booking_S042['receiver_postcode_full']}
    # ...    ${Booking_S003['parcel_size']}
    # ...    ${Booking_S003['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S003['discount_amount']}
    # ...    ${Booking_S003['discount_value']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S003['total_price_amount']}
    # ...    ${Booking_S003['total_price_value']}
    # ...    ${Booking_S003['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Summary After Edit Data Receiver
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Detail Page After Edit Data Receiver

    Log    Step No.12 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
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
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Data Sender After Edit Sender Data

    Log    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
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
    ...    ${Booking_S042['receiver_phone']}
    ...    ${Booking_S042['receiver_name']}
    ...    ${Booking_S042['receiver_address']}
    ...    ${Booking_S042['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Data Receiver After Edit Sender Data

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
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${EMPTY}
    ...    ${Booking_S003['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Parcel Detail

    Log    Step No.15 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Parcel
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Dry Parcel]
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${EMPTY}
    ...    ${Booking_S003['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Can Edit Data Receiver

    Log    Step No.16 เเก้ไข ข้อมูลพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S042['parcel_size']}
    b2c_booking_detail_page.Edit Insurance    ${Booking_S042['buy_insurance']}
    b2c_booking_detail_page.Edit Parcel Remark    ${Booking_S042['parcel_detail_remark']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Edit Data Parcel

    Log    Step No.17 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Defect101
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S042['sender_name']}
    # ...    ${Booking_S042['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S042['receiver_name']}
    # ...    ${Booking_S042['receiver_phone']}
    # ...    ${Booking_S042['receiver_address']}
    # ...    ${Booking_S042['receiver_postcode_full']}
    # ...    ${Booking_S042['parcel_size']}
    # ...    ${Booking_S042['price_value']}
    # ...    ${Booking_S042['verify_buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S003['discount_amount']}
    # ...    ${Booking_S003['discount_value']}
    # ...    ${Booking_S042['insurance_fee_amount']}
    # ...    ${Booking_S042['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S042['total_price_amount']}
    # ...    ${Booking_S042['total_price_value']}
    # ...    ${Booking_S003['store_code']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Summary After Edit Data Parcel
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Detail Page After Edit Data Parcel

    Log    Step No.18 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
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
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Data Sender After Edit Sender Data

    Log    Step No.19 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
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
    ...    ${Booking_S042['receiver_phone']}
    ...    ${Booking_S042['receiver_name']}
    ...    ${Booking_S042['receiver_address']}
    ...    ${Booking_S042['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Data Receiver After Edit Sender Data

    Log    Step No.20 กดปุ่ม "ถัดไป"
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
    ...    ${Booking_S042['buy_insurance']}
    ...    ${EMPTY}
    ...    ${Booking_S042['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Parcel Detail After Edit Sender Data

    Log    Step No.21 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Defect050
    # Expected
    # b2c_booking_delivery_page.Verify Selected Coupon And Code
    # ...    ${Booking_S003.promotion_detail['discount']}
    # ...    ${Booking_S003.promotion_detail['promotion_name']}
    # ...    ${Booking_S003.promotion_detail['parcel_size']}
    # ...    ${Booking_S003.promotion_detail['expired_date']}
    # ...    ${Booking_S003.promotion_detail['condition']}
    # ...    ${Booking_S003.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S042     Verify Selected Coupon And Code

    Log    Step No.22 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Defect050
    # Expected
    # b2c_booking_delivery_page.Verify Can Edit Selected Coupon And Code
    # b2c_booking_delivery_page.Verify Selected Coupon And Code
    # ...    ${Booking_S003.promotion_detail['discount']}
    # ...    ${Booking_S003.promotion_detail['promotion_name']}
    # ...    ${Booking_S003.promotion_detail['parcel_size']}
    # ...    ${Booking_S003.promotion_detail['expired_date']}
    # ...    ${Booking_S003.promotion_detail['condition']}
    # ...    ${Booking_S003.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Can Edit Selected Coupon And Code

    Log    Step No.23 กดปุ่ม "นำออก" ที่รายการคูปองและโค้ดส่วนลดที่เลือก
    b2c_booking_delivery_page.Click Take Out Coupon
    # Expected
    b2c_booking_delivery_page.Verify Not Select Coupon And Code
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Take Out Coupon

    Log    Step No.24 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Defect101
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S042['sender_name']}
    # ...    ${Booking_S042['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S042['receiver_name']}
    # ...    ${Booking_S042['receiver_phone']}
    # ...    ${Booking_S042['receiver_address']}
    # ...    ${Booking_S042['receiver_postcode_full']}
    # ...    ${Booking_S042['parcel_size']}
    # ...    ${Booking_S042['price_value']}
    # ...    ${Booking_S042['verify_buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking.text_default['discount_amount']}
    # ...    ${Booking.text_default['discount_value']}
    # ...    ${Booking_S042['insurance_fee_amount']}
    # ...    ${Booking_S042['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S042['total_price_amount']}
    # ...    ${Booking_S042.not_use_code['total_price_value']}
    # ...    ${Booking.origin_shipping['15888_store_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Summary After Edit Coupon And Code
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Detail Page After Coupon And Code

    Log    Step No.19 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    b2c_booking_detail_page.Verify Parcel Label
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking.label['text_postcode']}
    ...    ${Booking_S042['receiver_postcode_5_digits']}
    ...    ${Booking_S042['parcel_package_type']}
    ...    ${Booking_S042['parcel_size']}
    ...    ${Booking_S042['sender_name']}
    ...    ${Booking_S042['sender_phone']}
    ...    ${Booking_S042['sender_address']}
    ...    ${Booking_S042['sender_postcode_full']}
    ...    ${Booking_S042['receiver_name']}
    ...    ${Booking_S042['receiver_phone']}
    ...    ${Booking_S042['receiver_address']}
    ...    ${Booking_S042['receiver_postcode_full']}
    ...    ${Booking.label['non_cod']}
    ...    ${Booking.label['parcel_buy_insure']}
    ...    ${Booking_S042['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Parcel Label
    
    Log    Step No.20 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Print Screen
