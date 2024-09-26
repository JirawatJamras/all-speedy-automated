*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_B2C_005_ID_16
    [Documentation]          [สร้างรายการพัสดุด้วยการคีย์ข้อมูลจากหน้าจอระบบ] เพิ่มรายการ Booking กรณี ตรวจสอบข้อมูล Term & Condition และ กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    [Tags]    AllSpeedy_B2C_005_ID_1    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Verify Term & Condition
    b2c_bookingdelivery_page.Close Term & Condition Popup
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Verify Select Parcel Type
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Verify Create Parcel Page
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click Temperature Controlled Parcel
    b2c_create_parcel_page.Verify Create Parcel Page
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_16    Checking add booking item and term & condition information


AllSpeedy_B2C_005_ID_17
    [Documentation]          [สร้างรายการพัสดุด้วยการคีย์ข้อมูลจากหน้าจอระบบ] เพิ่มรายการพัสดุใน Booking กรณีกดปุ่ม เพิ่ม
    [Tags]    AllSpeedy_B2C_005_ID_17    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Select Card Booking
    b2c_bookingdelivery_page.Click Button To Add
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_17    Add parcel items to booking click add button

AllSpeedy_B2C_005_ID_18
    [Documentation]          [สร้างรายการพัสดุด้วยการคีย์ข้อมูลจากหน้าจอระบบ] เพิ่มรายการพัสดุ สร้างพัสดุ (1 ข้อมูลผู้ส่งพัสดุ) กรณีค้นหารายการโปรดไม่ถูกต้อง
    [Tags]    AllSpeedy_B2C_005_ID_18    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Select Card Booking
    b2c_bookingdelivery_page.Click Button To Add
    b2c_create_parcel_page.Clcik Choose Favorites
    b2c_create_parcel_page.Input Special Letters     ${AllSpeedy_B2C_005_ID_18['special_letters_txt']}
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_18    Verify system does not display information
    b2c_create_parcel_page.Clear Search Favorites TextBox
    b2c_create_parcel_page.Input Text Exceeds 100 Characters     ${AllSpeedy_B2C_005_ID_18['100Characters']}
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_18    Verify 100characters system does not display information


AllSpeedy_B2C_005_ID_19
    [Documentation]          [สร้างรายการพัสดุด้วยการคีย์ข้อมูลจากหน้าจอระบบ] เพิ่มรายการพัสดุ สร้างพัสดุ (1 ข้อมูลผู้ส่งพัสดุ) กรณีเลือกจากรายการโปรดเกิน 1 ตัวเลือก
    [Tags]    AllSpeedy_B2C_005_ID_19    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Select Card Booking
    b2c_bookingdelivery_page.Click Button To Add
    b2c_create_parcel_page.Clcik Choose Favorites
    b2c_create_parcel_page.Input Special Letters     ${AllSpeedy_B2C_005_ID_18['special_letters_txt']}
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_19    Verify system does not display information
    b2c_create_parcel_page.Clear Search Favorites TextBox
    b2c_create_parcel_page.Input Text Exceeds 100 Characters     ${AllSpeedy_B2C_005_ID_18['100Characters']}
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_19    Verify 100characters system does not display information

AllSpeedy_B2C_005_ID_20
    [Documentation]          [สร้างรายการพัสดุด้วยการคีย์ข้อมูลจากหน้าจอระบบ] เพิ่มรายการพัสดุ สร้างพัสดุ (1 ข้อมูลผู้ส่งพัสดุ) เลือกจากรายการโปรดที่เป็นค่าเริ่มต้น
    [Tags]    AllSpeedy_B2C_005_ID_20    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Select Card Booking
    b2c_bookingdelivery_page.Click Button To Add
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Click Favorites Defult
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_20    Choose from default favorites