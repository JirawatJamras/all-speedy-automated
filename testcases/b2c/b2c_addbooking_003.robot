*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Close Browser

*** Test Cases ***
B2C_AddBooking_003_001
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรณี ตรวจสอบข้อมูล Term & Condition
    [Tags]    B2C_AddBooking_003    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email     ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Verify Term & Condition    ${B2C_AddBooking_003_001['term_and_con']}    ${B2C_AddBooking_003_001['accept_term_and_con']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_001  Verify Term & Condition
    b2c_bookingdelivery_page.Close Term & Condition Popup
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Verify Select Parcel Type
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Verify Create Parcel Page
    common.Verify Capture Screenshot  B2C_AddBooking_003_001  Verify Create Parcel Page Genaral Parcel
    b2c_create_parcel_page.Click Close Paecel Page
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click Temperature Controlled Parcel
    b2c_create_parcel_page.Verify Create Parcel Page
    common.Verify Capture Screenshot  B2C_AddBooking_003_001  Verify Create Parcel Page Controlled Parcel
    b2c_create_parcel_page.Click Close Paecel Page

B2C_AddBooking_003_002
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรณี กดปุ่ม "เลือกจากรายการโปรด"
    [Tags]    B2C_AddBooking_003    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Verify Popup Favorites Sender 
    common.Verify Capture Screenshot  B2C_AddBooking_003_002  Verify Popup Favorites Sender

B2C_AddBooking_003_003
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรอกค้นหาข้อมูลที่อยู่ ถูกต้องกรอกค้นหาข้อมูลที่อยู่ เป็นตัวอักษรภาษาไทย อังกฤษ ตัวเลข และอักขระ /- 
    [Tags]    B2C_AddBooking_003    UAT    Medium    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${B2C_AddBooking_003_003.text_search_en}
    b2c_create_parcel_page.Verify Favorites Show Item Lists
    common.Verify Capture Screenshot  B2C_AddBooking_003_003  Verify Favorites Show Item Lists

B2C_AddBooking_003_004
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer]กรอกค้นหาข้อมูลที่อยู่ ไม่ถูกต้อง กรอกค้นหาข้อมูลที่อยู่ ไม่เป็นตัวอักษรภาษาไทย อังกฤษ ตัวเลข และอักขระ /- "
    [Tags]    B2C_AddBooking_003    UAT    Low    Regression    In_Review    Run
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Input Special Letters    ${B2C_AddBooking_003_004.text_search_special}
    b2c_create_parcel_page.Verify Favorites Not Show Item Lists
    common.Verify Capture Screenshot  B2C_AddBooking_003_004  Verify Favorites Not Show Item Lists 1
    common.Clear Value Input Text    ${search_favorites_txtbox}
    b2c_create_parcel_page.Input Favorites TextBox Nomal Letters Less Than 100 Characters    ${B2C_AddBooking_003_004.text_search_more_than_100_characters}
    b2c_create_parcel_page.Verify Favorites Not Show Item Lists
    common.Verify Capture Screenshot  B2C_AddBooking_003_004  Verify Favorites Not Show Item Lists 2


B2C_AddBooking_003_005
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี กดปุ่ม "เลือก"
    [Tags]    B2C_AddBooking_003    UAT    Medium    Regression    Feedback
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Click Favorites Defult List
    b2c_create_parcel_page.Click Accept Favorites List
    b2c_create_parcel_page.Verify Choose From Favorites
    common.Verify Capture Screenshot  B2C_AddBooking_003_005  Verify Choose From Favorites


B2C_AddBooking_003_006
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี กดปุ่ม "ยกเลิก"
    [Tags]    B2C_AddBooking_003    UAT    Low    Non-Regression    Feedback
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Click Choose Favorites
    b2c_create_parcel_page.Click Favorites Defult List
    b2c_create_parcel_page.Click Cancel Favorites List
    b2c_create_parcel_page.Verify Not Choose From Favorites
    common.Verify Capture Screenshot  B2C_AddBooking_003_006  Verify Not Choose From Favorites


B2C_AddBooking_003_007
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกเบอร์โทรศัพท์ ถูกต้องกรอกเบอร์โทรศัพท์ เป็นตัวเลข
    [Tags]    B2C_AddBooking_003    UAT    Low    Regression    Feedback
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_007['text_phone_sender']}
    b2c_create_parcel_page.Verify Phone Sender Value    ${B2C_AddBooking_003_007['text_phone_sender']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_007  Verify Phone Sender Value


B2C_AddBooking_003_008
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกเบอร์โทรศัพท์ ไม่ถูกต้อง กรอกเบอร์โทรศัพท์ ไม่เป็นตัวเลข, เกิน 10 หลัก, ไม่กรอกเบอร์โทรศัพท์
    [Tags]    B2C_AddBooking_003    UAT    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    #b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_008['text_phone_sender_not_mobile_number']}  # กรอกเบอร์โทร ไม่เป็นตัวเลข ไม่ได้
    #b2c_create_parcel_page.Verify Phone Sender Error Msg    ${B2C_AddBooking_003_008['text_error_msg_phone_sender']} 
    #common.Verify Capture Screenshot  B2C_AddBooking_003_008  Verify Phone Sender Error Msg 1
    #b2c_create_parcel_page.Click Button    ${phone_sender_clear_btn}
    #b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_008['text_phone_sender_more_than_10_number']}  # กรอกเบอร์โทร มากกว่า 10 หลัก ไม่ได้
    #b2c_create_parcel_page.Verify Phone Sender Error Msg    ${B2C_AddBooking_003_008['text_error_msg_phone_sender']}
    #common.Verify Capture Screenshot  B2C_AddBooking_003_008  Verify Phone Sender Error Msg 2
    #b2c_create_parcel_page.Click Button    ${phone_sender_clear_btn}
    #b2c_create_parcel_page.Verify Phone Sender Error Msg    ${B2C_AddBooking_003_008['text_error_msg_phone_sender']}  # Expected Result ไม่ตรงกับหน้าเว็บ
    #common.Verify Capture Screenshot  B2C_AddBooking_003_008  Verify Phone Sender Error Msg 3


B2C_AddBooking_003_009
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกชื่อ ถูกต้อง กรอกชื่อ เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ
    [Tags]    B2C_AddBooking_003    UAT    Low    Regression    Feedback
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_009['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_009['text_name_sender']}
    b2c_create_parcel_page.Verify Name Sender Value    ${B2C_AddBooking_003_009['text_name_sender']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_009  Verify Name Sender Value


B2C_AddBooking_003_010
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกชื่อ ไม่ถูกต้อง กรอกชื่อ ไม่เป็นตัวอักษร ภาษาไทย ภาษาอังกฤษ, กรอกชื่อ เกิน 50 ตัวอักษร, ไม่กรอกชื่อ
    [Tags]    B2C_AddBooking_003    UAT    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_010['text_phone_sender']}
    #b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_010['text_name_sender_not_en_th']}    
    #b2c_create_parcel_page.Verify Name Sender Error Msg    ${B2C_AddBooking_003_010['text_error_msg_name_sender']}  # Expected Result ไม่ตรงกับหน้าเว็บ
    #common.Verify Capture Screenshot  B2C_AddBooking_003_010  Verify Name Sender Error Msg 1
    #b2c_create_parcel_page.Click Button    ${name_sender_clear_btn}
    #b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_010['text_name_sender_more_than_50_letters']}  # กรอกชื่อ เกิน 50 ตัวอักษร ไม่ได้  
    #b2c_create_parcel_page.Verify Name Sender Error Msg    ${B2C_AddBooking_003_010['text_error_msg_name_sender']}
    #common.Verify Capture Screenshot  B2C_AddBooking_003_010  Verify Name Sender Error Msg 2
    #b2c_create_parcel_page.Click Button    ${name_sender_clear_btn}
    b2c_create_parcel_page.Click Next To Receiver
    b2c_create_parcel_page.Verify Name Sender Error Msg    ${B2C_AddBooking_003_010['text_error_msg_name_sender_is_empty']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_010  Verify Name Sender Error Msg 3


B2C_AddBooking_003_011
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกที่อยู่ ถูกต้อง กรอกที่อยู่ เป็นตัวอักษรภาษาไทย ภาษาอังกฤษ ตัวเลข, ไม่เกิน 50 ตัวอักษร
    [Tags]    B2C_AddBooking_003    UAT    Low    Regression    Feedback
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_011['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_011['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_011['text_address_sender_en_th_num']}
    b2c_create_parcel_page.Verify Address Sender Value    ${B2C_AddBooking_003_011['text_address_sender_en_th_num']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_011  Verify Address Sender Value


B2C_AddBooking_003_012
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกที่อยู่ ไม่ถูกต้อง กรอกที่อยู่ ไม่เป็นตัวอักษรภาษาไทย ภาษาอังกฤษ ตัวเลข,เกิน 50 ตัวอักษร, ไม่กรอกที่อยู่
    [Tags]    B2C_AddBooking_003   UAT    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_012['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_012['text_name_sender']}    
    #b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_012['text_address_sender_not_en_th']}    
    #b2c_create_parcel_page.Verify Address Sender Error Msg    ${B2C_AddBooking_003_012['text_error_msg_address_sender']}  # Expected Result ไม่ตรงกัน (ระบบไม่แสดง Validation)
    #common.Verify Capture Screenshot  B2C_AddBooking_003_012  Verify Address Sender Error Msg 1
    #b2c_create_parcel_page.Click Button    ${address_sender_clear_btn}
    #b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_012['text_address_sender_more_than_50_letters']}    
    #b2c_create_parcel_page.Verify Address Sender Error Msg    ${B2C_AddBooking_003_012['text_error_msg_address_sender']}  # Expected Result ไม่ตรงกัน (กรอกเกิน 50 ตัวอักษร ไม่มี Error Message)
    #common.Verify Capture Screenshot  B2C_AddBooking_003_012  Verify Address Sender Error Msg 2  
    #b2c_create_parcel_page.Click Button    ${address_sender_clear_btn}
    #b2c_create_parcel_page.Click Next To Receiver
    #b2c_create_parcel_page.Verify Address Sender Error Msg    ${B2C_AddBooking_003_012['text_error_msg_address_sender_is_empty']}  # Expected Result ไม่ตรงกับหน้าเว็บ
    #common.Verify Capture Screenshot  B2C_AddBooking_003_012  Verify Address Sender Error Msg 3

B2C_AddBooking_003_013
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกรหัสไปรษณีย์ ถูกต้อง กรอกรหัสไปรษณีย์ เป็นตัวเลข, ไม่เกิน 5 หลัก 
    [Tags]    B2C_AddBooking_003    UAT    Low    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_013['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_013['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_013['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender  ${B2C_AddBooking_003_013['text_postcode_sender']}
    b2c_create_parcel_page.Verify Postcode Sender Value    ${B2C_AddBooking_003_013['text_postcode_sender']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_013  Verify Postcode Sender Value


B2C_AddBooking_003_014
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรอกรหัสไปรษณีย์ ไม่ถูกต้อง กรอกรหัสไปรษณีย์ ไม่เป็นตัวเลข, เกิน 5 หลัก, ไม่กรอกรหัสไปรษณีย์
    [Tags]    B2C_AddBooking_003    UAT    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_014['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_014['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_014['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender  ${B2C_AddBooking_003_014['text_postcode_sender_not_number']}
    #b2c_create_parcel_page.Verify Postcode Sender Error Msg    ${B2C_AddBooking_003_014['text_error_msg_postcode_sender']}  # Expected Result ไม่ตรงกัน (ระบบไม่แสดง Validation)
    #common.Verify Capture Screenshot  B2C_AddBooking_003_014  Verify Postcode Sender Error Msg 1
    b2c_create_parcel_page.Click Button    ${postcode_sender_clear_btn}
    b2c_create_parcel_page.Input Postcode Sender  ${B2C_AddBooking_003_014['text_postcode_sender_more_than_5_digits']}
    #b2c_create_parcel_page.Verify Postcode Sender Error Msg    ${B2C_AddBooking_003_014['text_error_msg_postcode_sender']}  # Expected Result ไม่ตรงกัน (ระบบไม่แสดง Validation)
    #common.Verify Capture Screenshot  B2C_AddBooking_003_014  Verify Postcode Sender Error Msg 2
    b2c_create_parcel_page.Click Button    ${postcode_sender_clear_btn}
    b2c_create_parcel_page.Click Next To Receiver
    #b2c_create_parcel_page.Verify Postcode Sender Error Msg    ${B2C_AddBooking_003_014['text_error_msg_postcode_sender_is_empty']}  # Expected Result ไม่ตรงกับหน้าเว็บ
    #common.Verify Capture Screenshot  B2C_AddBooking_003_014  Verify Postcode Sender Error Msg 3


B2C_AddBooking_003_015
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] เลือกรหัสไปรษณีย์ ถูกต้อง เลือกรหัสไปรษณีย์ 1 ตัวเลือก, เลือกรหัสไปรษณีย์ ไม่ถูกต้อง ไม่เลือกรหัสไปรษณีย์
    [Tags]    B2C_AddBooking_003    UAT    Low    Regression    Feedback
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_015['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_015['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_015['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender    ${B2C_AddBooking_003_015['text_postcode_sender']}
    b2c_create_parcel_page.Verify Not Select Postcode Sender Value
    common.Verify Capture Screenshot  B2C_AddBooking_003_015  Verify Not Select Postcode Sender Value
    b2c_create_parcel_page.Click Postcode Sender Lists    ${postcode_sender_select_in_lists}
    b2c_create_parcel_page.Verify Select Postcode Sender Value    ${B2C_AddBooking_003_015['text_postcode_sender_show_select']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_015  Verify Select Postcode Sender Value

B2C_AddBooking_003_018
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี ไม่กดปุ่ม "เพิ่มเป็นรายการโปรด", กดปุ่ม "เพิ่มเป็นรายการโปรด"       
    [Tags]    B2C_AddBooking_003    UAT    Low    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_015['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_015['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_015['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender    ${B2C_AddBooking_003_015['text_postcode_sender']}
    b2c_create_parcel_page.Click Postcode Sender Lists    ${postcode_sender_select_in_lists}
    b2c_create_parcel_page.Click Add To Favorites


B2C_AddBooking_003_019
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี กดปุ่ม "ถัดไป"    
    [Tags]    B2C_AddBooking_003    UAT    High    Regression    In_Review
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_019['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_019['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_019['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender    ${B2C_AddBooking_003_019['text_postcode_sender']}
    b2c_create_parcel_page.Click Postcode Sender Lists    ${postcode_sender_select_in_lists}
    b2c_create_parcel_page.Click Next To Receiver
    b2c_create_parcel_page.Verify Step In Create Parcel Popup    ${B2C_AddBooking_003_019['text_title']}    ${step_2_receiver_progress}
    common.Verify Capture Screenshot  B2C_AddBooking_003_019  Verify Step Receiver In Create Parcel Popup

B2C_AddBooking_003_020
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี กดปุ่ม "เพิ่มเป็นรายการโปรด" กรณี กดปุ่ม "บันทึกร่าง"
    [Tags]    B2C_AddBooking_003    UAT    High    Regression 
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_020['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_020['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_020['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender    ${B2C_AddBooking_003_020['text_postcode_sender']}
    b2c_create_parcel_page.Click Postcode Sender Lists    ${postcode_sender_select_in_lists}
    b2c_create_parcel_page.Click Add To Favorites
    b2c_create_parcel_page.Verify Favorites Icon Red Heart   ${favorites_value}    ${B2C_AddBooking_003_020['text_add_to_favorites']}
    common.Verify Capture Screenshot  B2C_AddBooking_003_019  Verify Favorites Icon Red Heart
    b2c_create_parcel_page.Verify Add To Favorites    ${B2C_AddBooking_003_020['text_name_sender']}     
    common.Verify Capture Screenshot  B2C_AddBooking_003_019  Verify Add To Favorites
    #b2c_create_parcel_page.Click Button    ${save_draft_btn}
    #b2c_create_parcel_page.Verify Save Draft Paecel    

B2C_AddBooking_003_040
    [Documentation]    [เพิ่มรายการ Booking ส่งพัสดุแบบ Business to Customer] กรณี กดปุ่ม "เพิ่มเป็นรายการโปรด" กรณี กดปุ่ม "บันทึกร่าง"
    [Tags]    B2C_AddBooking_003    UAT    High    Regression    
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button
    b2c_home_page.Click Book Parcel Delivery
    b2c_bookingdelivery_page.Click Button To Add
    b2c_bookingdelivery_page.Click Accept Terms of Service
    b2c_bookingdelivery_page.Click General Parcel
    b2c_create_parcel_page.Input Phone Sender    ${B2C_AddBooking_003_040['text_phone_sender']}
    b2c_create_parcel_page.Input Name Sender    ${B2C_AddBooking_003_040['text_name_sender']}    
    b2c_create_parcel_page.Input Address Sender    ${B2C_AddBooking_003_040['text_address_sender']}
    b2c_create_parcel_page.Input Postcode Sender    ${B2C_AddBooking_003_040['text_postcode_sender']}
    b2c_create_parcel_page.Click Postcode Sender Lists    ${postcode_sender_select_in_lists}
    b2c_create_parcel_page.Click Next To Receiver
    b2c_create_parcel_page.Input Receiver   ${phone_receiver_txtbox}    ${B2C_AddBooking_003_040['text_phone_receiver']}
    b2c_create_parcel_page.Input Receiver   ${name_receiver_txtbox}    ${B2C_AddBooking_003_040['text_name_receiver']}
    b2c_create_parcel_page.Click Button    ${send_home_tab}
    b2c_create_parcel_page.Input Receiver   ${address_receiver_txtbox}    ${B2C_AddBooking_003_040['text_address_receiver']}
    b2c_create_parcel_page.Input Receiver   ${postcode_receiver_txtbox}    ${B2C_AddBooking_003_040['text_postcode_receiver']}
    b2c_create_parcel_page.Click Postcode Receiver Lists  ${postcode_receiver_select_in_lists}
    b2c_create_parcel_page.Click Button    ${add_receiver_to_favorites_btn}
    b2c_create_parcel_page.Click Button    ${save_draft_btn}

