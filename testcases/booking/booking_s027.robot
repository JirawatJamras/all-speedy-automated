*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Run Keywords    Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule    ${newDate}    ${Booking_S018.pickup_time['expected']}
                  ...    AND    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S027
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ควบคุมอุณหภูมิ) - ข้อมูลผู้ส่ง (เพิ่มเป็นรายการโปรด)(บันทึกร่าง) - ข้อมูลผู้รับพัสดุ (ส่งที่ร้าน 7-11 > ไม่เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก A1 (มี COD เเละใส่หมายเหตุ)(บันทึกร่าง) - Promotion (มี)
    [Tags]    Booking    UAT    Pass_With_Condition
    Log    Pre condition
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

    Step Test:    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Booking Page For Business Customer

    Step Test:    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    # Defect043
    # Expected
    # b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Term & Condition

    Step Test:    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Select Parcel Type

    Step Test:    Step No.4 กดปุ่ม "พัสดุควบคุมอุณหภูมิ"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S027['parcel_type']}
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
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Create Parcel Page Sender Step

    Step Test:    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S027['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S027['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S027['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S027['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S027['sender_postcode_full']}
    b2c_create_parcel_page.Click Add To Favorites
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S027    Verify After Create Parcel Page Sender Step

    Step Test:    Step No.6 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    # Defect051    Defect052
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page After Draft
    # ...    ${Booking['text_booking_list']}
    # ...    ${Booking['text_draft_status']}
    # ...    ${Booking.text_blank['text_dry_parcel_id_4_start_unit']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S027['sender_name']}
    # ...    ${Booking_S027['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking.text_blank['receiver_name']}
    # ...    ${Booking.text_blank['receiver_phone']}
    # ...    ${Booking.text_blank['receiver_address']}
    # ...    ${Booking.text_blank['receiver_postcode_full']}
    # ...    ${Booking.text_blank['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Draft Parcel Sender

    Step Test:    Step No.7 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
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
    ...    ${Booking_S027['sender_phone']}
    ...    ${Booking_S027['sender_name']}
    ...    ${Booking_S027['sender_address']}
    ...    ${Booking_S027['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Data Sender

    Step Test:    Step No.8 กดปุ่ม "ถัดไป"
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
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Data Receiver When Select Home

    Step Test:    Step No.9 ขั้นตอนกรอกข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S027['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S027['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_store}
    b2c_booking_delivery_page.Input And Select Store Code Receiver    ${Booking_S027['receiver_store_code_5_digits']}    ${Booking_S027['receiver_store_address']}
    b2c_booking_delivery_page.Click Store On Map
    # Expected
    b2c_booking_delivery_page.Verify Store Address Receiver    ${Booking_S027['receiver_store_full']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Create Parcel Page After Input Receiver Step

    Step Test:    Step No.10 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Defect083
    # Expected
    # b2c_booking_delivery_page.Verify Parcel Detail Page of Create Parcel [Chilled Parcel]
    # ...    ${Booking.chilled_parcel['parcel_detail_S0']}
    # ...    ${Booking.chilled_parcel['parcel_detail_S1']}
    # ...    ${Booking.chilled_parcel['parcel_detail_S2']}
    # ...    ${Booking.chilled_parcel['parcel_detail_A1']}
    # ...    ${Booking.chilled_parcel['parcel_detail_A2']}
    # ...    ${Booking['parcel_detail_insure_amount']}
    # ...    ${Booking['parcel_detail_cod']}
    # ...    ${Booking['parcel_detail_remark']}
    # b2c_booking_delivery_page.Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Parcel Detail

    Step Test:    Step No.11 ขั้นตอนรายละเอียดพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S027['parcel_size']}
    # Defect118
    # b2c_booking_delivery_page.Input COD    ${Booking_S027['parcel_cod']}
    # b2c_booking_delivery_page.Input Parcel Remark    ${Booking_S027['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Create Parcel Page After Input Parcel Detail Step

    Step Test:    Step No.12 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    # Defect102    Defect118
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page After Draft When Select 7-ELEVEN Store
    # ...    ${Booking['text_booking_list']}
    # ...    ${Booking['text_draft_status']}
    # ...    ${Booking.text_blank['text_chilled_parcel_id_4_start_unit']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S027['sender_name']}
    # ...    ${Booking_S027['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S027['receiver_name']}
    # ...    ${Booking_S027['receiver_phone']}
    # ...    ${Booking_S027['receiver_store_address']}
    # ...    ${Booking_S027['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking_S027['parcel_cod_verify']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Draft Parcel After Input Parcel Detail

    Step Test:    Step No.13 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
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
    ...    ${Booking_S027['sender_phone']}
    ...    ${Booking_S027['sender_name']}
    ...    ${Booking_S027['sender_address']}
    ...    ${Booking_S027['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Data Sender

    Step Test:    Step No.14 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button  
    # Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step When Select 7-ELEVEN Store
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    b2c_booking_delivery_page.Verify Data Receiver When Select 7-ELEVEN Store
    ...    ${Booking_S027['receiver_phone']}
    ...    ${Booking_S027['receiver_name']}
    ...    ${Booking_S027['receiver_store_full']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Data Receiver When Select 7-ELEVEN Store

    Step Test:    Step No.15 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Defect083    Defect136
    # Expected
    # b2c_booking_delivery_page.Verify Parcel Detail Page of Create Parcel [Chilled Parcel]
    # ...    ${Booking.chilled_parcel['parcel_detail_S0']}
    # ...    ${Booking.chilled_parcel['parcel_detail_S1']}
    # ...    ${Booking.chilled_parcel['parcel_detail_S2']}
    # ...    ${Booking.chilled_parcel['parcel_detail_A1']}
    # ...    ${Booking.chilled_parcel['parcel_detail_A2']}
    # ...    ${Booking['parcel_detail_insure_amount']}
    # ...    ${Booking['parcel_detail_cod']}
    # ...    ${Booking['parcel_detail_remark']}
    # Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    # ...    ${EMPTY}
    # ...    ${Booking_S027['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Parcel Detail

    Step Test:    Step No.16 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    # Defect045
    # Expected
    # b2c_booking_delivery_page.Verify Promotion Detail
    # ...    ${Booking['text_selected_coupon_and_code']}
    # ...    ${Booking['text_my_coupon_and_code']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Promotion

    Step Test:    Step No.17 ขั้นตอน Promotion
    # Defect072
    b2c_booking_delivery_page.Input Promotion    ${Booking_S027['promotion']}
    b2c_booking_delivery_page.Click Use Code Button
    # Expected
    # b2c_booking_delivery_page.Verify Selected Coupon And Code
    # ...    ${Booking_S027.promotion_detail['discount']}
    # ...    ${Booking_S027.promotion_detail['promotion_name']}
    # ...    ${Booking_S027.promotion_detail['parcel_size']}
    # ...    ${Booking_S027.promotion_detail['expired_date']}
    # ...    ${Booking_S027.promotion_detail['condition']}
    # ...    ${Booking_S027.promotion_detail['period']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Selected Coupon And Code

    Step Test:    Step No.18 กดปุ่ม "จองเลขพัสดุ"
    b2c_booking_delivery_page.Click Parcel Booking Button
    ${booking_time}    Get Booking Time
    # Defect048    Defect76    Defect102
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S027['sender_name']}
    # ...    ${Booking_S027['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S027['receiver_name']}
    # ...    ${Booking_S027['receiver_phone']}
    # ...    ${Booking_S027['receiver_store_address']}
    # ...    ${Booking_S027['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['parcel_cod_verify']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S027['discount_amount']}
    # ...    ${Booking_S027['discount_value1']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S027['total_price_amount']}
    # ...    ${Booking_S027['total_price_value1']}
    # ...    ${Booking.text_blank['origin_shipping']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Booking Summary After Booking Success
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Booking Detail Page After Booking Success

    Step Test:    Step No.19 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Defect047
    # Expected
    # b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    # ...    ${booking_id}
    # ...    ${booking_time}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking_S027['booking_name']}
    # ...    ${Booking_S027['booking_item']}
    # ...    ${Booking.text_default['booking_price']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Created Booking On Booking Delivery Page

    Step Test:    Step No.20 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    # Defect048    Defect76    Defect102
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking.img_not_favorite['img_sender_heart']}
    # ...    ${Booking_S027['sender_name']}
    # ...    ${Booking_S027['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S027['receiver_name']}
    # ...    ${Booking_S027['receiver_phone']}
    # ...    ${Booking_S027['receiver_store_address']}
    # ...    ${Booking_S027['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['parcel_cod_verify']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S027['discount_amount']}
    # ...    ${Booking_S027['discount_value1']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S027['total_price_amount']}
    # ...    ${Booking_S027['total_price_value1']}
    # ...    ${Booking.text_blank['origin_shipping']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Booking Detail Page
    
    Step Test:    Step No.21 กดปุ่ม "แก้ไขรายการบุ๊คกิ้ง"
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    b2c_booking_detail_page.Verify Edit Booking List Popup    
    ...    ${Booking_S027['parcel_type']}
    ...    ${Booking_S027['booking_name']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Edit Booking List Popup  

    Step Test:    Step No.22 "กรอกข้อมูลเพื้นที่ต้นทางการจัดส่ง"
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S027['shipping_origin']}
    b2c_booking_detail_page.Select Booked Pickup Time From List    ${newDate}
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    # Defect072    Defect076    Defect102
    # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page When Select 7-ELEVEN Store
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S027['sender_name']}
    # ...    ${Booking_S027['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S027['receiver_name']}
    # ...    ${Booking_S027['receiver_phone']}
    # ...    ${Booking_S027['receiver_store_address']}
    # ...    ${Booking_S027['parcel_size']}
    # ...    ${Booking_S027['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['parcel_cod_verify']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S027['discount_amount']}
    # ...    ${Booking_S027['discount_value2']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking_S027['cod_fee_amount']}
    # ...    ${Booking_S027['cod_fee_value']}
    # ...    ${Booking_S027['total_price_amount']}
    # ...    ${Booking_S027['total_price_value2']}
    # ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Booking Summary After Set Origin Shipping
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Booking Detail Page After Set Origin Shipping

    Step Test:    Step No.23 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Defect077    Defect118
    # Expected
    # b2c_booking_detail_page.Verify Parcel Label When Select 7-ELEVEN Store
    # ...    ${Booking.text_paper_size['size_a4']}
    # ...    ${Booking.text_paper_size['size_a5']}
    # ...    ${Booking.text_paper_size['size_8cm']}
    # ...    ${Booking.label['text_destination_deparment_code']}
    # ...    ${Booking_S027['receiver_store_code_5_digits']}
    # ...    ${Booking_S027['parcel_package_type']}
    # ...    ${Booking_S027['parcel_size']}
    # ...    ${Booking_S027['sender_name']}
    # ...    ${Booking_S027['sender_phone']}
    # ...    ${Booking_S027['sender_address']}
    # ...    ${Booking_S027['sender_postcode_full']}
    # ...    ${Booking_S027['receiver_name']}
    # ...    ${Booking_S027['receiver_phone']}
    # ...    ${Booking_S027['receiver_store_address']}
    # ...    ${Booking_S027['parcel_cod_verify_label']}
    # ...    ${Booking.label['parcel_not_buy_insure']}
    # ...    ${Booking_S027['parcel_detail_remark']}
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Parcel Label

    Step Test:    Step No.24 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S027    Verify Print Screen