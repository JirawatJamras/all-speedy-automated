*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S040
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ควบคุมอุณหภูมิ) - Import Excel Flie จากปุ่มในหน้า บุ๊คกิ้ง (ตรวจสอบ Error message เเละราคา)
    [Tags]    Booking    Business_To_Customer    UAT
    skip