*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome   #chrome
                  ...    AND   Set Folder Result with date
Test Teardown    Run Keywords    common.Delete API Booking By Booking ID    ${booking_id}
                  ...    AND    Close Browser

*** Test Cases ***
Booking_S047
    [Documentation]    ลูกค้า B - ตรวจสอบหน้า รายการโปรด เพิ่มเเละเเก้ไข
    [Tags]    Booking    UAT    Run
    Log    Login
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    ${b2c_login_user_01['username']}
    b2c_login_page.Input Password    ${b2c_login_user_01['password']}
    b2c_login_page.Click Log On Button

    Log    Step No.1 กด Tap "ผู้ส่งพัสดุ"
    b2c_home_page.Click Parcel Delivery Service Menu
    b2c_home_page.Select Sub Menu Favorites
    b2c_favorite_page.Select Sender Tab
    # Expected
    b2c_favorite_page.Verify Display Receiver Card When Select Home
    ...    ${Booking_S047.sender_favorite_card['favorite_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_phone']}
    ...    ${Booking_S047.sender_favorite_card['sender_address']}
    ...    ${Booking_S047.sender_favorite_card['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Display Receiver Card When Select Home

    Log    Step No.2 กดที่รายการโปรด
    b2c_favorite_page.Click Sender Card
    ...    ${Booking_S047.sender_favorite_card['favorite_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_phone']}
    ...    ${Booking_S047.sender_favorite_card['sender_address']}
    ...    ${Booking_S047.sender_favorite_card['sender_postcode_full']}
    # Expected
    b2c_favorite_page.Verify Label Sender
    ...    ${favorite.data_sender_favorite['text_data_sender']}
    ...    ${favorite.data_sender_favorite['text_favorite_name']}
    ...    ${favorite.data_sender_favorite['text_phone']}
    ...    ${favorite.data_sender_favorite['text_name']}
    ...    ${favorite.data_sender_favorite['text_address']}
    ...    ${favorite.data_sender_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Sender In Read-Only Mode
    ...    ${Booking_S047.sender_favorite_card['favorite_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_phone']}
    ...    ${Booking_S047.sender_favorite_card['sender_address']}
    ...    ${Booking_S047.sender_favorite_card['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Data Sender

    Log    Step No.3 กดปุ่ม "เเก้ไข"
    b2c_favorite_page.Click Edit Button
    # Expected
    b2c_favorite_page.Verify Label Sender
    ...    ${favorite.data_sender_favorite['text_data_sender']}
    ...    ${favorite.data_sender_favorite['text_favorite_name']}
    ...    ${favorite.data_sender_favorite['text_phone']}
    ...    ${favorite.data_sender_favorite['text_name']}
    ...    ${favorite.data_sender_favorite['text_address']}
    ...    ${favorite.data_sender_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Sender
    ...    ${Booking_S047['favorite_name']}
    ...    ${Booking_S047['sender_name']}
    ...    ${Booking_S047['sender_phone']}
    ...    ${Booking_S047['sender_address']}
    ...    ${Booking_S047['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Edit Data Sender
    
    Log    Step No.4 เเก้ไขรายการดังนี้
    # ชื่อรายการโปรด : บ้านต่างจังหวัด
    b2c_favorite_page.Input Sender Favorite Name    ${Booking_S047.edit_sender['sender_favorite_name']}
    # Expected
    common.Verify Capture Screenshot    Booking_S047    Verify Edit Favorite Name

    Log    Step No.5 กดปุ่ม "บันทึกเเก้ไข"
    b2c_favorite_page.Click Save Edit Button
    # Expected
    b2c_favorite_page.Verify Display Receiver Card When Select Home
    ...    ${Booking_S047.edit_sender['sender_favorite_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_name']}
    ...    ${Booking_S047.sender_favorite_card['sender_phone']}
    ...    ${Booking_S047.sender_favorite_card['sender_address']}
    ...    ${Booking_S047.sender_favorite_card['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Data Sender After Edit Favorite Name
    
    Log    Step No.6 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Sender Button
    # Expected
    b2c_favorite_page.Verify Label Sender
    ...    ${favorite.data_sender_favorite['text_data_sender']}
    ...    ${favorite.data_sender_favorite['text_favorite_name']}
    ...    ${favorite.data_sender_favorite['text_phone']}
    ...    ${favorite.data_sender_favorite['text_name']}
    ...    ${favorite.data_sender_favorite['text_address']}
    ...    ${favorite.data_sender_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Sender
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    common.Verify Capture Screenshot    Booking_S047    Verify Add Sender Favorite Popup

    Log    Step No.7 กรอกข้อมูลดังนี้
    b2c_favorite_page.Input Sender Favorite Name    ${Booking_S047.add_sender_favorite['favorite_name']}
    b2c_favorite_page.Input Sender Phone Number    ${Booking_S047.add_sender_favorite['sender_name']}
    b2c_favorite_page.Input Sender Name    ${Booking_S047.add_sender_favorite['sender_phone']}
    b2c_favorite_page.Input Sender Address    ${Booking_S047.add_sender_favorite['sender_address']}
    b2c_favorite_page.Input Sender Postcode    ${Booking_S047.add_sender_favorite['sender_postcode_5_digits']}
    b2c_favorite_page.Select Sender Postcode List    ${Booking_S047.add_sender_favorite['sender_postcode_full']}
    b2c_favorite_page.Click Save Button
    # Expected
    b2c_favorite_page.Verify Display Sender Card
    ...    ${Booking_S047.add_favorite['favorite_name']}
    ...    ${Booking_S047.add_favorite['sender_name']}
    ...    ${Booking_S047.add_favorite['sender_phone']}
    ...    ${Booking_S047.add_favorite['sender_address']}
    ...    ${Booking_S047.add_favorite['sender_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Sender Card After Add Favorite Sender

    Log    Step No.8 กด Tap "ผู้รับพัสดุ"
    b2c_favorite_page.Select Receiver Tab
    # Expected
    b2c_favorite_page.Verify Display Receiver Card When Select Home
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_phone']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_address']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Display Receiver Card When Select Home

    Log    Step No.9 กดที่รายการโปรด
    b2c_favorite_page.Click Receiver Card
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_phone']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_address']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_postcode_full']}
    # Expected
    b2c_favorite_page.Verify Label Receiver
    ...    ${favorite.data_reciever_favorite['text_data_sender']}
    ...    ${favorite.data_reciever_favorite['text_favorite_name']}
    ...    ${favorite.data_reciever_favorite['text_phone']}
    ...    ${favorite.data_reciever_favorite['text_name']}
    ...    ${favorite.data_reciever_favorite['text_location_pickup']}
    ...    ${favorite.data_reciever_favorite['text_address']}
    ...    ${favorite.data_reciever_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Recevier In Read-Only Mode
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_phone']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_location_pickup']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_address']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Data Receiver

    Log    Step No.10 กดปุ่ม "เเก้ไข"
    b2c_favorite_page.Click Edit Button
    # Expected
    b2c_favorite_page.Verify Label Receiver
    ...    ${favorite.data_reciever_favorite['text_data_sender']}
    ...    ${favorite.data_reciever_favorite['text_favorite_name']}
    ...    ${favorite.data_reciever_favorite['text_phone']}
    ...    ${favorite.data_reciever_favorite['text_name']}
    ...    ${favorite.data_reciever_favorite['text_location_pickup']}
    ...    ${favorite.data_reciever_favorite['text_address']}
    ...    ${favorite.data_reciever_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Receiver
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_phone']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_location_pickup']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_address']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Edit Data Sender

    Log    Step No.11 เเก้ไขรายการดังนี้
    # สถานที่รับพัสดุ : ส่งร้าน 7-11
    b2c_favorite_page.Select Pickup Location    ${Booking_S047.edit_receiver['receiver_location_pickup']}
    b2c_favorite_page.Input Store Code Receiver    ${Booking_S047.edit_receiver['receiver_store_code_5_digits']}
    b2c_favorite_page.Select Store Receiver Lists    ${Booking_S047.edit_receiver['receiver_store_address']}
    b2c_favorite_page.Click Store On Map
    # Expected
    b2c_favorite_page.Verify Store Address Receiver    15888 สาขา สาขา CP TOWER สีลม แขวงสีลม เขตบางรัก กรุงเทพมหานคร รหัสไปรษณีย์ 10500  #Expected result : ${Booking_S047.edit_receiver['receiver_store_full_address']}
    common.Verify Capture Screenshot    Booking_S047    Verify Edit Data Receiver

    Log    Step No.12 กดปุ่ม "บันทึกเเก้ไข"
    b2c_favorite_page.Click Save Edit Button
    # Expected
    b2c_favorite_page.Verify Display Receiver Card When Select 7-ELEVEN Store
    ...    ${Booking_S047.receiver_favorite_card['favorite_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_name']}
    ...    ${Booking_S047.receiver_favorite_card['receiver_phone']}
    ...    ${Booking_S047.edit_receiver['receiver_store_address']}
    common.Verify Capture Screenshot    Booking_S047    Verify Data Receiver After Edit Location Pickup

    Log    Step No.13 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Receiver Button
    # Expected
    b2c_favorite_page.Verify Label Receiver
    ...    ${favorite.data_reciever_favorite['text_data_sender']}
    ...    ${favorite.data_reciever_favorite['text_favorite_name']}
    ...    ${favorite.data_reciever_favorite['text_phone']}
    ...    ${favorite.data_reciever_favorite['text_name']}
    ...    ${favorite.data_reciever_favorite['text_location_pickup']}
    ...    ${favorite.data_reciever_favorite['text_address']}
    ...    ${favorite.data_reciever_favorite['text_postcode']}
    b2c_favorite_page.Verify Data Receiver
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${EMPTY}
    common.Verify Capture Screenshot    Booking_S047     Verify Add Receiver Favorite Popup

    Log    Step No.14 กรอกข้อมูลดังนี้
    b2c_favorite_page.Input Receiver Favorite Name    ${Booking_S047.add_receiver_favorite['favorite_name']}
    b2c_favorite_page.Input Receiver Phone Number    ${Booking_S047.add_receiver_favorite['sender_name']}
    b2c_favorite_page.Input Receiver Name    ${Booking_S047.add_receiver_favorite['sender_phone']}
    b2c_favorite_page.Input Receiver Address    ${Booking_S047.add_receiver_favorite['sender_address']}
    b2c_favorite_page.Input Receiver Postcode    ${Booking_S047.add_receiver_favorite['sender_postcode_5_digits']}
    b2c_favorite_page.Select Receiver Postcode Lists    ${Booking_S047.add_receiver_favorite['sender_postcode_full']}
    b2c_favorite_page.Click Save Button
    # Expected
    b2c_favorite_page.Verify Display Receiver Card When Select Home
    ...    ${Booking_S047.add_receiver_favorite['favorite_name']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_name']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_phone']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_address']}
    ...    ${Booking_S047.add_receiver_favorite['receiver_postcode_full']}
    common.Verify Capture Screenshot    Booking_S047    Verify Receiver Card After Add Favorite Receiver When Select Send Home

    Log    Step No.15 กด Tap "พื้นที่ต้นทางการจัดส่ง"
    b2c_favorite_page.Select Shipping Origin Area Tab
    # Expected
    b2c_favorite_page.Verify Shipping Origin Area Tab
    common.Verify Capture Screenshot    Booking_S047    Verify Shipping Origin Area Tab

    Log    Step No.16 กดปุ่ม "เพิ่ม"
    b2c_favorite_page.Click Add Shipping Origin Area Button
    # Expected
    b2c_favorite_page.Verify Label Shipping Origin Area
    ...    ${favorite.data_shipping_origin_area['text_data_shipping_origin_area']}
    ...    ${favorite.data_shipping_origin_area['text_favorite_name']}
    ...    ${favorite.data_shipping_origin_area['text_set_to_default']}
    b2c_favorite_page.Verify Data Shipping Origin Area
    ...    ${EMPTY}
    common.Verify Capture Screenshot    Booking_S047    Verify Add Shipping Origin Area Popup

    Log    Step No.17 กรอกข้อมูลดังนี้
    b2c_favorite_page.Input Shipping Origin Area Favorite Name    ${favorite.add_shipping_origin_area['favorite_name']}
    b2c_favorite_page.Input Store Code Shipping Origin Area    ${Booking_S047.add_shipping_origin_area['shipping_origin_store_code_5_digits']}
    b2c_favorite_page.Select Store Shipping Origin Area Lists    ${Booking_S047.add_shipping_origin_area['shipping_origin_store_address']}
    b2c_favorite_page.Click Store On Map
    # Expected
    common.Verify Capture Screenshot    Booking_S047    Verify Shipping Origin Area Card After Added Information

