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
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Get The Highest Displayed Date And Set New Highest Date
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Verify Popup Parcel Pickup Schedule
    b2c_call_car_pick_up_parcel_page.Verify Car Round Name Dropdown Was Disabled
    b2c_call_car_pick_up_parcel_page.Verify Unselected Parcel Type In Dropdown    ${B2C_AddPickupTime_008_001.parcelType.unselected['expected']}
    b2c_call_car_pick_up_parcel_page.Verify Unselected Date Pickup Parcel    ${B2C_AddPickupTime_008_001.pickupDate.unselected['expected']}
    b2c_call_car_pick_up_parcel_page.Verify Unselected Pickup Parcel Time    ${B2C_AddPickupTime_008_001.pickupTime.unselected['expected']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Popup Parcel Pickup Schedule Is All Default Value
    b2c_call_car_pick_up_parcel_page.Click Parcel Type Dropdown
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown      ${B2C_AddPickupTime_008_001.parcelType.selectMoreThan1selection['input1']}
    b2c_call_car_pick_up_parcel_page.Verify Select Parcel Type In Dropdown    ${B2C_AddPickupTime_008_001.parcelType.selectMoreThan1selection['input1']}
    b2c_call_car_pick_up_parcel_page.Click Parcel Type Dropdown
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Select Parcel Type In Dropdown Which Can Not One Time Select More Than 1 Type
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown      ${B2C_AddPickupTime_008_001.parcelType.selectMoreThan1selection['input2']}
    b2c_call_car_pick_up_parcel_page.Verify Select Parcel Type In Dropdown    ${B2C_AddPickupTime_008_001.parcelType.selectMoreThan1selection['input2']}
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Date Button
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Calendar Pickup Parcel Date
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Verify Selected Date Pickup Parcel Future Date
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Selected Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Date Button
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Date Pickup Parcel Can Not Be Select Previouse Date
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Previouse Date
    b2c_call_car_pick_up_parcel_page.Verify Date Pickup Parcel Can Not Be Select Previouse Date    ${B2C_AddPickupTime_008_001.pickupDate.previousDate['expected']}
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Time Button
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Select Pickup Parcel Time Which Can Not One Time Select More Than 1 Type
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${B2C_AddPickupTime_008_001.pickupTime.select['input']}
    b2c_call_car_pick_up_parcel_page.Verify Selected Pickup Parcel Time    ${B2C_AddPickupTime_008_001.pickupTime.select['input']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Selected Pickup Parcel Time
    b2c_call_car_pick_up_parcel_page.Click Clear Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Edit Pickup Parcel Time    ${B2C_AddPickupTime_008_001.pickupTime.edit['input']}
    b2c_call_car_pick_up_parcel_page.Verify Can Not Edit Pickup Parcel Time    ${B2C_AddPickupTime_008_001.pickupTime.edit['input']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Can Not Edit Pickup Parcel Time
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${B2C_AddPickupTime_008_001.pickupTime.select['input']}
    b2c_call_car_pick_up_parcel_page.Click Save Button
    b2c_call_car_pick_up_parcel_page.Verify Saved Popup Is Visible
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Saved Popup Is Visible
    b2c_call_car_pick_up_parcel_page.Verify Saved Information In Visible In List    ${B2C_AddPickupTime_008_001}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_001    Verify Saved Information In Visible In List
    b2c_call_car_pick_up_parcel_page.Delete The Lastest Parcel Pickup Schedule

B2C_AddPickupTime_008_004
    [Documentation]    [เพิ่มรายการรอบรถเข้ารับพัสดุ] กรณี กดปุ่ม "ยกเลิก"
    [Tags]    B2C_AddPickupTime_008    UAT    Low    Non-Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Get The Highest Displayed Date And Set New Highest Date
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Click Parcel Type Dropdown
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown    ${B2C_AddPickupTime_008_004.parcelType['input']}
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Date Button
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${B2C_AddPickupTime_008_004.pickupTime['input']}
    b2c_call_car_pick_up_parcel_page.Click Cancel Button On Parcel Pickup Schedule Popup
    b2c_call_car_pick_up_parcel_page.Verify Asking Popup To Close Popup    ${B2C_AddPickupTime_008_004.askingPopup['expected']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_004    Verify Asking Popup To Close Popup

B2C_AddPickupTime_008_005
    [Documentation]    [เพิ่มรายการรอบรถเข้ารับพัสดุ] กรณี กดปุ่มปิด "X"
    [Tags]    B2C_AddPickupTime_008    UAT    Low    Non-Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Get The Highest Displayed Date And Set New Highest Date
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Click Parcel Type Dropdown
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown    ${B2C_AddPickupTime_008_005.parcelType['input']}
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Date Button
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${B2C_AddPickupTime_008_005.pickupTime['input']}
    b2c_call_car_pick_up_parcel_page.Click X Button On Parcel Pickup Schedule Popup
    b2c_call_car_pick_up_parcel_page.Verify Asking Popup To Close Popup    ${B2C_AddPickupTime_008_005.askingPopup['expected']}
    common.Verify Capture Screenshot    B2C_AddPickupTime_008_005    Verify Asking Popup To Close Popup

B2C_AddPickupTime_008_006
    [Documentation]    [เพิ่มรายการรอบรถเข้ารับพัสดุ] ระบบจะแสดง Pop Up แจ้งเตือน "ต้องการการปิด Pop-Up หรือไม่ ข้อมูลที่กรอกจะไม่บันทึก" กรณี กดปุ่ม "ตกลง"
    [Tags]    B2C_AddPickupTime_008    UAT   Low    Non-Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Call Car Pick Up
    b2c_call_car_pick_up_parcel_page.Get The Highest Displayed Date And Set New Highest Date
    b2c_call_car_pick_up_parcel_page.Click Add Button
    b2c_call_car_pick_up_parcel_page.Click Parcel Type Dropdown
    b2c_call_car_pick_up_parcel_page.Select Parcel Type Dropdown    ${B2C_AddPickupTime_008_006.parcelType['input']}
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Date Button
    b2c_call_car_pick_up_parcel_page.Select Date Pickup Parcel Future Date
    b2c_call_car_pick_up_parcel_page.Click Pickup Parcel Time Button
    b2c_call_car_pick_up_parcel_page.Select Pickup Parcel Time    ${B2C_AddPickupTime_008_006.pickupTime['input']}
    b2c_call_car_pick_up_parcel_page.Click X Button On Parcel Pickup Schedule Popup
    b2c_call_car_pick_up_parcel_page.Click Confirm To Close Parcel Pickup Schedule Popup Button
    b2c_call_car_pick_up_parcel_page.Verify Website Never Save Sender Information        ${B2C_AddPickupTime_008_006}
