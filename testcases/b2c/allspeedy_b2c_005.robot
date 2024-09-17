*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    headlesschrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
# Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_B2C_005_ID_16
    [Documentation]          [สร้างรายการพัสดุด้วยการคีย์ข้อมูลจากหน้าจอระบบ] เพิ่มรายการ Booking กรณี ตรวจสอบข้อมูล Term & Condition และ กดปุ่ม "ยอมรับเงื่อนไขการใช้บริการ"
    [Tags]    AllSpeedy_B2C_005_ID_1    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005_ID_16['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005_ID_16['password']}
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
    b2c_login_page.Input Email                    ${b2c_login_user_005_ID_16['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005_ID_16['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Select Card Booking
    b2c_bookingdelivery_page.Click Button To Add
    Verify Capture Screenshot    AllSpeedy_B2C_005_ID_17    Add parcel items to booking click add button

AllSpeedy_B2C_005_ID_18
    [Documentation]          [สร้างรายการพัสดุด้วยการคีย์ข้อมูลจากหน้าจอระบบ] เพิ่มรายการพัสดุ สร้างพัสดุ (1 ข้อมูลผู้ส่งพัสดุ) กรณีค้นหารายการโปรดไม่ถูกต้อง
    [Tags]    AllSpeedy_B2C_005_ID_18    UAT
    # common.Open URL                           ${B2C_UAT_URL}
    Open Browser     https://www-uat.allspeedy.co.th/auth/login  chrome
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_005_ID_16['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_005_ID_16['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Select Card Booking
    b2c_bookingdelivery_page.Click Button To Add
    b2c_create_parcel_page.Clcik Choose Favorites
    # Verify Capture Screenshot    AllSpeedy_B2C_005_ID_18    