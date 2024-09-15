*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    headlesschrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_DPS_001_ID_1
    [Documentation]    [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานไม่ถูกต้อง
    [Tags]  AllSpeedy_DPS_001    UAT
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email                    ${dps_login_user_01['username']}
    dps_login_page.Input Password                 ${dps_login_user_01['password']}
    dps_login_page.Click Log On Button
    Verify Error Message    ${AllSpeedy_DPS_001_ID_1['expected_error_message']}
    Verify Capture Screenshot    AllSpeedy_DPS_001_ID_1    Username entered incorrectly

AllSpeedy_DPS_001_ID_2
   [Documentation]    [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกรหัสผ่านไม่ถูกต้อง
   [Tags]   AllSpeedy_DPS_001    UAT
   common.Open URL    ${DPS_UAT_URL}
   dps_landing_page.Click Go Login Button
   dps_login_page.Input Email                ${dps_login_user_02['username']}
   dps_login_page.Input Password             ${dps_login_user_02['password']}
   dps_login_page.Click Log On Button
   Verify Error Message    ${AllSpeedy_DPS_001_ID_2['expected_error_message']}
   Verify Capture Screenshot    AllSpeedy_DPS_001_ID_2    Password entered incorrectly

AllSpeedy_DPS_001_ID_3
   [Documentation]    [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานและรหัสผ่านถูกต้อง
   [Tags]   AllSpeedy_DPS_001    UAT
   common.Open URL    ${DPS_UAT_URL}
   dps_landing_page.Click Go Login Button
   dps_login_page.Input Email                ${dps_login_user_03['username']}
   dps_login_page.Input Password             ${dps_login_user_03['password']}
   dps_login_page.Click Log On Button
   Verify Capture Screenshot    AllSpeedy_DPS_001_ID_3    Username and password entered correctly

