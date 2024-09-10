*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Browser And Go To Allspeedy DPS Website
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

# Force Tags        AllSpeedy_DPS_001

*** Test Cases ***
AllSpeedy_DPS_001_ID_1
   [Documentation]                           [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานไม่ถูกต้อง
   [Tags]                                    AllSpeedy_DPS_001_ID_1
   common.Open URL                           ${DPS_UAT_URL}
   dps_landing_page.Click Go Login Button
   dps_login.Input Email                    ${dps_login_user_01['username']}
   dps_login.Input Password                 ${dps_login_user_01['password']}
   dps_login.Click Log On Button
   Verify Error Message    ${AllSpeedy_DPS_001_ID_1['expected_error_message']}
   common.Verify Capture Screenshot   AllSpeedy_DPS_001_ID_1    Username entered incorrectly



AllSpeedy_DPS_001_ID_2
   [Documentation]                       [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกรหัสผ่านไม่ถูกต้อง
   [Tags]                                AllSpeedy_DPS_001_ID_2
   common.Open URL                           ${DPS_UAT_URL}
   dps_landing_page.Click Go Login Button
   dps_login.Input Email                ${dps_login_user_02['username']}
   dps_login.Input Password             ${dps_login_user_02['password']}
   dps_login.Click Log On Button
   Verify Error Message    ${AllSpeedy_DPS_001_ID_2['expected_error_message']}
   common.Verify Capture Screenshot    AllSpeedy_DPS_001_ID_2    Password entered incorrectly

AllSpeedy_DPS_001_ID_3
   [Documentation]                       [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานและรหัสผ่านถูกต้อง
   [Tags]                                AllSpeedy_DPS_001_ID_3
   common.Open URL                           ${DPS_UAT_URL}
   dps_landing_page.Click Go Login Button
   dps_login.Input Email                ${dps_login_user_03['username']}
   dps_login.Input Password             ${dps_login_user_03['password']}
   dps_login.Click Log On Button
#  Verify Menu Displayed     ${menu_items['txtmenu']}
   common.Verify Capture Screenshot    AllSpeedy_DPS_001_ID_3    Username and password entered correctly

