*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Keywords ***
Booking_S031
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S031['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S031['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S031['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S031['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S031['sender_postcode_full']}
    b2c_booking_delivery_page.Click Save Button
    ${booking_id}    Get Booking ID
    Set Suite Variable    ${booking_id}
    b2c_booking_detail_page.Select Draft Booking
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S031['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S031['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S031['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S031['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S031['receiver_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S031['parcel_size']}
    b2c_booking_delivery_page.Input Parcel Remark    ${Booking_S031['parcel_detail_remark']}
    b2c_booking_delivery_page.Click Next Button 
    b2c_booking_delivery_page.Input Promotion    ${Booking_S031['promotion']}
    b2c_booking_delivery_page.Click Use Code Button
    b2c_booking_delivery_page.Click Parcel Booking Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S031['shipping_origin']}
    b2c_booking_detail_page.Search Shipping Store    ${Booking_S031['store_code']}
    b2c_booking_detail_page.Click Select Store On Map
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    ${booking_time}    Get Booking Time
    Set Suite Variable    ${booking_time}

*** Test Cases ***
Booking_S054 
    [Documentation]    ลูกค้า All Member - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (ไม่เพิ่มเป็นรายการโปรด)(บันทึกร่าง) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก A3 (ไม่มีประกัน เเละใส่หมายเหตุ) - Promotion (มี)
    [Tags]    Booking    Customer_To_Customer    UAT    Defect050    Defect054    Defect055    Defect075    Defect078    Defect084    Defect101    Defect117    
    ...    Defect119    Defect133
    Log    Login
    common.Open URL    ${C2C_URL}
    c2c_landing_page.Click Log In Button In Landing Page
    c2c_login.Input Email    ${c2c_login_user_01['username']}
    c2c_login.Input Password    ${c2c_login_user_01['password']}
    c2c_login.Click Log On Button
    c2c_landing_page.Click Menu Seven Store
    c2c_landing_page.Click Menu Shipping

    Log    Prerequisite S031
    Booking_S031

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    Log Defect No:  Defect084,Defect117
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${booking_time}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking_S031['booking_name']}
    ...    ${Booking_S031['booking_item']}
    ...    ${Booking_S054.old['total_price_value']}
    common.Verify Capture Screenshot    booking    Booking_S054    1.Verify Created Booking On Booking Delivery Page

    Log    Step No.2 กดรายการบุ๊คกิ้งที่มีสถานะ "รอส่งพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Booking With Waiting For Entering Parcel To System    ${booking_id}
    # Expected
    Log Defect No:  Defect054,Defect075,Defect078,Defect084,Defect101
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    ...    ${Booking_S031['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_not_favorite['img_sender_heart']}
    ...    ${Booking_S031['sender_name']}
    ...    ${Booking_S031['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    ...    ${Booking_S031['parcel_size']}
    ...    ${Booking_S031['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S031['discount_amount']}
    ...    ${Booking_S031['discount_value2']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S031['total_price_amount']}
    ...    ${Booking_S031['total_price_value2']}
    ...    ${Booking.origin_shipping['15888_store_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S054    2.1.Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S054    2.2.Verify Booking Detail Page

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
    ...    ${Booking_S031['sender_phone']}
    ...    ${Booking_S031['sender_name']}
    ...    ${Booking_S031['sender_address']}
    ...    ${Booking_S031['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    3.Verify Data Sender

    Log    Step No.4 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Sender
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S031['sender_phone']}
    ...    ${Booking_S031['sender_name']}
    ...    ${Booking_S031['sender_address']}
    ...    ${Booking_S031['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    4.Verify Can Edit Data Sender

    Log    Step No.5 เเก้ไข ข้อมูลผู้ส่งพัสดุ
    b2c_booking_detail_page.Edit Phone Sender    ${Booking_S054['sender_phone']}
    b2c_booking_detail_page.Edit Name Sender    ${Booking_S054['sender_name']}    
    b2c_booking_detail_page.Edit Address Sender    ${Booking_S054['sender_address']}
    b2c_booking_detail_page.Edit Postcode Sender    ${Booking_S054['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S054['sender_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Sender
    # Expected
    Log Defect No:  Defect119
    common.Verify Capture Screenshot    booking    Booking_S054    5.Verify Edit Data Sender

    Log    Step No.6 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect075,Defect078,Defect084,Defect101,Defect119
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    ...    ${Booking_S031['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    ...    ${Booking_S031['parcel_size']}
    ...    ${Booking_S031['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S031['discount_amount']}
    ...    ${Booking_S031['discount_value2']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S031['total_price_amount']}
    ...    ${Booking_S031['total_price_value2']}
    ...    ${Booking.origin_shipping['15888_store_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S054    6.1.Verify Booking Summary After Edit Sender Data
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S054    6.2.Verify Booking Detail Page After Edit Sender Data

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
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_address']}
    ...    ${Booking_S054['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    7.Verify Data Sender After Edit Sender Data

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
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    8.Verify Data Receiver

    Log    Step No.9 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Receiver
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    9.Verify Can Edit Data Receiver

    Log    Step No.10 เเก้ไข ข้อมูลผู้รับพัสดุ
    b2c_booking_detail_page.Edit Phone Receiver    ${Booking_S054['receiver_phone']}
    b2c_booking_detail_page.Edit Name Receiver    ${Booking_S054['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_detail_page.Edit Addres s Receiver    ${Booking_S054['receiver_address']}
    b2c_booking_detail_page.Edit Postcode Receiver    ${Booking_S054['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S054['receiver_postcode_full']}
    # Expected
    Log Defect No:  Defect119
    common.Verify Capture Screenshot    booking    Booking_S054    10.Verify Edit Data Receiver

    Log    Step No.11 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect075,Defect078,Defect084,Defect101,Defect119
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    ...    ${Booking_S031['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking_S054['receiver_name']}
    ...    ${Booking_S054['receiver_phone']}
    ...    ${Booking_S054['receiver_address']}
    ...    ${Booking_S054['receiver_postcode_full']}
    ...    ${Booking_S031['parcel_size']}
    ...    ${Booking_S031['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S031['discount_amount']}
    ...    ${Booking_S031['discount_value2']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S031['total_price_amount']}
    ...    ${Booking_S031['total_price_value2']}
    ...    ${Booking.origin_shipping['15888_store_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S054    11.1.Verify Booking Summary After Edit Data Receiver
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S054    11.2.Verify Booking Detail Page After Edit Data Receiver

    Log    Step No.12 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Parcel List With Waiting For Entering Parcel To System Status
    # Expected
    Log Defect No:  Defect119
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_address']}
    ...    ${Booking_S054['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    12.Verify Data Sender After Edit Sender Data

    Log    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    Log Defect No:  Defect119
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select Home   
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    ...    ${Booking['text_postcode_receiver']}
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${Booking_S054['receiver_phone']}
    ...    ${Booking_S054['receiver_name']}
    ...    ${Booking_S054['receiver_address']}
    ...    ${Booking_S054['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    13.Verify Data Receiver After Edit Sender Data

    Log    Step No.14 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    Log Defect No:  Defect055
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
    ...    ${Booking_S031['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S054    14.Verify Parcel Detail

    Log    Step No.15 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    Log Defect No:  Defect055,Defect133
    b2c_booking_detail_page.Verify Can Edit Data Parcel
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Dry Parcel]
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${Booking_S031['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S054    15.Verify Can Edit Data Receiver

    Log    Step No.16 เเก้ไข ข้อมูลพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S054['parcel_size']}
    b2c_booking_detail_page.Edit Insurance    ${Booking_S054['buy_insurance']}
    b2c_booking_detail_page.Edit Parcel Remark    ${Booking_S054['parcel_detail_remark']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S054    16.Verify Edit Data Parcel

    Log    Step No.17 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect075,Defect078,Defect084,Defect101,Defect119
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    ...    ${Booking_S031['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking_S054['receiver_name']}
    ...    ${Booking_S054['receiver_phone']}
    ...    ${Booking_S054['receiver_address']}
    ...    ${Booking_S054['receiver_postcode_full']}
    ...    ${Booking_S054['parcel_size']}
    ...    ${Booking_S054['price_value']}
    ...    ${Booking_S054['verify_buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S031['discount_amount']}
    ...    ${Booking_S031['discount_value2']}
    ...    ${Booking_S054['insurance_fee_amount']}
    ...    ${Booking_S054['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S054['total_price_amount']}
    ...    ${Booking_S054['total_price_value']}
    ...    ${Booking.origin_shipping['15888_store_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S054    17.1.Verify Booking Summary After Edit Data Parcel
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S054    17.2.Verify Booking Detail Page After Edit Data Parcel

    Log    Step No.18 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Parcel List With Waiting For Entering Parcel To System Status
    # Expected
    Log Defect No:  Defect119
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_address']}
    ...    ${Booking_S054['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    18.Verify Data Sender After Edit Sender Data

    Log    Step No.19 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    Log Defect No:  Defect119
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select Home   
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    ...    ${Booking['text_postcode_receiver']}
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${Booking_S054['receiver_phone']}
    ...    ${Booking_S054['receiver_name']}
    ...    ${Booking_S054['receiver_address']}
    ...    ${Booking_S054['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S054    19.Verify Data Receiver After Edit Sender Data

    Log    Step No.20 กดปุ่ม "ถัดไป"
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
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Dry Parcel]
    ...    ${Booking_S054['buy_insurance']}
    ...    ${EMPTY}
    ...    ${Booking_S054['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S054    20.Verify Parcel Detail After Edit Sender Data

    Log    Step No.21 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    Log Defect No:  Defect050
    b2c_booking_delivery_page.Verify Selected Coupon And Code
    ...    ${Booking_S031.promotion_detail['discount']}
    ...    ${Booking_S031.promotion_detail['promotion_name']}
    ...    ${Booking_S031.promotion_detail['parcel_size']}
    ...    ${Booking_S031.promotion_detail['expired_date']}
    ...    ${Booking_S031.promotion_detail['condition']}
    ...    ${Booking_S031.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S054     21.Verify Selected Coupon And Code

    Log    Step No.22 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    Log Defect No:  Defect050
    b2c_booking_delivery_page.Verify Can Edit Selected Coupon And Code
    b2c_booking_delivery_page.Verify Selected Coupon And Code
    ...    ${Booking_S031.promotion_detail['discount']}
    ...    ${Booking_S031.promotion_detail['promotion_name']}
    ...    ${Booking_S031.promotion_detail['parcel_size']}
    ...    ${Booking_S031.promotion_detail['expired_date']}
    ...    ${Booking_S031.promotion_detail['condition']}
    ...    ${Booking_S031.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S054    22.Verify Can Edit Selected Coupon And Code

    Log    Step No.23 กดปุ่ม "นำออก" ที่รายการคูปองและโค้ดส่วนลดที่เลือก
    b2c_booking_delivery_page.Click Take Out Coupon
    # Expected
    Log Defect No:  Defect0520
    b2c_booking_delivery_page.Verify Not Select Coupon And Code
    common.Verify Capture Screenshot    booking    Booking_S054    23.Verify Take Out Coupon

    Log    Step No.24 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect078,Defect084,Defect101,Defect119
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    ...    ${Booking_S031['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking_S054['receiver_name']}
    ...    ${Booking_S054['receiver_phone']}
    ...    ${Booking_S054['receiver_address']}
    ...    ${Booking_S054['receiver_postcode_full']}
    ...    ${Booking_S054['parcel_size']}
    ...    ${Booking_S054['price_value']}
    ...    ${Booking_S054['verify_buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking_S054['insurance_fee_amount']}
    ...    ${Booking_S054['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S054['total_price_amount']}
    ...    ${Booking_S054.not_use_code['total_price_value']}
    ...    ${Booking.origin_shipping['15888_store_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S054    24.1.Verify Booking Summary After Edit Coupon And Code
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S054    24.2.Verify Booking Detail Page After Coupon And Code

    Log    Step No.25 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    Log Defect No:  Defect119
    b2c_booking_detail_page.Verify Parcel Label
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking.label['text_postcode']}
    ...    ${Booking_S054['receiver_postcode_5_digits']}
    ...    ${Booking_S054['parcel_package_type']}
    ...    ${Booking_S054['parcel_size']}
    ...    ${Booking_S054['sender_name']}
    ...    ${Booking_S054['sender_phone']}
    ...    ${Booking_S054['sender_address']}
    ...    ${Booking_S054['sender_postcode_full']}
    ...    ${Booking_S054['receiver_name']}
    ...    ${Booking_S054['receiver_phone']}
    ...    ${Booking_S054['receiver_address']}
    ...    ${Booking_S054['receiver_postcode_full']}
    ...    ${Booking.label['non_cod']}
    ...    ${Booking.label['parcel_buy_insure']}
    ...    ${Booking_S054['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S054    25.Verify Parcel Label

    Log    Step No.26 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S054    26.Verify Print Screen