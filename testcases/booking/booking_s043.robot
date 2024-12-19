*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome   #headlesschrome   #chrome
                  ...    AND    Set Folder Result With Date
                  ...    AND    dps_home_page.Reset Cut Off Time    17:00
Test Teardown     Run Keywords    Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule    ${tomorrow}    ${Booking_S018.pickup_time['expected']}
                  ...    AND    Close Browser
                  ...    AND    common.Delete API Booking By Booking ID    ${booking_id}

*** Keywords ***
Booking_S018
    Set Suite Variable    ${card_is_visible}    False
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Click Add Button
    Set Tomorrow Date
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${Booking_S018['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${Booking_S018.pickup_time['input']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    b2c_booking_detail_page.Wait Until Loading Icon Success

Booking_S020
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S020['parcel_type']}
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S020['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S020['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S020['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S020['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S020['sender_postcode_full']}
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S020['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S020['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S020['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S020['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S020['receiver_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    b2c_booking_delivery_page.Click Save Button
    ${booking_id}    Get Booking ID
    Set Suite Variable    ${booking_id}
    b2c_booking_detail_page.Select Draft Booking
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S020['parcel_size']}
    b2c_booking_delivery_page.Input Parcel Remark    ${Booking_S020['parcel_detail_remark']}
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Input Promotion    ${Booking_S020['promotion']}
    b2c_booking_delivery_page.Click Use Code Button
    b2c_booking_delivery_page.Click Parcel Booking Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S020['shipping_origin']}
    Set Today
    Set Tomorrow Date
    b2c_booking_detail_page.Select Booked Pickup Time From List
    ...    ${Booking.pickup_schedule['special_car_pickup']}
    ...    ${tomorrow}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${today}
    ...    ${call_car_pick_up.default['price']}
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    Reload Page
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    ${booking_time}    Get Booking Time
    Set Suite Variable    ${booking_time}

*** Test Cases ***
Booking_S043
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ควบคุมอุณหภูมิ) - เเก้ไขรายการ
    [Tags]    Booking    Business_To_Customer    Regression    Defect047    Defect050    Defect072    Defect075    Defect083    Defect119    Defect126    Defect258
    Log    Login
    b2c_login_page.Input Email And Password    ${b2c_login_user_01['username']}    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Prerequisite S018
    Booking_S018

    Log    Prerequisite S020
    Booking_S020

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    Log Defect No:  Defect047,Defect258
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${booking_time}
    ...    ${Booking['text_parcel_status_call_car']}
    ...    ${Booking_S020['booking_name']}
    ...    ${Booking_S020['booking_item']}
    ...    ${Booking_S043.old['total_price_value']}
    common.Verify Capture Screenshot    booking    Booking_S043    1.Verify Created Booking On Booking Delivery Page

    Log    Step No.2 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Waiting For Entering Parcel To System    ${booking_id}
    # Expected
    Log Defect No:  Defect075,Defect126,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S020['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_not_favorite['img_sender_heart']}
    ...    ${Booking_S020['sender_name']}
    ...    ${Booking_S020['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S020['receiver_name']}
    ...    ${Booking_S020['receiver_phone']}
    ...    ${Booking_S020['receiver_address']}
    ...    ${Booking_S020['receiver_postcode_full']}
    ...    ${Booking_S020['parcel_size']}
    ...    ${Booking_S020['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S020['discount_amount']}
    ...    ${Booking_S020['discount_value2']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S020['total_price_amount']}
    ...    ${Booking_S020['total_price_value2']}
    ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S043    2.1.Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S043    2.2.Verify Booking Detail Page

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
    ...    ${Booking_S020['sender_phone']}
    ...    ${Booking_S020['sender_name']}
    ...    ${Booking_S020['sender_address']}
    ...    ${Booking_S020['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    3.Verify Data Sender

    Log    Step No.4 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Sender
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S020['sender_phone']}
    ...    ${Booking_S020['sender_name']}
    ...    ${Booking_S020['sender_address']}
    ...    ${Booking_S020['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    4.Verify Can Edit Data Sender

    Log    Step No.5 แก้ไข ข้อมูลผู้ส่งพัสดุ
    sleep    1s
    b2c_booking_detail_page.Edit Phone Sender    ${Booking_S043['sender_phone']}
    b2c_booking_detail_page.Edit Name Sender    ${Booking_S043['sender_name']}    
    b2c_booking_detail_page.Edit Address Sender    ${Booking_S043['sender_address']}
    b2c_booking_detail_page.Edit Postcode Sender    ${Booking_S043['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S043['sender_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Sender
    # Expected
    Log Defect No:  Defect119
    common.Verify Capture Screenshot    booking    Booking_S043    5.Verify Edit Data Sender

    Log    Step No.6 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect075,Defect119,Defect126,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S020['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S020['receiver_name']}
    ...    ${Booking_S020['receiver_phone']}
    ...    ${Booking_S020['receiver_address']}
    ...    ${Booking_S020['receiver_postcode_full']}
    ...    ${Booking_S020['parcel_size']}
    ...    ${Booking_S020['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S020['discount_amount']}
    ...    ${Booking_S020['discount_value2']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S020['total_price_amount']}
    ...    ${Booking_S020['total_price_value2']}
    ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S043    6.1.Verify Booking Summary After Edit Sender Data
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S043    6.2.Verify Booking Detail Page After Edit Sender Data

    Log    Step No.7 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
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
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_address']}
    ...    ${Booking_S043['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    7.Verify Data Sender After Edit Sender Data

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
    ...    ${Booking_S020['receiver_phone']}
    ...    ${Booking_S020['receiver_name']}
    ...    ${Booking_S020['receiver_address']}
    ...    ${Booking_S020['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    8.Verify Data Receiver

    Log    Step No.9 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Receiver
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${Booking_S020['receiver_phone']}
    ...    ${Booking_S020['receiver_name']}
    ...    ${Booking_S020['receiver_address']}
    ...    ${Booking_S020['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    9.Verify Can Edit Data Receiver

    Log    Step No.10 เเก้ไข ข้อมูลผู้รับพัสดุ
    b2c_booking_detail_page.Edit Phone Receiver    ${Booking_S043['receiver_phone']}
    b2c_booking_detail_page.Edit Name Receiver    ${Booking_S043['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_detail_page.Edit Addres s Receiver    ${Booking_S043['receiver_address']}
    b2c_booking_detail_page.Edit Postcode Receiver    ${Booking_S043['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S043['receiver_postcode_full']}
    # Expected
    Log Defect No:  Defect119
    common.Verify Capture Screenshot    booking    Booking_S043    10.Verify Edit Data Receiver

    Log    Step No.11 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect075,Defect119,Defect126,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S020['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking_S043['receiver_name']}
    ...    ${Booking_S043['receiver_phone']}
    ...    ${Booking_S043['receiver_address']}
    ...    ${Booking_S043['receiver_postcode_full']}
    ...    ${Booking_S020['parcel_size']}
    ...    ${Booking_S020['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S020['discount_amount']}
    ...    ${Booking_S020['discount_value2']}    
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S020['total_price_amount']}
    ...    ${Booking_S020['total_price_value2']}
    ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S043    11.1.Verify Booking Summary After Edit Data Receiver
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S043    11.2.Verify Booking Detail Page After Edit Data Receiver

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
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_address']}
    ...    ${Booking_S043['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    12.Verify Data Sender After Edit Receiver Data

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
    ...    ${Booking_S043['receiver_phone']}
    ...    ${Booking_S043['receiver_name']}
    ...    ${Booking_S043['receiver_address']}
    ...    ${Booking_S043['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    13.Verify Data Receiver After Edit Receiver Data

    Log    Step No.14 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    b2c_booking_delivery_page.Verify Parcel Detail Page of Create Parcel [Chilled Parcel]
    ...    ${Booking.chilled_parcel['parcel_detail_S0']}
    ...    ${Booking.chilled_parcel['parcel_detail_S1']}
    ...    ${Booking.chilled_parcel['parcel_detail_S2']}
    ...    ${Booking.chilled_parcel['parcel_detail_A1']}
    ...    ${Booking.chilled_parcel['parcel_detail_A2']}
    ...    ${Booking['parcel_detail_insure_amount']}
    ...    ${Booking['parcel_detail_cod']}
    ...    ${Booking['parcel_detail_remark']}
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    ...    ${EMPTY}
    ...    ${Booking_S020['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S043    14.Verify Parcel Detail

    Log    Step No.15 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    Log Defect No:  Defect083
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    ...    ${EMPTY}
    ...    ${Booking_S020['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S043    15.Verify Can Edit Parcel Detail

    Log    Step No.16 เเก้ไข ข้อมูลพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S043['parcel_size']}
    b2c_booking_detail_page.Edit Parcel Remark    ${Booking_S043['parcel_detail_remark']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S043    16.Verify Edit Data Parcel Detail

    Log    Step No.17 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect075,Defect119,Defect126,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S020['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking_S043['receiver_name']}
    ...    ${Booking_S043['receiver_phone']}
    ...    ${Booking_S043['receiver_address']}
    ...    ${Booking_S043['receiver_postcode_full']}
    ...    ${Booking_S043['parcel_size']}
    ...    ${Booking_S043['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S020['discount_amount']}
    ...    ${Booking_S020['discount_value2']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S020['total_price_amount']}
    ...    ${Booking_S043['total_price_value2']}
    ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    17.1.Verify Booking Summary After Edit Data Parcel
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    17.2.Verify Booking Detail Page After Edit Data Parcel

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
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_address']}
    ...    ${Booking_S043['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    18.Verify Data Sender After Edit Data Parcel

    Log    Step No.19 กดปุ่ม "ถัดไป"
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
    ...    ${Booking_S043['receiver_phone']}
    ...    ${Booking_S043['receiver_name']}
    ...    ${Booking_S043['receiver_address']}
    ...    ${Booking_S043['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    19.Verify Data Receiver After Edit Data Parcel

    Log    Step No.20 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    b2c_booking_delivery_page.Verify Parcel Detail Page of Create Parcel [Chilled Parcel]
    ...    ${Booking.chilled_parcel['parcel_detail_S0']}
    ...    ${Booking.chilled_parcel['parcel_detail_S1']}
    ...    ${Booking.chilled_parcel['parcel_detail_S2']}
    ...    ${Booking.chilled_parcel['parcel_detail_A1']}
    ...    ${Booking.chilled_parcel['parcel_detail_A2']}
    ...    ${Booking['parcel_detail_insure_amount']}
    ...    ${Booking['parcel_detail_cod']}
    ...    ${Booking['parcel_detail_remark']}
    b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    ...    ${EMPTY}
    ...    ${Booking_S043['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S043    20.Verify Parcel Detail After Edit Data Parcel

    Log    Step No.21 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    Log Defect No:  Defect050
    b2c_booking_delivery_page.Verify Selected Coupon And Code
    ...    ${Booking_S020.promotion_detail['discount']}
    ...    ${Booking_S020.promotion_detail['promotion_name']}
    ...    ${Booking_S020.promotion_detail['parcel_size']}
    ...    ${Booking_S020.promotion_detail['expired_date']}
    ...    ${Booking_S020.promotion_detail['condition']}
    ...    ${Booking_S020.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S042     21.Verify Selected Coupon And Code

    Log    Step No.22 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    Log Defect No:  Defect050
    b2c_booking_delivery_page.Verify Can Edit Selected Coupon And Code
    b2c_booking_delivery_page.Verify Selected Coupon And Code
    ...    ${Booking_S020.promotion_detail['discount']}
    ...    ${Booking_S020.promotion_detail['promotion_name']}
    ...    ${Booking_S020.promotion_detail['parcel_size']}
    ...    ${Booking_S020.promotion_detail['expired_date']}
    ...    ${Booking_S020.promotion_detail['condition']}
    ...    ${Booking_S020.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S042    22.Verify Can Edit Selected Coupon And Code

    Log    Step No.23 กดปุ่ม "นำออก" ที่รายการคูปองและโค้ดส่วนลดที่เลือก
    b2c_booking_delivery_page.Click Take Out Coupon
    # Expected
    Log Defect No:  Defect050
    b2c_booking_delivery_page.Verify Not Select Coupon And Code
    common.Verify Capture Screenshot    booking    Booking_S042    23.Verify Take Out Coupon

    Log    Step No.24 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect119,Defect126,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S020['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking_S043['receiver_name']}
    ...    ${Booking_S043['receiver_phone']}
    ...    ${Booking_S043['receiver_address']}
    ...    ${Booking_S043['receiver_postcode_full']}
    ...    ${Booking_S043['parcel_size']}
    ...    ${Booking_S043['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S020['total_price_amount']}
    ...    ${Booking_S043.not_use_code['total_price_value']}
    ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    24.1.Verify Booking Summary After Edit Coupon And Code
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    24.2.Verify Booking Detail Page After Edit Coupon And Code

    Log    Step No.25 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    Log Defect No:  Defect119
    b2c_booking_detail_page.Verify Parcel Label
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking.label['text_postcode']}
    ...    ${Booking_S043['receiver_postcode_5_digits']}
    ...    ${Booking_S043['parcel_package_type']}
    ...    ${Booking_S043['parcel_size']}
    ...    ${Booking_S043['sender_name']}
    ...    ${Booking_S043['sender_phone']}
    ...    ${Booking_S043['sender_address']}
    ...    ${Booking_S043['sender_postcode_full']}
    ...    ${Booking_S043['receiver_name']}
    ...    ${Booking_S043['receiver_phone']}
    ...    ${Booking_S043['receiver_address']}
    ...    ${Booking_S043['receiver_postcode_full']}
    ...    ${Booking.label['non_cod']}
    ...    ${Booking.label['parcel_not_buy_insure']}
    ...    ${Booking_S043['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S043    25.Verify Parcel Label

    Log    Step No.26 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    Set Global Variable    ${card_is_visible}    True
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S043    26.Verify Print Screen