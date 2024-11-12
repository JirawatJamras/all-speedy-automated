*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome   #headlesschrome   #chrome
                  ...    AND    Set Folder Result with date
Test Teardown     Run Keywords    Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule    ${newDate}    ${Booking_S018.pickup_time['expected']}
                  ...    AND    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S043
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ควบคุมอุณหภูมิ) - เเก้ไขรายการ
    [Tags]    Booking    UAT    Fail
    Log    Prerequisite S018
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Get The Highest Displayed Date And Set New Highest Date
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Click Parcel Type Dropdown
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown    ${Booking_S018['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Date Button
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${Booking_S018.pickup_time['input']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    b2c_booking_detail_page.Wait Until Loading Icon Success

    Log    Prerequisite S020
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
    ${booking_time}    Get Booking Time
    ${booking_name}    Get Booking Name
    ${parcel_id}    Get Parcel ID
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
    ${booking_time}    Get Booking Time
    sleep    1s
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    sleep    1s
    b2c_booking_detail_page.Click Edit Booking List
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S020['shipping_origin']}
    b2c_booking_detail_page.Select Booked Pickup Time From List    ${newDate}
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    Reload Page
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    ${booking_time}    Get Booking Time
    sleep    2s

    Step Test:    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    sleep    2s
    Reload Page
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    # Defect047
    # b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    # ...    ${booking_id}
    # ...    ${booking_time}
    # ...    ${Booking['text_parcel_status_call_car']}
    # ...    ${Booking_S020['booking_name']}
    # ...    ${Booking_S020['booking_item']}
    # ...    ${Booking_S020['price_value']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Created Booking On Booking Delivery Page

    Step Test:    Step No.2 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Waiting For Entering Parcel To System    ${booking_id}
    # Defect048    Defect072
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S020['sender_name']}
    # ...    ${Booking_S020['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S020['receiver_name']}
    # ...    ${Booking_S020['receiver_phone']}
    # ...    ${Booking_S020['receiver_address']}
    # ...    ${Booking_S020['receiver_postcode_full']}
    # ...    ${Booking_S020['parcel_size']}
    # ...    ${Booking_S020['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S043['discount_amount']}
    # ...    ${Booking_S043['discount_value']}
    # ...    ${Booking_S043['insurance_fee_amount']}
    # ...    ${Booking_S043['insurance_fee_value']}
    # ...    ${Booking_S043['cod_fee_amount']}
    # ...    ${Booking_S043['cod_fee_value']}
    # ...    ${Booking_S043['total_price_amount']}
    # ...    ${Booking_S043['total_price_value2']}
    # ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Booking Detail Page

    Step Test:    Step No.3 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
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
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Data Sender

    Step Test:    Step No.4 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Sender
    b2c_booking_delivery_page.Verify Data Sender
    ...    ${Booking_S020['sender_phone']}
    ...    ${Booking_S020['sender_name']}
    ...    ${Booking_S020['sender_address']}
    ...    ${Booking_S020['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Can Edit Data Sender

    Step Test:    Step No.5 แก้ไข ข้อมูลผู้ส่งพัสดุ
    sleep    1s
    b2c_booking_detail_page.Edit Phone Sender    ${Booking_S043['sender_phone']}
    # Defect119
    b2c_booking_detail_page.Edit Name Sender    ${Booking_S043['sender_name']}    
    b2c_booking_detail_page.Edit Address Sender    ${Booking_S043['sender_address']}
    b2c_booking_detail_page.Edit Postcode Sender    ${Booking_S043['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S043['sender_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Sender
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Edit Data Sender

    Step Test:    Step No.6 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Defect048
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S043['sender_name']}
    # ...    ${Booking_S043['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S020['receiver_name']}
    # ...    ${Booking_S020['receiver_phone']}
    # ...    ${Booking_S020['receiver_address']}
    # ...    ${Booking_S020['receiver_postcode_full']}
    # ...    ${Booking_S020['parcel_size']}
    # ...    ${Booking_S020['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S043['discount_amount']}
    # ...    ${Booking_S043['discount_value']}
    # ...    ${Booking_S043['insurance_fee_amount']}
    # ...    ${Booking_S043['insurance_fee_value']}
    # ...    ${Booking_S043['cod_fee_amount']}
    # ...    ${Booking_S043['cod_fee_value']}
    # ...    ${Booking_S043['total_price_amount']}
    # ...    ${Booking_S043['total_price_value2']}
    # ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Booking Summary After Edit Sender Data
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Booking Detail Page After Edit Sender Data

    Step Test:    Step No.7 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Parcel List With Waiting For Entering Parcel To System Status
    # Defect119
    # Expected
    # b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    # ...    ${Booking['text_title']}
    # ...    ${Booking['text_parcel_sender_information']}
    # ...    ${Booking['text_phone_sender']}
    # ...    ${Booking['text_name_sender']}
    # ...    ${Booking['text_address_sender']}
    # ...    ${Booking['text_postcode_sender']}
    # b2c_booking_delivery_page.Verify Data Sender
    # ...    ${Booking_S043['sender_phone']}
    # ...    ${Booking_S043['sender_name']}
    # ...    ${Booking_S043['sender_address']}
    # ...    ${Booking_S043['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Data Sender After Edit Sender Data

    Step Test:    Step No.8 กดปุ่ม "ถัดไป"
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
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Data Receiver

    Step Test:    Step No.9 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Expected
    b2c_booking_detail_page.Verify Can Edit Data Receiver
    b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    ...    ${Booking_S020['receiver_phone']}
    ...    ${Booking_S020['receiver_name']}
    ...    ${Booking_S020['receiver_address']}
    ...    ${Booking_S020['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Can Edit Data Receiver

    Step Test:    Step No.10 เเก้ไข ข้อมูลผู้รับพัสดุ
    b2c_booking_detail_page.Edit Phone Receiver    ${Booking_S043['receiver_phone']}
    b2c_booking_detail_page.Edit Name Receiver    ${Booking_S043['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_detail_page.Edit Addres s Receiver    ${Booking_S043['receiver_address']}
    b2c_booking_detail_page.Edit Postcode Receiver    ${Booking_S043['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S043['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Edit Data Receiver

    Step Test:    Step No.11 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Defect048    Defect119
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S020['sender_name']}
    # ...    ${Booking_S020['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S020['receiver_name']}
    # ...    ${Booking_S020['receiver_phone']}
    # ...    ${Booking_S020['receiver_address']}
    # ...    ${Booking_S020['receiver_postcode_full']}
    # ...    ${Booking_S020['parcel_size']}
    # ...    ${Booking_S020['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking.text_default['discount_amount']}
    # ...    ${Booking.text_default['discount_value']}    
    # ...    ${Booking_S043['insurance_fee_amount']}
    # ...    ${Booking_S043['insurance_fee_value']}
    # ...    ${Booking_S043['cod_fee_amount']}
    # ...    ${Booking_S043['cod_fee_value']}
    # ...    ${Booking_S043['total_price_amount']}
    # ...    ${Booking_S043['total_price_value2']}
    # ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Booking Summary After Edit Data Receiver
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Booking Detail Page After Edit Data Receiver

    Step Test:    Step No.12 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Parcel List With Waiting For Entering Parcel To System Status
    # Defect119
    # Expected
    # b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    # ...    ${Booking['text_title']}
    # ...    ${Booking['text_parcel_sender_information']}
    # ...    ${Booking['text_phone_sender']}
    # ...    ${Booking['text_name_sender']}
    # ...    ${Booking['text_address_sender']}
    # ...    ${Booking['text_postcode_sender']}
    # b2c_booking_delivery_page.Verify Data Sender
    # ...    ${Booking_S043['sender_phone']}
    # ...    ${Booking_S043['sender_name']}
    # ...    ${Booking_S043['sender_address']}
    # ...    ${Booking_S043['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Data Sender After Edit Receiver Data

    Step Test:    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Defect119
    # Expected
    # b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select Home   
    # ...    ${Booking['text_title']}
    # ...    ${Booking['text_parcel_receiver_information']}
    # ...    ${Booking['text_phone_receiver']}
    # ...    ${Booking['text_name_receiver']}
    # ...    ${Booking['text_location_receiver']}
    # ...    ${Booking['text_address_receiver']}
    # ...    ${Booking['text_postcode_receiver']}
    # b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    # ...    ${Booking_S043['receiver_phone']}
    # ...    ${Booking_S043['receiver_name']}
    # ...    ${Booking_S043['receiver_address']}
    # ...    ${Booking_S043['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Data Receiver After Edit Receiver Data

    Step Test:    Step No.14 กดปุ่ม "ถัดไป"
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
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Parcel Detail

    Step Test:    Step No.15 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Defect083
    # Expected
    # b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    # ...    ${EMPTY}
    # ...    ${Booking_S020['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Can Edit Parcel Detail

    Step Test:    Step No.16 เเก้ไข ข้อมูลพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S043['parcel_size']}
    b2c_booking_detail_page.Edit Parcel Remark    ${Booking_S043['parcel_detail_remark']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Edit Data Parcel Detail

    Step Test:    Step No.17 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Defect048    Defect119
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S020['sender_name']}
    # ...    ${Booking_S020['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S020['receiver_name']}
    # ...    ${Booking_S020['receiver_phone']}
    # ...    ${Booking_S020['receiver_address']}
    # ...    ${Booking_S020['receiver_postcode_full']}
    # ...    ${Booking_S020['parcel_size']}
    # ...    ${Booking_S020['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking.text_default['discount_amount']}
    # ...    ${Booking.text_default['discount_value']}
    # ...    ${Booking_S043['insurance_fee_amount']}
    # ...    ${Booking_S043['insurance_fee_value']}
    # ...    ${Booking_S043['cod_fee_amount']}
    # ...    ${Booking_S043['cod_fee_value']}
    # ...    ${Booking_S043['total_price_amount']}
    # ...    ${Booking_S043['total_price_value']}
    # ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Summary After Edit Data Parcel
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Detail Page After Edit Data Parcel

    Step Test:    Step No.18 กดที่รายการพัสดุที่มีสถานะ "รอพัสดุเข้าระบบ"
    b2c_booking_detail_page.Click Parcel List With Waiting For Entering Parcel To System Status
    # Expected
    # Defect119
    # b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    # ...    ${Booking['text_title']}
    # ...    ${Booking['text_parcel_sender_information']}
    # ...    ${Booking['text_phone_sender']}
    # ...    ${Booking['text_name_sender']}
    # ...    ${Booking['text_address_sender']}
    # ...    ${Booking['text_postcode_sender']}
    # b2c_booking_delivery_page.Verify Data Sender
    # ...    ${Booking_S043['sender_phone']}
    # ...    ${Booking_S043['sender_name']}
    # ...    ${Booking_S043['sender_address']}
    # ...    ${Booking_S043['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Data Sender After Edit Data Parcel

    Step Test:    Step No.19 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    # Defect119
    # b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select Home   
    # ...    ${Booking['text_title']}
    # ...    ${Booking['text_parcel_receiver_information']}
    # ...    ${Booking['text_phone_receiver']}
    # ...    ${Booking['text_name_receiver']}
    # ...    ${Booking['text_location_receiver']}
    # ...    ${Booking['text_address_receiver']}
    # ...    ${Booking['text_postcode_receiver']}
    # b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    # ...    ${Booking_S043['receiver_phone']}
    # ...    ${Booking_S043['receiver_name']}
    # ...    ${Booking_S043['receiver_address']}
    # ...    ${Booking_S043['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Data Receiver After Edit Data Parcel

    Step Test:    Step No.20 กดปุ่ม "ถัดไป"
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
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Parcel Detail After Edit Data Parcel

    Step Test:    Step No.21 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Defect050
    # Expected
    # b2c_booking_delivery_page.Verify Selected Coupon And Code
    # ...    ${Booking_S020.promotion_detail['discount']}
    # ...    ${Booking_S020.promotion_detail['promotion_name']}
    # ...    ${Booking_S020.promotion_detail['parcel_size']}
    # ...    ${Booking_S020.promotion_detail['expired_date']}
    # ...    ${Booking_S020.promotion_detail['condition']}
    # ...    ${Booking_S020.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S042     Verify Selected Coupon And Code

    Step Test:    Step No.22 กดปุ่ม "เเก้ไข"
    b2c_booking_detail_page.Click Edit Data
    # Defect050
    # Expected
    # b2c_booking_delivery_page.Verify Selected Coupon And Code
    # ...    ${Booking_S003.promotion_detail['discount']}
    # ...    ${Booking_S003.promotion_detail['promotion_name']}
    # ...    ${Booking_S003.promotion_detail['parcel_size']}
    # ...    ${Booking_S003.promotion_detail['expired_date']}
    # ...    ${Booking_S003.promotion_detail['condition']}
    # ...    ${Booking_S003.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Can Edit Selected Coupon And Code

    Step Test:    Step No.23 กดปุ่ม "นำออก" ที่รายการคูปองและโค้ดส่วนลดที่เลือก
    # Defect050
    # b2c_booking_delivery_page.Click Take Out Coupon
    # Expected
    b2c_booking_delivery_page.Verify Not Select Coupon And Code
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Take Out Coupon

    Step Test:    Step No.24 กดปุ่ม "บันทึกเเก้ไข"
    b2c_booking_detail_page.Click Save Edit Data
    Reload Page
    ${booking_time}    Get Booking Time
    # Defect119
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S020['sender_name']}
    # ...    ${Booking_S020['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S020['receiver_name']}
    # ...    ${Booking_S020['receiver_phone']}
    # ...    ${Booking_S020['receiver_address']}
    # ...    ${Booking_S020['receiver_postcode_full']}
    # ...    ${Booking_S020['parcel_size']}
    # ...    ${Booking_S020['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking.text_default['discount_amount']}
    # ...    ${Booking.text_default['discount_value']}
    # ...    ${Booking_S043['insurance_fee_amount']}
    # ...    ${Booking_S043['insurance_fee_value']}
    # ...    ${Booking_S043['cod_fee_amount']}
    # ...    ${Booking_S043['cod_fee_value']}
    # ...    ${Booking_S043['total_price_amount']}
    # ...    ${Booking_S043['total_price_value3']}
    # ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Summary After Edit Coupon And Code
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S042    Verify Booking Detail Page After Edit Coupon And Code

    Step Test:    Step No.25 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Defect119
    # Expected
    # b2c_booking_detail_page.Verify Parcel Label
    # ...    ${Booking.text_paper_size['size_a4']}
    # ...    ${Booking.text_paper_size['size_a5']}
    # ...    ${Booking.text_paper_size['size_8cm']}
    # ...    ${Booking.label['text_postcode']}
    # ...    ${Booking_S043['receiver_postcode_5_digits']}
    # ...    ${Booking_S043['parcel_package_type']}
    # ...    ${Booking_S043['parcel_size']}
    # ...    ${Booking_S043['sender_name']}
    # ...    ${Booking_S043['sender_phone']}
    # ...    ${Booking_S043['sender_address']}
    # ...    ${Booking_S043['sender_postcode_full']}
    # ...    ${Booking_S043['receiver_name']}
    # ...    ${Booking_S043['receiver_phone']}
    # ...    ${Booking_S043['receiver_address']}
    # ...    ${Booking_S043['receiver_postcode_full']}
    # ...    ${Booking.label['non_cod']}
    # ...    ${Booking.label['parcel_not_buy_insure']}
    # ...    ${Booking_S043['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Parcel Label

    Step Test:    Step No.26 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S043    Verify Print Screen
