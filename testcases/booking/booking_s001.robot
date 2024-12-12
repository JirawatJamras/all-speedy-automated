*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome   #headlesschrome   #chrome
                  ...    AND    Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S001
    [Documentation]    Log-In เข้าใช้งานระบบ สำหรับ ลูกค้า Business    
    [Tags]    Booking    Login_Business_To_Customer    UAT    Unknown    Defect046
    Log    Step No.1 Tap ลงทะเบียนลูกค้าธุระกิจ
    b2c_login_page.Input Email And Password
    # Expected
    common.Verify Capture Screenshot    booking    Booking_S001    1.Verify Login Page

    Log    Step No.2 Login
    b2c_login_page.Click Log On Button
    # Expected
    Log Defect No:  Defect046
    b2c_home_page.Verify My Profile Page
    ...    ${Booking['text_company_profile']}
    ...    ${Booking['text_profile']}
    ...    ${Booking['text_profile_name']}
    ...    ${Booking['text_profile_phone']}
    ...    ${Booking['text_profile_mail']}
    ...    ${Booking['text_profile_position']}
    ...    ${Booking_S001['sir_name']}
    ...    ${Booking_S001['company_name']}
    ...    ${Booking_S001['name']}
    ...    ${Booking_S001['phone']}
    ...    ${Booking_S001['email']}
    ...    ${Booking_S001['position']}
    common.Verify Capture Screenshot    booking    Booking_S001    2.Verify Home Page