*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser
Force Tags    UAT

*** Test Cases ***
Test
    common.Open URL    ${DPS_UAT_URL}
    dps_landing_page.Click Go Login Button
    dps_login_page.Input Email    ${dps_login_user_04['username']}
    dps_login_page.Input Password    ${dps_login_user_04['password']}
    dps_login_page.Click Log On Button
    # dps_home_page.Wait Until DC Operation Home Page Loaded
    dps_home_page.Click Dropdown For Select role
    dps_home_page.Select Role    ${dc_operation.role['admin']}

    dps_home_page.Select Warehouse List Button    ${dc_operation.selected_warehouse_list['text_warehouse_DC_BB']}
    dps_home_page.Select DPS Menu    ${dc_operation.dps_menu['scan']}
    dps_scan_page.Select Scan Out Tab

    Verify label Waiting List To Scan Out [Scan Out Page]
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_id']}
    ...    ${dc_operation.scan_out_title_waiting_scan['pouch_number']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receive_parcel_from']}
    ...    ${dc_operation.scan_out_title_waiting_scan['transport']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_owner']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_size']}
    ...    ${dc_operation.scan_out_title_waiting_scan['receiving_date']}
    ...    ${dc_operation.scan_out_title_waiting_scan['parcel_status']}
