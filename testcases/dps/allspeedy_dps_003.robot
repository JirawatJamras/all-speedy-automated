*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    headlesschrome    #chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser

*** Test Cases ***
AllSpeedy_DPS_003_ID_9
    [Documentation]    [ตรวจสอบภาพรวมงานประจําวัน] ตรวจสอบหัวข้อ พัสดุเข้าคลัง (งานรับเข้า)
    [Tags]    AllSpeedy_DPS_003    UAT    test1
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_03['username']}
    dps_login_page.Input Password    ${dps_login_user_03['password']}
    dps_login_page.Click Log On Button
    # Click เมนูระบบจัดการงานขนส่งพัสดุ    #### หลังจากล็อคอินสำเร็จระบบ By Pass มาที่ระบบ DPS เลย จะไม่เจอหน้า Portal ให้คลิกสเตปนี้ได้
    dps_home_page.Select DPS Menu    ${dps_menu['Home_Page']}    ####เพิ่มสเตปนี้ขึ้นมาเพราะ หลังจากล็ิอคอินสำเร็จ ระบบ Navigate มาที่เมนู Scan จึงต้องบังคับมาเมนู Home Page ตาม Requirement
    dps_home_page.Verify Current Date    
    common.Verify Capture Screenshot    AllSpeedy_DPS_003_ID_9    Verify Current Date
    dps_home_page.Verify Parcels Into The Warehouse   AllSpeedy_DPS_003_ID_9 
    common.Verify Capture Screenshot    AllSpeedy_DPS_003_ID_9    Verify Parcels Into The Warehouse

