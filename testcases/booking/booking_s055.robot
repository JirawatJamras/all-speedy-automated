*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S055
    [Documentation]    ลูกค้า All Member - ตรวจสอบหน้า ติดตามการจัดส่งพัสดุ
    [Tags]    Booking    Customer_To_Customer    Regression
    skip