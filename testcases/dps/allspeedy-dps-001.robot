*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Browser And Go To Allspeedy DPS Website
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

# Force Tags        AllSpeedy-DPS-001

*** Test Cases ***
AllSpeedy-DPS-001-ID-1
    [Documentation]                           [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานไม่ถูกต้อง
    [Tags]                                    AllSpeedy-DPS-001-ID-1
    common.Open URL                           https://alloauthdev.cpall.co.th/logon/LogonPoint/tmindex.html
    # common.Open URL                           ${DPS_UAT_URL}
    # dps_landing_page.Click Go Login Button
    dps_login.Input Email                    ${dps_login_user_01['username']}
    dps_login.Input Password                 ${dps_login_user_01['password']}
    dps_login.Click Log On Button
    # Verify Error Message    ${Dps_ERROR_MESSAGE}
    Verify Capture Screenshot    AllSpeedy-DPS-001-ID-1



AllSpeedy-DPS-001-ID-2
   [Documentation]                       [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกรหัสผ่านไม่ถูกต้อง
   [Tags]                                AllSpeedy-DPS-001-ID-2
    common.Open URL                           https://alloauthdev.cpall.co.th/logon/LogonPoint/tmindex.html
    # common.Open URL                           ${DPS_UAT_URL}
    # dps_landing_page.Click Go Login Button
   dps_login.Input Email                ${dps_login_user_02['username']}
   dps_login.Input Password             ${dps_login_user_02['password']}
   dps_login.Click Log On Button
   Verify Error Message    ${dps_errormessage_02['expected_error']}
   Verify Capture Screenshot    AllSpeedy-DPS-001-ID-2



AllSpeedy-DPS-001-ID-3
   [Documentation]                       [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานและรหัสผ่านถูกต้อง
   [Tags]                                AllSpeedy-DPS-001-ID-3
    common.Open URL                           https://alloauthdev.cpall.co.th/logon/LogonPoint/tmindex.html
    # common.Open URL                           ${DPS_UAT_URL}
    # dps_landing_page.Click Go Login Button
   dps_login.Input Email                ${dps_login_user_03['username']}
   dps_login.Input Password             ${dps_login_user_03['password']}
   dps_login.Click Log On Button
#    Verify Menu Displayed     ${menu_items['txtmenu']}
   Verify Capture Screenshot    AllSpeedy-DPS-001-ID-3

