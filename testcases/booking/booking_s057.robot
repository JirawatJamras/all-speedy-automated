*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date 
Test Teardown     Close Browser

*** Test Cases ***
Booking_S057
    [Documentation]    ลูกค้า All Member - ตรวจสอบหน้า พัสดุของฉัน Tap รายการพัสดุที่ได้รับ
    [Tags]    Booking    Customer_To_Customer    Regression
    skip