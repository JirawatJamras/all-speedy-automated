*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S029
    [Documentation]    Log-In เข้าใช้งานระบบ สำหรับ ลูกค้า C-Booking จองการจัดส่งพัสดุ
    [Tags]    Booking    UAT    Pass
    Log    Step No.1 Log-In
    common.Open URL    ${C2C_UAT_URL}
    c2c_landing_page.Click Log In Button In Landing Page
    c2c_login.Input Email    ${c2c_login_user_01['username']}
    c2c_login.Input Password    ${c2c_login_user_01['password']}
    c2c_login.Click Log On Button
    # Expected
    c2c_landing_page.Verify Login Success    ${c2c_login_user_01['username']}
    common.Verify Capture Screenshot    Booking_S029    Verify 7-Eleven Home Page

    Log    Step No.2 หน้า Home
    c2c_landing_page.Click Menu Seven Store
    c2c_landing_page.Click Menu Shipping
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For General Customer
    common.Verify Capture Screenshot    Booking_S029    Verify SPEED-D Parcel Delivery Booking Page