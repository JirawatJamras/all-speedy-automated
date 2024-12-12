*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
                  ...    AND   Reset Cut Off Time
Test Teardown     Run Keywords    Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule    ${tomorrow}    ${Booking_S048.add_new_pickup['expected']}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S048
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า เรียกรถเข้ารับพัสดุ (ตรวจสอบรอบรถปกติเเละเพิ่มรอบพิเศษ)
    [Tags]    Booking    Business_To_Customer    UAT    Unknown    Defect086    Defect107
    Log    Login
    common.Open URL    ${B2C_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "บริการขนส่งพัสดุ > เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    ${date}    Get Normal Parcel Pickup Date    ${Booking_S048['pickup_point']}
    Set Yesterday    ${date}
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Car Pickup Schedule Card
    ...    ${call_car_pick_up.status['parcel_in_progress']}
    ...    ${call_car_pick_up.car_round_name['normal']}
    ...    ${date}
    ...    ${Booking_S048.add_new_pickup['expected']}
    ...    ${yesterday}
    ...    ${call_car_pick_up['text_parcel_number']}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${call_car_pick_up['text_price']}
    ...    ${call_car_pick_up.default['price']}
    ...    ${call_car_pick_up['text_pickup_location']}
    ...    ${Booking_S048['pickup_point']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S048    1.Verify Car Pickup Schedule Card

    Log    Step No.2 กดปุ่ม "เพิ่ม"
    b2c_call_car_pick_up_parcel_page.Click Add Button
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Popup Parcel Pickup Schedule
    ...    ${call_car_pick_up['text_parcel_pickup_schedule']}
    ...    ${call_car_pick_up['text_car_round_name']}
    ...    ${call_car_pick_up['text_parcel_type']}
    ...    ${call_car_pick_up['text_parcel_pickup_date']}
    ...    ${call_car_pick_up['text_parcel_pickup_time']}
    ...    ${call_car_pick_up['button_save']}
    ...    ${call_car_pick_up['button_cancel']}
    common.Verify Capture Screenshot    booking    Booking_S048    2.Verify Popup Parcel Pickup Schedule

    Log    Step No.3 รอบรถเข้ารับพัสดุ
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${Booking_S048.add_new_pickup['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${Booking_S048.add_new_pickup['input']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S048    3.Verify Input Parcel Pickup Schedule In Add Popup

    Log    Step No.4 กดปุ่ม "บันทึก"
    b2c_call_car_pick_up_parcel_page.Click Save Button
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Added New Parcel Pickup
    ...    ${call_car_pick_up.status['parcel_in_progress']}
    ...    ${Booking_S048.add_new_pickup['parcel_type']}
    ...    ${call_car_pick_up.car_round_name['special']}
    ...    ${tomorrow}
    ...    ${Booking_S048.add_new_pickup['expected']}
    ...    ${today}
    ...    ${call_car_pick_up['text_parcel_number']}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${call_car_pick_up['text_price']}
    ...    ${call_car_pick_up.default['price']}
    ...    ${call_car_pick_up['text_pickup_location']}
    ...    ${Booking_S048.add_new_pickup['pickup_point']}
    common.Verify Capture Screenshot    booking    Booking_S048    4.Verify Added New Parcel Pickup