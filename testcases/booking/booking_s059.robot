*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome   #headlesschrome   #chrome
                  ...    AND    Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S059
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - ข้อมูลผู้ส่งต้องการใช้ที่อยู่ผู้ส่งพัสดุเดียวกันทั้งบุ๊คกิ้ง
    [Tags]    Booking    Business_To_Customer    Regression
    skip
