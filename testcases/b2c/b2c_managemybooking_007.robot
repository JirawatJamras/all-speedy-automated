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
    b2c_manage_my_booking_page.Verify Parcels In Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_03    Verify Search Results When Parcel Number Is Inputted Correctly
    b2c_manage_my_booking_page.Click Remove Data In Search Button
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Parcels In Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_03    Verify Search Results When Not Input Parcel Number

B2C_SearchTracking_007_04
    [Documentation]    [ตรวจสอบพัสดุของฉัน] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง
    ...                กรอกค้นหาหมายเลขพัสดุ ไม่เป็นตัวอักษรภาษาอังกฤษ ตัวเลข,
    ...                กรอกค้นหาหมายเลขพัสดุ เกิน 20 ตัวอักษร
    [Tags]    B2C_SearchTracking_007    UAT    Low    Regression
    # The expected result do not match the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Input Parcel Number In Filter    ${ฺB2C_Manange_My_Booking_007_04.input1_parcel_number}
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Error Message In Modal    ${ฺB2C_Manange_My_Booking_007_04.error_msg}
    common.Verify Capture Screenshot    B2C_SearchTracking_007_04    Verify Search Result When Input Parcel Number Is Not English Alphabets And Numbers
    b2c_manage_my_booking_page.Click Remove Data In Search Button
    b2c_manage_my_booking_page.Input Parcel Number In Filter    ${ฺB2C_Manange_My_Booking_007_04.input2_parcel_number}
    b2c_manage_my_booking_page.Verify Error Message In Modal    ${ฺB2C_Manange_My_Booking_007_04.error_msg}
    common.Verify Capture Screenshot    B2C_SearchTracking_007_04    Verify Search Result When Input Parcel Number Exceed Specifies

B2C_SearchTracking_007_05
    [Documentation]    [ตรวจสอบพัสดุของฉัน] กรอกค้นหาผู้รับพัสดุ ถูกต้อง
    ...                กรอกค้นหาผู้รับพัสดุ เป็นตัวอักษรภาษาไทย อังกฤษ และ ไม่เกิน 50 ตัวอักษร,
    ...                ไม่กรอกค้นหาผู้รับพัสดุ
    [Tags]    B2C_SearchTracking_007    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Input Name In Filter    ${ฺB2C_Manange_My_Booking_007_05.name}
    b2c_manage_my_booking_page.Verify Input Name In Filter
    common.Verify Capture Screenshot    B2C_SearchTracking_007_05    Verify Input Name In Filter
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Parcels In Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_05    Verify Search Results When Name Is Inputted Correctly
    b2c_manage_my_booking_page.Click Remove Data In Search Button
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Parcels In Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_05    Verify Search Results When Not Input Name

B2C_SearchTracking_007_06
    [Documentation]    [ตรวจสอบพัสดุของฉัน] กรอกค้นหาผู้รับพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาผู้รับพัสดุ ไม่เป็นตัวอักษรภาษาไทย อังกฤษ,
    ...                กรอกค้นหาผู้รับพัสดุ เกิน 50 ตัวอักษร
    [Tags]    B2C_SearchTracking_007    UAT    Low    Regression
    # The expected result do not match the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Input Name In Filter    ${ฺB2C_Manange_My_Booking_007_06.input1_name}
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Error Message In Modal    ${ฺB2C_Manange_My_Booking_007_06.error_msg}
    common.Verify Capture Screenshot    B2C_SearchTracking_007_06    Verify Search Result When Input Name Is Not Alphabets
    b2c_manage_my_booking_page.Click Remove Data In Search Button
    b2c_manage_my_booking_page.Input Name In Filter    ${ฺB2C_Manange_My_Booking_007_06.input2_name}
    b2c_manage_my_booking_page.Verify Error Message In Modal    ${ฺB2C_Manange_My_Booking_007_06.error_msg}
    common.Verify Capture Screenshot    B2C_SearchTracking_007_06    Verify Search Result When Input Name Exceed Specifies

B2C_SearchTracking_007_07
    [Documentation]    [ตรวจสอบพัสดุของฉัน] กรอกค้นหาที่อยู่จัดส่ง ถูกต้อง
    ...                กรอกค้นหาที่อยู่จัดส่ง เป็นตัวอักษรภาษาไทย อังกฤษ ตัวเลข อักขระ /- และ ไม่เกิน 100 ตัวอักษร,
    ...                ไม่กรอกค้นหาที่อยู่จัดส่ง
    [Tags]    B2C_SearchTracking_007    UAT1    Medium    Regression
    # The website does not filter parcels that match the address inputted in address textbox.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu My Parcel
    b2c_manage_my_booking_page.Click Filter Button
    b2c_manage_my_booking_page.Input Address In Filter    ${ฺB2C_Manange_My_Booking_007_07.address}
    b2c_manage_my_booking_page.Verify Input Address In Filter
    common.Verify Capture Screenshot    B2C_SearchTracking_007_07    Verify Input Address In Filter
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Parcels In Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_07    Verify Search Results When Address Is Inputted Correctly
    b2c_manage_my_booking_page.Click Remove Data In Search Button
    b2c_manage_my_booking_page.Click Search Button
    b2c_manage_my_booking_page.Verify Parcels In Search Result
    common.Verify Capture Screenshot    B2C_SearchTracking_007_07    Verify Search Results When Not Input Address