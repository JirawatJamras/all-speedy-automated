*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    # Unable to run headless
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S018
    [Documentation]    คลัง Dry การ Reprint ใบปะหน้าพัสดุ และใบคัดแยกพัสดุ กรณีแก้ไขขนาดพัสดุ / แก้ไข Courier / แก้ไขคลังปลายทาง ในขั้นตอนการ Scan in ที่คลังต้นทาง
    [Tags]    DC_Operation    UAT    Defect209    Defect225    Defect241

    Log    Prerequisite S002
    prerequisite.DC_Operation_S002
    ${tracking_a}    Get Parcel Codes By Sender Name    ${Global_ParcelsData}    ${DC_Operation_S016['sender_name']}

    Log    Prerequisite S016
    prerequisite.DC_Operation_S016

    Log    Step No.1 คลิกเมนู "ประวัติพัสดุภายในคลัง" ที่แถบเมนูด้านซ้าย
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['history_parcel']}
    dps_history_parcel_page.Filter Data By Parcel Number    ${tracking_a}
    # Expected
    dps_history_parcel_page.Verify Data In Table
    ...    ${dc_operation.title['history_parcel']}  
    ...    ${tracking_a}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S018    1.Verify Data In Table

    Log    Step No.2 คลิกไอคอนรูปดินสอ ด้านหลังรายการ Tracking นั้น
    Set Today
    ${today_repattern}    Set Date Pattern    ${today}
    dps_history_parcel_page.Click Edit History Parcel    ${tracking_a}
    Switch Window    NEW
    # Expected
    dps_history_parcel_page.Verify Timeline In Warehouse Details    ${dc_operation.label_parcel_details_in_warehouse['timeline']}
    dps_history_parcel_page.Verify Title Parcel Details In Warehouse Details  
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_detail']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['tracking_number']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_status']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['customer_type']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['pouch_number']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['parcel_size']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['route']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['check_in_date']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['date_in_system']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['sla_date']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['sla_text']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['origin_store']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['destination_store']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['shipping_by']}
    ...    ${dc_operation.label_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Data Parcel Details In Warehouse Details
    ...    ${tracking_a}
    ...    พัสดุรอ Scan out ไปคลัง DC SB    #${DC_Operation_S018.value_parcel_details_in_warehouse['parcel_status']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['customer_type']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['pouch_number']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['parcel_size']}
    ...    ${today_repattern}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['origin_store']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['origin_warehouse']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['destination_store']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['crossdock_warehouse']}
    ...    CP ALL  # ${DC_Operation_S018.value_parcel_details_in_warehouse['shipping_by']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['destination_warehouse']}
    dps_history_parcel_page.Verify Title Sender In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Sender In Warehouse Details
    ...    ${DC_Operation_S018.value_sender_in_warehouse['name']}
    ...    ${DC_Operation_S018.value_sender_in_warehouse['phone']}
    ...    ลำพยา เมืองนครปฐม นครปฐม 73000  # ${DC_Operation_S018.value_sender_in_warehouse['address']}
    dps_history_parcel_page.Verify Title Receiver In Warehouse Details
    ...    ${dc_operation.label_sender_in_warehouse['sender_name']}
    ...    ${dc_operation.label_sender_in_warehouse['sender_address']}
    dps_history_parcel_page.Verify Data Receiver In Warehouse Details
    ...    ${DC_Operation_S018.value_receiver_in_warehouse['name']}
    ...    ${DC_Operation_S018.value_receiver_in_warehouse['phone']}
    ...    ${DC_Operation_S018.value_receiver_in_warehouse['address']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S018    2.Verify Parcel Details In Warehouse
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S018    2.Verify Sender And Receiver In Warehouse

    Log    Step No.3 คลิกปุ่ม Dropdown Reprint
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Dropdown
    ...    ${dc_operation.dropdown_reprint_label['parcel_label']}
    ...    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    ...    ${DC_Operation_S018.value_parcel_details_in_warehouse['pouch_number']}
    ...    ${dc_operation.dropdown_reprint_label['pouch_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S018    3.Verify Reprint Label Dropdown

    Log    Step No.4 คลิกที่ใบปะหน้าพัสดุ
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_label']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_label']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S018    4.Verify Reprint Parcel Label

    Log    Step No.5 คลิกที่ใบคัดแยกพัสดุ
    dps_history_parcel_page.Click Cancel Reprint Label Button    ${dc_operation.card_reprint_label['text_parcel_label']}
    dps_history_parcel_page.Click Reprint Label Dropdown    ${dc_operation.dropdown_reprint_label['title']}
    dps_history_parcel_page.Select Reprint Label Type In Dropdown    ${dc_operation.dropdown_reprint_label['parcel_sorting_sheet']}
    # Expected
    dps_history_parcel_page.Verify Reprint Label Popup    ${dc_operation.card_reprint_label['text_parcel_sorting_sheet']}
    common.Verify Capture Screenshot    dc_operation    DC_Operation_S017    5.Verify Reprint Parcel Sorting Sheet