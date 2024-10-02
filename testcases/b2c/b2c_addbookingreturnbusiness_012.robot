*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
B2C_AddBookingReturnBusiness_012_001
    [Documentation]    [เพิ่มรายการ Return Business] กรณี กดปุ่ม "เลือกจากรายการโปรด",
    ...                กรอกค้นหาข้อมูลที่อยู่ ถูกต้อง,
    ...                กรอกค้นหาข้อมูลที่อยู่ เป็นตัวอักษรภาษาไทย อังกฤษ ตัวเลข และอักขระ /- และ ไม่เกิน 100 ตัวอักษร,
    ...                เลือกรายการข้อมูลที่อยู่ 1 ตัวเลือก,
    ...                ไม่เลือกรายการข้อมูลที่อยู่
    [Tags]    B2C_AddBookingReturnBusiness_012    UAT1    High    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email     ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Return Business
    b2c_return_business_page.Click Add Booking Button
    b2c_return_business_page.Verify Term And Condition
    common.Verify Capture Screenshot    B2C_AddBookingReturnBusiness_012_001    Verify Term And Condition
    b2c_return_business_page.Click Close Term And Condition Button
    b2c_return_business_page.Verify Close Term And Condition Modal
    common.Verify Capture Screenshot    B2C_AddBookingReturnBusiness_012_001    Verify Close Term And Condition Modal
    b2c_return_business_page.Click Add Booking Button
    b2c_return_business_page.Click Accept Condition Button
    b2c_return_business_page.Verify Link Return Business