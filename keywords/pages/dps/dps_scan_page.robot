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

Verify Label Sender
    [Arguments]    ${sender_title}    ${sender_name}    ${sender_phone}    ${shipping_origin}    ${sender_address}
    ${actual_txt_label_sender_title_in_scan_in}=    Get Text    ${dps_txt_label_sender_title_in_scan_in_scan_page}
    ${actual_txt_label_sender_name_in_scan_in}=    Get Text    ${dps_txt_label_sender_name_in_scan_in_scan_page}
    ${actual_txt_label_sender_phone_in_scan_in}=    Get Text    ${dps_txt_label_sender_phone_in_scan_in_scan_page}
    ${actual_txt_label_shipping_origin_in_scan_in}=    Get Text    ${dps_txt_label_shipping_origin_in_scan_in_scan_page}
    ${actual_txt_label_sender_address_in_scan_in}=    Get Text    ${dps_txt_label_sender_address_in_scan_in_scan_page}
    Should Be Equal    ${actual_txt_label_sender_title_in_scan_in}    ${sender_title}
    Should Be Equal    ${actual_txt_label_sender_name_in_scan_in}    ${sender_name}
    Should Be Equal    ${actual_txt_label_sender_phone_in_scan_in}    ${sender_phone}
    Should Be Equal    ${actual_txt_label_shipping_origin_in_scan_in}    ${shipping_origin}
    Should Be Equal    ${actual_txt_label_sender_address_in_scan_in}    ${sender_address}

Verify Data Sender
    [Arguments]    ${sender_name}    ${sender_phone}    ${shipping_origin}    ${sender_address}
    ${dps_txt_value_sender_name_in_scan_in}=    Replace String    ${dps_txt_value_sender_name_in_scan_in_scan_page}    {label_sender_name}    ${dc_operation.label_sender_scan_in_tab['name']}
    ${dps_txt_value_sender_name_in_scan_in}=    Replace String    ${dps_txt_value_sender_name_in_scan_in}    {value_sender_name}    ${sender_name}
    ${dps_txt_value_sender_phone_in_scan_in}=    Replace String    ${dps_txt_value_sender_phone_in_scan_in_scan_page}    {label_sender_phone}    ${dc_operation.label_sender_scan_in_tab['phone']}
    ${dps_txt_value_sender_phone_in_scan_in}=    Replace String    ${dps_txt_value_sender_phone_in_scan_in}    {value_sender_phone}    ${sender_phone}
    ${dps_txt_value_shipping_origin_in_scan_in}=    Replace String    ${dps_txt_value_shipping_origin_in_scan_in_scan_page}    {label_shipping_origin}    ${dc_operation.label_sender_scan_in_tab['shipping_origin']}
    ${dps_txt_value_shipping_origin_in_scan_in}=    Replace String    ${dps_txt_value_shipping_origin_in_scan_in}    {value_shipping_origin}    ${shipping_origin}
    ${dps_txt_value_sender_address_in_scan_in}=    Replace String    ${dps_txt_value_sender_address_in_scan_in_scan_page}    {label_sender_address}    ${dc_operation.label_sender_scan_in_tab['address']}
    ${dps_txt_value_sender_address_in_scan_in}=    Replace String    ${dps_txt_value_sender_address_in_scan_in}    {value_sender_address}    ${sender_address}
    ${actual_txt_value_sender_name_in_scan_in}=    Get Text    ${dps_txt_value_sender_name_in_scan_in}
    ${actual_txt_value_sender_phone_in_scan_in}=    Get Text    ${dps_txt_value_sender_phone_in_scan_in}
    ${actual_txt_value_shipping_origin_in_scan_in}=    Get Text    ${dps_txt_value_shipping_origin_in_scan_in}
    ${actual_txt_value_sender_address_in_scan_in}=    Get Text    ${dps_txt_value_sender_address_in_scan_in}
    Should Be Equal    ${actual_txt_value_sender_name_in_scan_in}    ${sender_name}
    Should Be Equal    ${actual_txt_value_sender_phone_in_scan_in}    ${sender_phone}
    Should Be Equal    ${actual_txt_value_shipping_origin_in_scan_in}    ${shipping_origin}
    Should Be Equal    ${actual_txt_value_sender_address_in_scan_in}    ${sender_address}

Verify Label Receiver
    [Arguments]    ${receiver_title}    ${receiver_name}    ${receiver_phone}    ${shipping_origin}    ${receiver_address}
    ${actual_txt_label_receiver_title_in_scan_in}=    Get Text    ${dps_txt_label_receiver_title_in_scan_in_scan_page}
    ${actual_txt_label_receiver_name_in_scan_in}=    Get Text    ${dps_txt_label_receiver_name_in_scan_in_scan_page}
    ${actual_txt_label_receiver_phone_in_scan_in}=    Get Text    ${dps_txt_label_receiver_phone_in_scan_in_scan_page}
    ${actual_txt_label_shipping_origin_in_scan_in}=    Get Text    ${dps_txt_label_shipping_origin_in_scan_in_scan_page}
    ${actual_txt_label_receiver_address_in_scan_in}=    Get Text    ${dps_txt_label_receiver_address_in_scan_in_scan_page}
    Should Be Equal    ${actual_txt_label_receiver_title_in_scan_in}    ${receiver_title}
    Should Be Equal    ${actual_txt_label_receiver_name_in_scan_in}    ${receiver_name}
    Should Be Equal    ${actual_txt_label_receiver_phone_in_scan_in}    ${receiver_phone}
    Should Be Equal    ${actual_txt_label_shipping_origin_in_scan_in}    ${shipping_origin}
    Should Be Equal    ${actual_txt_label_receiver_address_in_scan_in}    ${receiver_address}
