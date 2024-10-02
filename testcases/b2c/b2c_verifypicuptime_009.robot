*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***

B2C_VerifyPicupTime_009_001
    [Documentation]    [ตรวจสอบ แก้ไข และลบรายการเรียกรถเข้ารับพัสดุ] กรณี ตรวจสอบรายละเอียดรายการรอบรถเข้ารับพัสดุ
    [Tags]    B2C_VerifyPicupTime_009    UAT    High    Regression
    # common.Open URL    ${B2C_UAT_URL}
    # register_general_customers_page.Select Business Customers Tab
    # b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    # b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    # b2c_login_page.Click Log On Button
    # b2c_home_page.Click Parcel Delivery Service Menu
    # b2c_home_page.Select Sub Menu Call Car Pick Up
    # b2c_call_car_pick_up_parcel_page.Click Select Item On Parcel Pickup Schedule List
    