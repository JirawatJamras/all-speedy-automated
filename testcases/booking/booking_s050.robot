*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Booking_S050
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า Return Business (เพิ่มรายการ Return Business)
    [Tags]    Booking    Business_To_Customer    Regression
    skip
