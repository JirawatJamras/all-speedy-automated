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
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Prerequisite S050


    Log    Step No.1 กรอกเบอร์โทรศัพท์ เเละกดปุ่มยืนยัน
    Go To    https://www-uat.allspeedy.co.th/return-business/email-link/2410005650
    b2c_booking_detail_page.Input Trigger Phone Number    ${Booking_S050.old_return_business['phone']}
    b2c_booking_detail_page.Click Confirm Button
    ${booking_id}    Get Booking ID
    ${booking_name}    Get Booking Name
    # Expected
    b2c_booking_detail_page.Verify Booking Detail Page [Not Have Parcel List]
    ...    ${booking_id}
    ...    ${booking_name}
    common.Verify Capture Screenshot    Booking_S051     Verify Booking Detail Page
    