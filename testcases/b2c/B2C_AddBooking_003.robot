*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_AddBooking_003_01
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรณี ตรวจสอบข้อมูล Term & Condition
    [Tags]    B2C_AddBooking_003_01    UAT    Medium    
    common.Open URL                           ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
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
    b2c_create_parcel_page.Verify Create Parcel Page
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click Temperature Controlled Parcel
    b2c_create_parcel_page.Verify Create Parcel Page

B2C_AddBooking_003_02
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรณี กดปุ่ม "เลือกจากรายการโปรด"
    [Tags]    B2C_AddBooking_003_02    UAT    Medium
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
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
    [Tags]    B2C_AddBooking_003_03    UAT    Medium    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${b2c_addbooking_003_ID_3.text_search_en}
    b2c_create_parcel_page.Verify Favorites Show Item Lists

B2C_AddBooking_003_04
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรอกค้นหาข้อมูลที่อยู่ ไม่ถูกต้อง กรอกค้นหาข้อมูลที่อยู่ ไม่เป็นตัวอักษรภาษาไทย อังกฤษ ตัวเลข และอักขระ /- "
    [Tags]    B2C_AddBooking_003_04    UAT    Low
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
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
    [Tags]    B2C_AddBooking_003_05    UAT    Medium
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
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

B2C_AddBooking_003_06
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี กดปุ่ม "ยกเลิก"
    [Tags]    B2C_AddBooking_003_06    UAT    Low    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Click Favorites Defult List
    b2c_create_parcel_page.Click Cancel Favorites List
    b2c_create_parcel_page.Verify Not Choose From Favorites

B2C_AddBooking_003_07
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกเบอร์โทรศัพท์ ถูกต้องกรอกเบอร์โทรศัพท์ เป็นตัวเลข
    [Tags]    B2C_AddBooking_003_07    UAT    Low
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_7['text_phone_sender']}
    b2c_create_parcel_page.Verify Phone Sender Value    ${b2c_addbooking_003_ID_7['text_phone_sender']}

B2C_AddBooking_003_08
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง กรอกเบอร์โทรศัพท์ ไม่เป็นตัวเลข, เกิน 10 หลัก, ไม่กรอกเบอร์โทรศัพท์
    [Tags]    B2C_AddBooking_003_08    UAT    Medium
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    #b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_8['text_phone_sender_not_mobile_number']}  # กรอกเบอร์โทร ไม่เป็นตัวเลข ไม่ได้
    #b2c_create_parcel_page.Verify Phone Sender Error Msg    ${b2c_addbooking_003_ID_8['text_error_msg_phone_sender']}  
    #b2c_create_parcel_page.Click Clear Button    ${phone_sender_clear_btn}
    #b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_8['text_phone_sender_more_than_10_number']}  # กรอกเบอร์โทร มากกว่า 10 หลัก ไม่ได้
    #b2c_create_parcel_page.Verify Phone Sender Error Msg    ${b2c_addbooking_003_ID_8['text_error_msg_phone_sender']}
    #b2c_create_parcel_page.Click Clear Button    ${phone_sender_clear_btn}
    #b2c_create_parcel_page.Verify Phone Sender Error Msg    ${b2c_addbooking_003_ID_8['text_error_msg_phone_sender']}  # Expected Result ไม่ตรงกับหน้าเว็บ

B2C_AddBooking_003_09
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกชื่อ ถูกต้อง กรอกชื่อ เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ
    [Tags]    B2C_AddBooking_003_09    UAT    Low
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_9['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${b2c_addbooking_003_ID_9['text_name_sender']}
    b2c_create_parcel_page.Verify Name Sender Value    ${b2c_addbooking_003_ID_9['text_name_sender']}

B2C_AddBooking_003_10
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกชื่อ ไม่ถูกต้อง กรอกชื่อ ไม่เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ, กรอกชื่อ เกิน 50 ตัวอักษร, ไม่กรอกชื่อ
    [Tags]    B2C_AddBooking_003_10    UAT    Medium    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_10['text_phone_sender']}
    #b2c_create_parcel_page.Input Name Sender    ${b2c_addbooking_003_ID_10['text_name_sender_not_en_th']}    
    #b2c_create_parcel_page.Verify Name Sender Error Msg    ${b2c_addbooking_003_ID_10['text_error_msg_name_sender']}  # Expected Result ไม่ตรงกับหน้าเว็บ
    #b2c_create_parcel_page.Click Clear Button    ${name_sender_clear_btn}
    #b2c_create_parcel_page.Input Name Sender    ${b2c_addbooking_003_ID_10['text_name_sender_more_than_50_letters']}  # กรอกชื่อ เกิน 50 ตัวอักษร ไม่ได้  
    #b2c_create_parcel_page.Verify Name Sender Error Msg    ${b2c_addbooking_003_ID_10['text_error_msg_name_sender']}
    #b2c_create_parcel_page.Click Clear Button    ${name_sender_clear_btn}
    b2c_create_parcel_page.Click Next To Receiver
    b2c_create_parcel_page.Verify Name Sender Error Msg    ${b2c_addbooking_003_ID_10['text_error_msg_name_sender_is_empty']}

B2C_AddBooking_003_11
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกที่อยู่ ถูกต้อง กรอกที่อยู่ เป็นตัวอักษรภาษาไทย ภาษาอังกฤษ ตัวเลข, ไม่เกิน 50 ตัวอักษร
    [Tags]    B2C_AddBooking_003_11    UAT    Low
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_11['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${b2c_addbooking_003_ID_11['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${b2c_addbooking_003_ID_11['text_address_sender_en_th_num']}
    b2c_create_parcel_page.Verify Address Sender Value    ${b2c_addbooking_003_ID_11['text_address_sender_en_th_num']}

B2C_AddBooking_003_12
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกที่อยู่ ไม่ถูกต้อง กรอกที่อยู่ ไม่เป็นตัวอักษรภาษาไทย ภาษาอังกฤษ ตัวเลข,เกิน 50 ตัวอักษร, ไม่กรอกที่อยู่
    [Tags]    B2C_AddBooking_003_12   UAT    Medium
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_12['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${b2c_addbooking_003_ID_12['text_name_sender']}    
    #b2c_create_parcel_page.Input Address Sender    ${b2c_addbooking_003_ID_12['text_address_sender_not_en_th']}    
    #b2c_create_parcel_page.Verify Address Sender Error Msg    ${b2c_addbooking_003_ID_12['text_error_msg_address_sender']}  # Expected Result ไม่ตรงกัน (ระบบไม่แสดง Validation)
    #b2c_create_parcel_page.Click Clear Button    ${address_sender_clear_btn}
    #b2c_create_parcel_page.Input Address Sender    ${b2c_addbooking_003_ID_12['text_address_sender_more_than_50_letters']}    
    #b2c_create_parcel_page.Verify Address Sender Error Msg    ${b2c_addbooking_003_ID_12['text_error_msg_address_sender']}  # Expected Result ไม่ตรงกัน (กรอกเกิน 50 ตัวอักษร ไม่มี Error Message)
    #b2c_create_parcel_page.Click Clear Button    ${address_sender_clear_btn}
    #b2c_create_parcel_page.Click Next To Receiver
    #b2c_create_parcel_page.Verify Address Sender Error Msg    ${b2c_addbooking_003_ID_12['text_error_msg_address_sender_is_empty']}  # Expected Result ไม่ตรงกับหน้าเว็บ

B2C_AddBooking_003_13
    [Documentation]    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกรหัสไปรษณีย์ ถูกต้อง กรอกรหัสไปรษณีย์ เป็นตัวเลข, ไม่เกิน 5 หลัก 
    [Tags]    B2C_AddBooking_003_11    UAT    Low    Run
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_06['username']}
    b2c_login_page.Input Password    ${b2c_login_user_06['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${b2c_addbooking_003_ID_13['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${b2c_addbooking_003_ID_13['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${b2c_addbooking_003_ID_13['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender  ${b2c_addbooking_003_ID_13['text_postcode_sender']}
    b2c_create_parcel_page.Verify Postcode Sender Value    ${b2c_addbooking_003_ID_13['text_postcode_sender']}
