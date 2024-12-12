*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND    Set Folder Result with date
                  ...    AND    Reset Cut Off Time
Test Teardown     Run Keywords   Go To Call Car Pickup Menu And Delete The Lastest Parcel Pickup Schedule    ${tomorrow}    ${Booking_S018.pickup_time['expected']}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S018
    [Documentation]    สร้างรอบรถเข้ารับพัสดุ (รอบพิเศษ)
    [Tags]    Booking    Parcel_Pickup_Schedule    UAT    Unknown    Defect086    Defect087
    Log    Login
    b2c_login_page.Input Email And Password
    b2c_login_page.Click Log On Button

    Log    Step No.1 กดเมนู "บริการขนส่งพัสดุ > เรียกรถเข้ารับพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Call Car Pick Up Page    ${call_car_pick_up['text_call_car_pick_up']}
    common.Verify Capture Screenshot    booking    Booking_S018    1.Verify Navigate To Call Car Pick Up Page

    Log    Step No.2 กดปุ่ม "+ เพิ่ม"
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
    common.Verify Capture Screenshot    booking    Booking_S018    2.Verify Popup Parcel Pickup Schedule

    Log    Step No.3 รอบรถเข้ารับพัสดุ
    Set Tomorrow Date
    b2c_call_car_pick_up_parcel_page.Select Parcel Type    ${Booking_S018['parcel_type']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Date    ${tomorrow}
    b2c_call_car_pick_up_parcel_page.Select Parcel Pickup Time    ${Booking_S018.pickup_time['input']}
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S018    3.Verify Input Parcel Pickup Schedule In Add Popup

    Log    Step No.4 กดปุ่ม "บันทึก"
    Set Today
    b2c_call_car_pick_up_parcel_page.Click Save Button
    b2c_booking_detail_page.Wait Until Loading Icon Success
    # Expected
    b2c_call_car_pick_up_parcel_page.Verify Added New Parcel Pickup
    ...    ${call_car_pick_up.status['parcel_in_progress']}
    ...    ${Booking_S018['parcel_type']}
    ...    ${call_car_pick_up.car_round_name['special']}
    ...    ${tomorrow}
    ...    ${Booking_S018.pickup_time['expected']}
    ...    ${today}
    ...    ${call_car_pick_up['text_parcel_number']}
    ...    ${call_car_pick_up.default['parcel_number']}
    ...    ${call_car_pick_up['text_price']}
    ...    ${call_car_pick_up.default['price']}
    ...    ${call_car_pick_up['text_pickup_location']}
    ...    ${Booking_S018['pickup_point']}
    common.Verify Capture Screenshot    booking    Booking_S018    4.Verify Added New Parcel Pickup