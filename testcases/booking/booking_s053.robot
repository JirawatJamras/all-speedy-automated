*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S053
    [Documentation]    ลูกค้า All Member - สร้างพัสดุ (ทั่วไป) - Import Excel Flie จากปุ่มในหน้า จองการจัดส่งพัสดุ (ตรวจสอบ Error message เเละราคา)
    [Tags]    Booking    Customer_To_Customer    Regression
    skip