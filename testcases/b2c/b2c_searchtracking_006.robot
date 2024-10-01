*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
B2C_SearchTracking_006_01
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลข Tracking พัสดุ ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ เป็นตัวอักษรภาษาอังกฤษ ตัวเลข และ ไม่เกิน 20 ตัวอักษร,
    ...                กรอกค้นหาหมายเลขพัสดุ ครั้งละ 10 หมายเลข โดยในแต่ละหมายเลขเว้นวรรคเพื่อแยกจากกัน
    [Tags]    B2C_SearchTracking_006    UAT    High    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Verify Tracking Parcel Delivery Page
    common.Verify Capture Screenshot    B2C_SearchTracking_006_01    Verify Tracking Parcel Delivery Page
    b2c_search_tracking_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Search_Tracking_006_01.input1_parcel_number}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_01    Verify Input Parcel Number
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Parcel Search Results    ${b2c_txt_parcel_search_results}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_01    Verify Parcel Search Results
    b2c_search_tracking_page.Click Remove Search Parcel Button
    b2c_search_tracking_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Search_Tracking_006_01.input2_parcel_number}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_01    Verify Parcel Number Input Contains 10 Numbers With Spaces Between Each Number
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Parcel Search Results When Searching For More Than 1 Parcel    ${b2c_txt_many_parcel_search_results}    ${b2c_txt_amount_of_parcel_search_results}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_01    Verify Parcel Search Results 10 Parcel Numbers

B2C_SearchTracking_006_02
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ถูกต้อง,
    ...                กรอกค้นหา ชื่อผู้รับพัสดุ เป็นตัวอักษรภาษาไทย อังกฤษ และ ไม่เกิน 50 ตัวอักษร
    [Tags]  B2C_SearchTracking_006    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_02.name}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_02    Verify Input Receiver Name
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Parcel Search Results    ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_02    Verify Parcel Search Results

B2C_SearchTracking_006_03
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาเบอร์โทรศัพท์ ถูกต้อง,
    ...                กรอกค้นหาเบอร์โทรศัพท์ เป็นตัวเลข และ ไม่เกิน 10 หลัก
    [Tags]  B2C_SearchTracking_006    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_03.phone}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_03    Verify Input Receiver Name
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Parcel Search Results    ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_03    Verify Parcel Search Results


B2C_SearchTracking_006_04
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่กรอกค้นหาหมายเลขพัสดุ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุหมายเลขพัสดุ
    common.Verify Capture Screenshot    B2C_SearchTracking_006_04    Verify Error Message Parcel Number Not Inputted

B2C_SearchTracking_006_05
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ ไม่เป็นตัวอักษรภาษาอังกฤษ ตัวเลข
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${ฺB2C_Search_Tracking_006_05.parcel_number}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_05    Verify Input Parcel Number
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุหมายเลขพัสดุ ให้ถูกต้อง
    common.Verify Capture Screenshot    B2C_SearchTracking_006_05    Verify Error Message Input Incorrect Parcel Number

B2C_SearchTracking_006_06
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ เกิน 20 ตัวอักษร
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${ฺB2C_Search_Tracking_006_06.parcel_number}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_06    Verify Input Parcel Number
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุหมายเลขพัสดุ ให้ถูกต้อง
    common.Verify Capture Screenshot    B2C_SearchTracking_006_06    Verify Error Message Input Incorrect Parcel Number

B2C_SearchTracking_006_07
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ เกินครั้งละ 10 หมายเลข
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression
    # The expected results are displayed 10 parcels but the website is displayed more than 10 parcels.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Search_Tracking_006_07.parcel_number}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_07    Verify Input Parcel Number
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Search Results When Search More Than 10 Parcels     ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_07    Verify Search Results When Search More Than 10 Parcels

B2C_SearchTracking_006_08
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ ครั้งละ 10 หมายเลข โดยในแต่ละหมายเลขไม่เว้นวรรคเพื่อแยกจากกัน 
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Search_Tracking_006_08.parcel_number}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_08    Verify Input Parcel Number
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุหมายเลขพัสดุ ให้ถูกต้อง
    common.Verify Capture Screenshot    B2C_SearchTrackingy_006_08    Verify Error Message Input Incorrect Parcel Number

B2C_SearchTracking_006_09
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่กรอกค้นหาชื่อและเบอร์โทรศัพท์ผู้รับพัสดุ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณระบุชื่อหรือเบอร์โทรผู้รับ
    common.Verify Capture Screenshot    B2C_SearchTracking_006_09    Verify Error Message Name Or Phone Not Inputted    

B2C_SearchTracking_006_10
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาชื่อผู้รับพัสดุ ไม่เป็นตัวอักษรภาษาไทย อังกฤษ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_10.name}
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุผู้ชื่อรับพัสดุ/เบอร์โทรศัพท์ ให้ถูกต้อง
    common.Verify Capture Screenshot    B2C_SearchTracking_006_10    Verify Error Message Input Incorrect Name Or Phone

B2C_SearchTracking_006_11
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาชื่อผู้รับพัสดุ เกิน 50 ตัวอักษร
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_11.name}
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุผู้ชื่อรับพัสดุ/เบอร์โทรศัพท์ ให้ถูกต้อง
    common.Verify Capture Screenshot    B2C_SearchTracking_006_11    Verify Error Message Input Incorrect Name Or Phone

B2C_SearchTracking_006_12
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง,
    ...                กรอกเบอร์โทรศัพท์ ไม่เป็นตัวเลข
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_12.phone}
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุผู้ชื่อรับพัสดุ/เบอร์โทรศัพท์ ให้ถูกต้อง
    common.Verify Capture Screenshot    B2C_SearchTracking_006_12    Verify Error Message Input Incorrect Name Or Phone

B2C_SearchTracking_006_13
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง,
    ...                กรอกเบอร์โทรศัพท์ เกิน 10 หลัก
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_13.phone}
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Verify Error Message In Modal    กรุณาระบุผู้ชื่อรับพัสดุ/เบอร์โทรศัพท์ ให้ถูกต้อง
    common.Verify Capture Screenshot    B2C_SearchTracking_006_13    Verify Error Message Input Incorrect Name Or Phone

B2C_SearchTracking_006_14
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] เลือกสถานะพัสดุ ถูกต้อง,
    ...                เลือกสถานะพัสดุ 1 ตัวเลือก
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_14.name}
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Click Filter Button
    common.Verify Capture Screenshot    B2C_SearchTracking_006_14    Verify Filter Dropdown List Displayed When Filter Is Turned On
    b2c_search_tracking_page.Select Filter    รับพัสดุเข้าระบบ
    b2c_search_tracking_page.Verify Parcel Status    รับพัสดุเข้าระบบ
    common.Verify Capture Screenshot    B2C_SearchTracking_006_14    Verify Parcels Displayed When Filtering Status

B2C_SearchTracking_006_15
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่เลือกเลือกสถานะพัสดุ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_search_tracking_page.Click Search Type Selection Dropdown
    b2c_search_tracking_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_search_tracking_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Search_Tracking_006_15.name}
    b2c_search_tracking_page.Click Search Parcel Button
    b2c_search_tracking_page.Click Filter Button
    b2c_search_tracking_page.Click Filter Button
    common.Verify Capture Screenshot    B2C_SearchTracking_006_15    Verify Parcel Status After Filter Is Turned Off