*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
B2C_SearchTracking_006_001
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลข Tracking พัสดุ ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ เป็นตัวอักษรภาษาอังกฤษ ตัวเลข และ ไม่เกิน 20 ตัวอักษร,
    ...                กรอกค้นหาหมายเลขพัสดุ ครั้งละ 10 หมายเลข โดยในแต่ละหมายเลขเว้นวรรคเพื่อแยกจากกัน
    [Tags]    B2C_SearchTracking_006    UAT    High    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Verify Tracking Parcel Delivery Page
    common.Verify Capture Screenshot    B2C_SearchTracking_006_001    Verify Tracking Parcel Delivery Page
    b2c_tracking_parcel_delivery_page.Input Parcel Number In Search Parcel    ${B2C_SearchTracking_006_001.parcel_number['input1']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_001    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results
    common.Verify Capture Screenshot    B2C_SearchTracking_006_001    Verify Parcel Search Results
    b2c_tracking_parcel_delivery_page.Click Remove Search Parcel Button
    b2c_tracking_parcel_delivery_page.Input Parcel Number In Search Parcel    ${B2C_SearchTracking_006_001.parcel_number['input2']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_001    Verify Parcel Number Input Contains 10 Numbers With Spaces Between Each Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results When Searching For More Than 1 Parcel
    common.Verify Capture Screenshot    B2C_SearchTracking_006_001    Verify Parcel Search Results 10 Parcel Numbers

B2C_SearchTracking_006_002
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ถูกต้อง,
    ...                กรอกค้นหา ชื่อผู้รับพัสดุ เป็นตัวอักษรภาษาไทย อังกฤษ และ ไม่เกิน 50 ตัวอักษร
    [Tags]  B2C_SearchTracking_006    UAT    Medium    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_002['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_002['name']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_002    Verify Input Receiver Name
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results
    common.Verify Capture Screenshot    B2C_SearchTracking_006_002    Verify Parcel Search Results

B2C_SearchTracking_006_003
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาเบอร์โทรศัพท์ ถูกต้อง,
    ...                กรอกค้นหาเบอร์โทรศัพท์ เป็นตัวเลข และ ไม่เกิน 10 หลัก
    [Tags]  B2C_SearchTracking_006    UAT    Medium    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_003['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_003['phone']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_003    Verify Input Receiver Phone
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results
    common.Verify Capture Screenshot    B2C_SearchTracking_006_003    Verify Parcel Search Results


B2C_SearchTracking_006_004
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่กรอกค้นหาหมายเลขพัสดุ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${ฺB2C_SearchTracking_006_004['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_004    Verify Error Message Parcel Number Not Inputted

B2C_SearchTracking_006_005
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ ไม่เป็นตัวอักษรภาษาอังกฤษ ตัวเลข
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Input Parcel Number In Search Parcel    ${ฺB2C_SearchTracking_006_005['parcel_number']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_005    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${ฺB2C_SearchTracking_006_005['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_005    Verify Error Message When Input Parcel Number Is Not English Alphabets And Numbers

B2C_SearchTracking_006_006
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ เกิน 20 ตัวอักษร
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Input Parcel Number In Search Parcel    ${ฺB2C_SearchTracking_006_006['parcel_number']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_006    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${ฺB2C_SearchTracking_006_006['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_006    Verify Error Message When Input Parcel Number Exceed Specifies

B2C_SearchTracking_006_007
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ เกินครั้งละ 10 หมายเลข
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression
    # The expected results are displayed 10 parcels but the website is displayed more than 10 parcels.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Input Parcel Number In Search Parcel    ${B2C_SearchTracking_006_007['parcel_number']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_007    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Search Results When Search More Than 10 Parcels
    common.Verify Capture Screenshot    B2C_SearchTracking_006_007    Verify Search Results When Search More Than 10 Parcels

B2C_SearchTracking_006_008
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลขพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาหมายเลขพัสดุ ครั้งละ 10 หมายเลข โดยในแต่ละหมายเลขไม่เว้นวรรคเพื่อแยกจากกัน 
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Input Parcel Number In Search Parcel    ${B2C_SearchTracking_006_008['parcel_number']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_008    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${B2C_SearchTracking_006_008['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_008    Verify Search Results When Search More Than 10 Parcels Without Space Between Parcel Numbers

B2C_SearchTracking_006_009
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่กรอกค้นหาชื่อและเบอร์โทรศัพท์ผู้รับพัสดุ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${B2C_SearchTracking_006_009['search_type']}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${B2C_SearchTracking_006_009['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_009    Verify Error Message Name Or Phone Not Inputted    

B2C_SearchTracking_006_010
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาชื่อผู้รับพัสดุ ไม่เป็นตัวอักษรภาษาไทย อังกฤษ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_010['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_010['name']}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${ฺB2C_SearchTracking_006_010['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_010    Verify Error Message When Input Name Is Not Alphabets

B2C_SearchTracking_006_011
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ไม่ถูกต้อง,
    ...                กรอกค้นหาชื่อผู้รับพัสดุ เกิน 50 ตัวอักษร
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_011['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_011['name']}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${ฺB2C_SearchTracking_006_011['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_011    Verify Error Message When Input Name Exceed Specifies

B2C_SearchTracking_006_012
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง,
    ...                กรอกเบอร์โทรศัพท์ ไม่เป็นตัวเลข
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_012['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_012['phone']}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${ฺB2C_SearchTracking_006_012['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_012    Verify Error Message When Input Phone Is Not Numbers

B2C_SearchTracking_006_013
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง,
    ...                กรอกเบอร์โทรศัพท์ เกิน 10 หลัก
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_013['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_013['phone']}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ${ฺB2C_SearchTracking_006_013['error_msg']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_013    Verify Error Message When Input Phone Exceed Specifies

B2C_SearchTracking_006_014
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] เลือกสถานะพัสดุ ถูกต้อง,
    ...                เลือกสถานะพัสดุ 1 ตัวเลือก
    [Tags]  B2C_SearchTracking_006    UAT    Low    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_014['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_014['name']}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Click Filter Button
    common.Verify Capture Screenshot    B2C_SearchTracking_006_014    Verify Filter Dropdown List Displayed When Filter Is Turned On
    b2c_tracking_parcel_delivery_page.Select Filter    ${ฺB2C_SearchTracking_006_014['filter_status']}
    b2c_tracking_parcel_delivery_page.Verify Parcel Status    ${ฺB2C_SearchTracking_006_014['filter_status']}
    common.Verify Capture Screenshot    B2C_SearchTracking_006_014    Verify Parcels Displayed When Filtering Parcel Status

B2C_SearchTracking_006_015
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่เลือกเลือกสถานะพัสดุ
    [Tags]  B2C_SearchTracking_006    UAT    Low    Non-Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ${ฺB2C_SearchTracking_006_015['search_type']}
    b2c_tracking_parcel_delivery_page.Input Name Or Phone In Search Parcel    ${ฺB2C_SearchTracking_006_015['name']}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Click Filter Button
    b2c_tracking_parcel_delivery_page.Click Filter Button
    common.Verify Capture Screenshot    B2C_SearchTracking_006_015    Verify Parcel Status After Filter Is Turned Off