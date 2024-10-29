*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

# Test Setup        Run Keywords    Open Chrome Browser    chrome   #headlesschrome   #chrome
#                   ...    AND    Set Folder Result with date
# Test Teardown    Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
#                   ...    AND    Close Browser

*** Test Cases ***
Booking_S038
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่งต้องการใช้ที่อยู่ผู้ส่งพัสดุเดียวกันทั้งบุ๊คกิ้ง
    [Tags]    Booking    UAT
    # Log    Pre condition
    # common.Open URL    ${B2C_UAT_URL}
    # register_general_customers_page.Select Business Customers Tab
    # b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    # b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    # b2c_login_page.Click Log On Button
    # b2c_home_page.Click Book Parcel Delivery
    # b2c_booking_detail_page.Wait Until Loading Icon Success
    # b2c_booking_delivery_page.Click Button To Add    
    # b2c_booking_delivery_page.Click Accept Terms of Service
    # b2c_booking_delivery_page.Select Parcel Type    ${Booking_S002['parcel_type']}
    # b2c_booking_delivery_page.Input Phone Sender    ${Booking_S002['sender_phone']}
    # b2c_booking_delivery_page.Input Name Sender    ${Booking_S002['sender_name']}    
    # b2c_booking_delivery_page.Input Address Sender    ${Booking_S002['sender_address']}
    # b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S002['sender_postcode_5_digits']}
    # b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S002['sender_postcode_full']}
    # b2c_booking_delivery_page.Click Next Button
    # b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S002['receiver_phone']}
    # b2c_booking_delivery_page.Input Name Receiver    ${Booking_S002['receiver_name']}
    # b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    # b2c_booking_delivery_page.Input Address Receiver    ${Booking_S002['receiver_address']}
    # b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S002['receiver_postcode_5_digits']}
    # b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S002['receiver_postcode_full']}
    # b2c_booking_delivery_page.Click Save Button
    # ${booking_id}    Get Booking ID
    # ${booking_time}    Get Booking Time
    # ${booking_name}    Get Booking Name
    # ${parcel_id}    Get Parcel ID
    # b2c_booking_detail_page.Select Draft Booking
    # b2c_booking_delivery_page.Click Next Button  
    # b2c_booking_delivery_page.Click Next Button
    # b2c_booking_delivery_page.Select Parcel Size    ${Booking_S002['parcel_size']}
    # b2c_booking_delivery_page.Click Next Button 
    # b2c_booking_delivery_page.Click Parcel Booking Button
    # b2c_booking_detail_page.Wait Until Loading Icon Success
    # ${booking_time}    Get Booking Time
    # b2c_home_page.Click Book Parcel Delivery
    # b2c_booking_detail_page.Wait Until Loading Icon Success
    # b2c_booking_detail_page.Click Booking With Status Select Shipping Origin    ${booking_id}
    # b2c_booking_detail_page.Click Edit Booking List
    # b2c_booking_detail_page.Select Shipping Origin Tab    ${Booking_S002['shipping_origin']}
    # b2c_booking_detail_page.Search Shipping Store    ${Booking_S002['store_code']}
    # b2c_booking_detail_page.Click Select Store On Map
    # b2c_booking_detail_page.Click Save Shipping Origin Aria
    # b2c_booking_detail_page.Wait Until Page Loaded After Select Origin Shipping
    # ${booking_time}    Get Booking Time

    # Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    # b2c_home_page.Click Book Parcel Delivery
    # b2c_booking_detail_page.Wait Until Loading Icon Success
    # # Expected
    # b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    # ...    ${booking_id}
    # ...    ${booking_time}
    # ...    ${Booking['text_parcel_status_select_shipping_origin']}
    # ...    ${Booking_S002['booking_name']}
    # ...    ${Booking_S002['booking_item']}
    # ...    0.00 บาท    # Expected result is: ${Booking.text_default['booking_price']}
    # common.Verify Capture Screenshot    Booking_S038    Verify Created Booking On Booking Delivery Page

    # Log    Step No. 2 กดรายการบุ๊คกิ้งที่มีสถานะ "รอส่งพัสดุเข้าระบบ"
    # b2c_booking_detail_page.Click Booking With Waiting For Entering Parcel To System    ${booking_id}
    # # Expected
    # b2c_booking_detail_page.Verify Booking Detail Page
    # ...    ${Booking['text_title_booking_list']}
    # ...    ${booking_id}
    # ...    ${Booking['text_dry_parcel_id_4_start_unit']}
    # ...    ${booking_name}
    # ...    ${booking_time}
    # ...    ${Booking['text_title_parcel_list']}
    # ...    ${Booking['text_parcel_status_waiting_entering']}
    # ...    ${Booking.img_is_favorite['img_sender_heart']}
    # ...    ${Booking_S002['sender_name']}
    # ...    ${Booking_S002['sender_phone']}
    # ...    ${Booking.img_is_favorite['img_receiver_heart']}
    # ...    ${Booking_S002['receiver_name']}
    # ...    ${Booking_S002['receiver_phone']}
    # ...    ${Booking_S002['receiver_address']}
    # ...    ${Booking_S002['receiver_postcode_full']}
    # ...    ${Booking_S002['parcel_size']}
    # ...    ${Booking_S002['price_value']}
    # ...    ${Booking.text_blank['buy_insurance']}
    # ...    ${Booking.text_blank['cod_value']}
    # ...    ${Booking['text_title_booking_summary']}
    # ...    ${Booking.text_default['discount_amount']}
    # ...    ${Booking.text_default['discount_value']}
    # ...    ${Booking.text_default['insurance_fee_amount']}
    # ...    ${Booking.text_default['insurance_fee_value']}
    # ...    ${Booking.text_default['cod_fee_amount']}
    # ...    ${Booking.text_default['cod_fee_value']}
    # ...    ${Booking_S002['total_price_amount']}
    # ...    ${Booking_S002['total_price_value2']}
    # ...    ${Booking_S002['store_code']}
    # common.Scroll Window To Vertical    500
    # common.Verify Capture Screenshot    Booking_S038    Verify Booking Summary After Set Origin Shipping
    # common.Scroll Window To Vertical    0
    # common.Verify Capture Screenshot    Booking_S038    Verify Booking Detail Page After Set Origin Shipping

    # Go To    https://www-uat.allspeedy.co.th/booking/detail/B2410004883
    # b2c_booking_detail_page.Wait Until Loading Icon Success


    # Log    Step No. 3 กดปุ่ม "Import File"
    # b2c_booking_detail_page.Click Import File Button
    # # Expected
    # b2c_booking_detail_page.Verify Import File Popup
    # ...    ${Booking['text_import']}
    # ...    ${Booking['text_btn_template']}
    # ...    ${Booking['text_import_time']}
    # ...    ${Booking['text_file_name']}
    # ...    ${Booking['text_import_result']}
    # ...    ${Booking['text_file_import_error']}
    # common.Verify Capture Screenshot    Booking_S038    Verify Import File Popup

    # Log    Step No. 4 กดปุ่ม "Import" เเละเลือกไฟล์ชื่อ "Excel Template พัสดุทั่วไป" ที่ได้กรอกข้อมูลไว้เเล้ว
    # b2c_booking_detail_page.Import Excel File Of Dry Parcel Template    ${path_excel_dry_parcel}
    # b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    # b2c_booking_detail_page.Verify Import Excel File Inspection Results    # Have commented code, stuck at Defect108. Waiting for resolve.
    # ...    ${Booking.import_file['dry_parcel_file_name']}
    # ...    ${Booking.import_file['dry_parcel_import_success_amount']}
    # ...    ${Booking.import_file['dry_parcel_import_fail_amount']}
    # common.Verify Capture Screenshot    Booking_S038    Verify Import Excel File Inspection Results

    # Log    Step No. 5 กด Download ไฟล์ Error เเละตรวจสอบไฟล์
    # b2c_booking_detail_page.Click Download Import Error File
    # Expected
    # ~/Downloads/Error Report (241025 05_22_41).xlsx.xlsx
    ${files}=    List Files In Directory    /Users/jirawat/Downloads
    Log to console    ${files}
    Open Excel Document    /Users/jirawat/Downloads/Error Report (241025 05_22_41).xlsx.xlsx    doc_id=รายการพัสดุ
    ${value}=    Read Cell Data    ErrorReport    Sheet1    A1
    Log to console    ${value}