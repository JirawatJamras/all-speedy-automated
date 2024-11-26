*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
# Test Teardown     Run Keywords    Reset Cut Off Time
#                   ...    AND    Close Browser

*** Test Cases ***
DC_Operation_s027
    [Documentation]    การ Move Status แบบค้นหาพัสดุ
    [Tags]    DC_Operation    UAT
    Set Today
    ${today_repattern}    Set Date Pattern    ${today}

    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เลือกเมนู Scan, เลือกแท็บ Move Status > แท็บค้นหาพัสดุ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Move Status Tab
    # Expected
    dps_scan_page.Verify Move Status Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    1.Verify Move Status Page

    Log    Step No.2 คลิกปุ่มตัวกรอง
    dps_scan_page.Click Filter Button
    # Expected
    dps_scan_page.Verify Filter Title Used To Search Information
    ...    ${dc_operation.move_status['parcel_status']}
    ...    ${dc_operation.move_status['parcel_number']}
    ...    ${dc_operation.move_status['pouch_number']}
    ...    ${dc_operation.move_status['receive_parcel_from']}
    ...    ${dc_operation.move_status['transport']}
    ...    ${dc_operation.move_status['pouch_number']}
    ...    ${dc_operation.move_status['parcel_size']}
    ...    ${dc_operation.move_status['last_updated_date']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    2.Verify Filter Title Used To Search Information

    Log    Step No.3 คลิกช่องค้นหาสถานะพัสดุ
    dps_scan_page.Click Filter With Parcel Status
    # Expected
    dps_scan_page.Verify Parcel Status List In Dropdown
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    3.Verify Parcel Status List In Dropdown

    Log    Step No.4 พิมพ์ข้อความ "พัสดุรอเข้ารับร้าน"
    # Defect257
    #################### ใช้ชั่วคราว #######################
    dps_scan_page.Search With Parcel Status [Move Status]    ${dc_operation.parcel_status['pickup_pending']}
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    4.Search With Pickup Pending Status

    Log    Step No.5 คลิกปุ่มค้นหา
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    dps_scan_page.Verify Search Parcel Status Result    ${dc_operation.parcel_status['pickup_pending']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    5.Verify Search Parcel Status Result

    Log    Step No.6 คลิกปุ่มเคลียร์
    dps_scan_page.Click Clear Button [Move Status]
    # Defect266
    # Expected
    dps_scan_page.Verify Clear Filter Input
    # dps_scan_page.Verify Search Parcel Status Result    ${dc_operation.parcel_status['pickup_pending']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    6.Verify Clear Filter Parcel Status

    Log    Step No.7 คลิกช่องค้นหาขนาดพัสดุ
    dps_scan_page.Click Filter With Parcel Size
    # Expected
    dps_scan_page.Verify Parcel Size List In Dropdown
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    7.Verify Parcel Size List In Dropdown

    Log    Step No.8 คลิกช่องค้นหาผ่านขนส่ง
    dps_scan_page.Click Filter With Courier
    # Expected
    dps_scan_page.Verify Courier List In Dropdown
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    8.Verify Courier List In Dropdown

    Log    Step No.9 คลิกช่องค้นหา Parcel Owner
    dps_scan_page.Click Filter With Parcel Owner
    # Defect182
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    9.Verify Parcel Owner List In Dropdown

    Log    Step No.10 คลิกช่องค้นหาวันที่อัปเดตล่าสุด
    dps_scan_page.Click Filter With Last Updated Date
    # Expected
    dps_scan_page.Verify Calendar Last Updated Date
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    10.Verify Calendar Last Updated Date

    Log    Step No.11 คลิกช่องค้นหา Pouch Number และพิมพ์หมายเลข Pouch ที่มีสถานะปิดอยู่ลงในช่องค้นหา, กดปุ่มค้นหา
    dps_scan_page.Input Pouch Number [Move Status]    P112478683
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    dps_scan_page.Verify Search Pouch Number Result    P112478683
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    11.Verify Search Pouch Number Result

    Log    Step No.12 คลิกปุ่มเคลียร์
    dps_scan_page.Click Clear Button [Move Status]
    # Expected
    dps_scan_page.Verify Clear Filter Input
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    12.Verify Clear Filter Pouch Number

    Log    Step No.13 คลิกปุ่มค้นหา
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    dps_scan_page.Verify Move Status Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    13.Verify Click Search Button

    ####  ใช้ชั่วคราว ####
    dps_scan_page.Click Clear Button [Move Status]
    ####  ใช้ชั่วคราว ####
    Log    Step No.14 คลิกช่องค้นหาหมายเลขพัสดุ, พิมพ์หมายเลขพัสดุที่มีชื่อผู้ส่งเป็น คุณ b ถึง คุณ j โดยพิมพ์ Tracking1 เว้นวรรค ตามด้วย Tracking2 จนครบทุกหมายเลข, คลิกปุ่มค้นหา
    dps_scan_page.Input Tracking Number [Move Status]
    ...    SPBD241100019833    # B
    ...    SPBD241100012704    # D
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    SPBD241100019833    # B
    ...    -
    ...    CP ALL
    ...    Speedy
    ...    กล่อง M
    ...    22/11/2567
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    14.Verify Search Tracking Number Result

    Log    Step No.15 คลิกเลือก Checkbox ทุกรายการที่แสดงในตารางค้นหา, คลิกแท็บ "พัสดุที่เลือก" ด้านบนตัวกรอง
    dps_scan_page.Click All Checkbox [Move Status]
    dps_scan_page.Select Selected Parcel Tab
    # Expected
    dps_scan_page.Verify Selected Parcel Tab
    ...    ${dc_operation['text_move_status_to']}
    ...    ${dc_operation['button_download_template']}
    ...    ${dc_operation['button_import']}
    ...    ${dc_operation['button_confirm_move_status']}
    ...    SPBD241100019833    # B
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    15.Verify Selected Parcel Tab

    Log    Step No.16 คลิก Dropdown Move Status To, เลือกสถานะ "พัสดุรอเข้ารับที่ร้าน", คลิกปุ่มยืนยัน Move Status
    dps_scan_page.Click Dropdown Move Status To     ${dc_operation.parcel_status['pickup_pending']}
    dps_scan_page.Click Confirm Move Status Button
    # Expected
    dps_scan_page.Verify Popup Save Data Success    ${dc_operation['text_save_success']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    16.Verify Move Status Success Pop up 

    Log    Step No.17 คลิกที่ Pop up บันทึกข้อมูลเรียบร้อย
    dps_scan_page.Click Popup Save Data Success
    # Expected
    dps_scan_page.Verify Move Status Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Move Status Page After Change Status

