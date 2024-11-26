*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S045
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า พัสดุของฉัน Tap รายการพัสดุที่จัดส่ง
    [Tags]    Booking    Business_To_Customer    UAT
    skip