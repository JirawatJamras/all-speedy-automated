*** Settings ***
Resource            ../../resourses/import.robot
Suite Setup         Open Browser And Go To Allspeedy Website
Suite Teardown      Close Browser
Force Tags          AllSpeedy-DPS-001

*** Test Cases ***

AllSpeedy-DPS-001-ID-1
    [Documentation]    [หน้าล็อกอินเข้าสู่ระบบจัดการงานขนส่งพัสดุAll Speedy]
    ...                กรอกบัญชีผู้ใช้งาน ไม่ถูกต้อง
    [Tags]    AllSpeedy-DPS-001-ID-1
    common.Open URL    ${DPS_UAT_URL}
    landing_page.Click Go Login Button
    login_page.Input Email    ${login_user_01['username']}
    login_page.Input Password    ${login_user_01['password']}
    login_page.Click Log On Button
    

