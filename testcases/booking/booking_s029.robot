*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S029
    [Documentation]    Log-In เข้าใช้งานระบบ สำหรับ ลูกค้า C-Booking จองการจัดส่งพัสดุ
    [Tags]    Booking    Login_Customer_To_Customer    Regression
    Log    Step No.1 Login
    c2c_login.Input Email And Password    ${c2c_login_user_01['username']}    ${c2c_login_user_01['password']}
    c2c_login.Click Log On Button
    # Expected
    c2c_landing_page.Verify Login Success    ${c2c_login_user_01['username']}
    common.Verify Capture Screenshot    booking    Booking_S029    1.Verify 7-Eleven Home Page

    Log    Step No.2 หน้า Home
    c2c_landing_page.Click Menu Seven Store
    c2c_landing_page.Click Menu Shipping
    # Expected
    b2c_booking_delivery_page.Verify Booking Page For General Customer
    common.Verify Capture Screenshot    booking    Booking_S029    2.Verify SPEED-D Parcel Delivery Booking Page