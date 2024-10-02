*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***

B2C_VerifyPicupTime_009_001
    [Documentation]    [ตรวจสอบ แก้ไข และลบรายการเรียกรถเข้ารับพัสดุ] กรณี ตรวจสอบรายการรอบรถเข้ารับพัสดุ
    ...                                                         , กรณี ตรวจสอบรายละเอียดรายการรอบรถเข้ารับพัสดุ
    ...                                                         , กรณี ตรวจสอบรายละเอียดรายการรอบรถเข้ารับพัสดุกรณี กดปุ่ม "บันทึก"
    [Tags]    B2C_VerifyPicupTime_009    UAT    High    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Verify Pickup Parcel Schedule Page
    common.Verify Capture Screenshot    B2C_VerifyPicupTime_009_001    Verify Pickup Parcel Schedule Page
    b2c_call_car_pick_up_parcel_page.Click Select Item On Parcel Pickup Schedule List
    b2c_call_car_pick_up_parcel_page.Verify Information Detail Popup of Parcel Pickup Schedule
    common.Verify Capture Screenshot    B2C_VerifyPicupTime_009_001    Verify Information Detail Popup of Parcel Pickup Schedule
    common.Scroll Into View By Xpath    ${b2c_txt_select_pickup_booking_list_in_detail_popup}    true
    b2c_call_car_pick_up_parcel_page.Verify Information Detail Popup of Select Pickup Booking List
    common.Verify Capture Screenshot    B2C_VerifyPicupTime_009_001    Verify Information Detail Popup of Select Pickup Booking List
    b2c_call_car_pick_up_parcel_page.Click Save button
    b2c_call_car_pick_up_parcel_page.Verify Saved Popup Is Visible
    common.Verify Capture Screenshot    B2C_VerifyPicupTime_009_001    Verify Saved Popup Is Visible
    b2c_call_car_pick_up_parcel_page.Verify Pickup Parcel Schedule Page
    common.Verify Capture Screenshot    B2C_VerifyPicupTime_009_001    Verify Pickup Parcel Schedule Page After Saved

B2C_VerifyPicupTime_009_002
    [Documentation]    [ตรวจสอบ แก้ไข และลบรายการเรียกรถเข้ารับพัสดุ] กรองข้อมูลรายการรอบรถเข้ารับพัสดุกรณี กดปุ่ม "ตัวกรอง" เปิด
    ...                                                         , กรองข้อมูลรายการรอบรถเข้ารับพัสดุ กรณี กดปุ่ม "ตัวกรอง" ปิด
    [Tags]    B2C_VerifyPicupTime_009    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Click Open Filter
    b2c_call_car_pick_up_parcel_page.Verify Open Filter Section
    common.Verify Capture Screenshot    B2C_VerifyPicupTime_009_002    Verify Open Filter Section
    b2c_call_car_pick_up_parcel_page.Click Close Filter
    b2c_call_car_pick_up_parcel_page.Verify Close Filter Section
    common.Verify Capture Screenshot    B2C_VerifyPicupTime_009_002    Verify Close Filter Section
    