*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Run Keywords    b2c_call_car_pick_up_parcel_page.Delete The Lastest Parcel Pickup Schedule
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S018
    [Documentation]    สร้างรอบรถเข้ารับพัสดุ (รอบพิเศษ)
    [Tags]    Booking    UAT    Review_Pass
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "บริการขนส่งพัสดุ > เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    Booking_S018    Verify Navigate To Call Car Pick Up Page

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
    b2c_call_car_pick_up_parcel_page.Get The Highest Displayed Date And Set New Highest Date
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
    common.Verify Capture Screenshot    Booking_S018    Verify Popup Parcel Pickup Schedule

    Log    Step No.3 รอบรถเข้ารับพัสดุ
    b2c_call_car_pick_up_parcel_page.Click Parcel Type Dropdown
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown    ${Booking_S018['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Date Button
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${Booking_S018.pickup_time['input']}
    # Expected
    common.Verify Capture Screenshot    Booking_S018    Verify Input Parcel Pickup Schedule In Add Popup

    Log    Step No.4 กดปุ่ม "บันทึก"
    b2c_call_car_pick_up_parcel_page.Click Save Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Added New Car Pickup Schedule
    ...    ${Booking_S018['parcel_type']}
    ...    ${call_car_pick_up.car_round_name['special']}
    ...    ${newDate}
    ...    13:00:00 - 16:00    #${Booking_S018.pickup_time['expected']}
    ...    13:00:00 -16:00    #${Booking_S018.pickup_time['expected']}
    ...    200 ชั้น 19 ห้อง1901 จัสมินอินเตอร์เนชั่นแนลทาวเวอร์ ปากเกร็ด ปากเกร็ด นนทบุรี 11120 กำลังจัดพัสดุ    #{Booking_S018['pickup_point']}
    common.Verify Capture Screenshot    Booking_S018    Verify Added New Car Pickup Schedule