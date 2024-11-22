*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S022
    [Documentation]    Customer : สร้างรหัสผ่านเข้าใช้งานระบบ
    [Tags]    Register    Customer_Login    UAT
    skip
    register_business_full_register.Login mail    ${Register_S001['email']}    ${Register_S001['password']}   

    Log    Step No.1 กด Link ที่ได้รับจาก Welcome E-mail
    register_business_full_register.Get Link Create Password
    Open URL  ${LinkCreatePassword}
    # Expected
    common.Click When Ready  //button//b[text()='ยืนยันตัวตน']
    # register_business_full_register.Verify Create Password Page
    Log    Step No.2 ระบุรหัสผ่านสำหรับเข้าใช้งานระบบ : P@ssw0rd ให้ตรงกันทั้ง 2 ช่อง



    Log    Step No.3 กดปุ่ม "ยืนยัน"


    Log    Step No.4 กดปุ่ม "เข้าสู่ระบบ"