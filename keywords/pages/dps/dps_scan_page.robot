*** Keywords ***

Select Tab In Scan Page
    [Arguments]    ${tab}
    common.Click When Ready    //div[@role='tab' and text()='${tab}']

Select Scan In Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['scan_in']}

Select Scan Out Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['scan_out']}

Select Move Status Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['move_status']}

Select Change Courier Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['change_courier']}

Input Tracking Number [Scan In Page]
    [Arguments]    ${value}
    Wait Until Element Is Enabled    ${dps_txtbox_on_scan_in_page}
    common.Input When Ready    ${dps_txtbox_on_scan_in_page}    ${value}

Click Search Button
    ${dps_btn_search_scan_in_page}=    Replace String    ${dps_btn_search_scan_in_page}    {value}    ${dc_operation['text_search']}
    common.Click When Ready    ${dps_btn_search_scan_in_page}

Verify Navigate To Scan Page And Stay At Scan In Tab
    ${dps_txt_scan_header_ion_scan_page}=    Replace String    ${dps_txt_scan_header_ion_scan_page}    {value}    ${dc_operation.title['scan']}
    ${dps_btn_scan_in_tab_is_active_scan_page}=    Replace String    ${dps_btn_scan_in_tab_is_active_scan_page}    {value}    ${dc_operation.tab_scan['scan_in']}
    Wait Until Element Is Visible    ${dps_txt_scan_header_ion_scan_page}    timeout=10s
    Wait Until Element Is Visible    ${dps_btn_scan_in_tab_is_active_scan_page}    timeout=10s

Verify Parcel Details
