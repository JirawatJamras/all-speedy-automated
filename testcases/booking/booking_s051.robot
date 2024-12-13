*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S051
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า Return Business (ลูกค้าทั่วไปบุ๊คพัสดุ จาก Link Return Business ที่ได้รับ)
    [Tags]    Booking    Business_To_Customer    Regression
    skip
