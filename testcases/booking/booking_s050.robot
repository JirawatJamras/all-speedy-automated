*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
# Test Teardown    Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
#                   ...    AND    Close Browser
Test Teardown    Close Browser

*** Test Cases ***
Booking_S050
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า Return Business (เพิ่มรายการ Return Business)
    [Tags]    Booking    UAT    Run
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "บริการขนส่งพัสดุ > เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Return Business
    # Expected
    b2c_return_business_page.Verify Return Business
    common.Verify Capture Screenshot    Booking_S050    Verify Return Business Page

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_return_business_page.Click Add Booking Button
    # Expected
    b2c_return_business_page.Verify Term & Condition    ${txt_term_and_condition}    ${return_business['text_term_and_condition']}${current_date_thai}${return_business['text_version']}
    common.Verify Capture Screenshot    Booking_S050    Verify Term & Condition

    Log    Step No.3 กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    b2c_return_business_page.Click Accept Condition Button
    # Expected
    b2c_return_business_page.Verify Label Link Return Business Popup
    ...    ${return_business.link_return_business['text_link_return_business']}
    ...    ${return_business.link_return_business['text_link_name']}
    ...    ${return_business.link_return_business['text_phone']}
    ...    ${return_business.link_return_business['text_name']}
    ...    ${return_business.link_return_business['text_shipping_payer']}
    ...    ${return_business.link_return_business['text_location_pickup']}
    ...    ${return_business.link_return_business['text_address']}
    ...    ${return_business.link_return_business['text_postcode']}

    b2c_return_business_page.Verify Data Link Return Business Popup
    ...    ${Booking_S050.old_return_business['link_name']}  # Expected result : ${EMPTY}
    ...    ${Booking_S050.old_return_business['phone']}  # Expected result : ${EMPTY}
    ...    ${Booking_S050.old_return_business['name']}  # Expected result : ${EMPTY}
    ...    ${Booking_S050.old_return_business['shipping_payer']}  # Expected result : ${EMPTY}
    ...    ${Booking_S050.old_return_business['location_pickup']}  # Expected result : ${EMPTY}
    ...    ${Booking_S050.old_return_business['address']}  # Expected result : ${EMPTY}
    ...    ${Booking_S050.old_return_business['postcode']}  # Expected result : ${EMPTY}
    common.Verify Capture Screenshot    Booking_S050    Verify Link Return Business Popup

    Log    step clear Input
    b2c_return_business_page.Clear Input

    Log    Step No.4 กรอกข้อมูล
    b2c_return_business_page.Input Link Name    ${Booking_S050.old_return_business['link_name']}
    b2c_return_business_page.Input Phone Receiver    ${Booking_S050.old_return_business['phone']}
    b2c_return_business_page.Input Name Receiver    ${Booking_S050.old_return_business['name']}
    b2c_return_business_page.Click Owner Pay    ${Booking_S050.old_return_business['shipping_payer']}
    b2c_return_business_page.Select Send To Home Tab
    b2c_return_business_page.Input Address Receiver    ${Booking_S050.old_return_business['address']}
    b2c_return_business_page.Input Postcode Receiver    ${Booking_S050.old_return_business['postcode_5_digits']}
    b2c_return_business_page.Click Postcode Receiver Lists    ${Booking_S050.old_return_business['postcode']}
    common.Verify Capture Screenshot    Booking_S050    Verify fill information Success

    Log    Step No.5 กดปุ่ม "บันทึก"
    b2c_return_business_page.Click Save Button
    #Expected
    b2c_return_business_page.Verify New Booking
    ...    ${Booking_S050.old_return_business['link_name']}
    ...    ${Booking_S050.old_return_business['name']}
    ...    ${Booking_S050.old_return_business['phone']}
    ...    ${Booking_S050.old_return_business['address']}
    ...    ${Booking_S050.old_return_business['postcode']}

    Log    Step No.6 กดที่รายการ Link : Return บริษัท ไอดีซี พรีเมียร์ จำกัด สาขาหลัก
    b2c_return_business_page.Click Booking Card
    ...    ${Booking_S050.old_return_business['link_name']}
    ...    ${Booking_S050.old_return_business['name']}
    ...    ${Booking_S050.old_return_business['phone']}
    ...    ${Booking_S050.old_return_business['address']}
    ...    ${Booking_S050.old_return_business['postcode']}    
    #Expected

    Log    Step No.7 กดปุ่ม "Download QR Code"
    
    #Expected

    Log    Step No.8 กดปุ่ม "Copy Link"

    #Expected


