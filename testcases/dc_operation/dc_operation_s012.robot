*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
DC_Operation_S012
    [Documentation]    ลูกค้า B (เรียกรถเข้ารับพัสดุ) --> พัสดุ Dry ปลายทางร้าน ส่งโดย CP All (in area)
    [Tags]    DC_Operation    UAT
    Log    Login
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Click Dropdown For Select Role
    # dps_home_page.Select Role    ${dc_operation.role['admin']}

    Log    Step No.1 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCBB
    # dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select Tab All Task
    # Defect138    Defect141
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task Tab
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S012.data_in_all_task_tab['parcel_status']}
    ...    SPCD241000006135
    ...    ${DC_Operation_S012.data_in_all_task_tab['pouch_number']}
    ...    CPALL  # ${DC_Operation_S012.data_in_all_task_tab['transport']}
    ...    ${DC_Operation_S012.data_in_all_task_tab['export_to']}
    ...    home  # ${DC_Operation_S012.data_in_all_task_tab['import_from']}
    ...    speedy  # ${DC_Operation_S012.data_in_all_task_tab['parcel_owner']}
    ...    ${DC_Operation_S012.data_in_all_task_tab['task_type']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Data In All Task Tab

    Log    Step No.2 เลือกแท็บงานรับเข้า
    dps_home_page.Select Tab Import Task
    # Expected
    # dps_home_page.Verify Data In Import Task Tab
    # ...    499  # ${DC_Operation_S012.data_in_import_task_tab['number_of_scanned_items']}
    # ...    499  # ${DC_Operation_S012.data_in_import_task_tab['number_of_pieces']}
    # ...    0  # ${DC_Operation_S012.data_in_import_task_tab['number_of_pouch']}
    # ...    speedy  # ${DC_Operation_S012.data_in_import_task_tab['parcel_owner']}
    # ...    CPALL  # ${DC_Operation_S012.data_in_import_task_tab['transport']}
    # ...    home  # ${DC_Operation_S012.data_in_import_task_tab['import_from']}
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Import Task Tab

    Log    Step No.7 เข้าเมนูหน้าหลัก และ เลือก Dropdown ดูข้อมูลคลัง DCBB
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['homepage']}
    dps_home_page.Select Tab All Task
    # Defect138    Defect141
    # Expected
    dps_home_page.Verify Homepage
    ...    ${dc_operation.breadcrumb['homepage']}
    ...    ${dc_operation.title['homepage']}
    dps_home_page.Verify Data In All Task T ab
    ...    ร้านรับพัสดุเข้าระบบ  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['parcel_status']}
    ...    SPCD241000006135
    ...    ${DC_Operation_S012.data_in_all_task_tab_after_scan['pouch_number']}
    ...    CPALL  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['transport']}
    ...    ${DC_Operation_S012.data_in_all_task_tab_after_scan['export_to']}
    ...    home  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['import_from']}
    ...    speedy  # ${DC_Operation_S012.data_in_all_task_tab_after_scan['parcel_owner']}
    ...    ${DC_Operation_S012.data_in_all_task_tab_after_scan['task_type']}
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Homepage
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    DC_Operation_S012    Verify Data In All Task Tab After Scan Parcel
