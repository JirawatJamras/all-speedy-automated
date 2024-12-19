*** Keywords ***
#################################### All ####################################
Verify Title Sender In Scan Page
    [Arguments]    ${sender_title}    ${sender_name}    ${sender_phone}    ${shipping_origin}    ${sender_address}
    ${dps_txt_label_sender_title_in_scan_in}=    Replace String    ${dps_txt_label_sender_title_in_scan_in_scan_page}    {label_sender_title}    ${sender_title}
    ${dps_txt_label_sender_name_in_scan_in}=    Replace String    ${dps_txt_label_sender_name_in_scan_in_scan_page}    {label_sender_name}    ${sender_name}
    ${dps_txt_label_sender_phone_in_scan_in}=    Replace String    ${dps_txt_label_sender_phone_in_scan_in_scan_page}    {label_sender_phone}    ${sender_phone}
    ${dps_txt_label_shipping_origin_in_scan_in}=    Replace String    ${dps_txt_label_shipping_origin_in_scan_in_scan_page}    {label_shipping_origin}    ${shipping_origin}
    ${dps_txt_label_sender_address_in_scan_in}=    Replace String    ${dps_txt_label_sender_address_in_scan_in_scan_page}    {label_sender_address}    ${sender_address}
    ${actual_txt_label_sender_title_in_scan_in}=    Get Text    ${dps_txt_label_sender_title_in_scan_in}
    ${actual_txt_label_sender_name_in_scan_in}=    Get Text    ${dps_txt_label_sender_name_in_scan_in}
    ${actual_txt_label_sender_phone_in_scan_in}=    Get Text    ${dps_txt_label_sender_phone_in_scan_in}
    ${actual_txt_label_shipping_origin_in_scan_in}=    Get Text    ${dps_txt_label_shipping_origin_in_scan_in}
    ${actual_txt_label_sender_address_in_scan_in}=    Get Text    ${dps_txt_label_sender_address_in_scan_in}
    
    Should Be Equal    ${actual_txt_label_sender_title_in_scan_in}    ${sender_title}
    Should Be Equal    ${actual_txt_label_sender_name_in_scan_in}    ${sender_name}
    Should Be Equal    ${actual_txt_label_sender_phone_in_scan_in}    ${sender_phone}
    Should Be Equal    ${actual_txt_label_shipping_origin_in_scan_in}    ${shipping_origin}
    Should Be Equal    ${actual_txt_label_sender_address_in_scan_in}    ${sender_address}

Verify Data Sender In Scan Page
    [Arguments]    ${sender_name}    ${sender_phone}    ${shipping_origin}    ${sender_address}
    ${dps_txt_value_sender_name_in_scan_in}=    Replace String    ${dps_txt_value_sender_name_in_scan_in_scan_page}    {label_sender_name}    ${dc_operation.scan_in_title_sender_detail['name']}
    ${dps_txt_value_sender_name_in_scan_in}=    Replace String    ${dps_txt_value_sender_name_in_scan_in}    {value_sender_name}    ${sender_name}
    ${dps_txt_value_sender_phone_in_scan_in}=    Replace String    ${dps_txt_value_sender_phone_in_scan_in_scan_page}    {label_sender_phone}    ${dc_operation.scan_in_title_sender_detail['phone']}
    ${dps_txt_value_sender_phone_in_scan_in}=    Replace String    ${dps_txt_value_sender_phone_in_scan_in}    {value_sender_phone}    ${sender_phone}
    ${dps_txt_value_shipping_origin_in_scan_in}=    Replace String    ${dps_txt_value_shipping_origin_in_scan_in_scan_page}    {label_shipping_origin}    ${dc_operation.scan_in_title_sender_detail['shipping_origin']}
    ${dps_txt_value_shipping_origin_in_scan_in}=    Replace String    ${dps_txt_value_shipping_origin_in_scan_in}    {value_shipping_origin}    ${shipping_origin}
    ${dps_txt_value_sender_address_in_scan_in}=    Replace String    ${dps_txt_value_sender_address_in_scan_in_scan_page}    {label_sender_address}    ${dc_operation.scan_in_title_sender_detail['address']}
    ${dps_txt_value_sender_address_in_scan_in}=    Replace String    ${dps_txt_value_sender_address_in_scan_in}    {value_sender_address}    ${sender_address}
    ${actual_txt_value_sender_name_in_scan_in}=    Get Text    ${dps_txt_value_sender_name_in_scan_in}
    ${actual_txt_value_sender_phone_in_scan_in}=    Get Text    ${dps_txt_value_sender_phone_in_scan_in}
    ${actual_txt_value_shipping_origin_in_scan_in}=    Get Text    ${dps_txt_value_shipping_origin_in_scan_in}
    ${actual_txt_value_sender_address_in_scan_in}=    Get Text    ${dps_txt_value_sender_address_in_scan_in}
    Should Be Equal    ${actual_txt_value_sender_name_in_scan_in}    ${sender_name}
    Should Be Equal    ${actual_txt_value_sender_phone_in_scan_in}    ${sender_phone}
    Should Be Equal    ${actual_txt_value_shipping_origin_in_scan_in}    ${shipping_origin}
    Should Be Equal    ${actual_txt_value_sender_address_in_scan_in}    ${sender_address}

Verify Title Receiver In Scan Page
    [Arguments]    ${receiver_title}    ${receiver_name}    ${receiver_phone}    ${shipping_destination}    ${receiver_address}
    ${dps_txt_label_receiver_title_in_scan_in}=    Replace String    ${dps_txt_label_receiver_title_in_scan_in_scan_page}    {label_receiver_title}    ${receiver_title}
    ${dps_txt_label_receiver_name_in_scan_in}=    Replace String    ${dps_txt_label_receiver_name_in_scan_in_scan_page}    {label_receiver_name}    ${receiver_name}
    ${dps_txt_label_receiver_phone_in_scan_in}=    Replace String    ${dps_txt_label_receiver_phone_in_scan_in_scan_page}    {label_receiver_phone}    ${receiver_phone}
    ${dps_txt_label_shipping_destination_in_scan_in}=    Replace String    ${dps_txt_label_shipping_destination_in_scan_in_scan_page}    {label_shipping_destination}    ${shipping_destination}
    ${dps_txt_label_receiver_address_in_scan_in}=    Replace String    ${dps_txt_label_receiver_address_in_scan_in_scan_page}    {label_receiver_address}    ${receiver_address}
    ${actual_txt_label_receiver_title_in_scan_in}=    Get Text    ${dps_txt_label_receiver_title_in_scan_in}
    ${actual_txt_label_receiver_name_in_scan_in}=    Get Text    ${dps_txt_label_receiver_name_in_scan_in}
    ${actual_txt_label_receiver_phone_in_scan_in}=    Get Text    ${dps_txt_label_receiver_phone_in_scan_in}
    ${actual_txt_label_shipping_destination_in_scan_in}=    Get Text    ${dps_txt_label_shipping_destination_in_scan_in}
    ${actual_txt_label_receiver_address_in_scan_in}=    Get Text    ${dps_txt_label_receiver_address_in_scan_in}
    Should Be Equal    ${actual_txt_label_receiver_title_in_scan_in}    ${receiver_title}
    Should Be Equal    ${actual_txt_label_receiver_name_in_scan_in}    ${receiver_name}
    Should Be Equal    ${actual_txt_label_receiver_phone_in_scan_in}    ${receiver_phone}
    Should Be Equal    ${actual_txt_label_shipping_destination_in_scan_in}    ${shipping_destination}
    Should Be Equal    ${actual_txt_label_receiver_address_in_scan_in}    ${receiver_address}

Verify Data Receiver In Scan Page
    [Arguments]    ${receiver_name}    ${receiver_phone}    ${shipping_destination}    ${receiver_address}
    ${dps_txt_value_receiver_name_in_scan_in}=    Replace String    ${dps_txt_value_receiver_name_in_scan_in_scan_page}    {label_receiver_name}    ${dc_operation.scan_in_title_receiver_detail['name']}
    ${dps_txt_value_receiver_name_in_scan_in}=    Replace String    ${dps_txt_value_receiver_name_in_scan_in}    {value_receiver_name}    ${receiver_name}
    ${dps_txt_value_receiver_phone_in_scan_in}=    Replace String    ${dps_txt_value_receiver_phone_in_scan_in_scan_page}    {label_receiver_phone}    ${dc_operation.scan_in_title_receiver_detail['phone']}
    ${dps_txt_value_receiver_phone_in_scan_in}=    Replace String    ${dps_txt_value_receiver_phone_in_scan_in}    {value_receiver_phone}    ${receiver_phone}
    ${dps_txt_value_shipping_destination_in_scan_in}=    Replace String    ${dps_txt_value_shipping_destination_in_scan_in_scan_page}    {label_shipping_destination}    ${dc_operation.scan_in_title_receiver_detail['shipping_destination']}
    ${dps_txt_value_shipping_destination_in_scan_in}=    Replace String    ${dps_txt_value_shipping_destination_in_scan_in}    {value_shipping_destination}    ${shipping_destination}
    ${dps_txt_value_receiver_address_in_scan_in}=    Replace String    ${dps_txt_value_receiver_address_in_scan_in_scan_page}    {label_receiver_address}    ${dc_operation.scan_in_title_receiver_detail['address']}
    ${dps_txt_value_receiver_address_in_scan_in}=    Replace String    ${dps_txt_value_receiver_address_in_scan_in}    {value_receiver_address}    ${receiver_address}
    ${actual_txt_value_receiver_name_in_scan_in}=    Get Text    ${dps_txt_value_receiver_name_in_scan_in}
    ${actual_txt_value_receiver_phone_in_scan_in}=    Get Text    ${dps_txt_value_receiver_phone_in_scan_in}
    ${actual_txt_value_shipping_destination_in_scan_in}=    Get Text    ${dps_txt_value_shipping_destination_in_scan_in}
    ${actual_txt_value_receiver_address_in_scan_in}=    Get Text    ${dps_txt_value_receiver_address_in_scan_in}
    Should Be Equal    ${actual_txt_value_receiver_name_in_scan_in}    ${receiver_name}
    Should Be Equal    ${actual_txt_value_receiver_phone_in_scan_in}    ${receiver_phone}
    Should Be Equal    ${actual_txt_value_shipping_destination_in_scan_in}    ${shipping_destination}
    Should Be Equal    ${actual_txt_value_receiver_address_in_scan_in}    ${receiver_address}
    Scroll Element Into View    ${dps_txt_value_receiver_address_in_scan_in}

Select Change Courier Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['change_courier']}

Select Warehouse List Button
    [Arguments]    ${selected_warehouse}
    ${dps_cbo_selected_warehouse_list}=    Replace String    ${dps_cbo_warehouse_list_scan_page}    {warehouse}    ${selected_warehouse}
    common.Click When Ready    ${dps_btn_selected_warehouse_list_scan_page}
    common.Click When Ready    ${dps_cbo_selected_warehouse_list}

#################################### Scan In ####################################

Select Tab In Scan Page
    [Arguments]    ${tab}
    common.Click When Ready    //div[@role='tab' and text()='${tab}']

Select Scan In Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['scan_in']}

Input Tracking Number [Scan In Page]
    [Arguments]    ${value}
    Wait Until Element Is Enabled    ${dps_txtbox_on_scan_in_page}
    common.Input When Ready    ${dps_txtbox_on_scan_in_page}    ${value}

Input Pouch Number [Scan In Page]
    [Arguments]    ${value}
    Wait Until Element Is Enabled    ${dps_txtbox_on_scan_in_page}
    common.Input When Ready    ${dps_txtbox_on_scan_in_page}    ${value} 

Click Search Button [Scan In Page]
    ${dps_btn_search_scan_in_page}=    Replace String    ${dps_btn_search_scan_in_page}    {value}    ${dc_operation['text_search']}
    common.Click When Ready    ${dps_btn_search_scan_in_page}
    Sleep    5s

Verify Navigate To Scan Page And Stay At Scan In Tab
    Sleep    3s
    ${dps_txt_scan_header_ion_scan_page}=    Replace String    ${dps_txt_scan_header_ion_scan_page}    {value}    ${dc_operation.title['scan']}
    ${dps_btn_scan_in_tab_is_active_scan_page}=    Replace String    ${dps_btn_scan_in_tab_is_active_scan_page}    {value}    ${dc_operation.tab_scan['scan_in']}
    Wait Until Element Is Visible    ${dps_txt_scan_header_ion_scan_page}    timeout=10s
    Wait Until Element Is Visible    ${dps_btn_scan_in_tab_is_active_scan_page}    timeout=10s

Clear Input Parcel Size In Scan Page
    FOR    ${i}    IN    0    5
        Press Key    ${dps_txt_value_parcel_size1}    BACKSPACE
    END

Input Parcel Size In Scan Page
    [Arguments]    ${parcel_size}
    common.Input When Ready    ${dps_txt_value_parcel_size1}    ${parcel_size}
    ${dps_txt_title_parcel_size}=    Replace String    ${dps_txt_title_parcel_size}    {value}    ${dc_operation.scan_in_title_parcel_detail['parcel_size']}
    common.Click When Ready  ${dps_txt_title_parcel_size}

Verify Parcel Size Edited
    [Arguments]    ${parcel_size}
    ${actual_txt_value_parcel_size}=    Get Value    ${dps_txt_value_parcel_size3}
    Should Be Equal    ${actual_txt_value_parcel_size}    ${parcel_size}

Click Courier In Scan Page
    ${dps_txt_value_courier}=    Replace String    ${dps_txt_value_courier}    {value}    ${dc_operation.scan_in_title_parcel_detail['courier']}
    common.Click When Ready    ${dps_txt_value_courier}

Select Courier In Dropdown In Scan Page
    [Arguments]    ${courier}
    ${dps_cbo_courier}=    Replace String    ${dps_cbo_courier_in_scan_page}    {value}    ${courier}
    common.Click When Ready    ${dps_cbo_courier}

Click Destination Warehouse In Scan Page
    ${dps_txt_value_destination_warehouse}=    Replace String    ${dps_txt_value_destination_warehouse}    {value}    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    common.Click When Ready    ${dps_txt_value_destination_warehouse}

Select Destination Warehouse In Dropdown In Scan Page
    [Arguments]    ${warehouse}
    ${dps_cbo_destination_warehouse}=    Replace String    ${dps_cbo_destination_warehouse_in_scan_page}    {value}    ${warehouse}
    common.Click When Ready    ${dps_cbo_destination_warehouse}

Click Create Pouch Button
    ${btn_create_pouch}=    Replace String    ${dps_btn_create_pouch}    {value}    ${dc_operation['button_create_pouch']}
    common.Click When Ready    ${btn_create_pouch}

Verify Create Pouch Popup
    [Arguments]    ${origin_warehouse}    ${destination_warehouse}
    ${label_create_pouch}=    Replace String    ${dps_txt_popup_create_pouch}    {value}    ${dc_operation.label_pouch_detail['text_create_pouch']}
    ${label_origin_warehouse}=    Replace String    ${dps_txt_popup_create_pouch_detail}    {value}    ${dc_operation.label_pouch_detail['origin_warehouse']}
    ${value_origin_warehouse}=    Replace String    ${dps_txt_popup_create_pouch_detail}    {value}    ${origin_warehouse}
    ${label_destination_warehouse}=    Replace String    ${dps_txt_popup_create_pouch_detail}    {value}    ${dc_operation.label_pouch_detail['destination_warehouse']}
    ${value_destination_warehouse}=    Replace String    ${dps_txt_popup_create_pouch_detail}    {value}    ${destination_warehouse}
    Wait Until Element Is Visible    ${label_create_pouch}    timeout=10s
    Wait Until Element Is Visible    ${label_origin_warehouse}    timeout=10s
    Wait Until Element Is Visible    ${value_origin_warehouse}    timeout=10s
    Wait Until Element Is Visible    ${label_destination_warehouse}    timeout=10s
    Wait Until Element Is Visible    ${value_destination_warehouse}    timeout=10s
    Wait Until Element Is Visible    ${dps_cbo_destination_warehouse_in_create_pouch_popup}

Verify Create Pouch Popup After Scan In
    [Arguments]    ${destination_warehouse}
    ${dps_txt_destination_warehouse_create_pouch_popup_after_scan_in}=    Replace String    ${dps_txt_destination_warehouse_create_pouch_popup_after_scan_in}    {value}    ${dc_operation['text_destination_warehouse']}
    Wait Until Element Is Visible    ${dps_txt_destination_warehouse_create_pouch_popup_after_scan_in}    timeout=10s
    ${actual_text}=    Get Text    ${dps_txt_destination_warehouse_create_pouch_popup_after_scan_in}
    Should Be Equal    ${actual_text}    ${destination_warehouse}

Click Accept Button On Popup For Creating Pouch
    ${dps_btn_accept_for_create_pouch_auto}=    Replace String    ${dps_btn_accept_for_create_pouch_auto}    {value}    ${dc_operation['text_confirm']}
    common.Click When Ready    ${dps_btn_accept_for_create_pouch_auto}
    
Get Pouch Number In Scan Page
    ${dps_txt_pouch_number_in_scan_page}=    Replace String    ${dps_txt_pouch_number_in_scan_page}    {pouch_status}    ${DC_Operation_S026.pouch_number['pouch_status']}
    ${dps_txt_pouch_number_in_scan_page}=    Replace String    ${dps_txt_pouch_number_in_scan_page}    {pouch_number}    ${DC_Operation_S026.pouch_number['pouch_number']}
    ${dps_txt_pouch_number_in_scan_page}=    Replace String    ${dps_txt_pouch_number_in_scan_page}    {pouch_id}    ${DC_Operation_S026.pouch_number['pouch_id']}
    Wait Until Element Is Visible    ${dps_txt_pouch_number_in_scan_page}    timeout=${DEFAULT_TIMEOUT}
    ${pouch_number}=    Get text    ${dps_txt_pouch_number_in_scan_page}
    RETURN    ${pouch_number}

Verify Label Wait Scan In Warehouse AC
    [Arguments]    ${parcel_id}    ${pouch_number}    ${receive_parcel_from}
    ...            ${parcel_size}    ${receiving_date}    ${parcel_status}
    ${dps_txt_label_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_wait_scan_in_warehouse_ac}    {parcel_id}    ${parcel_id}
    ${dps_txt_label_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_wait_scan_in_warehouse_ac}    {pouch_number}    ${pouch_number}
    ${dps_txt_label_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_wait_scan_in_warehouse_ac}    {receive_parcel_from}    ${receive_parcel_from}
    ${dps_txt_label_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_wait_scan_in_warehouse_ac}    {parcel_size}    ${parcel_size}
    ${dps_txt_label_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_wait_scan_in_warehouse_ac}    {receiving_date}    ${receiving_date}
    ${dps_txt_label_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_wait_scan_in_warehouse_ac}    {parcel_status}    ${parcel_status}
    Wait Until Element Is Visible    ${dps_txt_label_wait_scan_in_warehouse_ac}    timeout=${DEFAULT_TIMEOUT}

Verify Data List Wait Scan In Warehouse AC
    [Arguments]    ${parcel_id}    ${pouch_number}    ${receive_parcel_from}
    ...            ${parcel_size}    ${receiving_date}    ${parcel_status}
    ${dps_txt_value_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_wait_scan_in_warehouse_ac}    {parcel_id}    ${parcel_id}
    ${dps_txt_value_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_wait_scan_in_warehouse_ac}    {pouch_number}    ${pouch_number}
    ${dps_txt_value_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_wait_scan_in_warehouse_ac}    {receive_parcel_from}    ${receive_parcel_from}
    ${dps_txt_value_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_wait_scan_in_warehouse_ac}    {parcel_size}    ${parcel_size}
    ${dps_txt_value_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_wait_scan_in_warehouse_ac}    {receiving_date}    ${receiving_date}
    ${dps_txt_value_wait_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_wait_scan_in_warehouse_ac}    {parcel_status}    ${parcel_status}
    Wait Until Element Is Visible    ${dps_txt_value_wait_scan_in_warehouse_ac}    timeout=${DEFAULT_TIMEOUT}

Verify Label Scan In Warehouse AC
    [Arguments]    ${parcel_id}    ${pouch_number}    ${receive_parcel_from}
    ...            ${parcel_size}    ${receiving_date}    ${parcel_status}
    ${dps_txt_label_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_scan_in_warehouse_ac}    {parcel_id}    ${parcel_id}
    ${dps_txt_label_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_scan_in_warehouse_ac}    {pouch_number}    ${pouch_number}
    ${dps_txt_label_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_scan_in_warehouse_ac}    {receive_parcel_from}    ${receive_parcel_from}
    ${dps_txt_label_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_scan_in_warehouse_ac}    {parcel_size}    ${parcel_size}
    ${dps_txt_label_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_scan_in_warehouse_ac}    {receiving_date}    ${receiving_date}
    ${dps_txt_label_scan_in_warehouse_ac}=    Replace String    ${dps_txt_label_scan_in_warehouse_ac}    {parcel_status}    ${parcel_status}
    Wait Until Element Is Visible    ${dps_txt_label_scan_in_warehouse_ac}    timeout=${DEFAULT_TIMEOUT}

Verify Data List Scan In Warehouse AC
    [Arguments]    ${parcel_id}    ${pouch_number}    ${receive_parcel_from}
    ...            ${parcel_size}    ${receiving_date}    ${parcel_status}
    ${dps_txt_value_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_scan_in_warehouse_ac}    {parcel_id}    ${parcel_id}
    ${dps_txt_value_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_scan_in_warehouse_ac}    {pouch_number}    ${pouch_number}
    ${dps_txt_value_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_scan_in_warehouse_ac}    {receive_parcel_from}    ${receive_parcel_from}
    ${dps_txt_value_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_scan_in_warehouse_ac}    {parcel_size}    ${parcel_size}
    ${dps_txt_value_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_scan_in_warehouse_ac}    {receiving_date}    ${receiving_date}
    ${dps_txt_value_scan_in_warehouse_ac}=    Replace String    ${dps_txt_value_scan_in_warehouse_ac}    {parcel_status}    ${parcel_status}
    Wait Until Element Is Visible    ${dps_txt_value_scan_in_warehouse_ac}    timeout=${DEFAULT_TIMEOUT}
    
Verify Parcel Is On Pouch Warning Popup
    [Arguments]    ${expected_txt}
    Wait Until Element Is Visible    ${dps_txt_parcel_is_on_pouch_popup1}    timeout=10s
    ${actual_txt1}=    Get Text    ${dps_txt_parcel_is_on_pouch_popup1}
    ${actual_txt2}=    Get Text    ${dps_txt_parcel_is_on_pouch_popup2}
    Should Be Equal As Strings    ${expected_txt}    ${actual_txt1} ${actual_txt2}

Click Agree On Parcel Is On Pouch Warning Popup
    ${dps_btn_agree_on_parcel_is_on_pouch_popup}=    Replace String    ${dps_btn_agree_on_parcel_is_on_pouch_popup}    {value}    ${dc_operation['text_agree']}
    common.Click When Ready    ${dps_btn_agree_on_parcel_is_on_pouch_popup}

Verify Unbox Pouch And Scan Piece By Piece
    [Arguments]    ${expected_text}
    Sleep    3s
    ${dps_txt_unbox_pouch_and_scan_piece_by_piece}=    Replace String    ${dps_txt_unbox_pouch_and_scan_piece_by_piece}    {value}    ${expected_text}
    Wait Until Element Is Visible    ${dps_txt_unbox_pouch_and_scan_piece_by_piece}    timeout=10s
    ${actual_text}=    Get Text    ${dps_txt_unbox_pouch_and_scan_piece_by_piece}
    Should Be Equal    ${actual_text}    ${expected_text}

Click Confirm Button On Unbox Pouch And Scan Piece By Piece Popup
    ${dps_btn_confirm_unbox_pouch_and_scan_piece_by_piece}=    Replace String    ${dps_btn_confirm_unbox_pouch_and_scan_piece_by_piece}    {value}    ${dc_operation['text_confirm']}
    common.Click When Ready    ${dps_btn_confirm_unbox_pouch_and_scan_piece_by_piece}

Input Tracking Number In Search Bar On Pouch Detail Section
    [Arguments]    ${text}
    ${dps_txtbox_on_pouch_detail_section}=    Replace String    ${dps_txtbox_on_pouch_detail_section}    {value}    ${dc_operation['text_pouch_detail']}
    common.Input When Ready  ${dps_txtbox_on_pouch_detail_section}    ${text}

Click Search Button Of Pouch Detail Section
    ${dps_btn_search_on_pouch_detail_on_scan_page}=    Replace String    ${dps_btn_search_on_pouch_detail_on_scan_page}    {label}    ${dc_operation['text_pouch_detail']}
    ${dps_btn_search_on_pouch_detail_on_scan_page}=    Replace String    ${dps_btn_search_on_pouch_detail_on_scan_page}    {value}    ${dc_operation['text_search']}
    common.Click Xpath By JavaScript    ${dps_btn_search_on_pouch_detail_on_scan_page}

Verify Label Pouch Detail In Scan In Page
    [Arguments]    ${expected_pouch_num}    ${expected_parcel_in_pouch}    ${expected_courier}
    ...    ${expected_date_delivery_pouch}    ${expected_origin_warehouse}    ${expected_destination_warehouse}
    ...    ${expected_crossdock_warehouse}
    ${dps_txt_pouch_number_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_pouch_number_in_pouch_detail_scan_in_page}   {value}    ${expected_pouch_num}
    ${dps_txt_parcel_in_pouch_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_parcel_in_pouch_in_pouch_detail_scan_in_page}    {value}    ${expected_parcel_in_pouch}
    ${dps_txt_courier_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_courier_in_pouch_detail_scan_in_page}    {value}    ${expected_courier}
    ${dps_txt_date_delivery_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_date_delivery_in_pouch_detail_scan_in_page}    {value}    ${expected_date_delivery_pouch}
    ${dps_txt_origin_warehouse_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_origin_warehouse_in_pouch_detail_scan_in_page}    {value}    ${expected_origin_warehouse}
    ${dps_txt_destination_warehouse_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_destination_warehouse_in_pouch_detail_scan_in_page}    {value}    ${expected_destination_warehouse}
    ${dps_txt_crossdock_warehouse_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_crossdock_warehouse_in_pouch_detail_scan_in_page}    {value}    ${expected_crossdock_warehouse}
    Wait Until Element Is Visible    ${dps_txt_pouch_number_in_pouch_detail_scan_in_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_pouch_num}=    Get Text    ${dps_txt_pouch_number_in_pouch_detail_scan_in_page}
    ${actual_parcel_in_pouch}=    Get Text    ${dps_txt_parcel_in_pouch_in_pouch_detail_scan_in_page}
    ${actual_courier}=    Get Text    ${dps_txt_courier_in_pouch_detail_scan_in_page}
    ${actual_date_delivery}=    Get Text    ${dps_txt_date_delivery_in_pouch_detail_scan_in_page}
    ${actual_origin_warehouse}=    Get Text    ${dps_txt_origin_warehouse_in_pouch_detail_scan_in_page}
    ${actual_destination_warehouse}=    Get Text    ${dps_txt_destination_warehouse_in_pouch_detail_scan_in_page}
    ${actual_crossdock_warehouse}=    Get Text    ${dps_txt_crossdock_warehouse_in_pouch_detail_scan_in_page}
    Should Be Equal    ${actual_pouch_num}    ${expected_pouch_num}
    Should Be Equal    ${actual_parcel_in_pouch}    ${expected_parcel_in_pouch}
    Should Be Equal    ${actual_courier}    ${expected_courier}
    Should Be Equal    ${actual_date_delivery}    ${expected_date_delivery_pouch}
    Should Be Equal    ${actual_origin_warehouse}    ${expected_origin_warehouse}
    Should Be Equal    ${actual_destination_warehouse}    ${expected_destination_warehouse}
    Should Be Equal    ${actual_crossdock_warehouse}    ${expected_crossdock_warehouse}

Verify Data Pouch Detail In Scan In Page
    [Arguments]    ${expected_pouch_num}    ${expected_parcel_in_pouch}    ${expected_courier}
    ...    ${expected_origin_warehouse}    ${expected_destination_warehouse}    ${expected_crossdock_warehouse}
    ${dps_txt_data_pouch_number_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_data_pouch_number_in_pouch_detail_scan_in_page}   {value}    ${dc_operation.label_pouch_detail_in_scan_in_page['pouch_number']}
    ${dps_txt_data_parcel_in_pouch_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_data_parcel_in_pouch_in_pouch_detail_scan_in_page}    {value}    ${dc_operation.label_pouch_detail_in_scan_in_page['parcel_in_pouch_amount']}
    ${dps_txt_data_courier_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_data_courier_in_pouch_detail_scan_in_page}    {value}    ${dc_operation.label_pouch_detail_in_scan_in_page['courier']}
    ${dps_txt_data_date_delivery_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_data_date_delivery_in_pouch_detail_scan_in_page}    {value}    ${dc_operation.label_pouch_detail_in_scan_in_page['date_delivery_origin_warehouse']}
    ${dps_txt_data_origin_warehouse_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_data_origin_warehouse_in_pouch_detail_scan_in_page}    {value}    ${dc_operation.label_pouch_detail_in_scan_in_page['origin_warehouse']}
    ${dps_txt_data_destination_warehouse_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_data_destination_warehouse_in_pouch_detail_scan_in_page}    {value}    ${dc_operation.label_pouch_detail_in_scan_in_page['destination_warehouse']}
    ${dps_txt_data_crossdock_warehouse_in_pouch_detail_scan_in_page}=    Replace String    ${dps_txt_data_crossdock_warehouse_in_pouch_detail_scan_in_page}    {value}    ${dc_operation.label_pouch_detail_in_scan_in_page['crossdock_warehouse']}
    ${dps_parcel_have_to_scan_remaining}=    Replace String    ${dps_parcel_have_to_scan_remaining}    {value}    ${dc_operation['text_parcel_have_to_scan_remaining']}
    ${actual_pouch_num}=    Get Text    ${dps_txt_data_pouch_number_in_pouch_detail_scan_in_page}
    ${actual_parcel_in_pouch}=    Get Text    ${dps_txt_data_parcel_in_pouch_in_pouch_detail_scan_in_page}
    ${actual_courier}=    Get Text    ${dps_txt_data_courier_in_pouch_detail_scan_in_page}
    ${actual_date_delivery}=    Get Text    ${dps_txt_data_date_delivery_in_pouch_detail_scan_in_page}
    ${actual_origin_warehouse}=    Get Text    ${dps_txt_data_origin_warehouse_in_pouch_detail_scan_in_page}
    ${actual_destination_warehouse}=    Get Text    ${dps_txt_data_destination_warehouse_in_pouch_detail_scan_in_page}
    ${actual_crossdock_warehouse}=    Get Text    ${dps_txt_data_crossdock_warehouse_in_pouch_detail_scan_in_page}
    ${actual_parcel_remaining_in_text}=    Get Text    ${dps_parcel_have_to_scan_remaining}
    ${actual_parcel_remaining_in_table}=    Get Element Count    ${dps_amount_parcel_have_to_scan_remaining_in_table}
    ${actual_parcel_remaining_in_table}=    Convert To String    ${actual_parcel_remaining_in_table}
    ${actual_date_delivery}=    Strip String    ${actual_date_delivery}
    Sleep    5s
    Should Be Equal    ${actual_pouch_num}    ${expected_pouch_num}
    Should Be Equal    ${actual_parcel_in_pouch}    ${expected_parcel_in_pouch}
    Should Be Equal    ${actual_courier}    ${expected_courier}
    Should Match Regexp    ${actual_date_delivery}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}$
    Should Be Equal    ${actual_origin_warehouse}    ${expected_origin_warehouse}
    Should Be Equal    ${actual_destination_warehouse}    ${expected_destination_warehouse}
    Should Be Equal    ${actual_crossdock_warehouse}    ${expected_crossdock_warehouse}
    Should be Equal    ${actual_parcel_remaining_in_text}    ${actual_parcel_remaining_in_table}

Verify Label Parcel In Pouch In Scan In Page
    [Arguments]    ${tracking}    ${destination_warehouse}    ${parcel_size}
    ...    ${type}    ${parcel_status}
    ${dps_txt_thead_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_thead_parcel_in_pouch_scan_in_page}    {tracking}    ${tracking}
    ${dps_txt_thead_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_thead_parcel_in_pouch_scan_in_page}    {destination_warehouse}    ${destination_warehouse}
    ${dps_txt_thead_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_thead_parcel_in_pouch_scan_in_page}    {parcel_size}    ${parcel_size}
    ${dps_txt_thead_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_thead_parcel_in_pouch_scan_in_page}    {type}    ${type}
    ${dps_txt_thead_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_thead_parcel_in_pouch_scan_in_page}    {parcel_status}    ${parcel_status}
    Scroll Element Into View    ${dps_txt_thead_parcel_in_pouch_scan_in_page}
    Wait Until Element Is Visible    ${dps_txt_thead_parcel_in_pouch_scan_in_page}    timeout=${DEFAULT_TIMEOUT}

Verify Data Parcel In Pouch In Scan In Page
    [Arguments]    ${tracking}    ${destination_warehouse}    ${parcel_size}
    ...    ${type}    ${parcel_status}
    ${dps_txt_data_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_data_parcel_in_pouch_scan_in_page}    {tracking}    ${tracking}
    ${dps_txt_data_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_data_parcel_in_pouch_scan_in_page}    {destination_warehouse}    ${destination_warehouse}
    ${dps_txt_data_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_data_parcel_in_pouch_scan_in_page}    {parcel_size}    ${parcel_size}
    ${dps_txt_data_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_data_parcel_in_pouch_scan_in_page}    {type}    ${type}
    ${dps_txt_data_parcel_in_pouch_scan_in_page}=    Replace String    ${dps_txt_data_parcel_in_pouch_scan_in_page}    {parcel_status}    ${parcel_status}
    Scroll Element Into View    ${dps_txt_data_parcel_in_pouch_scan_in_page}
    Wait Until Element Is Visible    ${dps_txt_data_parcel_in_pouch_scan_in_page}    timeout=${DEFAULT_TIMEOUT}

#################################### Home Destination ####################################

Click Confirm Button To Create Pouch
    common.Click When Ready    ${dps_btn_confirm_create_pouch}
    Wait Until Element Is Not Visible    ${dps_btn_confirm_create_pouch}

Verify Pouch Detail In Scan Page
    [Arguments]    ${pouch_number}    ${number_of_parcel}
    ${label_pouch}=    Replace String    ${dps_txt_pouch_detail}    {value}    ${dc_operation.label_pouch_detail['label_pouch']}
    ${label_pouch_number}=    Replace String    ${label_pouch}    {pouch_number}    ${pouch_number}
    ${text_pouch_number}=    Replace String    ${dps_txt_number_of_parcel_in_pouch}    {pouch_number}    ${pouch_number}
    ${text_number_of_parcel}=    Replace String    ${text_pouch_number}    {value}    ${number_of_parcel}
    Wait Until Element Is Visible    ${label_pouch_number}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${text_number_of_parcel}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${text_number_of_parcel}

Click Print Label
    ${dps_btn_print_label_parcel_detail_page}=    Replace String    ${dps_btn_print_label_parcel_detail_page}    {value}    ${dc_operation['text_print_label']}
    common.Scroll Into View By Xpath    ${dps_btn_print_label_parcel_detail_page}    true
    common.Click When Ready    ${dps_btn_print_label_parcel_detail_page}
    Sleep    5s

Click Accept Scan In
    ${dps_btn_print_label_parcel_detail_page}=    Replace String    ${dps_btn_print_label_parcel_detail_page}    {value}    ${dc_operation['text_accept_scan_in']}
    common.Scroll Into View By Xpath    ${dps_btn_print_label_parcel_detail_page}    true
    common.Click When Ready    ${dps_btn_print_label_parcel_detail_page}
    Sleep    5s

Click Close Print Label Success Popup
    common.Click When Ready    ${dps_btn_close_on_print_label_success_popup}
    Wait Until Element Is Not Visible    ${dps_txt_print_label_success_in_popup}    timeout=${DEFAULT_TIMEOUT}
    
Verify Print Label Success Popup
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${dps_txt_print_label_success_in_popup}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text}=    Get Text    ${dps_txt_print_label_success_in_popup}
    Should Be Equal    ${actual_text}    ${expected_text}

Verify Accept Scan In Success Popup
    [Arguments]    ${expected_text}
    Wait Until Element Is Visible    ${dps_txt_accept_scan_in_success_in_popup}    timeout=${DEFAULT_TIMEOUT}
    ${actual_text}=    Get Text    ${dps_txt_accept_scan_in_success_in_popup}
    Should Be Equal    ${actual_text}    ${expected_text}

Verify Create Pouch Popup Confirmation
    [Arguments]    ${text_create_pouch}    ${title_destination_warehouse}    ${value_destination_warehouse}
    ${dps_txt_create_pouch_confirmation}=    Replace String    ${dps_txt_create_pouch_confirmation_scan_in_page}    {value}    ${text_create_pouch}
    ${dps_txt_destination_warehouse_in_create_pouch_confirmation}=    Replace String    ${dps_txt_destination_warehouse_in_create_pouch_confirmation_scan_in_page}    {title_destination_warehouse}    ${title_destination_warehouse}
    ${dps_txt_destination_warehouse_in_create_pouch_confirmation}=    Replace String    ${dps_txt_destination_warehouse_in_create_pouch_confirmation}    {value_destination_warehouse}    ${value_destination_warehouse}
    Wait Until Element Is Visible    ${dps_txt_create_pouch_confirmation}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_txt_destination_warehouse_in_create_pouch_confirmation}    timeout=${DEFAULT_TIMEOUT}

Click Confirm Button To Create Pouch Popup Confirmation
    ${dps_btn_confirm_create_pouch_confirmation}=    Replace String    ${dps_btn_confirm_create_pouch_confirmation_scan_in_page}    {value}    ${dc_operation.create_pouch_confirmation['button_confirm']}
    common.Click When Ready    ${dps_btn_confirm_create_pouch_confirmation}

Click Pouch Box
    [Arguments]    ${pouch_number}    ${number_of_parcel}
    ${text_pouch_number}=    Replace String    ${dps_txt_number_of_parcel_in_pouch}    {pouch_number}    ${pouch_number}
    ${text_number_of_parcel}=    Replace String    ${text_pouch_number}    {value}    ${number_of_parcel}
    Scroll Element Into View    ${text_number_of_parcel}
    common.Click When Ready    ${text_number_of_parcel}

#################################### Other Courier ####################################

Verify Title Parcel Details In Scan Page [Other Courier]
    [Arguments]    ${title}    ${parcel_id}    ${customer_id}
    ...            ${parcel_size}    ${parcel_status}    ${courier}    ${pouch_number}
    ...            ${receiving_date}    ${origin_warehouse}    ${send_parcel_to}
    Sleep    5s
    ${dps_txt_title_parcel_detail}=    Replace String    ${dps_txt_title_parcel_detail}    {value}    ${title}
    ${dps_txt_title_parcel_id}=    Replace String    ${dps_txt_title_parcel_id}    {value}    ${parcel_id}
    ${dps_txt_title_customer_id}=    Replace String    ${dps_txt_title_customer_id}    {value}    ${customer_id}
    ${dps_txt_title_parcel_size}=    Replace String    ${dps_txt_title_parcel_size}    {value}    ${parcel_size}
    ${dps_txt_title_parcel_status}=    Replace String    ${dps_txt_title_parcel_status}    {value}    ${parcel_status}
    ${dps_txt_title_courier}=    Replace String    ${dps_txt_title_courier}    {value}    ${courier}
    ${dps_txt_title_pouch_number}=    Replace String    ${dps_txt_title_pouch_number}    {value}    ${pouch_number}
    ${dps_txt_title_receiving_date}=    Replace String    ${dps_txt_title_receiving_date}    {value}    ${receiving_date}
    ${dps_txt_title_origin_warehouse}=    Replace String    ${dps_txt_title_origin_warehouse}    {value}    ${origin_warehouse}
    ${dps_txt_title_send_parcel_to}=    Replace String    ${dps_txt_title_send_parcel_to}    {value}    ${send_parcel_to}
    Wait Until Element Is Visible    ${dps_txt_title_parcel_detail}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_parcel_detail_}=    Get Text    ${dps_txt_title_parcel_detail}
    ${actual_txt_title_parcel_id}=    Get Text    ${dps_txt_title_parcel_id}
    ${actual_txt_title_customer_id}=    Get Text    ${dps_txt_title_customer_id}
    ${actual_txt_title_parcel_size}=    Get Text    ${dps_txt_title_parcel_size} 
    ${actual_txt_title_parcel_status}=    Get Text    ${dps_txt_title_parcel_status}
    ${actual_txt_title_courier}=    Get Text    ${dps_txt_title_courier}
    ${actual_txt_title_pouch_number}=    Get Text    ${dps_txt_title_pouch_number}
    ${actual_txt_title_receiving_date}=    Get Text    ${dps_txt_title_receiving_date} 
    ${actual_txt_title_origin_warehouse}=    Get Text    ${dps_txt_title_origin_warehouse}
    ${actual_txt_title_send_parcel_to}=    Get Text    ${dps_txt_title_send_parcel_to}
   
    Should Be Equal    ${actual_txt_title_parcel_detail_}    ${title}
    Should Be Equal    ${actual_txt_title_parcel_id}    ${parcel_id}
    Should Be Equal    ${actual_txt_title_customer_id}    ${customer_id}
    Should Be Equal    ${actual_txt_title_parcel_size}    ${parcel_size}
    Should Be Equal    ${actual_txt_title_parcel_status}    ${parcel_status}
    Should Be Equal    ${actual_txt_title_courier}    ${courier}
    Should Be Equal    ${actual_txt_title_pouch_number}    ${pouch_number}
    Should Be Equal    ${actual_txt_title_receiving_date}    ${receiving_date}
    Should Be Equal    ${actual_txt_title_origin_warehouse}    ${origin_warehouse}
    Should Be Equal    ${actual_txt_title_send_parcel_to}    ${send_parcel_to}

Verify Data Parcel Details In Scan Page [Other Courier]
    [Arguments]    ${parcel_id}    ${customer_id}    ${parcel_size}
    ...            ${parcel_status}    ${courier}    ${pouch_number}   
    ...            ${receiving_date}    ${origin_warehouse}    ${send_parcel_to}  

    ${dps_txt_value_parcel_id}=    Replace String    ${dps_txt_value_parcel_id}    {value}    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    ${dps_txt_value_customer_id}=    Replace String    ${dps_txt_value_customer_id}    {value}    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    ${dps_txt_value_parcel_status}=    Replace String    ${dps_txt_value_parcel_status}    {value}    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    ${dps_txt_value_courier}=    Replace String    ${dps_txt_value_courier}    {value}    ${dc_operation.scan_in_title_parcel_detail['courier']}
    ${dps_txt_value_pouch_number}=    Replace String    ${dps_txt_value_pouch_number}    {value}    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ${dps_txt_value_receiving_date}=    Replace String    ${dps_txt_value_receiving_date}    {value}    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    ${dps_txt_value_origin_warehouse}=    Replace String    ${dps_txt_value_origin_warehouse}    {value}    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    ${dps_txt_value_send_parcel_to}=    Replace String    ${dps_txt_value_send_parcel_to}    {value}    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    
    ${actual_value_parcel_id}=    Get Text    ${dps_txt_value_parcel_id}
    ${actual_value_customer_id}=    Get Text    ${dps_txt_value_customer_id}
    ${actual_value_parcel_size1}=    Get Value    ${dps_txt_value_parcel_size1}
    ${actual_value_parcel_size2}=    Get Text    ${dps_txt_value_parcel_size2}
    ${actual_value_parcel_size3}=    Get Value    ${dps_txt_value_parcel_size3}
    ${actual_value_parcel_status}=    Get Text    ${dps_txt_value_parcel_status}
    ${actual_value_courier}=    Get Text    ${dps_txt_value_courier}
    ${actual_value_pouch_number}=    Get Text    ${dps_txt_value_pouch_number}
    ${actual_value_receiving_date}=    Get Text    ${dps_txt_value_receiving_date}
    ${actual_value_origin_warehouse}=    Get Text    ${dps_txt_value_origin_warehouse}
    ${actual_value_send_parcel_to}=    Get Text    ${dps_txt_value_send_parcel_to}
    ${actual_value_parcel_size}=    Set Variable    ${actual_value_parcel_size1} ${actual_value_parcel_size2} ${actual_value_parcel_size3}
    
    Should Be Equal    ${actual_value_parcel_id}    ${parcel_id}
    Should Be Equal    ${actual_value_customer_id}    ${customer_id}
    Should Be Equal    ${actual_value_parcel_size}    ${parcel_size}
    Should Be Equal    ${actual_value_parcel_status}    ${parcel_status}
    Should Be Equal    ${actual_value_courier}    ${courier}
    Should Be Equal    ${actual_value_pouch_number}    ${pouch_number}
    Should Contain    ${actual_value_receiving_date}    ${receiving_date}
    Should Match Regexp    ${actual_value_receiving_date}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}$
    Should Be Equal    ${actual_value_origin_warehouse}    ${origin_warehouse}
    Should Be Equal    ${actual_value_send_parcel_to}    ${send_parcel_to}

Verify Title Label Parcel In Scan Page [Other Courier]
    [Arguments]    ${courier}    ${zipcode}    ${customer}    ${phone}

    ${label_courier}=    Replace String    ${dps_txt_label_scan_in}    {value}    ${courier}
    ${label_zipcode}=    Replace String    ${dps_txt_label_scan_in}    {value}    ${zipcode}
    ${label_customer}=    Replace String    ${dps_txt_label_scan_in}    {value}    ${customer}
    ${label_phone}=    Replace String    ${dps_txt_label_scan_in}    {value}    ${phone}

    Element Should Be Visible    ${label_courier}
    Element Should Be Visible    ${label_zipcode}
    Element Should Be Visible    ${label_customer}
    Element Should Be Visible    ${label_phone}

Verify Data Label Parcel In Scan Page [Other Courier]
    [Arguments]    ${courier}    ${zipcode}    ${customer}    ${phone}
    ${value_courier}=    Replace String    ${dps_txt_label_scan_in}    {value}    ${courier}
    ${value_customer}=    Replace String    ${dps_txt_label_scan_in}    {value}    ${customer}
    ${value_phone}=    Replace String    ${dps_txt_label_scan_in}    {value}    ${phone}
    ${value_zipcode}=    Get Text    ${dps_txt_value_label_home}

    Element Should Be Visible    ${value_courier}
    Should Be Equal    ${value_zipcode}    ${zipcode}
    Element Should Be Visible    ${value_customer}
    Element Should Be Visible    ${value_phone}

#################################### CP All Courier ####################################

Verify Title Parcel Details In Scan Page [CP All Courier]
    [Arguments]    ${title}    ${parcel_id}    ${customer_id}    
    ...            ${parcel_size}    ${crossdock_warehouse}    ${destination_warehouse} 
    ...            ${parcel_status}    ${courier}    ${pouch_number}
    ...            ${receiving_date}    ${origin_warehouse}    ${send_parcel_to}    ${route}
    Sleep    5s
    ${dps_txt_title_parcel_detail}=    Replace String    ${dps_txt_title_parcel_detail}    {value}    ${title}
    ${dps_txt_title_parcel_id}=    Replace String    ${dps_txt_title_parcel_id}    {value}    ${parcel_id}
    ${dps_txt_title_customer_id}=    Replace String    ${dps_txt_title_customer_id}    {value}    ${customer_id}
    ${dps_txt_title_parcel_size}=    Replace String    ${dps_txt_title_parcel_size}    {value}    ${parcel_size}
    ${dps_txt_title_crossdock_warehouse}=    Replace String    ${dps_txt_title_crossdock_warehouse}    {value}    ${crossdock_warehouse}
    ${dps_txt_title_destination_warehouse}=    Replace String    ${dps_txt_title_destination_warehouse}    {value}    ${destination_warehouse}
    ${dps_txt_title_parcel_status}=    Replace String    ${dps_txt_title_parcel_status}    {value}    ${parcel_status}
    ${dps_txt_title_courier}=    Replace String    ${dps_txt_title_courier}    {value}    ${courier}
    ${dps_txt_title_pouch_number}=    Replace String    ${dps_txt_title_pouch_number}    {value}    ${pouch_number}
    ${dps_txt_title_receiving_date}=    Replace String    ${dps_txt_title_receiving_date}    {value}    ${receiving_date}
    ${dps_txt_title_origin_warehouse}=    Replace String    ${dps_txt_title_origin_warehouse}    {value}    ${origin_warehouse}
    ${dps_txt_title_send_parcel_to}=    Replace String    ${dps_txt_title_send_parcel_to}    {value}    ${send_parcel_to}
    ${dps_txt_title_route}=    Replace String    ${dps_txt_title_route}    {value}    ${route}
    Wait Until Element Is Visible    ${dps_txt_title_parcel_detail}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_parcel_detail_}=    Get Text    ${dps_txt_title_parcel_detail}
    ${actual_txt_title_parcel_id}=    Get Text    ${dps_txt_title_parcel_id}
    ${actual_txt_title_customer_id}=    Get Text    ${dps_txt_title_customer_id}
    ${actual_txt_title_parcel_size}=    Get Text    ${dps_txt_title_parcel_size} 
    ${actual_txt_title_crossdock_warehouse}=    Get Text    ${dps_txt_title_crossdock_warehouse}
    ${actual_txt_title_destination_warehouse}=    Get Text    ${dps_txt_title_destination_warehouse}
    ${actual_txt_title_parcel_status}=    Get Text    ${dps_txt_title_parcel_status}
    ${actual_txt_title_courier}=    Get Text    ${dps_txt_title_courier}
    ${actual_txt_title_pouch_number}=    Get Text    ${dps_txt_title_pouch_number}
    ${actual_txt_title_receiving_date}=    Get Text    ${dps_txt_title_receiving_date} 
    ${actual_txt_title_origin_warehouse}=    Get Text    ${dps_txt_title_origin_warehouse}
    ${actual_txt_title_send_parcel_to}=    Get Text    ${dps_txt_title_send_parcel_to}
    ${actual_txt_title_route}=    Get Text    ${dps_txt_title_route}
    Should Be Equal    ${actual_txt_title_parcel_detail_}    ${title}
    Should Be Equal    ${actual_txt_title_parcel_id}    ${parcel_id}
    Should Be Equal    ${actual_txt_title_customer_id}    ${customer_id}
    Should Be Equal    ${actual_txt_title_parcel_size}    ${parcel_size}
    Should Be Equal    ${actual_txt_title_crossdock_warehouse}    ${crossdock_warehouse}
    Should Be Equal    ${actual_txt_title_destination_warehouse}    ${destination_warehouse}
    Should Be Equal    ${actual_txt_title_parcel_status}    ${parcel_status}
    Should Be Equal    ${actual_txt_title_courier}    ${courier}
    Should Be Equal    ${actual_txt_title_pouch_number}    ${pouch_number}
    Should Be Equal    ${actual_txt_title_receiving_date}    ${receiving_date}
    Should Be Equal    ${actual_txt_title_origin_warehouse}    ${origin_warehouse}
    Should Be Equal    ${actual_txt_title_send_parcel_to}    ${send_parcel_to}
    Should Be Equal    ${actual_txt_title_route}    ${route}

Verify Pouch Number Data Parcel Details In Scan Page [CP All Courier]
    [Arguments]    ${pouch_number}
    ${actual_pouch_number}=    Replace String    ${dps_txt_value_pouch_number_scan_in}    {text}    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ${actual_pouch_number}=    Replace String    ${actual_pouch_number}    {value}    ${pouch_number}
    Wait Until Element Is Visible    ${actual_pouch_number}    timeout=${DEFAULT_TIMEOUT}

Verify Data Parcel Details In Scan Page [CP All Courier]
    [Arguments]    ${parcel_id}    ${customer_id}    ${parcel_size}
    ...            ${crossdock_warehouse}    ${destination_warehouse}    ${parcel_status}
    ...            ${courier}    ${pouch_number}    ${receiving_date}
    ...            ${origin_warehouse}    ${send_parcel_to}
    ${dps_txt_value_parcel_id}=    Replace String    ${dps_txt_value_parcel_id}    {value}    ${dc_operation.scan_in_title_parcel_detail['parcel_id']}
    ${dps_txt_value_customer_id}=    Replace String    ${dps_txt_value_customer_id}    {value}    ${dc_operation.scan_in_title_parcel_detail['customer_id']}
    ${dps_txt_value_crossdock_warehouse}=    Replace String    ${dps_txt_value_crossdock_warehouse}    {value}    ${dc_operation.scan_in_title_parcel_detail['crossdock_warehouse']}
    ${dps_txt_value_destination_warehouse}=    Replace String    ${dps_txt_value_destination_warehouse}    {value}    ${dc_operation.scan_in_title_parcel_detail['destination_warehouse']}
    ${dps_txt_value_parcel_status}=    Replace String    ${dps_txt_value_parcel_status}    {value}    ${dc_operation.scan_in_title_parcel_detail['parcel_status']}
    ${dps_txt_value_courier}=    Replace String    ${dps_txt_value_courier}    {value}    ${dc_operation.scan_in_title_parcel_detail['courier']}
    ${dps_txt_value_pouch_number}=    Replace String    ${dps_txt_value_pouch_number}    {value}    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    ${dps_txt_value_receiving_date}=    Replace String    ${dps_txt_value_receiving_date}    {value}    ${dc_operation.scan_in_title_parcel_detail['receiving_date']}
    ${dps_txt_value_origin_warehouse}=    Replace String    ${dps_txt_value_origin_warehouse}    {value}    ${dc_operation.scan_in_title_parcel_detail['origin_warehouse']}
    ${dps_txt_value_send_parcel_to}=    Replace String    ${dps_txt_value_send_parcel_to}    {value}    ${dc_operation.scan_in_title_parcel_detail['send_parcel_to']}
    ${dps_input_route_parcel_detail_scan_in_page}=    Replace String    ${dps_input_route_parcel_detail_scan_in_page}    {value}    ROUTE    #${dc_operation.scan_in_title_parcel_detail['route']}
    ${actual_value_parcel_id}=    Get Text    ${dps_txt_value_parcel_id}
    ${actual_value_customer_id}=    Get Text    ${dps_txt_value_customer_id}
    ${actual_value_parcel_size1}=    Get Value    ${dps_txt_value_parcel_size1}
    ${actual_value_parcel_size2}=    Get Text    ${dps_txt_value_parcel_size2}
    ${actual_value_parcel_size3}=    Get Value    ${dps_txt_value_parcel_size3}
    ${actual_value_crossdock_warehouse}=    Get Text    ${dps_txt_value_crossdock_warehouse}
    ${actual_value_destination_warehouse}=    Get Text    ${dps_txt_value_destination_warehouse}
    ${actual_value_parcel_status}=    Get Text    ${dps_txt_value_parcel_status}
    ${actual_value_courier}=    Get Text    ${dps_txt_value_courier}
    ${actual_value_pouch_number}=    Get Text    ${dps_txt_value_pouch_number}
    ${actual_value_receiving_date}=    Get Text    ${dps_txt_value_receiving_date}
    ${actual_value_origin_warehouse}=    Get Text    ${dps_txt_value_origin_warehouse}
    ${actual_value_send_parcel_to}=    Get Text    ${dps_txt_value_send_parcel_to}
    ${actual_value_route}=    Get Value    ${dps_txt_value_route}
    ${actual_value_parcel_size}=    Set Variable    ${actual_value_parcel_size1} ${actual_value_parcel_size2} ${actual_value_parcel_size3}
    ${actual_receiving_date}    Split String And Select  ${actual_value_receiving_date}  ${SPACE}  0
    ${actual_receiving_time}    Split String And Select  ${actual_value_receiving_date}  ${SPACE}  1
    Should Match Regexp    ${actual_receiving_time}    ^\\d{2}:\\d{2}$
    IF    '${actual_value_route}' == '' or '${actual_value_route}' == '-'
        Element Should Be Disabled    ${dps_input_route_parcel_detail_scan_in_page}
    ELSE
        Should Match Regexp    ${actual_value_route}    ^\\d+$  
    END
    Should Be Equal    ${actual_value_parcel_id}    ${parcel_id}
    Should Be Equal    ${actual_value_customer_id}    ${customer_id}
    Should Be Equal    ${actual_value_parcel_size}    ${parcel_size}
    Should Be Equal    ${actual_value_crossdock_warehouse}    ${crossdock_warehouse}
    Should Be Equal    ${actual_value_destination_warehouse}    ${destination_warehouse}
    Element Should Be Visible    ${dps_txt_value_destination_warehouse}${dps_txt_arrow_destination_warehouse}
    Should Be Equal    ${actual_value_parcel_status}    ${parcel_status}
    Should Be Equal    ${actual_value_courier}    ${courier}
    Should Be Equal    ${actual_value_pouch_number}    ${pouch_number}
    Should Be Equal    ${actual_receiving_date}    ${receiving_date}
    Should Be Equal    ${actual_value_origin_warehouse}    ${origin_warehouse}
    Should Be Equal    ${actual_value_send_parcel_to}    ${send_parcel_to}

Verify Title Label Parcel In Scan Page [CP All Courier]
    [Arguments]    ${route}    ${store}    ${customer}    ${phone}    ${pouch_number}    ${wh}
    ${dps_txt_title_label_route}=    Replace String    ${dps_txt_title_label}    {value}    ${route}
    ${dps_txt_title_label_store}=    Replace String    ${dps_txt_title_label}    {value}    ${store}
    ${dps_txt_title_label_customer}=    Replace String    ${dps_txt_title_label}    {value}    ${customer}
    ${dps_txt_title_label_phone}=    Replace String    ${dps_txt_title_label}    {value}    ${phone}
    ${dps_txt_title_label_pouch_number}=    Replace String    ${dps_txt_title_label}    {value}    ${pouch_number}
    ${dps_txt_title_label_wh}=    Replace String    ${dps_txt_title_label}    {value}    ${wh}
    Wait Until Element Is Visible    ${dps_txt_title_label_route}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Keyword Succeeds    5x    2s    Element Should Be Visible    ${dps_txt_title_label_route}
    Element Should Be Visible    ${dps_txt_title_label_store}
    Element Should Be Visible    ${dps_txt_title_label_customer}
    Element Should Be Visible    ${dps_txt_title_label_phone}
    Element Should Be Visible    ${dps_txt_title_label_pouch_number}
    Element Should Be Visible    ${dps_txt_title_label_wh}

Verify Pouch Number Data Label Parcel In Scan Page [CP All Courier]
    [Arguments]    ${pouch_number}
    ${actual_pouch}=    Replace String   ${dps_txt_pouch_value_label}    {text}    ${dc_operation.scan_in_title_label_detail['pouch_number']}
    ${actual_pouch}=    Replace String   ${actual_pouch}    {value}    ${pouch_number}
    Wait Until Element Is VIsible    ${actual_pouch}

Verify Data Label Parcel In Scan Page [CP All Courier]
    [Arguments]    ${store}    ${customer}    ${phone}    ${pouch_number}    ${wh}    ${symbol}
    ${actual_value_route}=    Get Value    ${dps_txt_value_route}
    IF    '${actual_value_route}' == ''
        ${actual_value_route}=    Set Variable    -
    END
    ${dps_txt_value_label_route}=    Replace String    ${dps_txt_value_label}    {value}    ${actual_value_route}
    ${dps_txt_value_label_customer}=    Replace String    ${dps_txt_value_label}    {value}    ${customer}
    ${dps_txt_value_label_phone}=    Replace String    ${dps_txt_value_label}    {value}    ${phone}
    ${dps_txt_value_label_pouch_number}=    Replace String    ${dps_txt_value_label}    {value}    ${pouch_number}
    ${actual_txt_value_label_store}=    Get Text    ${dps_txt_value_label_store}
    ${actual_txt_value_label_wh}=    Get Text    ${dps_txt_value_label_wh}
    Element Should Be Visible    ${dps_txt_value_label_route}
    Element Should Be Visible    ${dps_txt_value_label_customer}
    Element Should Be Visible    ${dps_txt_value_label_phone}
    Element Should Be Visible    ${dps_txt_value_label_pouch_number}
    Should Be Equal    ${actual_txt_value_label_store}    ${store}
    Should Be Equal    ${actual_txt_value_label_wh}    ${wh}

    IF         '${symbol}' == 'รูปดาว'
        Wait Until Page Contains Element    ${dps_img_label_star_symbol_in_scan_page}     
    ELSE IF    '${symbol}' == 'รูปวงกลม'
        Wait Until Page Contains Element    ${dps_img_label_circle_symbol_in_scan_page}
    ELSE IF    '${symbol}' == 'รูปนาฬิกาทราย'
        Wait Until Page Contains Element    ${dps_img_label_hourglass_symbol_in_scan_page}
    END

Click Close Popup Print Scan In Success
    common.Click When Ready    ${dps_btn_close_popup_success}

#################################### Scan Out ####################################

Select Scan Out Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['scan_out']}

Verify Navigate To Scan Page And Stay At Scan Out Tab     # Scan Out
    ${dps_txt_scan_header_ion_scan_page}=    Replace String    ${dps_txt_scan_header_ion_scan_page}    {value}    ${dc_operation.title['scan']}
    ${dps_btn_scan_in_tab_is_active_scan_page}=    Replace String    ${dps_btn_scan_in_tab_is_active_scan_page}    {value}    ${dc_operation.tab_scan['scan_out']}
    Wait Until Element Is Visible    ${dps_txt_scan_header_ion_scan_page}    timeout=10s
    Wait Until Element Is Visible    ${dps_btn_scan_in_tab_is_active_scan_page}    timeout=10s

Click Search Button [Scan Out Page]    # Scan Out
    ${dps_btn_search_scan_out_page}=    Replace String    ${dps_btn_search_scan_out_page}    {value}    ${dc_operation['text_search']}
    common.Click When Ready    ${dps_btn_search_scan_out_page}

Click Confirm Scan Out Button    # Scan Out
    ${dps_btn_confirm_scan_out_scan_out_page}=    Replace String    ${dps_btn_confirm_scan_out_scan_out_page}    {value}    ${dc_operation['text_confirm_scan_out']}
    common.Click When Ready    ${dps_btn_confirm_scan_out_scan_out_page}

Verify Popup Confirm Scan Out
    [Arguments]    ${txt_expected}
    ${dps_txt_popup_scan_out}=    Replace String    ${dps_txt_popup_scan_out}    {value}    ${txt_expected}
    Wait Until Element Is Visible    ${dps_txt_popup_scan_out}    timeout=10s
    ${actual_txt}=    Get Text    ${dps_txt_popup_scan_out}
    Should Be Equal    ${actual_txt}    ${txt_expected}

Click Confirm Button On Popup Asking To Scan Out    # Scan Out
    ${button_confirm}=    Replace String    ${dps_btn_confirm_on_asking_confirm_scan_out_popup}    {value}    ${dc_operation['text_confirm']}
    common.Click When Ready    ${button_confirm}

Verify Popup Save Data Success
    [Arguments]    ${expected_txt}
    ${dps_txt_save_data_success}=    Replace String    ${dps_txt_save_data_success}    {value}    ${expected_txt}
    Wait Until Element Is Visible    ${dps_txt_save_data_success}    timeout=10s
    ${actual_txt}=    Get Text    ${dps_txt_save_data_success}
    Should Be Equal    ${actual_txt}    ${expected_txt}
    
Click Popup Save Data Success    # Scan Out
    ${dps_txt_save_data_success}=    Replace String    ${dps_txt_save_data_success}    {value}    ${dc_operation['text_save_success']}
    common.Click When Ready    ${dps_txt_save_data_success}

Click Waiting Delivery List Button    # Scan Out
    ${dps_btn_waiting_delivery_list_scan_out_page}=    Replace String    ${dps_btn_waiting_delivery_list_scan_out_page}    {value}    ${dc_operation['text_waiting_delivery_list']}
    common.Scroll Into View By Xpath    ${dps_btn_waiting_delivery_list_scan_out_page}    true
    common.Click When Ready    ${dps_btn_waiting_delivery_list_scan_out_page}

Input Pouch Number [Scan Out Page]    # Scan Out
    [Arguments]    ${value}
    Wait Until Element Is Enabled    ${dps_txtbox_on_scan_out_page}
    common.Input When Ready    ${dps_txtbox_on_scan_out_page}    ${value}

Input Tracking Number [Scan Out Page]    # Scan Out
    [Arguments]    ${value}
    Wait Until Element Is Enabled    ${dps_txtbox_on_scan_out_page}
    common.Input When Ready    ${dps_txtbox_on_scan_out_page}    ${value}

Verify label Waiting List To Scan Out [Scan Out Page]
    [Arguments]    ${parcel_number}    ${pouch_number}    ${import_from}
    ...    ${deliver}    ${parcel_owner}    ${parcel_size}
    ...    ${update_date}    ${parcel_status}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {parcel_number}    ${parcel_number}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {pouch_number}    ${pouch_number}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {import_from}    ${import_from}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {deliver}    ${deliver}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {parcel_size}    ${parcel_size}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {update_date}    ${update_date}
    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    {parcel_status}    ${parcel_status}
    common.Scroll Into View By Xpath    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    true
    Wait Until Element Is Visible    ${dps_txt_label_waiting_list_to_scan_out_in_scan_out_page}    timeout=${DEFAULT_TIMEOUT}

Verify Value Waiting List To Scan Out [Scan Out Page]
    [Arguments]    ${parcel_number}    ${pouch_number}    ${import_from}
    ...    ${deliver}    ${parcel_owner}    ${parcel_size}    
    ...    ${update_date}    ${parcel_status}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {parcel_number}    ${parcel_number}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {pouch_number}    ${pouch_number}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {import_from}    ${import_from}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {deliver}    ${deliver}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {parcel_size}    ${parcel_size}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {update_date}    ${update_date}
    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    {parcel_status}    ${parcel_status}
    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}    {parcel_number}    ${parcel_number}
    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}    {pouch_number}    ${pouch_number}
    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}    {import_from}    ${import_from}
    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}    {deliver}    ${deliver}
    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}    {parcel_size}    ${parcel_size}
    common.Scroll Into View By Xpath    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}    true
    Wait Until Element Is Visible    ${dps_txt_waiting_list_to_scan_out_in_scan_out_page}
    ${actual_update_date}=    Get Text    ${dps_txt_update_date_of_waiting_list_to_scan_out_in_scan_out_page}
    Should Match Regexp    ${actual_update_date}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}$

Verify Close Pouch Before Scan Out Warning Popup
    [Arguments]    ${text}
    ${dps_txt_close_pouch_first_warning_popup}=    Replace String    ${dps_txt_close_pouch_first_warning_popup}    {value}    ${text}
    Wait Until Element Is Visible    ${dps_txt_close_pouch_first_warning_popup}    timeout=10s

Verify Label Scan Out
    [Arguments]    ${pouch_number}    ${parcel_id}    ${import_from}    ${transport}
    ...            ${parcel_owner}    ${parcel_size}    ${date}    ${parcel_status}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_pouch_number}    ${pouch_number}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_parcel_id}    ${parcel_id}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_import_from}    ${import_from}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_transport}    ${transport}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_parcel_owner}    ${parcel_owner}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_parcel_size}    ${parcel_size}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_date}    ${date}
    ${dps_txt_label_title_scan_out}=    Replace String    ${dps_txt_label_title_scan_out}    {title_parcel_status}    ${parcel_status}
    Element Should Be Visible    ${dps_txt_label_title_scan_out}

Verify Value List Scan Out
    [Arguments]    ${pouch_number}    ${parcel_id}    ${import_from}    ${transport}
    ...            ${parcel_owner}    ${parcel_size}    ${date}    ${parcel_status}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_pouch_number}    ${pouch_number}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_parcel_id}    ${parcel_id}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_import_from}    ${import_from}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_transport}    ${transport}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_parcel_owner}    ${parcel_owner}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_parcel_size}    ${parcel_size}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_date}    ${date}
    ${dps_txt_value_scan_out}=    Replace String    ${dps_txt_value_scan_out}    {value_parcel_status}    ${parcel_status}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_pouch_number}    ${pouch_number}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_parcel_id}    ${parcel_id}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_import_from}    ${import_from}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_transport}    ${transport}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_parcel_owner}    ${parcel_owner}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_parcel_size}    ${parcel_size}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_date}    ${date}
    ${dps_txt_update_time_scan_out}=    Replace String    ${dps_txt_update_time_scan_out}    {value_parcel_status}    ${parcel_status}
    ${actual_update_date}=    Get Text    ${dps_txt_update_time_scan_out}
    Should Match Regexp    ${actual_update_date}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}$ 
    Element Should Be Visible    ${dps_txt_value_scan_out}
    
Filter Data By Parcel Number [Waiting Scan Out]
    [Arguments]    ${parcel_cod}
    Select Filter Button
    common.Input When Ready    ${dps_txtbox_parcel_code_scan_out_page}    ${parcel_cod}
    Click Search Button On Filter

Get Pouch Number And Verify Pouch Format
    ${dps_txt_pouch_number_title_in_scan_in_page}=    Replace String    ${dps_txt_pouch_number_title_in_scan_in_page}    {value}    ${dc_operation.scan_in_title_parcel_detail['pouch_number']}
    Wait Until Element Is Visible    ${dps_txt_pouch_number_title_in_scan_in_page}    timeout=${DEFAULT_TIMEOUT}
    ${actual_pouch_number}=    Get Text    ${dps_txt_pouch_number_title_in_scan_in_page}
    ${pattern}=    Set Variable    ^P\d{2}(0[1-9]|1[0-2])([0-2][1-9]|3[0-1])\d{3}$
    Should Match Regexp    ${actual_pouch_number}    ${pattern}
    RETURN    ${actual_pouch_number}

############################ Move Status Tab #########################################
Select Move Status Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['move_status']}

Select Finding Parcel Tab
    ${tab}=    Replace String    ${dps_btn_sub_tab_in_move_status_tab}    {tab}    ${dc_operation.tab_scan['finding_parcel']}
    common.Click When Ready    ${tab}

Select Selected Parcel Tab
    ${tab}=    Replace String    ${dps_btn_sub_tab_in_move_status_tab}    {tab}    ${dc_operation.tab_scan['selected_parcel']}
    common.Click When Ready    ${tab}

Verify Move Status Page
    Set Today
    ${today_repattern}    Set Date Pattern    ${today}
    ${btn_download_template}=    Replace String    ${dps_btn_in_move_status_tab}    {value}    ${dc_operation['button_download_template']}
    ${btn_import}=    Replace String    ${dps_btn_in_move_status_tab}    {value}    ${dc_operation['button_import']}
    ${btn_filter}=    Replace String    ${dps_btn_in_move_status_tab}    {value}    ${dc_operation['button_filter']}
    ${txt_update_date}=    Replace String    ${dps_txt_update_date_move_status}   {date}    ${today_repattern}
    Wait Until Element Is Visible    ${btn_download_template}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_import}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_filter}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_update_date}    timeout=${DEFAULT_TIMEOUT}
    ${amount_of_data}=    Get Element Count    ${dps_table_data_move_status}
    Should Be Equal As Strings    ${amount_of_data}    10

Click Filter Button
    ${btn_filter}=    Replace String    ${dps_btn_in_move_status_tab}    {value}    ${dc_operation['button_filter']}
    common.Click When Ready    ${btn_filter}

Verify Filter Title Used To Search Information
    [Arguments]    ${parcel_status}    ${parcel_number}    ${pouch_number}    ${transport}    ${parcel_owner}
    ...        ${parcel_size}        ${last_updated_date}
    ${txt_parcel_status}=    Replace String    ${dps_txt_filter_title_move_status}    {value}    ${parcel_status}
    ${txt_parcel_number}=    Replace String    ${dps_txt_filter_title_move_status}    {value}    ${parcel_number}
    ${txt_pouch_number}=    Replace String    ${dps_txt_filter_title_move_status}    {value}    ${pouch_number}
    ${txt_transport}=    Replace String    ${dps_txt_filter_title_move_status}    {value}    ${transport}
    ${txt_parcel_owner}=    Replace String    ${dps_txt_filter_title_move_status}    {value}    ${parcel_owner}
    ${txt_parcel_size}=    Replace String    ${dps_txt_filter_title_move_status}    {value}    ${parcel_size}
    ${txt_last_updated_date}=    Replace String    ${dps_txt_filter_title_move_status}    {value}    ${last_updated_date}

    Wait Until Element Is Visible    ${txt_parcel_status}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_parcel_number}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_pouch_number}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_transport}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_parcel_owner}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_parcel_size}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_last_updated_date}    timeout=${DEFAULT_TIMEOUT}

Click Filter With Parcel Status
    ${cbo_parcel_status}=    Replace String    ${dps_cbo_filter_move_status}    {value}    ${dc_operation.move_status['parcel_status']}
    common.Click When Ready    ${cbo_parcel_status}

Verify Parcel Status List In Dropdown
    Wait Until Element Is Visible    ${dps_cbo_status_list_move_status}

Search With Parcel Status [Move Status]
    [Arguments]    ${parcel_status}
    common.Input When Ready    ${dps_txtbox_status_move_status}    ${parcel_status}

Select Parcel Status [Move Status]
    [Arguments]    ${parcel_status}
    ${actual_parcel_status}=    Replace String    ${dps_cbo_parcel_status_move_status}    {value}    ${parcel_status}
    ${status}=    Set Variable    False
    Register Keyword To Run On Failure    NOTHING
    WHILE    '${status}' == 'False'
        Press Keys    None    DOWN
        ${status}    Run Key Word And Return Status    Page Should Contain Element    ${actual_parcel_status}
        Exit For Loop If    '${status}' == 'True'
    END
    Scroll Element Into View    ${actual_parcel_status}
    common.Click When Ready    ${actual_parcel_status}
    Register Keyword To Run On Failure    Capture Page Screenshot

Verify Parcel Status Dropdown [Move Status]
    [Arguments]    ${status}
    ${actual_parcel_status}=    Replace String    ${dps_cbo_parcel_status_move_status}    {value}    ${parcel_status}
    Wait Until Element Is Visible    ${actual_parcel_status}    timeout=${DEFAULT_TIMEOUT}

Verify Search Parcel Status Result
    [Arguments]    ${status}
    Scroll Window To Vertical    700
    ${parcel_status}=    Replace String    ${dps_txt_parcel_status_move_status}    {value}    ${status}
    Wait Until Element Is Visible    ${parcel_status}    timeout=${DEFAULT_TIMEOUT}
    ${count_parcel_status}=    Get Element Count    ${parcel_status}
    ${count}=    Get Element Count    ${dps_table_data_move_status}
    Should Be Equal As Strings    ${count}    ${count_parcel_status}

Click Filter With Parcel Size
    ${cbo_parcel_status}=    Replace String    ${dps_cbo_filter_move_status}    {value}    ${dc_operation.move_status['parcel_size']}
    common.Click When Ready    ${cbo_parcel_status}

Verify Parcel Size List In Dropdown
    Wait Until Element Is Visible    ${dps_cbo_size_list_move_status}

Click Filter With Courier
    ${cbo_transport}=    Replace String    ${dps_cbo_filter_move_status}    {value}    ${dc_operation.move_status['transport']}
    common.Click When Ready    ${cbo_transport}

Verify Courier List In Dropdown
    Wait Until Element Is Visible    ${dps_cbo_courier_list_move_status}

Click Filter With Parcel Owner
    ${cbo_parcel_owner}=    Replace String    ${dps_cbo_filter_move_status}    {value}    ${dc_operation.move_status['parcel_owner']}
    common.Click When Ready    ${cbo_parcel_owner}

Verify Parcel Owner List In Dropdown
    [Arguments]    ${speedy}    ${partnership}
    ${cbo_speedy}=    Replace String    ${dps_cbo_value_parcel_owner_move_status}    {value}    ${speedy}
    ${cbo_partnership}=    Replace String    ${dps_cbo_value_parcel_owner_move_status}    {value}    ${partnership}
    Wait Until Element Is Not Visible    ${dps_cbo_no_data_move_status}   
    Wait Until Element Is Visible    ${dps_cbo_parcel_owner_list_move_status}
    Wait Until Element Is Visible    ${cbo_speedy}
    Wait Until Element Is Visible    ${cbo_partnership}

Click Filter With Last Updated Date
    common.Click When Ready    ${dps_cbo_selected_date_move_status}

Verify Calendar Last Updated Date
    Wait Until Element Is Visible    ${dps_cbo_calendar_move_status}

Click Search Button [Move Status]
    ${btn_search}=    Replace String    ${dps_btn_search_filter_move_status_tab}    {value}    ${dc_operation['button_search']}
    common.Click When Ready    ${btn_search}

Click Clear Button [Move Status]
    ${btn_clear}=    Replace String    ${dps_btn_clear_filter_move_status_tab}    {value}    ${dc_operation['button_clear']}
    common.Click When Ready    ${btn_clear}

Click Clear Button [Scan Out]
    ${btn_clear}=    Replace String    ${dps_btn_clear_filter_scan_out_tab}    {value}    ${dc_operation['button_clear']}
    common.Click When Ready    ${btn_clear}

Verify Clear Filter Input
    Scroll Window To Vertical    0
    ${parcel_number}=    Get Value    ${dps_txtbox_parcel_number_move_status}
    ${pouch_number}=    Get Value    ${dps_txtbox_pouch_number_move_status}
    ${start_date}=    Get Value    ${dps_txtbox_start_date_move_status}
    ${end_date}=    Get Value    ${dps_txtbox_end_date_move_status}

    Wait Until Element Is Visible    ${dps_txt_blank_parcel_status_move_status}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_txt_courier_move_status}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_txt_blank_parcel_owner_move_status}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_txt_blank_parcel_size_move_status}    timeout=${DEFAULT_TIMEOUT}
    Should Be Empty    ${parcel_number}
    Should Be Empty    ${pouch_number}
    Should Be Empty    ${start_date}
    Should Be Empty    ${end_date}

Input Pouch Number [Move Status]
    [Arguments]    ${pouch_number}
    common.Input When Ready    ${dps_txtbox_pouch_number_move_status}    ${pouch_number}

Verify Search Pouch Number Result
    [Arguments]    ${pouch_number}
    ${pouch_no}=    Replace String    ${dps_txt_pouch_number_move_status}    {value}    ${pouch_number}
    Wait Until Element Is Visible    ${pouch_no}    timeout=${DEFAULT_TIMEOUT}
    ${count}=    Get Element Count    ${dps_table_data_move_status}
    Should Be Equal As Strings    ${count}    1

Input Tracking Number [Move Status]
    [Arguments]    ${tracking_number_b}    ${tracking_number_c}    ${tracking_number_d}    ${tracking_number_e}    ${tracking_number_f}    
    ...    ${tracking_number_g}    ${tracking_number_h}    ${tracking_number_i}    ${tracking_number_j}
    common.Input When Ready    ${dps_txtbox_parcel_number_move_status}
    ...    ${tracking_number_b} ${tracking_number_c} ${tracking_number_d} ${tracking_number_e} ${tracking_number_f} ${tracking_number_g} ${tracking_number_h} ${tracking_number_i} ${tracking_number_j}
ํ
Input One Tracking Number [Move Status]
    [Arguments]    ${tracking_number}
    common.Input When Ready    ${dps_txtbox_parcel_number_move_status}    ${tracking_number}

Verify Search Tracking Number Result
    [Arguments]    ${status}    ${tracking}    ${pouch}    ${courier}    ${owner}    ${size}     ${date}
    ${txt_list_data_move_status}=    Replace String    ${dps_txt_list_data_move_status}    {status}    ${status}
    ${txt_list_data_move_status}=    Replace String    ${txt_list_data_move_status}    {tracking}    ${tracking}
    ${txt_list_data_move_status}=    Replace String    ${txt_list_data_move_status}    {pouch}    ${pouch}
    ${txt_list_data_move_status}=    Replace String    ${txt_list_data_move_status}    {courier}    ${courier}
    ${txt_list_data_move_status}=    Replace String    ${txt_list_data_move_status}    {owner}    ${owner}
    ${txt_list_data_move_status}=    Replace String    ${txt_list_data_move_status}    {size}    ${size}
    ${txt_list_data_move_status}=    Replace String    ${txt_list_data_move_status}    {date}    ${date}
    Wait Until Element Is Visible    ${txt_list_data_move_status}

Verify Search Tracking Number Status Result
    [Arguments]    ${status}    ${tracking}
    ${txt_list_data_move_status}=    Replace String    ${dps_txt_tracking_data_move_status}    {status}    ${status}
    ${txt_list_data_move_status}=    Replace String    ${txt_list_data_move_status}    {tracking}    ${tracking}
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${txt_list_data_move_status}
    RETURN    ${status}

Click All Checkbox [Move Status]
    common.Click When Ready    ${dps_btn_select_all_on_move_status_tab}

Click Selected Checkbox [Move Status]
    [Arguments]    ${tracking}
    ${btn_select_on_move_status_tab}=    Replace String    ${dps_btn_select_on_move_status_tab}    {value}    ${tracking}
    common.Click When Ready    ${btn_select_on_move_status_tab}

Verify Selected Parcel Tab
    [Arguments]    ${text_move_status}    ${download_template}    ${import_file}    ${confirm_move}    ${tracking_b}
    ...    ${tracking_c}    ${tracking_d}    ${tracking_e}    ${tracking_f}    ${tracking_g}    ${tracking_h}
    ...    ${tracking_i}    ${tracking_j}
    ${txt_move_status_to}=    Replace String    ${dps_txt_move_status_to}    {value}    ${text_move_status}
    ${btn_download_template}=    Replace String    ${dps_btn_on_move_status_tab}    {value}    ${download_template}
    ${btn_import_file}=    Replace String    ${dps_btn_on_move_status_tab}    {value}    ${import_file}
    ${btn_confirm_move}=    Replace String    ${dps_btn_on_move_status_tab}    {value}    ${confirm_move}
    ${txt_tracking_b}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_b}
    ${txt_tracking_c}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_c}
    ${txt_tracking_d}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_d}
    ${txt_tracking_e}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_e}
    ${txt_tracking_f}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_f}
    ${txt_tracking_g}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_g}
    ${txt_tracking_h}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_h}
    ${txt_tracking_i}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_i}
    ${txt_tracking_j}=    Replace String    ${dps_txt_tracking_move_status}    {value}    ${tracking_j}

    Wait Until Element Is Visible    ${txt_move_status_to}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${dps_cbo_move_status_to}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_download_template}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_import_file}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${btn_confirm_move}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_b}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_c}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_d}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_e}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_f}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_g}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_h}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_i}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${txt_tracking_j}    timeout=${DEFAULT_TIMEOUT}

Click Dropdown Move Status To
    [Arguments]    ${parcel_status}
    ${actual_parcel_status}=    Replace String    ${dps_cbo_parcel_status_move_status_to}    {value}    ${parcel_status}
    ${status}=    Set Variable    False
    common.Click When Ready    ${dps_btn_select_statuscode_on_move_status_tab}
    Register Keyword To Run On Failure    NOTHING
    WHILE    '${status}' == 'False'
        Press Keys    None    DOWN
        ${status}    Run Key Word And Return Status    Page Should Contain Element    ${actual_parcel_status}
        Exit For Loop If    '${status}' == 'True'
    END
    Scroll Element Into View    ${actual_parcel_status}
    common.Click When Ready    ${actual_parcel_status}
    Register Keyword To Run On Failure    Capture Page Screenshot

Click Confirm Move Status Button
    ${btn_confirm_move}=    Replace String    ${dps_btn_on_move_status_tab}    {value}    ${dc_operation['button_confirm_move_status']}
    common.Click When Ready    ${btn_confirm_move}




