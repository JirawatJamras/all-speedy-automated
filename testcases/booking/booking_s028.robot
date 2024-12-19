*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND    Set Folder Result With Date
                  ...    AND    dps_home_page.Reset Cut Off Time    23:59
Test Teardown     Run Keywords    Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule    ${tomorrow}    ${Booking_S018.pickup_time['expected']}
                  ...    AND    Close Browser
                  ...    AND    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    dps_home_page.Reset Cut Off Time    17:00
                  
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

*** Test Cases ***
Booking_S028
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ควบคุมอุณหภูมิ) - ข้อมูลผู้ส่ง (เลือกจากรายการโปรด)(บันทึกร่าง) - ข้อมูลผู้รับพัสดุ (ส่งที่ร้าน 7-11 > เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก A2 (ไม่มีCOD เเละไม่ใส่หมายเหตุ) - Promotion (ไม่มี)
    [Tags]    Booking    Business_To_Customer    Regression    Unknown    Defect043    Defect045    Defect047    Defect048    Defect052    Defect063    Defect076    Defect077    
    ...    Defect083    Defect126    Defect258
    Log    Login
    b2c_login_page.Input Email And Password    ${b2c_login_user_01['username']}    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Prerequisite S018
    Booking_S018

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    booking    Booking_S028    1.Verify Booking Page For Business Customer

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    # Expected
    Log Defect No:  Defect043
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    booking    Booking_S028    2.Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    booking    Booking_S028    3.Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุควบคุมอุณหภูมิ"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S028['parcel_type']}
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    common.Verify Capture Screenshot    booking    Booking_S028    4.Verify Create Parcel Page Sender Step

    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Click Choose Favorites
    # Expected
    b2c_booking_delivery_page.Verify Favorites Sender PopUp    
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_address']}
    ...    ${Booking_S028['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S028    5.Verify Click Choose Favorites

    Log    Step No.6 กดเลือกรายการ 
    b2c_booking_delivery_page.Click Choose Favorites Sender List
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_address']}
    ...    ${Booking_S028['sender_postcode_full']}
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
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_address']}
    ...    ${Booking_S028['sender_postcode_full']}
    b2c_booking_delivery_page.Verify Favorites Icon Red Heart  
    common.Verify Capture Screenshot    booking    Booking_S028    6.Verify After Create Parcel Page Sender Step

   Log    Step No.7 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    # Expected
    Log Defect No:  Defect052
    b2c_booking_detail_page.Verify Booking Detail Page After Draft
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking.text_blank['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking.text_blank['receiver_name']}
    ...    ${Booking.text_blank['receiver_phone']}
    ...    ${Booking.text_blank['receiver_address']}
    ...    ${Booking.text_blank['receiver_postcode_full']}
    ...    ${Booking.text_blank['parcel_size']}
    ...    ${Booking.text_blank['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    common.Verify Capture Screenshot    booking    Booking_S028    7.Verify Draft Parcel Sender

    Log    Step No.8 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
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
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_address']}
    ...    ${Booking_S028['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S028    8.Verify Data Sender

    Log    Step No.9 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    # Expected
    Log Defect No:   New Defect : Defect293
    # b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select Home   
    # ...    ${Booking['text_title']}
    # ...    ${Booking['text_parcel_receiver_information']}
    # ...    ${Booking['text_phone_receiver']}
    # ...    ${Booking['text_name_receiver']}
    # ...    ${Booking['text_location_receiver']}
    # ...    ${Booking['text_address_receiver']}
    # ...    ${Booking['text_postcode_receiver']}
    # b2c_booking_delivery_page.Verify Data Receiver When Select Home  
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    common.Verify Capture Screenshot    booking    Booking_S028    9.Verify Create Parcel Page Receiver Step When Select Home

    Log    Step No.10 ขั้นตอนข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S028['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S028['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_store}
    b2c_booking_delivery_page.Input And Select Store Code Receiver    ${Booking_S028['receiver_store_code_5_digits']}    ${Booking_S028['receiver_store_address']}
    b2c_booking_delivery_page.Click Store On Map
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    # Expected
    b2c_booking_delivery_page.Verify Store Address Receiver    ${Booking_S028['receiver_store_full']}
    common.Verify Capture Screenshot    booking    Booking_S028    10.Verify Create Parcel Page After Input Receiver Step

    Log    Step No.11 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    Log Defect No:  Defect083
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
    ...    ${EMPTY}
    common.Verify Capture Screenshot    booking    Booking_S028    11.Verify Parcel Detail

    Log    Step No.12 ขั้นตอนรายละเอียดพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S028['parcel_size']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S028    12.Verify Create Parcel Page After Input Parcel Detail Step

    Log    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Expected
    Log Defect No:  Defect045
    b2c_booking_delivery_page.Verify Promotion Detail
    ...    ${Booking['text_selected_coupon_and_code']}
    ...    ${Booking['text_my_coupon_and_code']}
    common.Verify Capture Screenshot    booking    Booking_S028    13.Verify Promotion

    Log    Step No.14 ขั้นตอน Promotion
    b2c_booking_delivery_page.Click Parcel Booking Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    ${booking_time}    Get Booking Time
    # Expected
    Log Defect No:  Defect048,Defect063,Defect076,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S028['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S028['receiver_name']}
    ...    ${Booking_S028['receiver_phone']}
    ...    ${Booking_S028['receiver_store_address']}
    ...    ${Booking_S028['parcel_size']}
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
    ...    ${Booking_S028['total_price_amount']}
    ...    ${Booking_S028['total_price_value1']}
    ...    ${Booking.text_blank['origin_shipping']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S028    14.1.Verify Booking Summary After Booking Success
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S028    14.2.Verify Booking Detail Page After Booking Success

    Log    Step No.15 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    Log Defect No:  Defect047,Defect258
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${booking_time}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking_S028['booking_name']}
    ...    ${Booking_S028['booking_item']}
    ...    ${Booking.text_default['booking_price']}
    common.Verify Capture Screenshot    booking    Booking_S028    15.Verify Created Booking On Booking Delivery Page

    Log    Step No.16 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    # Expected
    Log Defect No:  Defect048,Defect063,Defect076,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S028['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S028['receiver_name']}
    ...    ${Booking_S028['receiver_phone']}
    ...    ${Booking_S028['receiver_store_address']}
    ...    ${Booking_S028['parcel_size']}
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
    ...    ${Booking_S028['total_price_amount']}
    ...    ${Booking_S028['total_price_value1']}
    ...    ${Booking.text_blank['origin_shipping']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S028    16.1.Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S028    16.2.Verify Booking Detail Page

    Log    Step No.17 กดปุ่ม "แก้ไขรายการบุ๊คกิ้ง"
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    Log Defect No:  Defect258
    b2c_booking_detail_page.Verify Edit Booking List Popup    
    ...    ${Booking_S028['parcel_type']}
    ...    ${Booking_S028['booking_name']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    booking    Booking_S028    17.Verify Edit Booking List Popup  

    Log    Step No.18 "กรอกข้อมูลพื้นที่ต้นทางการจัดส่ง"
    Set Today
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S028['shipping_origin']}
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
    # Expected
    Log Defect No:  Defect076,Defect126,Defect258
    b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    ...    ${Booking_S028['booking_name']}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking.img_is_favorite['img_sender_heart']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking.img_is_favorite['img_receiver_heart']}
    ...    ${Booking_S028['receiver_name']}
    ...    ${Booking_S028['receiver_phone']}
    ...    ${Booking_S028['receiver_store_address']}
    ...    ${Booking_S028['parcel_size']}
    ...    ${Booking_S028['price_value']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking.text_default['discount_amount']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_amount']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_amount']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S028['total_price_amount']}
    ...    ${Booking_S028['total_price_value2']}
    ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S028    18.1.Verify Booking Summary After Set Origin Shipping
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S028    18.2.Verify Booking Detail Page After Set Origin Shipping


    Log    Step No.19 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    Log Defect No:  Defect077
    b2c_booking_detail_page.Verify Parcel Label When Select 7-ELEVEN Store
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking.label['text_destination_deparment_code']}
    ...    ${Booking_S028['receiver_store_code_5_digits']}
    ...    ${Booking_S028['parcel_package_type']}
    ...    ${Booking_S028['parcel_size']}
    ...    ${Booking_S028['sender_name']}
    ...    ${Booking_S028['sender_phone']}
    ...    ${Booking_S028['sender_address']}
    ...    ${Booking_S028['sender_postcode_full']}
    ...    ${Booking_S028['receiver_name']}
    ...    ${Booking_S028['receiver_phone']}
    ...    ${Booking_S028['receiver_store_address']}
    ...    ${Booking.label['non_cod']}
    ...    ${Booking.label['parcel_not_buy_insure']}
    ...    ${Booking.text_blank['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S028    19.Verify Parcel Label

    Log    Step No.20 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    Set Global Variable    ${card_is_visible}    True
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S028    20.Verify Print Screen