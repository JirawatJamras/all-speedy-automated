*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
B2C_SearchTracking_007_01
    [Documentation]    [ตรวจสอบพัสดุของฉัน] ตรวจสอบพัสดุของฉัน,
    ...                ตรวจสอบรายการพัสดุที่จัดส่ง,
    ...                ตรวจสอบ Tab "อยู่ระหว่างจัดส่ง"
    [Tags]    B2C_SearchTracking_007    UAT    Low    Regression    In_Review
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
    common.Verify Capture Screenshot    B2C_SearchTracking_007_01    Verify Activate In Transit Button
    b2c_manage_my_booking_page.Verify Parcels In Tab Is In Transit
    common.Verify Capture Screenshot    B2C_SearchTracking_007_01    Verify Parcels In Tab Is In Transit

B2C_SearchTracking_007_02
    [Documentation]    [ตรวจสอบพัสดุของฉัน] กรองข้อมูล Tab "อยู่ระหว่างจัดส่ง",
    ...                กรณี กดปุ่มเปิดและปิด "ตัวกรอง"
    [Tags]    B2C_SearchTracking_007    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Verify Open Filter Form
    common.Verify Capture Screenshot    B2C_SearchTracking_007_02    Verify Open Filter Form
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Verify Close Filter Form
    common.Verify Capture Screenshot    B2C_SearchTracking_007_02    Verify Close Filter Form

B2C_SearchTracking_007_03
    [Documentation]    [ตรวจสอบพัสดุของฉัน] กรอกค้นหาหมายเลขพัสดุ ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ เป็นตัวอักษรภาษาอังกฤษ ตัวเลข และ ไม่เกิน 20 ตัวอักษร,
    ...                ไม่กรอกค้นหาหมายเลขพัสดุ
    [Tags]    B2C_SearchTracking_007    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Input Parcel Number In Filter    ${ฺB2C_Manange_My_Booking_007_03.parcel_number}
    b2c_manage_my_booking_page.Verify Input Parcel Number In Filter
    common.Verify Capture Screenshot    B2C_SearchTracking_007_03    Verify Input Parcel Number In Filter
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Parcel Number Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_03    Verify Parcel Number Search Results
    b2c_manage_my_booking_page.Click Remove Parcel Number Search Button
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Parcel Number Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_03    Verify Search Results When Not Input Parcel Number

B2C_SearchTracking_007_04
    [Documentation]    [ตรวจสอบพัสดุของฉัน] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง
    [Tags]    B2C_SearchTracking_007    UAT    Low    Regression    In_Progress
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Input Parcel Number In Filter    ${ฺB2C_Manange_My_Booking_007_04.input1_parcel_number}
    b2c_manage_my_booking_page.Verify Input Incorrect Parcel Number Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_04    Verify Input Incorrect Parcel Number Search Result
    b2c_manage_my_booking_page.Click Remove Parcel Number Search Button
    b2c_manage_my_booking_page.Input Parcel Number In Filter    ${ฺB2C_Manange_My_Booking_007_04.input2_parcel_number}
    b2c_manage_my_booking_page.Verify Search Result When Input Parcel Number More Than 20 Characters
    common.Verify Capture Screenshot    B2C_SearchTracking_007_04    Verify Search Result When Input Parcel Number More Than 20 Characters