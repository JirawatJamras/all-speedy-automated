*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome   #headlesschrome   #chrome
                  ...    AND    Set Folder Result with date
Test Teardown    Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S043
    [Documentation]    ลูกค้า B - สร้างพัสดุ (ทั่วไป) - เเก้ไขรายการ
    [Tags]    Booking    UAT    Review_Pass
    Log    Step No.1 กดเมนู "จองการจัดส่งพัสดุ"
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    #Expected
    b2c_booking_delivery_page.Verify Created Booking On Booking Delivery Page
    ...    ${booking_id}
    ...    ${booking_time}
    ...    ${Booking['text_parcel_status_waiting_entering']}
    ...    ${Booking_S020['booking_name']}
    ...    ${Booking_S020['booking_item']}
    ...    0.00 บาท    # Expected result is: ${Booking.text_default['booking_price']}
    common.Verify Capture Screenshot    Booking_S042    Verify Created Booking On Booking Delivery Page
