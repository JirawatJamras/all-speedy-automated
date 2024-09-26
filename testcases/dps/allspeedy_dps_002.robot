*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_DPS_002_ID_1
    [Documentation]    [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานไม่ถูกต้อง
    [Tags]  AllSpeedy_DPS_002    UAT
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email                    ${dps_login_user_01['username']}
    dps_login_page.Input Password                 ${dps_login_user_01['password']}
    dps_login_page.Click Log On Button


AllSpeedy_DPS_002-ID-2
   [Documentation]    [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกรหัสผ่านไม่ถูกต้อง
   [Tags]   AllSpeedy_DPS_002    UAT
   common.Open URL                       ${DPS_UAT_URL}
   dps_landing_page.Click Go Login Button
   dps_login_page.Input Email                ${dps_login_user_02['username']}
   dps_login_page.Input Password             ${dps_login_user_02['password']}
   dps_login_page.Click Log On Button