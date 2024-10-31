*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Run Keywords    Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule    ${newDate}    ${Booking_S018.pickup_time['expected']}
                  ...    AND    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S022
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ควบคุมอุณหภูมิ) - ข้อมูลผู้ส่ง (เพิ่มเป็นรายการโปรด)(บันทึกร่าง) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > ไม่เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก A1 (มี COD เเละใส่หมายเหตุ)(บันทึกร่าง) - Promotion (มี)
    [Tags]    Booking    UAT    Review_Pass
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

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For Business Customer
    common.Verify Capture Screenshot    Booking_S022    Verify Booking Page For Business Customer

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    # Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}${Booking['text_term_and_condition_date_set']}${Booking['text_version']}
    common.Verify Capture Screenshot    Booking_S022    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    # Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S022    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุควบคุมอุณหภูมิ"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S022['parcel_type']}
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
    common.Verify Capture Screenshot    Booking_S022    Verify Create Parcel Page Sender Step

    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S022['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S022['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S022['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S022['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S022['sender_postcode_full']}
    b2c_create_parcel_page.Click Add To Favorites
    # Expected
    common.Verify Capture Screenshot    Booking_S022    Verify After Create Parcel Page Sender Step

    Log    Step No.6 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    # Expected
    # Defect051    Defect052
    # b2c_booking_detail_page.Verify Booking Detail Page After Draft
    # ...    ${Booking['text_booking_list']}
    # ...    ${Booking['text_draft_status']}
    # ...    ${Booking.text_blank['text_chilled_parcel_id_4_start_unit']}
    # ...    ${Booking.img_not_favorite['img_sender_heart']}    # Expected Result is ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S022['sender_name']}
    # ...    ${Booking_S022['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking.text_blank['receiver_name']}
    # ...    ${Booking.text_blank['receiver_phone']}
    # ...    ${Booking.text_blank['receiver_address']}
    # ...    ${Booking.text_blank['receiver_postcode_full']}
    # ...    ${EMPTY}         # Expected Result is ${Booking.text_blank['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    common.Verify Capture Screenshot    Booking_S022    Verify Draft Parcel Sender

    Log    Step No.7 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
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
    ...    ${Booking_S022['sender_phone']}
    ...    ${Booking_S022['sender_name']}
    ...    ${Booking_S022['sender_address']}
    ...    ${Booking_S022['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S022    Verify Data Sender

    Log    Step No.8 กดปุ่ม "ถัดไป"
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
    common.Verify Capture Screenshot    Booking_S022    Verify Data Receiver When Select Home

    Log    Step No.9 ขั้นตอนข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S022['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S022['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S022['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S022['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S022['receiver_postcode_full']}
    # Expected
    common.Verify Capture Screenshot    Booking_S022    Verify After Create Parcel Page Receiver Step

    Log    Step No.10 กดปุ่ม "ถัดไป"
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
    # Defect083
    # Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    # ...    ${EMPTY}
    # ...    ${EMPTY}
    common.Verify Capture Screenshot    Booking_S022    Verify Parcel Detail

    Log    Step No.11 ขั้นตอนรายละเอียดพัสดุ
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S022['parcel_size']}
    # Defect118
    # b2c_booking_delivery_page.Input COD    ${Booking_S022['parcel_cod']}
    b2c_booking_delivery_page.Input Parcel Remark    ${Booking_S022['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S022    Verify Create Parcel Page After Input Parcel Detail Step

    Log    Step No.12 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Save Button
    # Expected
    # Defect102
    # b2c_booking_detail_page.Verify Booking Detail Page After Draft
    # ...    ${Booking['text_booking_list']}
    # ...    ${Booking['text_draft_status']}
    # ...    ${Booking.text_blank['text_chilled_parcel_id_4_start_unit']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S022['sender_name']}
    # ...    ${Booking_S022['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S022['receiver_name']}
    # ...    ${Booking_S022['receiver_phone']}
    # ...    ${Booking_S022['receiver_address']}
    # ...    ${Booking_S022['receiver_postcode_full']}
    # ...    ${Booking_S022['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking_S022['parcel_cod_verify']}
    common.Verify Capture Screenshot    Booking_S022    Verify Draft Parcel After Input Parcel Detail

    Log    Step No.13 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
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
    ...    ${Booking_S022['sender_phone']}
    ...    ${Booking_S022['sender_name']}
    ...    ${Booking_S022['sender_address']}
    ...    ${Booking_S022['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S022    Verify Data Sender

    Log    Step No.14 กดปุ่ม "ถัดไป"
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
    ...    ${Booking_S022['receiver_phone']}
    ...    ${Booking_S022['receiver_name']}
    ...    ${Booking_S022['receiver_address']}
    ...    ${Booking_S022['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S022    Verify Create Parcel Page Receiver Step When Select Home

    Log    Step No.15 กดปุ่ม "ถัดไป"
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
    # Defect083    Defect136
    # Verify Textbox Value On Parcel Detail Step [Chilled Parcel]
    # ...    ${EMPTY}
    # ...    ${Booking_S022['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S022    Verify Parcel Detail

    Log    Step No.16 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button 
    # Expected
    b2c_booking_delivery_page.Verify Promotion Detail
    ...    ${Booking['text_selected_coupon_and_code']}
    ...    ${Booking['text_my_coupon_and_code']}
    common.Verify Capture Screenshot    Booking_S022    Verify Promotion

    Log    Step No.17 ขั้นตอน Promotion
    # Defect072
    # b2c_booking_delivery_page.Input Promotion    ${Booking_S022['promotion']}
    # b2c_booking_delivery_page.Click Use Code Button
    # # Expected
    # b2c_booking_delivery_page.Verify Selected Coupon And Code
    # ...    ${Booking_S022.promotion_detail['discount']}
    # ...    ${Booking_S022.promotion_detail['promotion_name']}
    # ...    ${Booking_S022.promotion_detail['parcel_size']}
    # ...    ${Booking_S022.promotion_detail['expired_date']}
    # ...    ${Booking_S022.promotion_detail['condition']}
    # ...    ${Booking_S022.promotion_detail['period']}
    # common.Verify Capture Screenshot    Booking_S022    Verify Selected Coupon And Code

    Log    Step No.18 กดปุ่ม "จองเลขพัสดุ"
    b2c_booking_delivery_page.Click Parcel Booking Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    ${booking_time}    Get Booking Time
    # Expected
    # Defect048    Defect102
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S022['sender_name']}
    # ...    ${Booking_S022['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S022['receiver_name']}
    # ...    ${Booking_S022['receiver_phone']}
    # ...    ${Booking_S022['receiver_address']}
    # ...    ${Booking_S022['receiver_postcode_full']}
    # ...    ${Booking_S022['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking_S022['parcel_cod_verify']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S022['discount_amount']}
    # ...    ${Booking_S022['discount_value1']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking_S022['cod_fee_amount']}
    # ...    ${Booking_S022['cod_fee_value']}
    # ...    ${Booking_S022['total_price_amount']}
    # ...    ${Booking_S022['total_price_value1']}
    # ...    ${Booking.text_blank['origin_shipping']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S022    Verify Booking Summary After Booking Success
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S022    Verify Booking Detail Page After Booking Success

    Log    Step No.19 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    # Defect047
    # b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    # ...    ${booking_id}
    # ...    ${booking_time}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking_S022['booking_name']}
    # ...    ${Booking_S022['booking_item']}
    # ...    ${Booking.text_default['booking_price']}
    common.Verify Capture Screenshot    Booking_S022    Verify Created Booking On Booking Delivery Page

    Log    Step No.20 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    # Expected
    # Defect048    Defect102
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S022['sender_name']}
    # ...    ${Booking_S022['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S022['receiver_name']}
    # ...    ${Booking_S022['receiver_phone']}
    # ...    ${Booking_S022['receiver_address']}
    # ...    ${Booking_S022['receiver_postcode_full']}
    # ...    ${Booking_S022['parcel_size']}
    # ...    ${Booking.text_blank['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking_S022['parcel_cod_verify']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S022['discount_amount']}
    # ...    ${Booking_S022['discount_value1']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking_S022['cod_fee_amount']}
    # ...    ${Booking_S022['cod_fee_value']}
    # ...    ${Booking_S022['total_price_amount']}
    # ...    ${Booking_S022['total_price_value1']}
    # ...    ${Booking.text_blank['origin_shipping']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S022    Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S022    Verify Booking Detail Page
    
    Log    Step No.21 กดปุ่ม "แก้ไขรายการบุ๊คกิ้ง"
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    b2c_booking_detail_page.Verify Edit Booking List Popup    
    ...    ${Booking_S022['parcel_type']}
    ...    ${Booking_S022['booking_name']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    Booking_S022    Verify Edit Booking List Popup  

    Log    Step No.22 "กรอกข้อมูลเพื้นที่ต้นทางการจัดส่ง"
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S022['shipping_origin']}
    b2c_booking_detail_page.Select Booked Pickup Time From List    ${newDate}
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    # Expected
    # Defect072    Defect102
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_chilled_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S022['sender_name']}
    # ...    ${Booking_S022['sender_phone']}
    # ...    ${Booking.img_not_favorite['img_receiver_heart']}
    # ...    ${Booking_S022['receiver_name']}
    # ...    ${Booking_S022['receiver_phone']}
    # ...    ${Booking_S022['receiver_address']}
    # ...    ${Booking_S022['receiver_postcode_full']}
    # ...    ${Booking_S022['parcel_size']}
    # ...    ${Booking_S022['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking_S022['discount_amount']}
    # ...    ${Booking_S022['discount_value2']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking_S022['cod_fee_amount']}
    # ...    ${Booking_S022['cod_fee_value']}
    # ...    ${Booking_S022['total_price_amount']}
    # ...    ${Booking_S022['total_price_value2']}
    # ...    ${Booking.origin_shipping['idc_company_address']}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S022    Verify Booking Summary After Set Origin Shipping
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Booking_S022    Verify Booking Detail Page After Set Origin Shipping

    Log    Step No.23 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    # Defect118
    # b2c_booking_detail_page.Verify Parcel Label
    # ...    ${Booking.text_paper_size['size_a4']}
    # ...    ${Booking.text_paper_size['size_a5']}
    # ...    ${Booking.text_paper_size['size_8cm']}
    # ...    ${Booking.label['text_postcode']}
    # ...    ${Booking_S022['receiver_postcode_5_digits']}
    # ...    ${Booking_S022['parcel_package_type']}
    # ...    ${Booking_S022['parcel_size']}
    # ...    ${Booking_S022['sender_name']}
    # ...    ${Booking_S022['sender_phone']}
    # ...    ${Booking_S022['sender_address']}
    # ...    ${Booking_S022['sender_postcode_full']}
    # ...    ${Booking_S022['receiver_name']}
    # ...    ${Booking_S022['receiver_phone']}
    # ...    ${Booking_S022['receiver_address']}
    # ...    ${Booking_S022['receiver_postcode_full']}
    # ...    ${Booking_S022['parcel_cod_verify_label']}
    # ...    ${Booking.label['parcel_not_buy_insure']}
    # ...    ${Booking_S022['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S022    Verify Parcel Label

    Log    Step No.24 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    Booking_S022    Verify Print Screen