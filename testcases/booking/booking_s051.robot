*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
Booking_S051
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า Return Business (ลูกค้าทั่วไปบุ๊คพัสดุ จาก Link Return Business ที่ได้รับ
    [Tags]    Booking    UAT    BEW
    Log    S051
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Return Business
    b2c_return_business_page.Click Add Booking Button
    b2c_return_business_page.Click Accept Condition Button
    b2c_return_business_page.Clear Input
    b2c_return_business_page.Input Link Name    ${Booking_S050.new_return_business['link_name']}
    b2c_return_business_page.Input Phone Receiver    ${Booking_S050.new_return_business['phone']}
    b2c_return_business_page.Input Name Receiver    ${Booking_S050.new_return_business['name']}
    b2c_return_business_page.Click Owner Pay    ${Booking_S050.new_return_business['shipping_payer']}
    b2c_return_business_page.Select Send To Home Tab
    b2c_return_business_page.Input Address Receiver    ${Booking_S050.new_return_business['address']}
    b2c_return_business_page.Input Postcode Receiver    ${Booking_S050.new_return_business['postcode_5_digits']}
    b2c_return_business_page.Click Postcode Receiver Lists    ${Booking_S050.new_return_business['postcode']}
    b2c_return_business_page.Click Save Button
    b2c_return_business_page.Verify New Booking
    ...    ${Booking_S050.new_return_business['link_name']}
    ...    ${Booking_S050.new_return_business['name']}
    ...    ${Booking_S050.new_return_business['phone']}
    ...    ${Booking_S050.new_return_business['address']}
    ...    ${Booking_S050.new_return_business['postcode']}
    b2c_return_business_page.Click Booking Card
    ...    ${Booking_S050.new_return_business['link_name']}
    ...    ${Booking_S050.new_return_business['name']}
    ...    ${Booking_S050.new_return_business['phone']}
    ...    ${Booking_S050.new_return_business['address']}
    ...    ${Booking_S050.new_return_business['postcode']}
    b2c_return_business_page.Click Download QR Code Button
    b2c_return_business_page.Click Copy Link Button
    b2c_return_business_page.Verify Copy Link    ${return_business['text_copy_link_success']}

    Log    Step No.2 กรอกเบอร์โทรศัพท์ เเละกดปุ่มยืนยัน
    Go To    ${Link_booking_return}
    b2c_return_business_page.Input Trigger Phone Number    ${Booking_S050.old_return_business['phone']}
    b2c_return_business_page.Click Confirm Button
    ${booking_id}    Get Booking ID
    ${booking_name}    Get Booking Name
    # Expected
    b2c_return_business_page.Verify Booking Detail Page [Not Have Parcel List]
    ...    ${booking_id}
    ...    ${booking_name}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking.text_default['total_price_amount']}
    ...    ${Booking.text_default['total_price_value']}
    common.Verify Capture Screenshot    Booking_S051     Verify Booking Detail Page [Not Have Parcel List]
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S051     Verify Booking Detail Page [Not Have Parcel List] 2

    Log    Step No.3 กดปุ่ม "+ เพิ่ม"
    b2c_return_business_page.Click Add Parcel Button
    # Expected
    b2c_return_business_page.Verify Create Parcel Popup
    ...    ${return_business.email_link['text_parcel_sender_information']}
    ...    ${return_business.email_link['text_phone']}
    ...    ${return_business.email_link['text_name']}
    ...    ${return_business.email_link['text_address']}
    ...    ${return_business.email_link['text_address_full']}
    ...    ${return_business.email_link['parcel_detail_A4']}
    ...    ${return_business.email_link['parcel_detail_A3']}
    ...    ${return_business.email_link['parcel_detail_XS']}
    ...    ${return_business.email_link['parcel_detail_S']}
    ...    ${return_business.email_link['parcel_detail_M']}
    ...    ${return_business.email_link['parcel_detail_L']}
    ...    ${return_business.email_link['parcel_detail_XL']}
    ...    ${return_business.email_link['parcel_detail_XXL']}
    ...    ${return_business.email_link['text_remark']}
    common.Verify Capture Screenshot    Booking_S051     Verify Create Parcel Popup

    Log    Step No.4 กรอกข้อมูล การสร้างพัสดุ
    b2c_return_business_page.Input Sender Phone    ${Booking_S051['sender_phone']}
    b2c_return_business_page.Input Sender Name    ${Booking_S051['sender_name']}
    b2c_return_business_page.Input Sender Address    ${Booking_S051['sender_address']}
    b2c_return_business_page.Input Sender Postcode    ${Booking_S051['sender_postcode']}
    b2c_return_business_page.Select Sender Address Full    ${Booking_S051['sender_address_full']}
    b2c_return_business_page.Select Parcel Size    ${Booking_S051['parcel_size']}
    # Expected
    common.Verify Capture Screenshot    Booking_S051     Input Data For Create Parcel

    Log    Step No.5 กดปุ่ม "จองเลขพัสดุ"
    b2c_return_business_page.Click Parcel Booking Button
    # Expected
    b2c_return_business_page.Verify Booking Detail Page
    ...    ${booking_id}
    ...    ${booking_name}
    ...    ${Booking_S051['parcel_status']}
    ...    ${Booking_S051['sender_name']}
    ...    ${Booking_S051['sender_phone']}
    ...    ${Booking_S050.new_return_business['name']}
    ...    ${Booking_S050.new_return_business['phone']}
    ...    ${Booking_S050.new_return_business['address']}
    ...    ${Booking_S050.new_return_business['postcode']}
    ...    ${EMPTY}
    # ...    ${Booking_S051['size']}
    ...    ${Booking_S051['booking_price']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking_S051['cod']}
    # ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking.img_not_favorite['img_sender_heart']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S051['total_amount']}
    ...    30.00
    common.Verify Capture Screenshot    Booking_S051     Verify Booking Detail Page 

    Log    Step No.6 กดปุ่ม "เเก้ไขรายการบุ๊คกิ้ง"
    b2c_return_business_page.Click Edit Booking
    # Expected
    b2c_return_business_page.Verify Edit Booking List Popup    
    ...    ${Booking['text_shipping_origin_aria']}
    common.Verify Capture Screenshot    Booking_S051     Verify Edit Booking Popup

    Log    Step No.7 กรอกข้อมูลพื้นที่ต้นทางการจัดส่ง
    b2c_return_business_page.Input Shipping Origin    ${Booking_S051['store']}
    # Expected
    b2c_return_business_page.Verify Booking Detail Page
    ...    ${booking_id}
    ...    ${booking_name}
    ...    ${Booking_S051['parcel_status']}
    ...    ${Booking_S051['sender_name']}
    ...    ${Booking_S051['sender_phone']}
    ...    ${Booking_S050.new_return_business['name']}
    ...    ${Booking_S050.new_return_business['phone']}
    ...    ${Booking_S050.new_return_business['address']}
    ...    ${Booking_S050.new_return_business['postcode']}
    ...    ${EMPTY}
    # ...    ${Booking_S051['size']}
    ...    ${Booking_S051['booking_price']}
    ...    ${Booking.text_blank['buy_insurance']}
    ...    ${Booking_S051['cod']}
    # ...    ${Booking.text_blank['cod_value']}
    ...    ${Booking.img_not_favorite['img_sender_heart']}
    ...    ${Booking.img_not_favorite['img_receiver_heart']}
    ...    ${Booking.text_default['discount_value']}
    ...    ${Booking.text_default['insurance_fee_value']}
    ...    ${Booking.text_default['cod_fee_value']}
    ...    ${Booking_S051['total_amount']}
    ...    ${Booking_S051['verify_booking_price']}
    common.Verify Capture Screenshot    Booking_S051     Verify Booking Detail Page After Shipping Origin

    Log    Step No.8 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_return_business_page.Click Print Parcel Label
    # Expected
    b2c_return_business_page.Verify Parcel Label
    ...    ${Booking.text_paper_size['size_a4']}
    ...    ${Booking.text_paper_size['size_a5']}
    ...    ${Booking.text_paper_size['size_8cm']}
    ...    ${Booking.label['text_postcode']}
    ...    ${Booking_S050.new_return_business['postcode_5_digits']}
    ...    ${Booking_S051['parcel_package_type']}
    ...    ${Booking_S051['size']}
    ...    ${Booking_S051['sender_name']}
    ...    ${Booking_S051['sender_phone']}
    ...    ${Booking_S051['sender_address']}
    ...    ${Booking_S051['sender_address_full']}
    ...    ${Booking_S050.new_return_business['name']}
    ...    ${Booking_S050.new_return_business['phone']}
    ...    ${Booking_S050.new_return_business['address']}
    ...    ${Booking_S050.new_return_business['postcode']}
    ...    ${Booking.label['non_cod']}
    ...    ${Booking.label['parcel_not_buy_insure']}
    ...    ${Booking.text_blank['parcel_detail_remark']}
    common.Verify Capture Screenshot    Booking_S051    Verify Parcel Label

    Log    Step No.9 กดปุ่ม "พิมพ์ใบจ่ายหน้าพัสดุ" ใน PopUp "พิมพ์ใบจ่ายหน้าพัสดุ"
    b2c_return_business_page.Click Print Label On Popup
    # Expected
    common.Verify Capture Screenshot    Booking_S051    Verify Parcel Label 2