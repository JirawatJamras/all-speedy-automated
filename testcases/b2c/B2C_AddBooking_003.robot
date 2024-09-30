*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
B2C_AddBooking_003_01
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรณี ตรวจสอบข้อมูล Term & Condition
    [Tags]    B2C_AddBooking_003_01    UAT    Low    Relate
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email     ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Verify Term & Condition
    b2c_bookingdelivery_page.Close Term & Condition Popup
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Verify Select Parcel Type
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Verify Create Parcel Page    #ระบบแสดงหน้า Pop-Up สร้างพัสดุ “1 ข้อมูลผู้ส่งพัสดุ”
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click Temperature Controlled Parcel
    b2c_create_parcel_page.Verify Create Parcel Page    #ระบบแสดงหน้า Pop-Up สร้างพัสดุ “1 ข้อมูลผู้ส่งพัสดุ”

B2C_AddBooking_003_02
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรณี กดปุ่ม "เลือกจากรายการโปรด"
    [Tags]    B2C_AddBooking_003_01    UAT    Low    Relate 
    common.Open URL    ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Verify Popup Favorites Sender 

B2C_AddBooking_003_03
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรอกค้นหาข้อมูลที่อยู่ ถูกต้องกรอกค้นหาข้อมูลที่อยู่ เป็นตัวอักษรภาษาไทย อังกฤษ ตัวเลข และอักขระ /- 
    [Tags]    B2C_AddBooking_003_01    UAT    Low    Relate    
    common.Open URL    ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${b2c_addbooking_003_ID_3.text_search_en}
    # b2c_create_parcel_page.Verify Favorites Text In TextBox    ${b2c_addbooking_003_ID_3.text_search_en}
    b2c_create_parcel_page.Verify Favorites Show Item Lists
    # common.Clear Value Input Text    ${search_favorites_txtbox}
    # b2c_create_parcel_page.Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${B2C_003_ID_3.text_search_en}

B2C_AddBooking_003_04
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรอกค้นหาข้อมูลที่อยู่ ไม่ถูกต้อง กรอกค้นหาข้อมูลที่อยู่ ไม่เป็นตัวอักษรภาษาไทย อังกฤษ ตัวเลข และอักขระ /- "
    [Tags]    B2C_AddBooking_003_01    UAT    Low    Relate    
    common.Open URL    ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Input Special Letters    ${b2c_addbooking_003_ID_4.text_search_special}
    b2c_create_parcel_page.Verify Favorites Not Show Item Lists
    common.Clear Value Input Text    ${search_favorites_txtbox}
    b2c_create_parcel_page.Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${b2c_addbooking_003_ID_4.text_search_more_than_100_characters}
    b2c_create_parcel_page.Verify Favorites Not Show Item Lists

B2C_AddBooking_003_05
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี กดปุ่ม "เลือก"
    [Tags]    B2C_AddBooking_003_01    UAT    Low    Relate    Run
    common.Open URL    ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Click Favorites Defult List
    b2c_create_parcel_page.Click Accept Favorites List
    b2c_create_parcel_page.Verify Choose From Favorites



