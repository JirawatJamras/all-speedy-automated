*** Keywords ***
Verify History Parcel Page
    [Arguments]    ${title_history_parcel}
    ${dps_txt_title_history_parcel}=    Replace String    ${dps_txt_title_history_parcel_history_parcel_page}    {value}    ${title_history_parcel}
    Wait Until Element Is Visible    ${dps_txt_title_history_parcel}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_history_parcel}=    Get Text    ${dps_txt_title_history_parcel}
    Should Be Equal    ${actual_txt_title_history_parcel}    ${title_history_parcel}
    Wait Until Element Is Visible    ${dps_tbl_history_parcel_history_parcel_page}    timeout=${DEFAULT_TIMEOUT}

Check Date And Time Format In Timeline
    [Arguments]    ${date}
    @{thai_months}=    Create List    มกราคม    กุมภาพันธ์    มีนาคม    เมษายน    พฤษภาคม    มิถุนายน    กรกฎาคม    สิงหาคม    กันยายน    ตุลาคม    พฤศจิกายน    ธันวาคม
    @{date_parts}=    Split String    ${date}    ${SPACE}
    ${day}=    Set Variable    ${date_parts[0]}
    ${month}=    Set Variable    ${date_parts[1]}
    ${year}=    Set Variable    ${date_parts[2]}
    ${hour}=    Set Variable    ${date_parts[3]}
    ${minute}=    Set Variable    ${date_parts[5]}

    ${day_is_valid}=    Run Keyword And Return Status    Should Match Regexp    ${day}    ^\\d{2}$
    ${month_is_valid}=    Run Keyword And Return Status    List Should Contain Value    ${thai_months}    ${month}
    ${year_has_four_digits}=    Run Keyword And Return Status    Should Match Regexp    ${year}    ^\\d{4}$
    ${year_in_buddhist_range}=    Run Keyword And Return Status    Run Keyword If    ${year_has_four_digits}    Convert To Integer    ${year}
    ${year_is_valid}=    Run Keyword And Return Status    Evaluate    ${year_in_buddhist_range} >= 2400 and ${year_in_buddhist_range} <= 2600
    ${hour_is_valid}=    Run Keyword And Return Status    Should Match Regexp    ${hour}    ^\\d{2}$
    ${minute_is_valid}=    Run Keyword And Return Status    Should Match Regexp    ${minute}    ^\\d{2}$
    Should Be True    ${day_is_valid}
    Should Be True    ${month_is_valid}
    Should Be True    ${year_is_valid}
    Should Be True    ${hour_is_valid}
    Should Be True    ${minute_is_valid}

Compare Time And Title In Timeline
    [Arguments]    ${step_title}    ${step_description}    ${count_timeline}
    ${sequence}=    Convert To Integer    1
    # FOR    ${i}    IN RANGE    1    ${count_timeline}
    FOR    ${i}    IN RANGE    1    10
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_txt_step_title_in_timeline_history_parcel_page}[${i}]    timeout=1s
        Run Keyword IF    '${isvisible}' == 'True'    Set Suite Variable    ${sequence}    ${i}
        ${actual_description}=    Get Text    (${dps_txt_step_description_in_timeline_history_parcel_page})[${sequence}]
        ${actual_title}=    Get Text    (${dps_txt_step_title_in_timeline_history_parcel_page})[${sequence}]
        Exit For Loop If    '${actual_title}' == '${step_title}'
        ${sequence}=    Set Variable    ${sequence + 1}
    END
    ${dps_card_timeline}=    Replace String    ${dps_card_timeline_history_parcel_page}    {value}    ${dc_operation.label_parcel_details_in_warehouse['timeline']}
    Wait Until Element Is Visible    ${dps_card_timeline}    timeout=${DEFAULT_TIMEOUT}
    ${actual_time}=    Get Text    (${dps_txt_time_in_timeline_history_parcel_page})[${sequence}]
    ${actual_time}=    Replace String    ${actual_time}    \n    ${SPACE}
    Check Date And Time Format In Timeline    ${actual_time}
    Should Be Equal    ${actual_title}    ${step_title}
    Should Be Equal    ${actual_description}    ${step_description}

Verify Timeline
    [Arguments]    ${timelines}    ${index}
    ${count_timeline}=    Get Length    ${timelines}
        FOR    ${i}    IN RANGE    ${index}
        ${timeline}    Get From List    ${timelines}    ${i}
        ${title}=    Get From Dictionary    ${timeline}    title
        ${description}=    Get From Dictionary    ${timeline}    description
        Compare Time And Title In Timeline    ${title}    ${description}    ${count_timeline}
    END

Set Pouch Number In Timeline List
    [Arguments]    ${timelines}    ${title_to_update}    ${new_description}
    FOR    ${timeline}    IN    @{timelines}
        ${title}=    Get From Dictionary    ${timeline}    title
        Run Keyword If    '${title}' == '${title_to_update}'    Set To Dictionary    ${timeline}    description=${new_description}
    END

Filter Data By Parcel Number
    [Arguments]    ${parcel_number}
    ${dps_btn_edit_history_parcel}=    Replace String    ${dps_btn_edit_history_parcel_history_parcel_page}    {value}    ${parcel_number}
    FOR    ${i}    IN RANGE    0    5
        Select Filter Button
        Is Value Present In Parcel Textbox
        common.Input When Ready    ${dps_txtbox_fitler_parcel_number_history_parcel_page}    ${parcel_number}
        Sleep    3s
        Click Search Button On Filter
        Select Filter Button
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_btn_edit_history_parcel}
        Exit For Loop If    '${isvisible}' == 'True'   
    END

Is Value Present In Parcel Textbox
    ${actual_txtbox_fitler_parcel_number}=    Get Value    ${dps_txtbox_fitler_parcel_number_history_parcel_page}
    ${is_not_empty}=    Run Keyword And Return Status    Should Not Be Empty    ${actual_txtbox_fitler_parcel_number}
    Run Keyword If    '${is_not_empty}' == 'True'    common.Click When Ready    ${dps_btn_clear_parcel_number_history_parcel_page}
    
Select Filter Button
    ${dps_btn_filter}=    Replace String    ${dps_btn_filter_history_parcel_page}    {value}    ${dc_operation['button_filter']}
    common.Click Xpath By JavaScript    ${dps_btn_filter}

Click Search Button On Filter
    ${dps_btn_search_filter}=    Replace String    ${dps_btn_search_filter_history_parcel_page}    {value}    ${dc_operation['button_search']}
    common.Click Xpath By JavaScript    ${dps_btn_search_filter}

Verify Data In Table
    [Arguments]    ${title_history_parcel}    ${parcel_number}
    ${dps_txt_title_history_parcel}=    Replace String    ${dps_txt_title_history_parcel_history_parcel_page}    {value}    ${title_history_parcel}
    ${dps_tbl_data_history_parcel}=    Replace String    ${dps_tbl_data_history_parcel_history_parcel_page}    {value}    ${parcel_number}
    Wait Until Element Is Visible    ${dps_txt_title_history_parcel}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${dps_tbl_data_history_parcel}
    Wait Until Element Is Visible    ${dps_tbl_history_parcel_history_parcel_page}

Click Edit History Parcel
    [Arguments]    ${parcel_number}
    ${dps_btn_edit_history_parcel}=    Replace String    ${dps_btn_edit_history_parcel_history_parcel_page}    {value}    ${parcel_number}
    common.Click When Ready    ${dps_btn_edit_history_parcel}

Verify Timeline In Warehouse Details
    [Arguments]    ${header_timeline}
    ${dps_txt_header_timeline}=    Replace String    ${dps_txt_header_timeline_history_parcel_page}    {value}    ${header_timeline}
    ${dps_card_timeline}=    Replace String    ${dps_card_timeline_history_parcel_page}    {value}    ${header_timeline}
    Wait Until Element Is Visible    ${dps_txt_header_timeline}    timeout=${DEFAULT_TIMEOUT}
    Element Should Be Visible    ${dps_card_timeline}

Verify Title Parcel Details In Warehouse Details
    [Arguments]    ${title_parcel_detail}    ${tracking_number}    ${parcel_status}    ${customer_type}    ${pouch_number}    
    ...            ${parcel_size}    ${route}    ${check_in_date}    ${date_in_system}    ${sla_date}    ${sla_text}    ${origin_store}
    ...            ${origin_warehouse}    ${destination_store}    ${crossdock_warehouse}    ${shipping_by}    ${destination_warehouse}
    ${dps_txt_header_parcel_detail}=    Replace String    ${dps_txt_header_parcel_detail_history_parcel_page}    {value}    ${title_parcel_detail}
    ${dps_txt_title_tracking_number}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${tracking_number}
    ${dps_txt_title_parcel_status}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${parcel_status}
    ${dps_txt_title_customer_type}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${customer_type}
    ${dps_txt_title_pouch_number}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${pouch_number}
    ${dps_txt_title_parcel_size}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${parcel_size}
    ${dps_txt_title_route}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${route}
    ${dps_txt_title_check_in_date}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${check_in_date}
    ${dps_txt_title_date_in_system}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${date_in_system}
    ${dps_txt_title_sla_date}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${sla_date}
    ${dps_txt_title_sla_text}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}     {value}    ${sla_text}
    ${dps_txt_title_origin_store}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${origin_store}
    ${dps_txt_title_origin_warehouse}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${origin_warehouse}
    ${dps_txt_title_destination_store}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${destination_store}
    ${dps_txt_title_crossdock_warehouse}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${crossdock_warehouse}
    ${dps_txt_title_shipping_by}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${shipping_by}
    ${dps_txt_title_destination_warehouse}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${destination_warehouse}
    ${actual_txt_header_parcel_detail}=    Get Text    ${dps_txt_header_parcel_detail}
    ${actual_txt_title_tracking_number}=    Get Text    ${dps_txt_title_tracking_number}
    ${actual_txt_title_parcel_status}=    Get Text    ${dps_txt_title_parcel_status}
    ${actual_txt_title_customer_type}=    Get Text    ${dps_txt_title_customer_type}
    ${actual_txt_title_pouch_number}=    Get Text    ${dps_txt_title_pouch_number}
    ${actual_txt_title_parcel_size}=    Get Text    ${dps_txt_title_parcel_size}
    ${actual_txt_title_route}=    Get Text    ${dps_txt_title_route}
    ${actual_txt_title_check_in_date}=    Get Text    ${dps_txt_title_check_in_date}
    ${actual_txt_title_date_in_system}=    Get Text    ${dps_txt_title_date_in_system}
    ${actual_txt_title_sla_date}=    Get Text    ${dps_txt_title_sla_date}
    ${actual_txt_title_sla_text}=    Get Text    ${dps_txt_title_sla_text}
    ${actual_txt_title_origin_store}=    Get Text    ${dps_txt_title_origin_store}
    ${actual_txt_title_origin_warehouse}=    Get Text    ${dps_txt_title_origin_warehouse}
    ${actual_txt_title_destination_store}=    Get Text    ${dps_txt_title_destination_store}
    ${actual_txt_title_crossdock_warehouse}=    Get Text    ${dps_txt_title_crossdock_warehouse}
    ${actual_txt_title_shipping_by}=    Get Text    ${dps_txt_title_shipping_by}
    ${actual_txt_title_destination_warehouse}=    Get Text    ${dps_txt_title_destination_warehouse}
    Should Be Equal    ${actual_txt_header_parcel_detail}    ${title_parcel_detail}
    Should Be Equal    ${actual_txt_title_tracking_number}    ${tracking_number}
    Should Be Equal    ${actual_txt_title_parcel_status}    ${parcel_status}
    Should Be Equal    ${actual_txt_title_customer_type}    ${customer_type}
    Should Be Equal    ${actual_txt_title_pouch_number}    ${pouch_number}
    Should Be Equal    ${actual_txt_title_parcel_size}    ${parcel_size}
    Should Be Equal    ${actual_txt_title_route}    ${route}
    Should Be Equal    ${actual_txt_title_check_in_date}    ${check_in_date}
    Should Be Equal    ${actual_txt_title_date_in_system}    ${date_in_system}
    Should Be Equal    ${actual_txt_title_sla_date}    ${sla_date}
    Should Be Equal    ${actual_txt_title_sla_text}    ${sla_text}
    Should Be Equal    ${actual_txt_title_origin_store}    ${origin_store}
    Should Be Equal    ${actual_txt_title_origin_warehouse}    ${origin_warehouse}
    Should Be Equal    ${actual_txt_title_destination_store}    ${destination_store}
    Should Be Equal    ${actual_txt_title_crossdock_warehouse}    ${crossdock_warehouse}
    Should Be Equal    ${actual_txt_title_shipping_by}    ${shipping_by}
    Should Be Equal    ${actual_txt_title_destination_warehouse}    ${destination_warehouse}

Verify Data Parcel Details In Warehouse Details
    [Arguments]    ${tracking_number}    ${parcel_status}    ${customer_type}    ${pouch_number}
    ...            ${parcel_size}    ${check_in_date}    ${origin_store}    ${origin_warehouse}
    ...            ${destination_store}    ${crossdock_warehouse}    ${shipping_by}    ${destination_warehouse}
    ${dps_txt_value_route}=    Replace String    ${dps_txt_value_parcel_detail_with_title_history_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['route']}
    ${actual_value_route}=    Get Text    ${dps_txt_value_route}
    ${dps_txt_value_date_in_system}=    Replace String    ${dps_txt_value_parcel_detail_with_title_history_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['date_in_system']}
    ${actual_value_date_in_system}=    Get Text    ${dps_txt_value_date_in_system}
    ${dps_txt_value_sla_date}=    Replace String    ${dps_txt_value_parcel_detail_with_title_history_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['sla_date']}
    ${actual_value_sla_date}=    Get Text    ${dps_txt_value_sla_date}
    ${dps_txt_value_sla_text}=    Replace String    ${dps_txt_value_parcel_detail_with_title_history_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['sla_text']}
    ${actual_value_sla_text}=    Get Text    ${dps_txt_value_sla_text}

    ${dps_txt_value_tracking_number}=    Replace String    ${dps_txt_value_tracking_number_history_parcel_page}    {value}    ${tracking_number}
    ${dps_txt_value_parcel_status}=    Replace String    ${dps_txt_value_parcel_status_history_parcel_page}    {value}    ${parcel_status}
    ${dps_txt_value_customer_type}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${customer_type}
    ${dps_txt_value_pouch_number}=    Replace String    ${dps_txt_value_pouch_number_history_parcel_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['pouch_number']}
    ${dps_txt_value_pouch_number}=    Replace String    ${dps_txt_value_pouch_number}    {value}    ${pouch_number}
    ${dps_txt_value_parcel_size}=    Replace String    ${dps_txt_value_parcel_size_history_parcel_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['parcel_size']}
    ${dps_txt_value_parcel_size}=    Replace String    ${dps_txt_value_parcel_size}    {value}    ${parcel_size}
    ${dps_txt_value_route}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${actual_value_route}
    ${dps_txt_value_check_in_date}=    Replace String    ${dps_txt_value_parcel_detail_with_title_history_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['check_in_date']}
    ${dps_txt_value_date_in_system}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${actual_value_date_in_system}
    ${dps_txt_value_sla_date}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${actual_value_sla_date}
    ${dps_txt_value_sla_text}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${actual_value_sla_text}
    ${dps_txt_value_origin_store}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${origin_store}
    ${dps_txt_value_origin_warehouse}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${origin_warehouse}
    ${dps_txt_value_destination_store}=    Replace String    ${dps_txt_value_destination_store_history_parcel_page}    {title}    ${dc_operation.label_parcel_details_in_warehouse['destination_store']}
    ${dps_txt_value_destination_store}=    Replace String    ${dps_txt_value_destination_store}    {value}    ${destination_store}
    ${dps_txt_value_crossdock_warehouse}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${crossdock_warehouse}
    ${dps_txt_value_shipping_by}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${shipping_by}
    ${dps_txt_value_destination_warehouse}=    Replace String    ${dps_txt_value_parcel_detail_history_parcel_page}    {value}    ${destination_warehouse}
    
    ${actual_txt_value_tracking_number}=    Get Text    ${dps_txt_value_tracking_number}
    ${actual_txt_value_parcel_status}=    Get Text    ${dps_txt_value_parcel_status}
    ${actual_txt_value_customer_type}=    Get Text    ${dps_txt_value_customer_type}
    ${actual_txt_value_pouch_number}=    Get Text    ${dps_txt_value_pouch_number}
    ${actual_txt_value_parcel_size}=    Get Text    ${dps_txt_value_parcel_size}
    ${actual_txt_value_check_in_date}=    Get Text    ${dps_txt_value_check_in_date}
    ${actual_txt_value_origin_store}=    Get Text    ${dps_txt_value_origin_store}
    ${actual_txt_value_origin_warehouse}=    Get Text    ${dps_txt_value_origin_warehouse}
    ${actual_txt_value_destination_store}=    Get Text    ${dps_txt_value_destination_store}
    ${actual_txt_value_crossdock_warehouse}=    Get Text    ${dps_txt_value_crossdock_warehouse}
    ${actual_txt_value_shipping_by}=    Get Text    ${dps_txt_value_shipping_by}
    ${actual_txt_value_destination_warehouse}=    Get Text    ${dps_txt_value_destination_warehouse}
    
    Should Be Equal    ${actual_txt_value_tracking_number}    ${tracking_number}
    Should Be Equal    ${actual_txt_value_parcel_status}    ${parcel_status}
    Should Be Equal    ${actual_txt_value_customer_type}    ${customer_type}
    Should Be Equal    ${actual_txt_value_pouch_number}    ${pouch_number}
    Should Be Equal    ${actual_txt_value_parcel_size}    ${parcel_size}
    Element Should Be Visible    ${dps_txt_value_route}
    ${actual_value_date}    Split String And Select  ${actual_txt_value_check_in_date}  ${SPACE}  0
    ${actual_value_time}    Split String And Select  ${actual_txt_value_check_in_date}  ${SPACE}  1
    Should Match Regexp    ${actual_value_time}    ^\\d{2}:\\d{2}$
    Should Be Equal    ${actual_value_date}    ${check_in_date}
    Element Should Be Visible    ${dps_txt_value_date_in_system}
    Element Should Be Visible    ${dps_txt_value_sla_date}
    Element Should Be Visible    ${dps_txt_value_sla_text}
    Should Be Equal    ${actual_txt_value_origin_store}    ${origin_store}
    Should Be Equal    ${actual_txt_value_origin_warehouse}    ${origin_warehouse}
    Should Be Equal    ${actual_txt_value_destination_store}    ${destination_store}
    Should Be Equal    ${actual_txt_value_crossdock_warehouse}    ${crossdock_warehouse}
    Should Be Equal    ${actual_txt_value_shipping_by}    ${shipping_by}
    Should Be Equal    ${actual_txt_value_destination_warehouse}    ${destination_warehouse}

Verify Title Sender In Warehouse Details
    [Arguments]    ${sender_name}    ${sender_adderss}
    ${dps_txt_title_sender_name}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${sender_name}
    ${dps_txt_title_sender_address}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${sender_adderss}
    ${actual_txt_title_sender_name}=    Get Text    ${dps_txt_title_sender_name}
    ${actual_txt_title_sender_address}=    Get Text    ${dps_txt_title_sender_address}
    Should Be Equal    ${actual_txt_title_sender_name}    ${sender_name}
    Should Be Equal    ${actual_txt_title_sender_address}    ${sender_adderss}

Verify Data Sender In Warehouse Details
    [Arguments]    ${sender_name}    ${sender_phone}    ${sender_adderss}
    ${dps_txt_value_sender_name}=    Replace String    ${dps_txt_value_sender_history_parcel_page}    {value}    ${sender_name}
    ${dps_txt_value_sender_phone}=    Replace String    ${dps_txt_value_sender_history_parcel_page}    {value}    ${sender_phone}
    ${dps_txt_value_sender_address}=    Replace String    ${dps_txt_value_sender_address_history_parcel_page}    {value}    ${sender_adderss}
    ${actual_txt_value_sender_name}=    Get Text    ${dps_txt_value_sender_name}
    ${actual_txt_value_sender_phone}=    Get Text    ${dps_txt_value_sender_phone}
    ${actual_txt_value_sender_address}=    Get Text    ${dps_txt_value_sender_address}
    Should Be Equal    ${actual_txt_value_sender_name}    ${sender_name}
    Should Be Equal    ${actual_txt_value_sender_phone}    ${sender_phone}
    Should Be Equal    ${actual_txt_value_sender_address}    ${sender_adderss}

Verify Title Receiver In Warehouse Details
    [Arguments]    ${receiver_name}    ${receiver_adderss}
    ${dps_txt_title_receiver_name}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${receiver_name}
    ${dps_txt_title_receiver_address}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${receiver_adderss}
    ${actual_txt_title_receiver_name}=    Get Text    ${dps_txt_title_receiver_name}
    ${actual_txt_title_receiver_address}=    Get Text    ${dps_txt_title_receiver_address}
    Should Be Equal    ${actual_txt_title_receiver_name}    ${receiver_name}
    Should Be Equal    ${actual_txt_title_receiver_address}    ${receiver_adderss}

Verify Data Receiver In Warehouse Details
    [Arguments]    ${receiver_name}    ${receiver_phone}    ${receiver_adderss}
    ${dps_txt_value_receiver_name}=    Replace String    ${dps_txt_value_receiver_history_parcel_page}    {value}    ${receiver_name}
    ${dps_txt_value_receiver_phone}=    Replace String    ${dps_txt_value_receiver_history_parcel_page}    {value}    ${receiver_phone}
    ${dps_txt_value_receiver_address}=    Replace String    ${dps_txt_value_receiver_address_history_parcel_page}    {value}    ${receiver_adderss}
    ${actual_txt_value_receiver_name}=    Get Text    ${dps_txt_value_receiver_name}
    ${actual_txt_value_receiver_phone}=    Get Text    ${dps_txt_value_receiver_phone}
    ${actual_txt_value_receiver_address}=    Get Text    ${dps_txt_value_receiver_address}
    Should Be Equal    ${actual_txt_value_receiver_name}    ${receiver_name}
    Should Be Equal    ${actual_txt_value_receiver_phone}    ${receiver_phone}
    Should Be Equal    ${actual_txt_value_receiver_address}    ${receiver_adderss}

Click Reprint Label Dropdown
    [Arguments]    ${title}
    ${dps_btn_reprint_label}=    Replace String    ${dps_btn_reprint_label_history_parcel_page}    {value}    ${title}
    FOR    ${i}    IN RANGE    0    5
        common.Click When Ready    ${dps_btn_reprint_label}
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_cbo_reprint_label_history_parcel_page}    timeout=10s
        Exit For Loop If    '${isvisible}' == 'True'
    END

Verify Reprint Label Dropdown
    [Arguments]    ${parcel_label}    ${parcel_sorting_sheet}    ${pouch_number}    ${pouch_label}
    ${dps_cbo_parcel_label}=    Replace String    ${dps_cbo_value_in_reprint_label_history_parcel_page}    {value}    ${parcel_label}
    ${dps_cbo_parcel_sorting_sheet}=    Replace String    ${dps_cbo_value_in_reprint_label_history_parcel_page}    {value}    ${parcel_sorting_sheet}
    ${dps_cbo_pouch_label}=    Replace String    ${dps_cbo_value_in_reprint_label_history_parcel_page}    {value}    ${pouch_label}
    ${actual_status_parcel_sorting_sheet}=    Get Element Attribute    ${dps_cbo_parcel_sorting_sheet}    aria-disabled
    ${actual_status_pouch_label}=    Get Element Attribute    ${dps_cbo_pouch_label}    aria-disabled
    Element Should Be Visible    ${dps_cbo_parcel_label}
    Should Be Equal    ${actual_status_parcel_sorting_sheet}    false
    Log    ${pouch_number}
    IF    '${pouch_number}' == '-'
        Should Be Equal    ${actual_status_pouch_label}    true
    ELSE
        Should Be Equal    ${actual_status_pouch_label}    false
    END

Select Reprint Label Type In Dropdown
    [Arguments]    ${label_type}
    ${dps_cbo_value_in_reprint_label}=    Replace String    ${dps_cbo_value_in_reprint_label_history_parcel_page}    {value}    ${label_type}
    common.Click When Ready    ${dps_cbo_value_in_reprint_label}

Verify Reprint Label Popup
    [Arguments]    ${label_type}
    ${dps_card_reprint_label}=    Replace String    ${dps_card_reprint_label_history_parcel_page}    {value}    ${label_type}
    ${dps_txt_title_reprint_label_in_card}=    Replace String    ${dps_txt_title_reprint_label_in_card_history_parcel_page}    {value}    ${label_type}
    Wait Until Element Is Visible    ${dps_card_reprint_label}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_reprint_label_in_card}=    Get Text    ${dps_txt_title_reprint_label_in_card}
    Should Be Equal    ${actual_txt_title_reprint_label_in_card}    ${label_type}

Click Cancel Reprint Label Button
    [Arguments]    ${label_type}
    ${dps_btn_cancel_reprint_label}=    Replace String    ${dps_btn_cancel_reprint_label_history_parcel_page}    {label_type}    ${label_type}
    ${dps_btn_cancel_reprint_label}=    Replace String    ${dps_btn_cancel_reprint_label}    {value}    ${dc_operation.card_reprint_label['button_cancel']}
    common.Click When Ready    ${dps_btn_cancel_reprint_label}

Verify Reprint Pouch Label Popup
    [Arguments]    ${label_type}    ${destination_warehouse}    ${route}    ${destination_warehouse_symbol}
    ${dps_card_reprint_label}=    Replace String    ${dps_card_reprint_label_history_parcel_page}    {value}    ${label_type}
    ${dps_txt_title_reprint_label_in_card}=    Replace String    ${dps_txt_title_reprint_label_in_card_history_parcel_page}    {value}    ${label_type}
    ${dps_txt_destination_warehouse_in_pouch_label}=    Replace String    ${dps_txt_destination_warehouse_in_pouch_label_history_parcel_page}    {label_type}    ${label_type}
    ${dps_txt_destination_warehouse_in_pouch_label}=    Replace String    ${dps_txt_destination_warehouse_in_pouch_label}    {destination_warehouse}    ${destination_warehouse}
    ${dps_txt_route_in_pouch_label}=    Replace String    ${dps_txt_route_in_pouch_label_history_parcel_page}    {label_type}    ${label_type}
    ${dps_txt_route_in_pouch_label}=    Replace String    ${dps_txt_route_in_pouch_label}    {route}    ${route}
    Wait Until Element Is Visible    ${dps_card_reprint_label}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_reprint_label_in_card}=    Get Text    ${dps_txt_title_reprint_label_in_card}
    ${actual_txt_destination_warehouse_in_pouch_label}=    Get Text    ${dps_txt_destination_warehouse_in_pouch_label}
    ${actual_txt_route_in_pouch_label}=    Get Text    ${dps_txt_route_in_pouch_label}
    Should Be Equal    ${actual_txt_title_reprint_label_in_card}    ${label_type}
    Should Be Equal    ${actual_txt_destination_warehouse_in_pouch_label}    ${destination_warehouse}
    Should Be Equal    ${actual_txt_route_in_pouch_label}    ${route}

    Run Keyword If    "$destination_warehouse_symbol" == 'รูปนาฬิกาทราย'    Run Keywords
    ...    ${dps_img_rdclp_warehouse_symbol_in_pouch_label}=    Replace String    ${dps_img_rdclp_warehouse_symbol_in_pouch_label_history_parcel_page}    {label_type}    ${label_type}
    ...    AND    Should Be Visible    ${dps_img_rdclp_warehouse_symbol_in_pouch_label}
