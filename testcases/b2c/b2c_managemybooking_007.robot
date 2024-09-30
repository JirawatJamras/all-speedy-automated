*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
B2C_SearchTracking_007_01
    [Documentation]             [ตรวจสอบพัสดุของฉัน] ตรวจสอบ Tab "อยู่ระหว่างจัดส่ง"
    [Tags]    B2C_SearchTracking_007_01    UAT1    High    Regression    ??
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Verify My Parcel Page
    common.Verify Capture Screenshot    B2C_SearchTracking_007_01    Verify My Parcel Page
    b2c_manage_my_booking_page.Click Delivered Parcel Button
    b2c_manage_my_booking_page.Verify Activate Delivered Parcel Button
    common.Verify Capture Screenshot    B2C_SearchTracking_007_01    Verify Activate Delivered Parcel Button
    b2c_manage_my_booking_page.Click In Transit Button
    b2c_manage_my_booking_page.Verify Activate In Transit Button
    common.Verify Capture Screenshot    B2C_SearchTracking_007_01    Verify In Transit Button
    b2c_manage_my_booking_page.Verify Parcels In Tab Is In Transit
    common.Verify Capture Screenshot    B2C_SearchTracking_007_01    Verify Parcels In Tab Is In Transit

