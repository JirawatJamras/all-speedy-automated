*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    headlesschrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_B2C_001_ID_1
    [Documentation]          [Login เข้าสู่ระบบ] Login เข้าระบบประเภทลูกค้าธุรกิจ กรณีไม่กรอก Email และ รหัสผ่าน
    [Tags]    AllSpeedy_B2C_001_ID_1    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Click Log On Button
    Verify Error Message B2C_001_ID_1
    Verify Capture Screenshot    AllSpeedy_B2C_001_ID_1    Login for business customers In case of not entering Email and Password

AllSpeedy_B2C_001_ID_2
    [Documentation]                           [Login เข้าสู่ระบบ] Login เข้าระบบประเภทลูกค้าธุรกิจ กรณีกรอก Email ไม่เป็นภาษาอังกฤษ ตัวเลข อักขระพิเศษ ในรูปแบบอีเมล และ ไม่ใช่ในรูปแบบอีเมล 
    [Tags]    AllSpeedy_B2C_001_ID_2    UAT   
    common.Open URL                           ${B2C_UAT_URL}
    # Open Browser    ${B2C_UAT_URL}   Chrome
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_02['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_02['password']}
    b2c_login_page.Click Log On Button
    Clear Email and Password Textbox
    b2c_login_page.Input Email                    ${b2c_login_user_02['username']}
    Verify Error Message B2C_001_ID_2     ${AllSpeedy_B2C_001_ID_2['expected_error_message']}
    Verify Capture Screenshot    AllSpeedy_B2C_001_ID_2    email entered is not in English letters or not in email format


AllSpeedy_B2C_001_ID_3
    [Documentation]          [Login เข้าสู่ระบบ] Login เข้าระบบประเภทลูกค้าธุรกิจ กรณีกรอกรหัสผ่านไม่ตรงตามที่ตั้งไว้
    [Tags]    AllSpeedy_B2C_001_ID_3    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_03['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_03['password']}
    b2c_login_page.Click Log On Button
    Verify Error Message B2C_001_ID_3    ${AllSpeedy_B2C_001_ID_3['expected_error_message']}
    Verify Capture Screenshot    AllSpeedy_B2C_001_ID_3    Password entered does not match the set password

AllSpeedy_B2C_001_ID_4
    [Documentation]          [Login เข้าสู่ระบบ] Login เข้าระบบประเภทลูกค้าธุรกิจ กรณีกรอก Email และรหัสผ่าน ไม่มีอยู่ในระบบ
    [Tags]    AllSpeedy_B2C_001_ID_4    UAT
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_04['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_04['password']}
    b2c_login_page.Click Log On Button
    Verify Error Message B2C_001_ID_4    ${AllSpeedy_B2C_001_ID_4['expected_error_message']}
    Verify Capture Screenshot    AllSpeedy_B2C_001_ID_4    Email and password do not exist in the system

B2C_Login_001_01
    [Documentation]    [Login เข้าสู่ระบบ] กรอก E-mail ไม่ถูกต้อง กรณีกรอก E-mail ไม่เป็นภาษาอังกฤษ ตัวเลข อักขระพิเศษ ในรูปแบบอีเมล์ และกรณีกรอก E-mail เป็นภาษาอังกฤษ ตัวเลข อักขระพิเศษ ไม่ใช่ในรูปแบบอีเมล์
    [Tags]    B2C_Login_001    UAT    Low    Regression    In_Review
    common.Open URL                           ${B2C_UAT_URL}
    b2c_landing_page.Click Go Login Button
    b2c_login_page.Input Email                    ${b2c_login_user_05['username']}
    b2c_login_page.Input Password                 ${b2c_login_user_05['password']}
    b2c_login_page.Click Log On Button
    Verify Error Message B2C_001_ID_5    ${AllSpeedy_B2C_001_ID_5['expected_error_message']}
    Verify Capture Screenshot    AllSpeedy_B2C_001_ID_5    Business customer email entered is for a regular customer type