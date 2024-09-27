*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
B2C_TrackingParcelDelivery_006_01
    [Documentation]         [ตรวจสอบการติดตามการจัดส่งพัสดุ] ตรวจสอบการติดตามการจัดส่งพัสดุ กรอกค้นหา หมายเลข Tracking พัสดุ ถูกต้อง
    [Tags]    B2C_TrackingParcelDelivery_006_01    UAT    High    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button
    b2c_tracking_parcel_delivery_page.Click Tracking Parcel Delivery Menu Button
    b2c_tracking_parcel_delivery_page.Verify Tracking Parcel Delivery Page
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Tracking Parcel Delivery Page
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ${B2C_Tracking_Parcel_Delivery_006_01.input1_parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Input Parcel Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results    ${b2c_txt_1parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Parcel Search Results
    b2c_tracking_parcel_delivery_page.Click Remove Search Parcel Button
    b2c_tracking_parcel_delivery_page.Input Search Parcel Data    ${B2C_Tracking_Parcel_Delivery_006_01.input2_parcel_number}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Parcel Number Input Contains 10 Numbers With Spaces Between Each Number
    b2c_tracking_parcel_delivery_page.Click Search Parcel Button
    b2c_tracking_parcel_delivery_page.Verify Parcel Search Results When Searching For More Than 1 Parcel    ${b2c_txt_10parcel_search_results}    ${b2c_txt_amount_of_parcel_search_results}
    common.Verify Capture Screenshot    B2C_TrackingParcelDelivery_006_01    Verify Parcel Search Results 10 Parcel Numbers

B2C_TrackingParcelDelivery_006_02
    [Documentation]    [ตรวจสอบการติดตามการจัดส่งพัสดุ] ตรวจสอบการติดตามการจัดส่งพัสดุ กรอกค้นหา ชิ่อผู้รับพัสดุ ถูกต้อง
    [Tags]  B2C_TrackingParcelDelivery_006_02    UAT1    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button