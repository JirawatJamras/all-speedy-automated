*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
Booking_S051
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า Return Business (ลูกค้าทั่วไปบุ๊คพัสดุ จาก Link Return Business ที่ได้รับ
    [Tags]    Booking    UAT    BEW
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Prerequisite S050


    Log    Step No.1 กรอกเบอร์โทรศัพท์ เเละกดปุ่มยืนยัน
    Go To    https://www-uat.allspeedy.co.th/return-business/email-link/2410005650
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
    common.Verify Capture Screenshot    Booking_S051     Verify Booking Detail Page
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Booking_S051     Verify Booking Detail Page 2

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
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

    Log    Step No.3 กรอกข้อมูล การสร้างพัสดุ
    b2c_return_business_page.Input Sender Phone    ${Booking_S051['sender_phone']}
    b2c_return_business_page.Input Sender Name    ${Booking_S051['sender_name']}
    # Expected
    common.Verify Capture Screenshot    Booking_S051     Input Data For Create Parcel