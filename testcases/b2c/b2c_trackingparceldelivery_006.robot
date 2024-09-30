*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
B2C_TrackingParcelDelivery_006_01
    [Documentation]         [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลข Tracking พัสดุ ถูกต้อง
    [Tags]    B2C_TrackingParcelDelivery_006_01    UAT    High    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Verify Tracking Parcel Delivery Page
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Tracking Parcel Delivery Page
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Tracking_Parcel_Delivery_006_01.input1_parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results    ${b2c_txt_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Parcel Search Results
    b2c_tracking_parcel_delivery_page.Click Remove Search Parcel Button
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Tracking_Parcel_Delivery_006_01.input2_parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Parcel Number Input Contains 10 Numbers With Spaces Between Each Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results When Searching For More Than 1 Parcel    ${b2c_txt_many_parcel_search_results}    ${b2c_txt_amount_of_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Parcel Search Results 10 Parcel Numbers

B2C_TrackingParcelDelivery_006_02
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ถูกต้อง
    [Tags]  B2C_TrackingParcelDelivery_006_02    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    # register_general_customers_page.Select Business Customers Tab
    # b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    # b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    # b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Tracking_Parcel_Delivery_006_02.name}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_02    Verify Input Receiver Name
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results    ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_02    Verify Parcel Search Results

B2C_TrackingParcelDelivery_006_03
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาเบอร์โทรศัพท์ ถูกต้อง
    [Tags]  B2C_TrackingParcelDelivery_006_03    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    # register_general_customers_page.Select Business Customers Tab
    # b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    # b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    # b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Tracking_Parcel_Delivery_006_03.phone}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_03    Verify Input Receiver Name
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results    ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_03    Verify Parcel Search Results


B2C_TrackingParcelDelivery_006_04
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่กรอกค้นหาหมายเลข Tracking พัสดุ"
    [Tags]  B2C_TrackingParcelDelivery_006_04    UAT    Low    Non-Regression    Failed
    # The expected results are to display all bookings, but the website displays error message and does not display bookings. 
    # The commented code is the actual result on the website.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results    ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_04    Verify Parcel Search Results
    # b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    กรุณาระบุหมายเลขพัสดุ    ${b2c_msg_specify_parcel_number}
    # common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_04    Verify Error Message In Modal

B2C_TrackingParcelDelivery_006_05
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลข Tracking พัสดุ ไม่เป็นตัวอักษรภาษาอังกฤษ ตัวเลข"
    [Tags]  B2C_TrackingParcelDelivery_006_05    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    # register_general_customers_page.Select Business Customers Tab
    # b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    # b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    # b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${ฺB2C_Tracking_Parcel_Delivery_006_05.parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_05    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ระบุหมายเลขพัสดุไม่ถูกต้อง    ${b2c_msg_input_incorrect_parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_05    Verify Error Message In Modal

B2C_TrackingParcelDelivery_006_06
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลข Tracking พัสดุ เกิน 20 ตัวอักษร"
    [Tags]  B2C_TrackingParcelDelivery_006_06    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    # register_general_customers_page.Select Business Customers Tab
    # b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    # b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    # b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${ฺB2C_Tracking_Parcel_Delivery_006_06.parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_06    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ระบุหมายเลขพัสดุไม่ถูกต้อง    ${b2c_msg_input_incorrect_parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_06    Verify Error Message In Modal

B2C_TrackingParcelDelivery_006_07
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลข Tracking พัสดุ เกินครั้งละ 10 หมายเลข
    [Tags]  B2C_TrackingParcelDelivery_006_07    UAT    Low    Non-Regression    Failed
    # The expected results are displayed 10 parcels but the website is displayed more than 10 parcels.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Tracking_Parcel_Delivery_006_07.parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_07    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Search Results When Search More Than 10 Parcels     ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_07    Verify Search Results When Search More Than 10 Parcels

B2C_TrackingParcelDelivery_006_08
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาหมายเลข Tracking พัสดุ ครั้งละ 10 หมายเลข โดยในแต่ละหมายเลขไม่เว้นวรรคเพื่อแยกจากกัน
    [Tags]  B2C_TrackingParcelDelivery_006_08    UAT    Low    Non-Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    # register_general_customers_page.Select Business Customers Tab
    # b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    # b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    # b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุหมายเลขพัสดุ    ${B2C_Tracking_Parcel_Delivery_006_08.parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_08    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ระบุหมายเลขพัสดุไม่ถูกต้อง    ${b2c_msg_input_incorrect_parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_08    Verify Error Message In Modal

B2C_TrackingParcelDelivery_006_09
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่กรอกค้นหาชื่อผู้รับพัสดุ
    [Tags]  B2C_TrackingParcelDelivery_006_09    UAT    Low    Non-Regression    Failed
    # The expected results are to display all bookings, but the website displays error message and does not display bookings.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results    ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_04    Verify Parcel Search Results

B2C_TrackingParcelDelivery_006_10
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ ไม่เป็นตัวอักษรภาษาไทย อังกฤษ"
    [Tags]  B2C_TrackingParcelDelivery_006_10    UAT    Low    Regression    Failed
    common.Open URL    ${B2C_UAT_URL}
    # Expected result error message and website mismatch.
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Tracking_Parcel_Delivery_006_10.name}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ระบุชื่อหรือเบอร์โทรศัพท์ไม่ถูกต้อง    ${b2c_msg_input_incorrect_name_or_phone}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_10    Verify Error Message In Modal

B2C_TrackingParcelDelivery_006_11
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกค้นหาชื่อผู้รับพัสดุ เกิน 50 ตัวอักษร
    [Tags]  B2C_TrackingParcelDelivery_006_11    UAT    Low    Regression    Failed
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Tracking_Parcel_Delivery_006_11.name}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ระบุชื่อหรือเบอร์โทรศัพท์ไม่ถูกต้อง    ${b2c_msg_input_incorrect_name_or_phone}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_11    Verify Error Message In Modal

B2C_TrackingParcelDelivery_006_12
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ไม่กรอกเบอร์โทรศัพท์
    [Tags]  B2C_TrackingParcelDelivery_006_12    UAT    Low    Regression    Failed
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results    ${b2c_txt_many_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_12    Verify Parcel Search Results

B2C_TrackingParcelDelivery_006_13
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกเบอร์โทรศัพท์ ไม่เป็นตัวเลข
    [Tags]  B2C_TrackingParcelDelivery_006_13    UAT    Low    Regression    Failed
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Tracking_Parcel_Delivery_006_13.phone}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ระบุชื่อหรือเบอร์โทรศัพท์ไม่ถูกต้อง    ${b2c_msg_input_incorrect_name_or_phone}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_13    Verify Error Message In Modal

B2C_TrackingParcelDelivery_006_14
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] กรอกเบอร์โทรศัพท์ เกิน 10 หลัก
    [Tags]  B2C_TrackingParcelDelivery_006_14    UAT    Low    Regression    Failed
    # Expected result error message and website mismatch.
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
    b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Tracking_Parcel_Delivery_006_14.phone}
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Error Message In Modal    ระบุชื่อหรือเบอร์โทรศัพท์ไม่ถูกต้อง    ${b2c_msg_input_incorrect_name_or_phone}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_13    Verify Error Message In Modal

# B2C_TrackingParcelDelivery_006_15
#     [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] เลือกสถานะพัสดุ ถูกต้อง
#     [Tags]  B2C_TrackingParcelDelivery_006_15    UAT1    Low    Regression    
#     common.Open URL    ${B2C_UAT_URL}
#     register_general_customers_page.Select Business Customers Tab
#     b2c_login_page.Input Email                    ${b2c_login_user_06['username']}
#     b2c_login_page.Input Password                 ${b2c_login_user_06['password']}
#     b2c_login_page.Click Log On Button
#     b2c_home_page.Click Tracking Parcel Delivery Menu Button
#     b2c_tracking_parcel_delivery_page.Click Search Type Selection Dropdown
#     b2c_tracking_parcel_delivery_page.Select Search Type In Dropdown    ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ
#     b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ระบุชื่อหรือเบอร์โทรผู้รับ    ${ฺB2C_Tracking_Parcel_Delivery_006_15.name}
#     b2c_tracking_parcel_delivery_page.Click Search Parcel Button
#     b2c_tracking_parcel_delivery_page.Click Filter Button    รับพัสดุเข้าระบบ
#     b2c_tracking_parcel_delivery_page.Verify Parcel Status    รับพัสดุเข้าระบบ
#     common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_15    Verify Error Message In Modal