*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    Reset Cut Off Time
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_s027
    [Documentation]    การ Move Status แบบค้นหาพัสดุ
    [Tags]    DC_Operation    UAT    Pass_With_Condition
    ${today}    Set Today
    ${today_repattern}    Set Date Pattern    ${today}

    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เลือกเมนู Scan, เลือกแท็บ Move Status > แท็บค้นหาพัสดุ
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Move Status Tab
    # Expected
    dps_scan_page.Verify Move Status Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Move Status Page

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
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Filter Title Used To Search Information

    Log    Step No.3 คลิกช่องค้นหาสถานะพัสดุ
    dps_scan_page.Click Filter With Parcel Status
    # Expected
    dps_scan_page.Verify Parcel Status List In Dropdown
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Parcel Status List In Dropdown

    Log    Step No.4 พิมพ์ข้อความ "พัสดุรอเข้ารับร้าน"

    Log    Step No.5 คลิกปุ่มค้นหา
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Search Parcel Status Result

    Log    Step No.6 คลิกปุ่มเคลียร์
    dps_scan_page.Click Clear Button [Move Status]
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Clear Search Result Parcel Status

    Log    Step No.7 คลิกช่องค้นหาขนาดพัสดุ
    dps_scan_page.Click Filter With Parcel Size
    # Expected
    dps_scan_page.Verify Parcel Size List In Dropdown
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Parcel Size List In Dropdown

    Log    Step No.8 คลิกช่องค้นหาผ่านขนส่ง
    dps_scan_page.Click Filter With Courier
    # Expected
    dps_scan_page.Verify Courier List In Dropdown
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Courier List In Dropdown

    Log    Step No.9 คลิกช่องค้นหา Parcel Owner
    dps_scan_page.Click Filter With Parcel Owner
    # Expected
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Parcel Owner List In Dropdown

    Log    Step No.10 คลิกช่องค้นหาวันที่อัปเดตล่าสุด
    dps_scan_page.Click Filter With Last Updated Date
    # Expected
    dps_scan_page.Verify Calendar Last Updated Date
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    Verify Calendar Last Updated Date

    Log    Step No.11 คลิกช่องค้นหา Pouch Number และพิมพ์หมายเลข Pouch ที่มีสถานะปิดอยู่ลงในช่องค้นหา, กดปุ่มค้นหา
    # dps_scan_page.Input Pouch Number [Move Status]

