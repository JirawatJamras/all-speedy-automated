*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser
Force Tags        AllSpeedy-DPS-003

*** Test Cases ***

################################## โค้ดใช้ไม่ได้แล้ว ##################################
# AllSpeedy-DPS-003-ID-1
#     [Documentation]    หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกบัญชีผู้ใช้งานไม่ถูกต้อง
#     [Tags]    AllSpeedy-DPS-003-ID-1
#     common.Open URL    ${DPS_UAT_URL}
#     landing_page.Click Go Login DPS Button
#     login_dps.Input Email    ${dps_login_user_01['username']}
#     login_dps.Input Password    ${dps_login_user_01['password']}
#     login_dps.Click Log On Button


# AllSpeedy-DPS-003-ID-2
#    [Documentation]    หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy] กรอกรหัสผ่านไม่ถูกต้อง
#    [Tags]    AllSpeedy-DPS-003-ID-2
#    common.Open URL    ${DPS_UAT_URL}
#    landing_page.Click Go Login DPS Button
#    login_dps.Input Email    ${dps_login_user_02['username']}
#    login_dps.Input Password    ${dps_login_user_02['password']}
#    login_dps.Click Log On Button
################################## โค้ดใช้ไม่ได้แล้ว ##################################

AllSpeedy-DPS-003-ID-9
    [Documentation]          [ตรวจสอบภาพรวมงานประจําวัน] ตรวจสอบหัวข้อ พัสดุเข้าคลัง (งานรับเข้า)
    [Tags]    AllSpeedy-DPS-003-ID-9
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_03['username']}
    dps_login_page.Input Password    ${dps_login_user_03['password']}
    dps_login_page.Click Log On Button
    # Click เมนูระบบจัดการงานขนส่งพัสดุ    #### หลังจากล็อคอินสำเร็จระบบ By Pass มาที่ระบบ DPS เลย จะไม่เจอหน้า Portal ให้คลิกสเตปนี้ได้
    dps_common.Select DPS Menu    ${dps_menu['Home_Page']}    ####เพิ่มสเตปนี้ขึ้นมาเพราะ หลังจากล็ิอคอินสำเร็จ ระบบ Navigate มาที่เมนู Scan จึงต้องบังคับมาเมนู Home Page ตาม Requirement
    dps_home_page.Verify Current Date
    common.Verify Capture Screenshot    AllSpeedy-DPS-003-ID-9    Verify Current Date
    dps_home_page.Verify Parcels Into The Warehouse
    common.Verify Capture Screenshot    AllSpeedy-DPS-003-ID-9    Verify Parcels Into The Warehouse