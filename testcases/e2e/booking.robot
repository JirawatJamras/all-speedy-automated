*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S001
    [Documentation]    Log-In เข้าใช้งานระบบ สำหรับ ลูกค้า Business    
    [Tags]    Booking    UAT
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Verify My Profile Page  
    ...    ${Booking_S001['company_profile']}
    ...    ${Booking_S001['sir_name']}
    ...    ${Booking_S001['company_name']}
    ...    ${Booking_S001['profile']}
    ...    ${Booking_S001['name']}
    ...    ${Booking_S001['phone']}
    ...    ${Booking_S001['email']}
    ...    ${Booking_S001['position']}
    common.Verify Capture Screenshot    Booking_S001    Verify Home Page

Booking_S002
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (ไม่เพิ่มเป็นรายการโปรด) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > ไม่เพิ่มเป็นรายการโปรด)(บันทึกร่าง) - รายละเอียดพัสดุ เลือก A4 (ไม่มีประกัน ไม่มี COD เเละไม่ใส่หมายเหตุ) - Promotion (ไม่มี)    
    [Tags]    Booking    UAT    Run
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    #Expected
    b2c_booking_delivery_page.Verify Booking Page    ${Booking['text_title_booking']}
    common.Verify Capture Screenshot    Booking_S002    Verify Booking Page

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_booking_delivery_page.Click Button To Add
    #Expected
    b2c_booking_delivery_page.Verify Term & Condition    ${txt_term_and_condition}    ${Booking['text_term_and_condition']}
    common.Verify Capture Screenshot    Booking_S002    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_booking_delivery_page.Click Accept Terms of Service
    #Expected   
    b2c_booking_delivery_page.Verify Select Parcel Type
    common.Verify Capture Screenshot    Booking_S002    Verify Select Parcel Type

    Log    Step No.4 กดปุ่ม "พัสดุทั่วไป"
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S002['parcel_type']}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    common.Verify Capture Screenshot    Booking_S002    Verify Create Parcel Page Sender Step

    Log    Step No.5 ขั้นตอนข้อมูลผู้ส่งพัสดุ
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S002['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S002['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S002['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S002['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S002['sender_postcode_full']}
    #Expected
    common.Verify Capture Screenshot    Booking_S002    Verify After Create Parcel Page Sender Step

    Log    Step No.6 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Button  ${btn_next_to_receiver}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Receiver Step   
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_receiver_information']}
    ...    ${Booking['text_phone_receiver']}
    ...    ${Booking['text_name_receiver']}
    ...    ${Booking['text_location_receiver']}
    ...    ${Booking['text_address_receiver']}
    ...    ${Booking['text_postcode_receiver']}
    common.Verify Capture Screenshot    Booking_S002    Verify Create Parcel Page Receiver Step

    Log    Step No.7 ขั้นตอนข้อมูลผู้รับพัสดุ
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S002['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S002['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S002['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S002['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S002['receiver_postcode_full']}
    #Expected
    common.Verify Capture Screenshot    Booking_S002    Verify After Create Parcel Page Receiver Step

    Log    Step No.8 กดปุ่ม "บันทึกร่าง"
    b2c_booking_delivery_page.Click Button  ${btn_save_draft}
    #Expected
    b2c_booking_detail_page.Verify Booking list Page
    ...    ${Booking['text_booking_list']}
    ...    ${Booking['text_draft_status']}
    ...    ${Booking_S002['img_sender_heart']}
    ...    ${Booking_S002['sender_name']}
    ...    ${Booking_S002['sender_phone']}
    ...    ${Booking_S002['img_receiver_heart']}
    ...    ${Booking_S002['receiver_name']}
    ...    ${Booking_S002['receiver_phone']}
    ...    ${Booking_S002['receiver_address']}
    ...    ${Booking_S002['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S002    Verify Draft Paecel

    Log    Step No.9 กดที่รายการพัสดุที่มีสถานะ "ร่าง"
    ${booking_id}    Get Booking ID
    ${booking_time}    Get Booking Time
    ${booking_name}    Get Booking Name
    ${parcel_id}    Get Parcel ID
    b2c_booking_detail_page.Click Button    ${b2c_crd_list_of_parcels}
    #Expected
    b2c_booking_delivery_page.Verify Create Parcel Page Sender Step
    ...    ${Booking['text_title']}
    ...    ${Booking['text_parcel_sender_information']}
    ...    ${Booking['text_phone_sender']}
    ...    ${Booking['text_name_sender']}
    ...    ${Booking['text_address_sender']}
    ...    ${Booking['text_postcode_sender']}
    b2c_booking_delivery_page.Verify Draft Paecel Sender
    ...    ${Booking_S002['sender_phone']}
    ...    ${Booking_S002['sender_name']}
    ...    ${Booking_S002['sender_address']}
    ...    ${Booking_S002['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S002    Verify Draft Paecel Sender

    Log    Step No.10 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button  
    #Expected
    b2c_booking_delivery_page.Verify Draft Paecel Receiver
    ...    ${Booking_S002['receiver_phone']}
    ...    ${Booking_S002['receiver_name']}
    ...    ${Booking_S002['receiver_address']}
    ...    ${Booking_S002['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S002    Verify Draft Paecel Receiver
   
    Log    Step No.11 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button
    #Expected
    ${detail_A4}=    Get Text    //strong[text()= 'A4']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_A4}    A4${\n}ซอง A4${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 51 ชม.
    ${detail_A3}=    Get Text    //strong[text()= 'A3']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_A3}    A3${\n}ซอง A3${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 72 ชม.
    ${detail_XS}=    Get Text    //strong[text()= 'XS']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_XS}    XS${\n}กล่อง XS (เล็กพิเศษ)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 40 ชม.
    ${detail_S}=    Get Text    //strong[text()= 'S']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_S}    S${\n}กล่อง S (เล็ก)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 60 ชม.
    ${detail_M}=    Get Text    //strong[text()= 'M']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_M}    M${\n}กล่อง M (กลาง)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 90 ชม.
    ${detail_L}=    Get Text    //strong[text()= 'L']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_L}    L${\n}กล่อง L (ใหญ่)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 120 ชม.
    ${detail_XL}=    Get Text    //strong[text()= 'XL']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_XL}    XL${\n}กล่อง XL (ใหญ่มาก)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 150 ชม.
    ${detail_XXL}=    Get Text    //strong[text()= 'XXL']/../../../div[@class='ant-card-body']
    Should Be Equal    ${detail_XXL}    XXL${\n}กล่อง XXL (ใหญ่พิเศษ)${\n}ขนาดวัดตามสายวัด${\n}กว้าง + ยาว + สูง ไม่เกิน 200 ชม.
    ${insure_amount}=    Get Text    //label[@title='จำนวนเงินซื้อประกัน']
    Should Be Equal    ${insure_amount}    จำนวนเงินซื้อประกัน
    ${cod}=    Get Text    //label[@title='เก็บเงินปลายทาง']
    Should Be Equal    ${cod}    เก็บเงินปลายทาง
    ${remark}=    Get Text    //label[@title='หมายเหตุ']
    Should Be Equal    ${remark}    หมายเหตุ
    common.Verify Capture Screenshot    Booking_S002    Verify Paecel Detail

    Log    Step No.12 ขั้นตอนรายละเอียดพัสดุ
    # กรอกข้อมูล
    # เลือกขนาดพัสดุ : ซอง A4"
    b2c_booking_delivery_page.Select Parcel Size    ${Booking_S002['parcel_size']}

    Log    Step No.13 กดปุ่ม "ถัดไป"
    b2c_booking_delivery_page.Click Next Button 
    #Expected
    b2c_booking_delivery_page.Verify Promotion Detail
    ...    ${Booking['text_selected_coupon_and_code']}
    ...    ${Booking['text_my_coupon_and_code']}
    common.Verify Capture Screenshot    Booking_S002    Verify Promotion

    Log    Step No.14 ขั้นตอน Promotion
    # - ไม่เลือก Promotion
    b2c_booking_delivery_page.Click Parcel Booking

    #Expected

    Log    Step No.15 กดเมนู "จองการจัดส่งพัสดุ"
    ${booking_time}    Get Booking Time
    b2c_home_page.Click Book Parcel Delivery
    #Expected
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking_S002['booking_name']}
    ...    ${Booking_S002['booking_item']}
    ...    ${Booking_S002['booking_price']}
    common.Verify Capture Screenshot    Booking_S002    Verify Created Booking On Booking Delivery Page

    Log    Step No.16 กดรายการบุ๊คกิ้งที่มีสถานะ "เลือกต้นทางจัดส่ง"
    b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page
    ...    ${Booking['text_title_booking_list']}
    ...    ${booking_id}
    ...    ${booking_name}
    ...    ${booking_time}
    ...    ${Booking['text_title_parcel_list']}
    ...    ${Booking['text_parcel_status_select_shipping_origin']}
    ...    ${Booking_S002['img_sender_heart']}
    ...    ${Booking_S002['sender_name']}
    ...    ${Booking_S002['sender_phone']}
    ...    ${Booking_S002['img_receiver_heart']}
    ...    ${Booking_S002['receiver_name']}
    ...    ${Booking_S002['receiver_phone']}
    ...    ${Booking_S002['receiver_address']}
    ...    ${Booking_S002['receiver_postcode_full']}
    ...    ${Booking_S002['parcel_type_booking_detail']}
    ...    ${Booking['text_title_booking_summary']}
    ...    ${Booking_S002['discount_amount']}
    ...    ${Booking_S002['discount_value']}
    ...    ${Booking_S002['insurance_fee_amount']}
    ...    ${Booking_S002['insurance_fee_value']}
    ...    ${Booking_S002['cod_fee_amount']}
    ...    ${Booking_S002['cod_fee_value']}
    ...    ${Booking_S002['total_price_amount']}
    ...    ${Booking_S002['total_price_value']}
    common.Verify Capture Screenshot    Booking_S002    Verify Booking Detail Page

    Log    Step No.17 กดปุ่ม "เเก้ไขรายการบุ๊คกิ้ง"
    b2c_booking_detail_page.Click Edit Booking List
    # Expected
    b2c_booking_detail_page.Verify Edit Booking List Popup    
    ...    ${Booking_S002['parcel_type']}
    ...    ${Booking_S002['booking_name']}
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    Booking_S002    Verify Edit Booking List Popup  

    Log    Step No.18 "กรอกข้อมูลเพื้นที่ต้นทางการจัดส่ง"
    b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S002['shipping_origin']}
    b2c_booking_detail_page.Search Shipping Store    ${Booking_S002['store_code']}
    b2c_booking_detail_page.Click Select Store On Map
    b2c_booking_detail_page.Click Save Shipping Origin Aria
    # Expected

    Log    Step No.19 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Parcel Label
    # Expected
    b2c_booking_detail_page.Verify Parcel Label
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking_S002['receiver_postcode_5_digits']}
    ...    ${Booking_S002['parcel_package_type']}
    ...    ${Booking_S002['parcel_size']}
    ...    ${Booking_S002['sender_name']}
    ...    ${Booking_S002['sender_phone']}
    ...    ${Booking_S002['sender_address']}
    ...    ${Booking_S002['sender_postcode_full']}
    ...    ${Booking_S002['receiver_name']}
    ...    ${Booking_S002['receiver_phone']}
    ...    ${Booking_S002['receiver_address']}
    ...    ${Booking_S002['receiver_postcode_full']}
    ...    ${Booking_S002['parcel_cod']}
    ...    ${Booking_S002['parcel_insure']}
    common.Verify Capture Screenshot    Booking_S002    Verify Parcel Label

    Log    Step No.20 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_booking_detail_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    Booking_S002    Verify Print Screen

    
    [Teardown]    common.Delete API Booking By Booking ID    ${booking_id}