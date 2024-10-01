*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***

B2C_AddPickupTime_008_001
    [Documentation]    [เพิ่มรายการรอบรถเข้ารับพัสดุ] กรณี กดปุ่ม "+ เพิ่ม"
    [Tags]    B2C_AddPickupTime_008    UAT    High    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Verify Popup Parcel Pickup Schedule
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Popup Parcel Pickup Schedule
    b2c_call_car_pick_up_parcel_page.Verify Car Round Name Dropdown Was Disabled
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Car Round Name Dropdown Was Disabled
    b2c_call_car_pick_up_parcel_page.Verify Unselected Parcel Type In Dropdown    ${B2C_AddPickupTime_008_01.parcelType.unselected['expected']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Unselected Parcel Type In Dropdown
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown      ${B2C_AddPickupTime_008_01.parcelType.selectMoreThan1selection['input1']}
    b2c_call_car_pick_up_parcel_page.Verify Select Parcel Type In Dropdown    ${B2C_AddPickupTime_008_01.parcelType.selectMoreThan1selection['input1']}
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown      ${B2C_AddPickupTime_008_01.parcelType.selectMoreThan1selection['input2']}
    b2c_call_car_pick_up_parcel_page.Verify Select Parcel Type In Dropdown    ${B2C_AddPickupTime_008_01.parcelType.selectMoreThan1selection['input2']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Select Parcel Type In Dropdown Which Can Not One Time Select More Than 1 Type
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Verify Selected Date Pickup Parcel Future Date
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Selected Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Verify Unselected Date Pickup Parcel    ${B2C_AddPickupTime_008_01.pickupDate.unselected['expected']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Unselected Date Pickup Parcel
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Previouse Date
    b2c_call_car_pick_up_parcel_page.Verify Date Pickup Parcel Can Not Be Select Previouse Date    ${B2C_AddPickupTime_008_01.pickupDate.previousDate['expected']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Date Pickup Parcel Can Not Be Select Previouse Date
    b2c_call_car_pick_up_parcel_page.Verify Unselected Pickup Parcel Time    ${B2C_AddPickupTime_008_01.pickupTime.unselected['expected']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Pickup Parcel Time Show Defaul value
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${B2C_AddPickupTime_008_01.pickupTime.select['input']}
    b2c_call_car_pick_up_parcel_page.Verify Selected Pickup Parcel Time    ${B2C_AddPickupTime_008_01.pickupTime.select['input']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Selected Pickup Parcel Time
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Select Pickup Parcel Time Which Can Not One Time Select More Than 1 Type
    b2c_call_car_pick_up_parcel_page.Click Clear Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Edit Pickup Parcel Time    ${B2C_AddPickupTime_008_01.pickupTime.edit['input']}
    b2c_call_car_pick_up_parcel_page.Verify Can Not Edit Pickup Parcel Time    ${B2C_AddPickupTime_008_01.pickupTime.edit['input']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Can Not Edit Pickup Parcel Time
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${B2C_AddPickupTime_008_01.pickupTime.select['input']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    b2c_call_car_pick_up_parcel_page.Verify Saved Popup Is Visible
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Saved Popup Is Visible
    b2c_call_car_pick_up_parcel_page.Verify Saved Information In Visible In List
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_01    Verify Saved Information In Visible In List