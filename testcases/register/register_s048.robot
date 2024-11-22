*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S048
    [Documentation]    RM : เปลี่ยนสถานะลูกค้าที่ไม่ Active เป็น Inactive
    [Tags]    Register    RM    UAT
    skip
    common.Open URL    ${B2C_UAT_URL}
    #Step 1 ชื่อ User (Company Admin) >โปรของฉัน
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button
    register_business_profile_business.Click Profile Icon
    #step click โปรไฟล์ของฉัน
    #Step 2 กดปุ่ม "แก้ไข"
    register_business_profiles.Click Edit Button
    #Step 3 แก้ไขเบอร์โทรศัพท์
    register_business_profiles.Edit Mobile No    0871000000
    #Step 4 กดปุ่ม "บันทึก"   ปุ่ม "บันทึก" ไม่มีแสดง
    #register_business_profiles.Click Save Button