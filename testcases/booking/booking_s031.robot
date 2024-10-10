*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S031 
    [Documentation]    ลูกค้า All Member - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่ง (ไม่เพิ่มเป็นรายการโปรด)(บันทึกร่าง) - ข้อมูลผู้รับพัสดุ (ส่งที่บ้าน > เพิ่มเป็นรายการโปรด) - รายละเอียดพัสดุ เลือก A3 (ไม่มีประกัน เเละใส่หมายเหตุ) - Promotion (มี)
    [Tags]    Booking    UAT
    Log    Log-In
    common.Open URL    ${C2C_UAT_URL}
    c2c_login.Input Email    ${c2c_login_user_01['username']}  # ${c2c_login_user_02['username']}
    c2c_login.Input Password    ${c2c_login_user_01['password']}  # ${c2c_login_user_02['password']}
    c2c_login.Click Log On Button
    c2c_landing_page.Click Menu Seven Store
    c2c_landing_page.Click Menu Shipping