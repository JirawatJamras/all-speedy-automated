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

Verify Data Recevier In Scan Page
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

Select Move Status Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['move_status']}

Select Change Courier Tab
    Select Tab In Scan Page    ${dc_operation.tab_scan['change_courier']}

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

Verify Navigate To Scan Page And Stay At Scan In Tab
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

# Get Pouch Number In Scan Page

Click Confirm Button To Create Pouch
    common.Click When Ready    ${dps_btn_confirm_create_pouch}

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

#################################### Other Courier ####################################

Verify Title Parcel Details In Scan Page [Other Courier]
    [Arguments]    ${title}    ${parcel_id}    ${customer_id}
    ...            ${parcel_size}    ${parcel_status}    ${courier}    ${pouch_number}
    ...            ${receiving_date}    ${origin_warehouse}    ${send_parcel_to}

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
    Should Match Regexp    ${actual_value_receiving_date}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}:\\d{2}$
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
    Should Match Regexp    ${actual_receiving_time}    ^\\d{2}:\\d{2}:\\d{2}$
    Should Match Regexp    ${actual_value_route}    ^\\d+$  
    
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
    Element Should Be Visible    ${dps_txt_title_label_route}
    Element Should Be Visible    ${dps_txt_title_label_store}
    Element Should Be Visible    ${dps_txt_title_label_customer}
    Element Should Be Visible    ${dps_txt_title_label_phone}
    Element Should Be Visible    ${dps_txt_title_label_pouch_number}
    Element Should Be Visible    ${dps_txt_title_label_wh}

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
    Sould Be Equal    ${actual_txt}    ${txt_expected}

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

Click Print Button By Data     # Scan Out
    [Arguments]    ${export_to}    ${deliver}    
    # ${parcel_amount}    ${pouch_amount}    ${total_parcel_pouch}
    ${btn_print}=    Replace String    ${dps_btn_print_scan_out}    {export_to}    ${export_to}
    ${btn_print}=    Replace String    ${btn_print}    {deliver}    ${deliver}
    ${btn_print}=    Replace String    ${btn_print}    ${dc_operation['text_print']}
    common.Click When Ready    ${btn_print}

Input Pouch Number [Scan Out Page]    # Scan Out
    [Arguments]    ${value}
    Wait Until Element Is Enabled    ${dps_txtbox_on_scan_out_page}
    common.Input When Ready    ${dps_txtbox_on_scan_out_page}    ${value}

Verify Section Waiting List To Scan Out [Scan Out Page]
    [Arguments]    ${parcel_number}    ${pouch_number}    ${import_from}
    ...    ${deliver}    ${parcel_owner}    ${parcel_size}    
    ...    ${update_date}    ${parcel_status}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {parcel_number}    ${parcel_number}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {pouch_number}    ${pouch_number}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {import_from}    ${import_from}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {deliver}    ${deliver}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {parcel_size}    ${parcel_size}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {update_date}    ${update_date}
    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    {parcel_status}    ${parcel_status}
    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}    {parcel_number}    ${parcel_number}
    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}    {pouch_number}    ${pouch_number}
    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}    {import_from}    ${import_from}
    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}    {deliver}    ${deliver}
    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}    {parcel_owner}    ${parcel_owner}
    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}=    Replace String    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}    {parcel_size}    ${parcel_size}
    common.Scroll Into View By Xpath    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}    true
    Wait Until Element Is Visible    ${dps_txt_wiating_list_to_scan_out_in_scan_out_page}
    ${actual_update_date}=    Get Text    ${dps_txt_update_date_of_wiating_list_to_scan_out_in_scan_out_page}
    Should Match Regexp    ${actual_update_date}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}$
    # ${date_convert}=    Convert Date    ${actual_update_date}    date_format=%d/%m/%Y %H:%M    result_format=%d/%m/%Y %H:%M
    # Should Be Equal    ${actual_update_date}    ${date_convert}

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
    Should Match Regexp    ${actual_update_date}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}:\\d{2}$
    # Should Match Regexp    ${actual_update_date}    ^\\d{2}-\\d{2}-\\d{4} \\d{2}:\\d{2}$ 
    Element Should Be Visible    ${dps_txt_value_scan_out}
    



Filter Data By Parcel Number [Waiting Scan Out]
    [Arguments]    ${parcel_cod}
    Select Filter Button
    common.Input When Ready    ${dps_txtbox_parcel_code_scan_out_page}    ${parcel_cod}
    Click Search Button On Filter

Get Pouch Number
    ${actual_pouch_number}=    Get Text    (//strong[text()='Pouch Number']/../../..//span)[2]
    RETURN    ${actual_pouch_number}
