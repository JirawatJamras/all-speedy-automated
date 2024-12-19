*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result With Date
Test Teardown     Run Keywords    dps_home_page.Reset Cut Off Time    17:00
                  ...    AND    Close Browser

*** Test Cases ***
DC_Operation_S027
    [Documentation]    การ Move Status แบบค้นหาพัสดุ
    [Tags]    DC_Operation    Move Status    Regression    Defect182    Defect257    Defect266    Defect284

    Log    Prerequisite S002
    prerequisite.DC_Operation_S002
    ${tracking_c}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S004['sender_name']}
    ${tracking_d}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S005['sender_name']}
    ${tracking_e}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S006['sender_name']}
    ${tracking_f}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S007['sender_name']}
    ${tracking_g}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S008['sender_name']}
    ${tracking_h}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S009['sender_name']}
    ${tracking_i}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S010['sender_name']}
    ${tracking_j}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S011['sender_name']}
    ${tracking_b}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S012['sender_name']}

    Log    Prerequisite S004
    prerequisite.DC_Operation_S004
    Log    Prerequisite S005
    prerequisite.DC_Operation_S005
    Log    Prerequisite S006
    prerequisite.DC_Operation_S006
    Log    Prerequisite S007
    prerequisite.DC_Operation_S007
    Log    Prerequisite S008
    prerequisite.DC_Operation_S008  
    Log    Prerequisite S009
    prerequisite.DC_Operation_S009
    Log    Prerequisite S010
    prerequisite.DC_Operation_S010
    Log    Prerequisite S011
    prerequisite.DC_Operation_S011
    Log    Prerequisite S012
    prerequisite.DC_Operation_S012

    Set Today
    ${today_repattern}    Set Date Pattern    ${today}

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
    dps_scan_page.Search With Parcel Status [Move Status]    ${dc_operation.parcel_status['pickup_pending']}
    # Expected
    Log Defect No:  Defect257
    dps_scan_page.Verify Parcel Status Dropdown [Move Status]    ${dc_operation.parcel_status['pickup_pending']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    4.Verify Parcel Status Dropdown

    Log    Step No.5 คลิกปุ่มค้นหา
    dps_scan_page.Select Parcel Status [Move Status]    ${dc_operation.parcel_status['pickup_pending']}
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    dps_scan_page.Verify Search Parcel Status Result    ${dc_operation.parcel_status['pickup_pending']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    5.Verify Search Parcel Status Result

    Log    Step No.6 คลิกปุ่มเคลียร์
    dps_scan_page.Click Clear Button [Move Status]
    # Expected
    Log Defect No:  Defect266
    dps_scan_page.Verify Clear Filter Input
    dps_scan_page.Verify Search Parcel Status Result    ${dc_operation.parcel_status['pickup_pending']}
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
    # Expected
    Log Defect No:  Defect182
    dps_scan_page.Verify Parcel Owner List In Dropdown    ${dc_operation.parcel_owner['speedy']}    ${dc_operation.parcel_owner['partnership']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    9.Verify Parcel Owner List In Dropdown

    Log    Step No.10 คลิกช่องค้นหาวันที่อัปเดตล่าสุด
    dps_scan_page.Click Filter With Last Updated Date
    # Expected
    dps_scan_page.Verify Calendar Last Updated Date
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    10.Verify Calendar Last Updated Date

    Log    Step No.11 คลิกช่องค้นหา Pouch Number และพิมพ์หมายเลข Pouch ที่มีสถานะปิดอยู่ลงในช่องค้นหา, กดปุ่มค้นหา
    dps_scan_page.Input Pouch Number [Move Status]    ${global_pouch_number}
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    dps_scan_page.Verify Search Pouch Number Result    ${global_pouch_number}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    11.Verify Search Pouch Number Result

    Log    Step No.12 คลิกปุ่มเคลียร์
    dps_scan_page.Click Clear Button [Move Status]
    # Expected
    Log Defect No:  Defect266
    dps_scan_page.Verify Clear Filter Input
    dps_scan_page.Verify Search Pouch Number Result    ${global_pouch_number}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    12.Verify Clear Filter Pouch Number

    Log    Step No.13 คลิกปุ่มค้นหา
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    dps_scan_page.Verify Move Status Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    13.Verify Click Search Button

    Log    Step No.14 คลิกช่องค้นหาหมายเลขพัสดุ, พิมพ์หมายเลขพัสดุที่มีชื่อผู้ส่งเป็น คุณ b ถึง คุณ j โดยพิมพ์ Tracking1 เว้นวรรค ตามด้วย Tracking2 จนครบทุกหมายเลข, คลิกปุ่มค้นหา
    dps_scan_page.Input Tracking Number [Move Status]
    ...    ${tracking_b}    
    ...    ${tracking_c}    
    ...    ${tracking_d}    
    ...    ${tracking_e}    
    ...    ${tracking_f}    
    ...    ${tracking_g}    
    ...    ${tracking_h}    
    ...    ${tracking_i}    
    ...    ${tracking_j}    
    dps_scan_page.Click Search Button [Move Status]
    # Expected
    Log Defect No:  Defect266
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_b}
    ...    ${DC_Operation_S012.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S012.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S012.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S012.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_c}
    ...    ${DC_Operation_S004.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S004.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S004.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_D}
    ...    ${DC_Operation_S005.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S005.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S005.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_e}
    ...    ${DC_Operation_S006.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S006.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S006.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_f}
    ...    ${DC_Operation_S007.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S007.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S007.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_g}
    ...    ${DC_Operation_S008.data_in_all_task_tab['pouch_number1']}
    ...    ${DC_Operation_S008.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S008.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_h}
    ...    ${DC_Operation_S009.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S009.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S009.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_i}
    ...    ${DC_Operation_S010.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S010.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S010.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
    dps_scan_page.Verify Search Tracking Number Result   
    ...    ${dc_operation.parcel_status['awaiting_delivery_warehouse']}
    ...    ${tracking_j}
    ...    ${DC_Operation_S011.data_in_all_task_tab['pouch_number']}
    ...    ${DC_Operation_S011.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S011.data_in_all_task_tab['parcel_size']}
    ...    ${today_repattern}
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
    ...    ${tracking_b}   
    ...    ${tracking_c}   
    ...    ${tracking_d}   
    ...    ${tracking_e}   
    ...    ${tracking_f}   
    ...    ${tracking_g}   
    ...    ${tracking_h}  
    ...    ${tracking_i}   
    ...    ${tracking_j}   
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
    Log Defect No:  Defect284
    dps_scan_page.Verify Move Status Page
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S027    17.Verify Move Status Page After Change Status

