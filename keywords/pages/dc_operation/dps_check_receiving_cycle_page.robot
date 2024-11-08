*** Keywords ***
Click Dropdown Select Warehouse List
    [Arguments]    ${selected_warehouse}
    ${name}=    Get Text    ${dps_txt_dropdown_warehouse_tab_home_page}
    ${button_selected_warehouse_list}=    Replace String    ${dps_btn_selected_warehouse_list_home_page}    {value}    ${name}
    common.Click When Ready    ${button_selected_warehouse_list}
    ${selected_warehouse_list}=    Replace String    ${dps_cbo_warehouse_parcel_pickup}    {value}    ${selected_warehouse}
    common.Click When Ready    ${selected_warehouse_list}

Verify Pickup Schedule Of DC MC Warehouse
    [Arguments]    ${company_name}    ${branch}
    ${text_company_name}=    Replace String    ${dps_txt_company_name_parcel_pickup_detail}    {company}    ${company_name}
    ${text_company_branch}=    Replace String    ${text_company_name}    {branch}    ${branch}
    Wait Until Element Is Not Visible    ${text_company_branch}    timeout=${DEFAULT_TIMEOUT}

Verify Check Parcel Pickup Schedule
    Wait Until Element Is Not Visible    ${dps_img_loading}    timeout=${DEFAULT_TIMEOUT}
    dps_home_page.Verify Page Title    ${dc_operation.title['check_receiving_cycle']}
    dps_home_page.Verify Tab Selected    ${dc_operation.Check_Receiving_Cycle_Tab['all_parcels_received']}

Verify Check Receiving Cycle Page
    [Arguments]    ${title}    ${tab}    ${company_name}    ${branch}    ${address}    ${sub_district}    ${district}    ${province}
    ...    ${postcode}    ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${today}    ${status}
    Wait Until Element Is Not Visible    ${dps_img_loading}    timeout=${DEFAULT_TIMEOUT}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}

    ${tomorrow}    dps_home_page.Set Tomorrow Date
    ${row_receiving_cycle}=    Replace String    ${dps_txt_list_receiving_cycle}    {company_name}    ${company_name}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {branch}    ${branch}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {address}    ${address}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {sub_district}    ${sub_district}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {district}    ${district}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {province}    ${province}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {postcode}    ${postcode}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {tomorrow}    ${tomorrow}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {receiving_time}    ${receiving_time}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {receiving_type}    ${receiving_type}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {courier}    ${courier}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {number_of_parcel}    ${number_of_parcel}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {cutoff}    ${today}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {status}    ${status}

    Page Should Contain Element    ${row_receiving_cycle}
    Wait Until Element Is Visible    ${row_receiving_cycle}   
    Scroll Element Into View    ${row_receiving_cycle}
    # Set Suite Variable    ${card_inventory}    ${row_receiving_cycle}

Select All Parcels Received List Tab
    common.Scroll Window To Vertical    0
    ${dps_tab_name}=  Replace String   ${dps_tab_name}   {value}   ${dc_operation.Check_Receiving_Cycle_Tab['all_parcels_received']}
    Click When Ready    ${dps_tab_name}
    
Select Waiting Inventory Confirm List Tab
    common.Scroll Window To Vertical    0
    ${dps_tab_name}=  Replace String   ${dps_tab_name}   {value}   ${dc_operation.Check_Receiving_Cycle_Tab['waiting_inventory_confirm_list']}
    Click When Ready    ${dps_tab_name}

Verify Inventory Confirm List Tab
    [Arguments]    ${title}    ${tab}    ${company_name}    ${address}    ${sub_district}    ${district}    ${province}    ${postcode}
    ...        ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${today}    ${status}
    Wait Until Element Is Not Visible    ${dps_img_loading}    timeout=${DEFAULT_TIMEOUT}
    dps_home_page.Verify Page Title    ${title}
    dps_home_page.Verify Tab Selected    ${tab}

    ${tomorrow}    dps_home_page.Set Tomorrow Date
    ${row_receiving_cycle}=    Replace String    ${dps_txt_list_receiving_cycle_waiting}    {company_name}    ${company_name}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {address}    ${address}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {sub_district}    ${sub_district}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {district}    ${district}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {province}    ${province}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {postcode}    ${postcode}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {tomorrow}    ${tomorrow}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {receiving_time}    ${receiving_time}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {receiving_type}    ${receiving_type}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {courier}    ${courier}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {number_of_parcel}    ${number_of_parcel}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {cutoff}    ${today}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {status}    ${status}

    Scroll Element Into View    ${row_receiving_cycle}
    Page Should Contain Element    ${row_receiving_cycle}
    Wait Until Element Is Visible    ${row_receiving_cycle}   
    Set Suite Variable    ${card_inventory}    ${row_receiving_cycle}
 
Click Pencil Icon
    [Arguments]    ${bookig_id}
    ${button_filter}=    Replace String    ${dps_btn_filter_parcel_pickup_details}    {value}    ${dc_operation['button_filter']}
    ${button_search}=    Replace String    ${dps_btn_search_parcel_pickup}    {value}    ${dc_operation['button_search']}
    ${booking_ID}=    Replace String    ${dps_txt_booking_id_parcel_pickup_detail}    {value}    ${bookig_id}
    common.Click When Ready    ${button_filter}
    common.Click When Ready    ${dps_update_date_parcel_pickup}
    common.Click When Ready    ${dps_btn_today_parcel_pickup}
    common.Click When Ready    ${button_search}
    common.Click When Ready    ${button_filter}
    ${card_count}=    Get Element Count    ${card_inventory}
    Log To Console    ${card_count}
    FOR    ${index}    IN RANGE    1    ${card_count}+1
        Scroll Element Into View    (${card_inventory})[${index}]
        common.Click When Ready    (${card_inventory})[${index}]
        ${element}    Run Keyword And Return Status    Wait Until Element Is Visible    ${booking_ID}
        Exit For Loop If    '${element}' == 'True'
        common.Click When Ready    ${dps_btn_close_parcel_pickup_details}
    END

Verify Parcel Pickup Details Popup
    [Arguments]    ${company_name}    ${company_address}    ${sub_district}    ${district}    ${province}    ${postcode}
    ...    ${tomorrow}    ${receiving_time}    ${receiving_type}    ${courier}    ${parcel_num}    ${status}
    ###################
    ${today}=    Get Current Date    result_format=%Y-%m-%d
    ${tomorrow_day}=    Add Time To Date    ${today}    1 days    result_format=%d-%m-%Y
    ###################
    ${label_parcel_pickup_detail}=  Replace String   ${dps_txt_parcel_pickup_detail}   {value}   ${dc_operation['parcel_pickup_details']}
    ${label_comapny}=  Replace String   ${dps_txt_company_parcel_pickup_detail}   {text_company}    ${dc_operation['text_company']}
    ${actual_comapny}=  Replace String   ${label_comapny}   {company_name}    ${company_name}
    ${label_address}=  Replace String   ${dps_txt_company_address_parcel_pickup_detail}   {text_address}    ${dc_operation['text_company_address']}
    ${actual_address}=  Replace String   ${label_address}   {company_address}    ${company_address}
    ${label_sub_district}=  Replace String   ${dps_txt_sub_district_parcel_pickup_detail}   {text_sub_district}    ${dc_operation['text_sub_district']}
    ${actual_sub_district}=  Replace String   ${label_sub_district}   {sub_district}    ${district}
    ${label_district}=  Replace String   ${dps_txt_district_parcel_pickup_detail}   {text_district}    ${dc_operation['text_district']}
    ${actual_district}=  Replace String   ${label_district}   {district}    ${district}
    ${label_province}=  Replace String   ${dps_txt_province_parcel_pickup_detail}   {text_province}    ${dc_operation['text_province']}
    ${actual_province}=  Replace String   ${label_province}   {province}    ${province}
    ${label_postcode}=  Replace String   ${dps_txt_postcode_parcel_pickup_detail}   {text_postcode}    ${dc_operation['text_postcode']}
    ${actual_postcode}=  Replace String   ${label_postcode}   {postcode}    ${postcode}
    ${label_pickup_date}=  Replace String   ${dps_txt_pickup_date_parcel_pickup_detail}   {text_pickup}    ${dc_operation['pickup_date']}
    ${actual_pickup_date}=  Replace String   ${label_pickup_date}   {pickup_date}   ${tomorrow_day} ${receiving_time}   ##${tomorrow} ${receiving_time}
    ${label_receiving_type}=  Replace String   ${dps_txt_receiving_type_parcel_pickup_detail}   {text_receiving_type}    ${dc_operation['text_receiving_type']}
    ${actual_receiving_type}=  Replace String   ${label_receiving_type}   {receiving_type}    ${receiving_type}
    ${label_courier}=  Replace String   ${dps_txt_courier_parcel_pickup_detail}   {text_courier}    ${dc_operation['text_courier']}
    ${actual_courier}=  Replace String   ${label_courier}   {courier}    ${courier}
    ${label_parcel_num}=  Replace String   ${dps_txt_parcel_num_parcel_pickup_detail}   {text_parcel_num}    ${dc_operation['text_number_of_parcel']}
    ${actual_parcel_num}=  Replace String   ${label_parcel_num}   {parcel_num}    ${parcel_num}
    ${label_status}=  Replace String   ${dps_txt_status_parcel_pickup_detail}   {text_status}    ${dc_operation['text_status']}
    ${actual_status}=  Replace String   ${label_status}   {status}    ${status}
    ${cbo_vehicle_type}=  Replace String   ${dps_cbo_vehicle_type}   {value}   ${dc_operation['vehicle_type']}
    ${button_export}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${dc_operation['button_export']}

    Wait Until Element Is Visible    ${label_parcel_pickup_detail}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_comapny}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_address}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_sub_district}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_district}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_province}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_postcode}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_pickup_date}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_receiving_type}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_courier}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_parcel_num}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${actual_status}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${cbo_vehicle_type}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${button_export}    timeout=${DEFAULT_TIMEOUT}
    
Click Export Button On Parcel Pickup Details Popup
    ${btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${dc_operation['button_export']}
    Scroll Element Into View    ${btn_parcel_pickup_details}
    Click When Ready    ${btn_parcel_pickup_details}

Click Approve Button On Parcel Pickup Details Popup
    ${btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${dc_operation['button_approve']}
    Scroll Element Into View    ${btn_parcel_pickup_details}
    Click When Ready    ${btn_parcel_pickup_details}

Click Unapproved Button On Parcel Pickup Details Popup
    ${btn_parcel_pickup_details}=  Replace String   ${dps_btn_parcel_pickup_details}   {value}   ${dc_operation['button_unapproved']}
    Scroll Element Into View    ${btn_parcel_pickup_details}
    Click When Ready    ${btn_parcel_pickup_details}

Verify Data Saved Success Popup
    ${text_save_success}=  Replace String   ${dps_txt_save_success_parcel_pickup_detail}   {value}   ${dc_operation['text_save_success']}
    Wait Until Element Is Visible    ${text_save_success}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Not Visible    ${text_save_success}    timeout=${DEFAULT_TIMEOUT}

Verify Pickup Schedule Change Status
    [Arguments]    ${company_name}    ${branch}    ${address}    ${sub_district}    ${district}    ${province}
    ...    ${postcode}    ${receiving_time}    ${receiving_type}    ${courier}    ${number_of_parcel}    ${today}    ${status}
    ${tomorrow}    dps_home_page.Set Tomorrow Date
    ${row_receiving_cycle}=    Replace String    ${dps_txt_list_receiving_cycle}    {company_name}    ${company_name}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {branch}    ${branch}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {address}    ${address}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {sub_district}    ${sub_district}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {district}    ${district}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {province}    ${province}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {postcode}    ${postcode}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {tomorrow}    ${tomorrow}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {receiving_time}    ${receiving_time}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {receiving_type}    ${receiving_type}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {courier}    ${courier}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {number_of_parcel}    ${number_of_parcel}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {cuttoff}    ${today}
    ${row_receiving_cycle}=    Replace String    ${row_receiving_cycle}    {status}    ${status}

    Log To Console    ${row_receiving_cycle}
    Log    ${row_receiving_cycle}
    # Page Should Contain Element    ${row_receiving_cycle}
    # Wait Until Element Is Visible    ${row_receiving_cycle}    timeout=${DEFAULT_TIMEOUT}
    # Scroll Element Into View    ${row_receiving_cycle}

