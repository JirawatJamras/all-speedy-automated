*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S017
    [Documentation]    คลัง Dry การ Reprint ใบปะหน้าพัสดุ กรณีไม่แก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in
    [Tags]    DC_Operation    UAT    
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    dps_home_page.Wait Until Page Loaded
    dps_home_page.Click Dropdown For Select Role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนู Scan, กรอกหมายเลขพัสดุ (Tracking) ที่มีชื่อผู้ส่งเป็น "คุณ i" และ กดค้นหา หรือกด Enter
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan In Tab
    dps_scan_page.Input Tracking Number [Scan In Page]    SPBD241100002415
    dps_scan_page.Click Search Button [Scan In Page]
    # Defect143
    # Expected
    # Verify Create Pouch Destination DCSB Popup
    # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Create Pouch Destination DCSB Popup

    # Log    Step No.2 คลิกปุ่มตกลง
    # # Defect143    Defect155    Defect156    Defect158    Defect159    Defect165    Defect168    Defect171
    # # Click Accept    
    # # Expected
    # # รอโค้ด verify จากพี่พี

    # Log    Step No.3 คลิกปุ่ม ยืนยัน/Print Label
    # dps_parcel_detail_page.Click Print Label
    
    # Log    Step No.4 คลิกปุ่มพิมพ์
    # # Robot is unable to click print on browser popup, so change to click ESC Button to go on.
    # dps_parcel_detail_page.Click ESC On Keyboard
    # # Defect142
    # # Expected
    # # dps_parcel_detail_page.Verify Print Label Success Popup
    # # ...    ทำรายการสำเร็จ    # Expected is: ${dc_operation['text_print_label_success']}
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Print Label Success Popup

    # # Defect145    Unable to click on popup, but anable to click on close button (X) to close popup.
    # # Log    Step No.5 คลิกที่ Pop up
    # # dps_parcel_detail_page.Click Close Print Label Success Popup
    # # # Expected
    # # dps_scan_page.Verify Navigate To Scan Page And Stay At Scan In Tab
    # # common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Navigate To Scan Page And Stay At Scan In Tab

    Log    Step No.6 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    SPBD241100002415
    # Expected
    dps_history_parcel_page.Verify Data In Table    SPBD241100002415
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    Verify Data In Table