*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Open Browser And Go To Allspeedy DPS Website
Suite Teardown    Close Browser
Force Tags        AllSpeedy-DPS-002

*** Test Cases ***

AllSpeedy-DPS-002-ID-1
    [Documentation]                           [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานไม่ถูกต้อง
    [Tags]                                    AllSpeedy-DPS-002-ID-1
    common.Open URL                           ${DPS_UAT_URL}
    landing_page.Click Go Login DPS Button
    login_dps.Input Email                    ${dps_login_user_01['username']}
    login_dps.Input Password                 ${dps_login_user_01['password']}
    login_dps.Click Log On Button


AllSpeedy-DPS-002-ID-2
   [Documentation]                       [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกรหัสผ่านไม่ถูกต้อง
   [Tags]                                AllSpeedy-DPS-002-ID-2
   common.Open URL                       ${DPS_UAT_URL}
   landing_page.Click Go Login DPS Button
   login_dps.Input Email                ${dps_login_user_02['username']}
   login_dps.Input Password             ${dps_login_user_02['password']}
   login_dps.Click Log On Button


