*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Keywords ***
Booking_S031
    c2c_login.Input Email And Password    ${c2c_login_user_01['username']}    ${c2c_login_user_01['password']}
    c2c_login.Click Log On Button
    c2c_landing_page.Click Menu Seven Store
    c2c_landing_page.Click Menu Shipping
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S031['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S031['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S031['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S031['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S031['sender_postcode_full']}
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S031['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S031['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S031['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S031['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S031['receiver_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    b2c_booking_delivery_page.Click Save Button
    
Booking_S032
    b2c_home_page.Click Book Parcel Delivery
    b2c_booking_delivery_page.Click Button To Add
    b2c_booking_delivery_page.Click Accept Terms of Service
    b2c_booking_delivery_page.Input Phone Sender    ${Booking_S032['sender_phone']}
    b2c_booking_delivery_page.Input Name Sender    ${Booking_S032['sender_name']}    
    b2c_booking_delivery_page.Input Address Sender    ${Booking_S032['sender_address']}
    b2c_booking_delivery_page.Input Postcode Sender    ${Booking_S032['sender_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Sender Lists    ${Booking_S032['sender_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Sender
    b2c_booking_delivery_page.Click Next Button
    b2c_booking_delivery_page.Select Send To Home Tab
    b2c_booking_delivery_page.Input Phone Receiver    ${Booking_S032['receiver_phone']}
    b2c_booking_delivery_page.Input Name Receiver    ${Booking_S032['receiver_name']}
    b2c_booking_delivery_page.Click Button    ${tab_send_to_home}
    b2c_booking_delivery_page.Input Address Receiver    ${Booking_S032['receiver_address']}
    b2c_booking_delivery_page.Input Postcode Receiver    ${Booking_S032['receiver_postcode_5_digits']}
    b2c_booking_delivery_page.Click Postcode Receiver Lists    ${Booking_S032['receiver_postcode_full']}
    b2c_booking_delivery_page.Click Add To Favorites In Receiver
    b2c_booking_delivery_page.Click Save Button

*** Test Cases ***
Booking_S058
    [Documentation]    ลูกค้า All Member - ตรวจสอบหน้า รายการโปรด เพิ่มเเละเเก้ไข
    [Tags]    Booking    Customer_To_Customer    UAT    Defect106    Defect123    Defect124    Defect134    Defect135
    Log    Prerequisite S031
    Booking_S031 

    Log    Prerequisite S032
    Booking_S032

    Log    Step No.1 กด Tap "ผู้ส่งพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    # Expected
    b2c_favorite_page.Verify Display Sender Card
    ...    ${Booking_S058.sender_favorite_card['favorite_name']}
    ...    ${Booking_S032['sender_name']}
    ...    ${Booking_S032['sender_phone']}
    ...    ${Booking_S032['sender_address']}
    ...    ${Booking_S032['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    1.Verify Display Sender Card

    Log    Step No.2 กดที่รายการโปรด
    b2c_favorite_page.Click Sender Card
    ...    ${Booking_S058.sender_favorite_card['favorite_name']}
    ...    ${Booking_S032['sender_name']}
    ...    ${Booking_S032['sender_phone']}
    ...    ${Booking_S032['sender_address']}
    ...    ${Booking_S032['sender_postcode_full']}
    # Expected
    b2c_favorite_page.Verify Label Sender
    ...    ${favorite.label_sender_favorite['text_data_sender']}
    ...    ${favorite.label_sender_favorite['text_favorite_name']}
    ...    ${favorite.label_sender_favorite['text_phone']}
    ...    ${favorite.label_sender_favorite['text_name']}
    ...    ${favorite.label_sender_favorite['text_address']}
    ...    ${favorite.label_sender_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Sender In Read-Only Mode
    ...    ${Booking_S058.sender_favorite_card['favorite_name']}
    ...    ${Booking_S032['sender_name']}
    ...    ${Booking_S032['sender_phone']}
    ...    ${Booking_S032['sender_address']}
    ...    ${Booking_S032['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    2.Verify Data Sender In Popup

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
    ...    ${Booking_S058.sender_favorite_card['favorite_name']}
    ...    ${Booking_S032['sender_name']}
    ...    ${Booking_S032['sender_phone']}
    ...    ${Booking_S032['sender_address']}
    ...    ${Booking_S032['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    3.Verify Sender Before Editing In Popup

    Log    Step No.4 เเก้ไขรายการ
    b2c_favorite_page.Edit Sender Favorite Name    ${Booking_S058.edit_sender['sender_favorite_name']}
    # Expected
    b2c_favorite_page.Wait until Data Is Successfully Edited
    common.Verify Capture Screenshot    booking    Booking_S058    4.Verify Sender Edited In Popup

    Log    Step No.5 กดปุ่ม "บันทึกเเก้ไข"
    b2c_favorite_page.Click Save Edit Button
    # Expected
    b2c_favorite_page.Verify Display Sender Card After Edit Data
    ...    ${Booking_S058.edit_sender['sender_favorite_name']}
    ...    ${Booking_S032['sender_name']}
    ...    ${Booking_S032['sender_phone']}
    ...    ${Booking_S032['sender_address']}
    ...    ${Booking_S032['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    5.Verify Data Sender After Edited

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
    common.Verify Capture Screenshot    booking    Booking_S058    6.Verify Add Sender Favorite Popup

    Log    Step No.7 กรอกข้อมูล
    b2c_favorite_page.Input Sender Favorite Name    ${Booking_S058.add_sender_favorite['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number    ${Booking_S058.add_sender_favorite['sender_phone']}
    b2c_favorite_page.Input Sender Name    ${Booking_S058.add_sender_favorite['sender_name']}
    b2c_favorite_page.Input Sender Address    ${Booking_S058.add_sender_favorite['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${Booking_S058.add_sender_favorite['sender_postcode_5_digits']}
    b2c_favorite_page.Select Sender Postcode List    ${Booking_S058.add_sender_favorite['sender_postcode_full']}
    b2c_favorite_page.Click Save Button
    # Expected
    b2c_favorite_page.Verify Display Sender Card After Add New
    ...    ${Booking_S058.add_sender_favorite['favorite_name']}
    ...    ${Booking_S058.add_sender_favorite['sender_name']}
    ...    ${Booking_S058.add_sender_favorite['sender_phone']}
    ...    ${Booking_S058.add_sender_favorite['sender_address']}
    ...    ${Booking_S058.add_sender_favorite['sender_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    7.Verify Sender Card After Added Information

    Log    Step No.8 กด Tap "ผู้รับพัสดุ"
    b2c_favorite_page.Select Receiver Tab
    # Expected
    b2c_favorite_page.Verify Display Receiver Card When Select Home
    ...    ${Booking_S058.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    8.Verify Display Receiver Card When Select Send To Home

    Log    Step No.9 กดที่รายการโปรด
    b2c_favorite_page.Click Receiver Card
    ...    ${Booking_S058.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    # Expected
    Log Defect No:  Defect134
    b2c_favorite_page.Verify Label Receiver
    ...    ${favorite.label_reciever_favorite['text_data_receiver']}
    ...    ${favorite.label_reciever_favorite['text_favorite_name']}
    ...    ${favorite.label_reciever_favorite['text_phone']}
    ...    ${favorite.label_reciever_favorite['text_name']}
    ...    ${favorite.label_reciever_favorite['text_location_pickup']}
    ...    ${favorite.label_reciever_favorite['text_address']}
    ...    ${favorite.label_reciever_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Recevier In Read-Only Mode
    ...    ${Booking_S058.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S058.receiver_favorite_card['receiver_location_pickup']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    9.1.Verify Data Receiver In Popup
    b2c_favorite_page.Scroll To Display Edit Button
    common.Verify Capture Screenshot    booking    Booking_S058    9.2.Verify Data Receiver Footer In Popup

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
    ...    ${Booking_S058.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S058.receiver_favorite_card['receiver_location_pickup']}
    ...    ${Booking_S031['receiver_address']}
    ...    ${Booking_S031['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    10.Verify Receiver Before Editing In Popup

    Log    Step No.11 เเก้ไขรายการ
    b2c_favorite_page.Select Pickup Location    ${Booking_S058.edit_receiver['receiver_location_pickup']}
    b2c_favorite_page.Input And Select Store Code Receiver    ${Booking_S058.edit_receiver['receiver_store_code_5_digits']}    ${Booking_S058.edit_receiver['receiver_store_address']}
    b2c_favorite_page.Click Store On Map
    # Expected
    Log Defect No:  Defect106
    b2c_favorite_page.Verify Store Address Receiver    ${Booking_S058.edit_receiver['receiver_store_full_address']}
    common.Verify Capture Screenshot    booking    Booking_S058    11.Verify Receiver Edited In Popup

    Log    Step No.12 กดปุ่ม "บันทึกเเก้ไข"
    b2c_favorite_page.Click Save Edit Button
    # Expected
    Log Defect No:  Defect123
    b2c_favorite_page.Verify Display Receiver Card After Edit Data When Select Send To 7-ELEVEN Store
    ...    ${Booking_S058.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S031['receiver_name']}
    ...    ${Booking_S031['receiver_phone']}
    ...    ${Booking_S058.edit_receiver['receiver_store_address']}
    common.Verify Capture Screenshot    booking    Booking_S058    12.Verify Data Receiver After Edited

    Log    Step No.13 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Receiver Button
    b2c_favorite_page.Select Pickup Location    ${Booking_S058.add_receiver_favorite['receiver_location_pickup']}
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
    common.Verify Capture Screenshot    booking    Booking_S058    13.1.Verify Add Receiver Favorite Popup
    b2c_favorite_page.Scroll To Display Save Button
    common.Verify Capture Screenshot    booking    Booking_S058    13.2.Verify Add Receiver Favorite Footer Popup

    Log    Step No.14 กรอกข้อมูล
    b2c_favorite_page.Input Receiver Favorite Name    ${Booking_S058.add_receiver_favorite['favorite_name']}
    b2c_favorite_page.Input Receiver Phone Number    ${Booking_S058.add_receiver_favorite['receiver_phone']}
    b2c_favorite_page.Input Receiver Name    ${Booking_S058.add_receiver_favorite['receiver_name']}
    b2c_favorite_page.Input Receiver Address    ${Booking_S058.add_receiver_favorite['receiver_address']}
    b2c_favorite_page.Input Receiver Postcode    ${Booking_S058.add_receiver_favorite['receiver_postcode_5_digits']}
    b2c_favorite_page.Select Receiver Postcode Lists    ${Booking_S058.add_receiver_favorite['receiver_postcode_full']}
    b2c_favorite_page.Click Save Button
    # Expected
    b2c_favorite_page.Verify Display Receiver Card After Add New When Select Send To Home
    ...    ${Booking_S058.add_receiver_favorite['favorite_name']}
    ...    ${Booking_S058.add_receiver_favorite['receiver_name']}
    ...    ${Booking_S058.add_receiver_favorite['receiver_phone']}
    ...    ${Booking_S058.add_receiver_favorite['receiver_address']}
    ...    ${Booking_S058.add_receiver_favorite['receiver_postcode_full']}
    common.Verify Capture Screenshot    booking    Booking_S058    14.Verify Receiver Card After Added When Select Send To Home

    Log    Step No.15 กด Tap "พื้นที่ต้นทางการจัดส่ง"
    b2c_favorite_page.Select Shipping Origin Area Tab
    # Expected
    b2c_favorite_page.Verify Shipping Origin Area Tab
    common.Verify Capture Screenshot    booking    Booking_S058    15.Verify Shipping Origin Area Tab

    Log    Step No.16 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Shipping Origin Area Button
    # Expected
    Log Defect No:  Defect135
    b2c_favorite_page.Verify Label Shipping Origin Area
    ...    ${favorite.label_shipping_origin_area['text_data_shipping_origin_area']}
    ...    ${favorite.label_shipping_origin_area['text_favorite_name']}
    ...    ${favorite.label_shipping_origin_area['text_set_to_default']}
    b2c_favorite_page.Verify Data Shipping Origin Area
    ...    ${EMPTY}
    common.Verify Capture Screenshot    booking    Booking_S058    16.1.Verify Add Shipping Origin Area Popup
    b2c_favorite_page.Scroll To Display Save Button
    common.Verify Capture Screenshot    booking    Booking_S058    16.2.Verify Add Shipping Origin Area Footer Popup

    Log    Step No.17 กรอกข้อมูล
    b2c_favorite_page.Input Shipping Origin Area Favorite Name    ${Booking_S058.add_shipping_origin_area['favorite_name']}
    b2c_favorite_page.Input And Select Store Code Shipping Origin Area    ${Booking_S058.add_shipping_origin_area['shipping_origin_store_code_5_digits']}    ${Booking_S058.add_shipping_origin_area['shipping_origin_store_address']}
    b2c_favorite_page.Click Store On Map
    b2c_favorite_page.Click Save Button
    # Expected
    Log Defect No:  Defect124
    b2c_favorite_page.Verify Display Shipping Origin Area Card
    ...    ${Booking_S058.add_shipping_origin_area['favorite_name']}
    ...    ${Booking_S058.add_shipping_origin_area['shipping_origin_store_address']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    booking    Booking_S058    17.Verify Shipping Origin Area Card After Added Information