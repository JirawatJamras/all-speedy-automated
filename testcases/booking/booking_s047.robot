*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Keywords ***
Booking_S005
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S005['parcel_type']}
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S005['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S005['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S005['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S005['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S005['sender_postcode_full']}
    b2c_create_parcel_page.Click Add To Favorites
    b2c_booking_delivery_page.Click Save Button
    b2c_booking_detail_page.Wait Until Loading Icon Success

Booking_S003
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_detail_page.Wait Until Loading Icon Success
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Select Parcel Type    ${Booking_S003['parcel_type']}
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S003['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S003['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S003['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S003['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S003['sender_postcode_full']}
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S003['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S003['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S003['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S003['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S003['receiver_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    b2c_booking_delivery_page.Click Save Button
    b2c_booking_detail_page.Wait Until Loading Icon Success

*** Test Cases ***
Booking_S047
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า รายการโปรด เพิ่มเเละเเก้ไข
    [Tags]    Booking    Business_To_Customer    UAT    Defect106    Defect123    Defect124    Defect135
    Log    Login
    b2c_login_page.Input Email And Password
    b2c_login_page.Click Log On Button

    Log    Prerequisite S005
    Booking_S005

    Log    Prerequisite S003
    Booking_S003

    Log    Step No.1 กด Tap "ผู้ส่งพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    # Expected
    b2c_favorite_page.Verify Display Sender Card
    ...    ${Booking_S047.sender_favorite_card['favorite_name']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['sender_address']}
    ...    ${Booking_S005['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    1.Verify Display Sender Card

    Log    Step No.2 กดที่รายการโปรด
    b2c_favorite_page.Click Sender Card
    ...    ${Booking_S047.sender_favorite_card['favorite_name']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['sender_address']}
    ...    ${Booking_S005['sender_postcode_full']}
    # Expected
    b2c_favorite_page.Verify Label Sender
    ...    ${favorite.label_sender_favorite['text_data_sender']}
    ...    ${favorite.label_sender_favorite['text_favorite_name']}
    ...    ${favorite.label_sender_favorite['text_phone']}
    ...    ${favorite.label_sender_favorite['text_name']}
    ...    ${favorite.label_sender_favorite['text_address']}
    ...    ${favorite.label_sender_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Sender In Read-Only Mode
    ...    ${Booking_S047.sender_favorite_card['favorite_name']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['sender_address']}
    ...    ${Booking_S005['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    2.Verify Data Sender In Popup

    Log    Step No.3 กดปุ่ม "เเก้ไข"
    b2c_favorite_page.Click Edit Button
    # Expected
    b2c_favorite_page.Verify Label Sender
    ...    ${favorite.label_sender_favorite['text_data_sender']}
    ...    ${favorite.label_sender_favorite['text_favorite_name']}
    ...    ${favorite.label_sender_favorite['text_phone']}
    ...    ${favorite.label_sender_favorite['text_name']}
    ...    ${favorite.label_sender_favorite['text_address']}
    ...    ${favorite.label_sender_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Sender
    ...    ${Booking_S047.sender_favorite_card['favorite_name']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['sender_address']}
    ...    ${Booking_S005['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    3.Verify Sender Before Editing In Popup
    
    Log    Step No.4 เเก้ไขรายการดังนี้
    b2c_favorite_page.Edit Sender Favorite Name    ${Booking_S047.edit_sender['sender_favorite_name']}
    # Expected
    b2c_favorite_page.Wait until Data Is Successfully Edited
    common.Verify Capture Screenshot    booking    Booking_S047    4.Verify Sender Edited In Popup

    Log    Step No.5 กดปุ่ม "บันทึกเเก้ไข"
    b2c_favorite_page.Click Save Edit Button
    # Expected
    b2c_favorite_page.Verify Display Sender Card After Edit Data
    ...    ${Booking_S047.edit_sender['sender_favorite_name']}
    ...    ${Booking_S005['sender_name']}
    ...    ${Booking_S005['sender_phone']}
    ...    ${Booking_S005['sender_address']}
    ...    ${Booking_S005['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    5.Verify Data Sender After Edited
    
    Log    Step No.6 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Sender Button
    # Expected
    b2c_favorite_page.Verify Label Sender
    ...    ${favorite.label_sender_favorite['text_data_sender']}
    ...    ${favorite.label_sender_favorite['text_favorite_name']}
    ...    ${favorite.label_sender_favorite['text_phone']}
    ...    ${favorite.label_sender_favorite['text_name']}
    ...    ${favorite.label_sender_favorite['text_address']}
    ...    ${favorite.label_sender_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Sender
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${favorite['text_input_postcode']}
    common.Verify Capture Screenshot    booking    Booking_S047    6.Verify Add Sender Favorite Popup

    Log    Step No.7 กรอกข้อมูลดังนี้
    b2c_favorite_page.Input Sender Favorite Name    ${Booking_S047.add_sender_favorite['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number    ${Booking_S047.add_sender_favorite['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${Booking_S047.add_sender_favorite['sender_name']}
    b2c_favorite_page.Input Sender Address    ${Booking_S047.add_sender_favorite['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${Booking_S047.add_sender_favorite['sender_postcode_5_digits']}
    b2c_favorite_page.Select Sender Postcode List    ${Booking_S047.add_sender_favorite['sender_postcode_full']}
    b2c_favorite_page.Click Save Button
    # Expected
    b2c_favorite_page.Verify Display Sender Card After Add New
    ...    ${Booking_S047.add_sender_favorite['favorite_name']}
    ...    ${Booking_S047.add_sender_favorite['sender_name']}
    ...    ${Booking_S047.add_sender_favorite['sender_phone']}
    ...    ${Booking_S047.add_sender_favorite['sender_address']}
    ...    ${Booking_S047.add_sender_favorite['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    7.Verify Sender Card After Added Information

    Log    Step No.8 กด Tap "ผู้รับพัสดุ"
    b2c_favorite_page.Select Receiver Tab
    # Expected
    b2c_favorite_page.Verify Display Receiver Card When Select Home
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    8.Verify Display Receiver Card When Select Send To Home

    Log    Step No.9 กดที่รายการโปรด
    b2c_favorite_page.Click Receiver Card
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    # Expected
    b2c_favorite_page.Verify Label Receiver
    ...    ${favorite.label_reciever_favorite['text_data_receiver']}
    ...    ${favorite.label_reciever_favorite['text_favorite_name']}
    ...    ${favorite.label_reciever_favorite['text_phone']}
    ...    ${favorite.label_reciever_favorite['text_name']}
    ...    ${favorite.label_reciever_favorite['text_location_pickup']}
    ...    ${favorite.label_reciever_favorite['text_address']}
    ...    ${favorite.label_reciever_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Recevier In Read-Only Mode
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_location_pickup']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    9.1.Verify Data Receiver In Popup
    b2c_favorite_page.Scroll To Display Edit Button
    common.Verify Capture Screenshot    booking    Booking_S047    9.2.Verify Data Receiver Footer In Popup

    Log    Step No.10 กดปุ่ม "เเก้ไข"
    b2c_favorite_page.Click Edit Button
    # Expected
    b2c_favorite_page.Verify Label Receiver
    ...    ${favorite.label_reciever_favorite['text_data_receiver']}
    ...    ${favorite.label_reciever_favorite['text_favorite_name']}
    ...    ${favorite.label_reciever_favorite['text_phone']}
    ...    ${favorite.label_reciever_favorite['text_name']}
    ...    ${favorite.label_reciever_favorite['text_location_pickup']}
    ...    ${favorite.label_reciever_favorite['text_address']}
    ...    ${favorite.label_reciever_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Receiver
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_location_pickup']}
    ...    ${Booking_S003['receiver_address']}
    ...    ${Booking_S003['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    10.Verify Receiver Before Editing In Popup

    Log    Step No.11 เเก้ไขรายการดังนี้
    b2c_favorite_page.Select Pickup Location    ${Booking_S047.edit_receiver['receiver_location_pickup']}
    b2c_favorite_page.Input And Select Store Code Receiver    ${Booking_S047.edit_receiver['receiver_store_code_5_digits']}    ${Booking_S047.edit_receiver['receiver_store_address']}
    b2c_favorite_page.Click Store On Map
    # Expected
    b2c_favorite_page.Verify Store Address Receiver    ${Booking_S047.edit_receiver['receiver_store_full_address']}
    common.Verify Capture Screenshot    booking    Booking_S047    11.Verify Receiver Edited In Popup

    Log    Step No.12 กดปุ่ม "บันทึกเเก้ไข"
    b2c_favorite_page.Click Save Edit Button
    # Expected
    b2c_favorite_page.Verify Display Receiver Card After Edit Data When Select Send To 7-ELEVEN Store
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S003['receiver_name']}
    ...    ${Booking_S003['receiver_phone']}
    ...    ${Booking_S047.edit_receiver['receiver_store_address2']}
    common.Verify Capture Screenshot    booking    Booking_S047    12.Verify Data Receiver After Edited

    Log    Step No.13 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Receiver Button
    b2c_favorite_page.Select Pickup Location    ${Booking_S047.add_receiver_favorite['receiver_location_pickup']}
    # Expected
    b2c_favorite_page.Verify Label Receiver
    ...    ${favorite.label_reciever_favorite['text_data_receiver']}
    ...    ${favorite.label_reciever_favorite['text_favorite_name']}
    ...    ${favorite.label_reciever_favorite['text_phone']}
    ...    ${favorite.label_reciever_favorite['text_name']}
    ...    ${favorite.label_reciever_favorite['text_location_pickup']}
    ...    ${favorite.label_reciever_favorite['text_address']}
    ...    ${favorite.label_reciever_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Receiver
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${favorite['text_input_postcode']}
    common.Verify Capture Screenshot    booking    Booking_S047    13.1.Verify Add Receiver Favorite Popup
    b2c_favorite_page.Scroll To Display Save Button
    common.Verify Capture Screenshot    booking    Booking_S047    13.2.Verify Add Receiver Favorite Footer Popup

    Log    Step No.14 กรอกข้อมูลดังนี้
    b2c_favorite_page.Input Receiver Favorite Name    ${Booking_S047.add_receiver_favorite['favorite_name']}
    b2c_favorite_page.Input Receiver Phone Number    ${Booking_S047.add_receiver_favorite['receiver_phone']}
    b2c_favorite_page.Input Receiver Name    ${Booking_S047.add_receiver_favorite['receiver_name']}
    b2c_favorite_page.Input Receiver Address    ${Booking_S047.add_receiver_favorite['receiver_address']}
    b2c_favorite_page.Input Receiver Postcode    ${Booking_S047.add_receiver_favorite['receiver_postcode_5_digits']}
    b2c_favorite_page.Select Receiver Postcode Lists    ${Booking_S047.add_receiver_favorite['receiver_postcode_full']}
    b2c_favorite_page.Click Save Button
    # Expected
    b2c_favorite_page.Verify Display Receiver Card After Add New When Select Send To Home
    ...    ${Booking_S047.add_receiver_favorite['favorite_name']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_name']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_phone']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_address']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S047    14.Verify Receiver Card After Added When Select Send To Home

    Log    Step No.15 กด Tap "พื้นที่ต้นทางการจัดส่ง"
    b2c_favorite_page.Select Shipping Origin Area Tab
    # Expected
    b2c_favorite_page.Verify Shipping Origin Area Tab
    common.Verify Capture Screenshot    booking    Booking_S047    15.Verify Shipping Origin Area Tab

    Log    Step No.16 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Shipping Origin Area Button
    # Expected
    b2c_favorite_page.Verify Label Shipping Origin Area
    ...    ${favorite.label_shipping_origin_area['text_data_shipping_origin_area']}
    ...    ${favorite.label_shipping_origin_area['text_favorite_name']}
    ...    ${favorite.label_shipping_origin_area['text_set_to_default']}
    b2c_favorite_page.Verify Data Shipping Origin Area
    ...    ${EMPTY}
    common.Verify Capture Screenshot    booking    Booking_S047    16.1.Verify Add Shipping Origin Area Popup
    b2c_favorite_page.Scroll To Display Save Button
    common.Verify Capture Screenshot    booking    Booking_S047    16.2.Verify Add Shipping Origin Area Footer Popup

    Log    Step No.17 กรอกข้อมูลดังนี้
    b2c_favorite_page.Input Shipping Origin Area Favorite Name    ${Booking_S047.add_shipping_origin_area['favorite_name']}
    b2c_favorite_page.Input And Select Store Code Shipping Origin Area    ${Booking_S047.add_shipping_origin_area['shipping_origin_store_code_5_digits']}    ${Booking_S047.add_shipping_origin_area['shipping_origin_store_address']}
    b2c_favorite_page.Click Store On Map
    b2c_favorite_page.Click Save Button
    # Expected
    b2c_favorite_page.Verify Display Shipping Origin Area Card
    ...    ${Booking_S047.add_shipping_origin_area['favorite_name']}
    ...    ${Booking_S047.add_shipping_origin_area['shipping_origin_store_address']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S047    17.Verify Shipping Origin Area Card After Added Information