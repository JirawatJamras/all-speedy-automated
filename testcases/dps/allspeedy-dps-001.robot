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
    Open URL    ${DPS_UAT_URL}
    
    



    
