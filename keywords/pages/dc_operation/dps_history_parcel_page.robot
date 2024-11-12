*** Keywords ***
Verify History Parcel Page
    [Arguments]    ${title_history_parcel}
    ${dps_txt_title_history_parcel}=    Replace String    ${dps_txt_title_history_parcel_history_parcel_page}    {value}    ${title_history_parcel}
    Wait Until Element Is Visible    ${dps_txt_title_history_parcel}    timeout=${DEFAULT_TIMEOUT}
    ${actual_txt_title_history_parcel}=    Get Text    ${dps_txt_title_history_parcel}
    Should Be Equal    ${actual_txt_title_history_parcel}    ${title_history_parcel}
    Element Should Be Visible    ${dps_tbl_history_parcel_history_parcel_page}

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

Compare Time And Title In Timeline
    [Arguments]    ${step_title}    ${step_description}
    ${sequence}=    Convert To Integer    1
    FOR    ${i}    IN RANGE    1    10
        ${isvisible}=    Run Keyword And Return Status    Wait Until Element Is Visible    ${dps_txt_step_title_in_timeline_history_parcel_page}[${i}]    timeout=1s
        Run Keyword IF    '${isvisible}' == 'True'    Set Suite Variable    ${sequence}    ${i}
        ${actual_description}=    Get Text    (${dps_txt_step_description_in_timeline_history_parcel_page})[${sequence}]
        ${actual_title}=    Get Text    (${dps_txt_step_title_in_timeline_history_parcel_page})[${sequence}]
        Exit For Loop If    '${actual_title}' == '${step_title}'
        ${sequence}=    Set Variable    ${sequence + 1}
    END
    ${dps_card_timeline}=    Replace String    ${dps_card_timeline_history_parcel_page}    {value}    ${dc_operation.label_parcel_details_in_warehouse['timeline']}
    Wait Until Element Is VIsible    ${dps_card_timeline}
    ${actual_time}=    Get Text    (${dps_txt_time_in_timeline_history_parcel_page})[${sequence}]
    ${actual_time}=    Replace String    ${actual_time}    \n    ${SPACE}
    Check Date And Time Format In Timeline    ${actual_time}
    Should Be Equal    ${actual_title}    ${step_title}
    Should Be Equal    ${actual_description}    ${step_description}

Verify Timeline
    [Arguments]    ${title1}    ${description1}    ${title2}    ${description2}    ${title3}    ${description3}
    ...            ${title4}    ${description4}    ${title5}    ${description5}
    # Defect206
    # Compare Time And Title In Timeline    ${title1}    ${description1}
    Compare Time And Title In Timeline    ${title2}    ${description2}
    Compare Time And Title In Timeline    ${title3}    ${description3}
    Compare Time And Title In Timeline    ${title4}    ${description4}
    Compare Time And Title In Timeline    ${title5}    ${description5}

Filter Data By Parcel Number
    [Arguments]    ${parcel_number}
    Select Filter Button
    common.Input When Ready    ${dps_txtbox_fitler_parcel_number_history_parcel_page}    ${parcel_number}
    Click Search Button On Filter
    Select Filter Button

Select Filter Button
    ${dps_btn_filter}=    Replace String    ${dps_btn_filter_history_parcel_page}    {value}    ${dc_operation['button_filter']}
    common.Click When Ready    ${dps_btn_filter}

Click Search Button On Filter
    ${dps_btn_search_filter}=    Replace String    ${dps_btn_search_filter_history_parcel_page}    {value}    ${dc_operation['button_search']}
    common.Click When Ready    ${dps_btn_search_filter}

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
    ${dps_txt_title_date_in_system}=    Get Text    ${dps_txt_title_date_in_system}
    
    Should Be Equal    ${actual_txt_header_parcel_detail}    ${title_parcel_detail}
    Should Be Equal    ${actual_txt_title_tracking_number}    ${tracking_number}
    Should Be Equal    ${actual_txt_title_parcel_status}    ${parcel_status}
    Should Be Equal    ${actual_txt_title_customer_type}    ${customer_type}
    Should Be Equal    ${actual_txt_title_pouch_number}    ${pouch_number}
    Should Be Equal    ${actual_txt_title_parcel_size}    ${parcel_size}
    Should Be Equal    ${actual_txt_title_route}    ${route}
    Should Be Equal    ${actual_txt_title_check_in_date}    ${check_in_date}
    Should Be Equal    ${dps_txt_title_date_in_system}    ${date_in_system}


    Element Should Be Visible    ${dps_txt_title_tracking_number}
    Element Should Be Visible    ${dps_txt_title_parcel_status}
    Element Should Be Visible    ${dps_txt_title_customer_type}
    Element Should Be Visible    ${dps_txt_title_pouch_number}
    Element Should Be Visible    ${dps_txt_title_parcel_size}
    Element Should Be Visible    ${dps_txt_title_route}
    Element Should Be Visible    ${dps_txt_title_check_in_date}
    Element Should Be Visible    ${dps_txt_title_date_in_system}
    Element Should Be Visible    ${dps_txt_title_sla_date}
    Element Should Be Visible    ${dps_txt_title_sla_text}
    Element Should Be Visible    ${dps_txt_title_origin_store}
    Element Should Be Visible    ${dps_txt_title_origin_warehouse}
    Element Should Be Visible    ${dps_txt_title_destination_store}
    Element Should Be Visible    ${dps_txt_title_crossdock_warehouse}
    Element Should Be Visible    ${dps_txt_title_shipping_by}
    Element Should Be Visible    ${dps_txt_title_destination_warehouse}

Verify Title Sender In Warehouse Details
    [Arguments]    ${sender_name}    ${sender_adderss}
    ${dps_txt_title_sender_name}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${sender_name}
    ${dps_txt_title_sender_address}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${sender_adderss}
    Element Should Be Visible    ${dps_txt_title_sender_name}
    Element Should Be Visible    ${dps_txt_title_sender_address}

Verify Data Sender In Warehouse Details
    [Arguments]    ${sender_name}    ${sender_phone}    ${sender_adderss}
    ${dps_text_value_sender_name}=    Replace String    ${dps_txt_value_sender_history_parcel_page}    {value}    ${sender_name}
    ${dps_text_value_sender_phone}=    Replace String    ${dps_txt_value_sender_history_parcel_page}    {value}    ${sender_phone}
    ${dps_text_value_sender_address}=    Replace String    ${dps_txt_value_sender_address_history_parcel_page}    {value}    ${sender_adderss}
    ${actual_text_value_sender_name}=    Get Text    ${dps_text_value_sender_name}
    Should Be Equal    ${actual_text_value_sender_name}    ${sender_name}

Verify Title Receiver In Warehouse Details
    [Arguments]    ${receiver_name}    ${receiver_adderss}
    ${dps_txt_title_receiver_name}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${receiver_name}
    ${dps_txt_title_receiver_address}=    Replace String    ${dps_txt_title_parcel_detail_history_parcel_page}    {value}    ${receiver_adderss}
    Element Should Be Visible    ${dps_txt_title_receiver_name}
    Element Should Be Visible    ${dps_txt_title_receiver_address}
