*** Keywords ***
Click Next Page Button
    ${btn_next_page}=    Replace String    ${pms_btn_full_regis}    {value}    ${rm['text_next_page']}
    Scroll Element Into View    ${btn_next_page}
    common.Click When Ready    ${btn_next_page}
    
Click Dry Parcel Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_dry_parcel}

Verify Dry Parcel Tab Full Register Detail Page
    [Arguments]    ${cod}    ${insure}    ${product_category}    ${pieces_amount}    ${sale_channel}    ${vat}    ${remark}
    ...    ${branch}    ${address}    ${address_full}    ${latitude_longitude}    ${determined}

    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_service_info']}
    ${service_info}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_service_info']}
    ${price_scheme}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_price_scheme']}
    ${title_cod}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_cod']}
    ${title_insure}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_insure']}
    ${title_condition}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_condition']}
    ${label_one_mile}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_one_mile']}
    ${label_cancel_return_fee}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_cancel_return_fee']}
    ${label_rebate}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${title_parcel_pickup}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}
    Page Should Contain Element    ${label_step}

    #### part 1 ####
    ${selected_dry_parcel}=    Get Value    ${pms_btn_select_dry_parcel}
    ${selected_cod}=    Get Value    ${pms_checkbox_dry_cod}
    ${selected_insure}=    Get Value    ${pms_checkbox_dry_insure}

    Should Be Equal As Strings    ${selected_dry_parcel}    true
    Should Be Equal As Strings    ${selected_cod}    ${cod}
    Should Be Equal As Strings    ${selected_insure}    ${insure}

    #### part 2 ####
    Page Should Contain Element    ${service_info}    

    ${label_product_category}=    Get Text    ${pms_txt_dry_product_category_full_regis}
    ${input_product_category}=    Get Text    ${pms_txtbox_dry_product_category_full_regis}
    ${label_pieces_amount}=    Get Text    ${pms_txt_dry_pieces_amount_full_regis}
    ${input_pieces_amount}=    Get Text    ${pms_txtbox_dry_pieces_amount_full_regis}
    ${label_sale_channel}=    Get Text    ${pms_txt_dry_sale_channel_full_regis}
    ${input_sale_channel}=    Get Text    ${pms_txtbox_dry_sale_channel_full_regis}
    ${label_vat}=    Get Text    ${pms_txt_dry_vat_full_regis}
    ${input_vat}=    Get Text    ${pms_txtbox_dry_vat_full_regis}
    ${label_remark}=    Get Text    ${pms_txt_dry_remark_full_regis}
    ${input_remark}=    Get Text    ${pms_txtbox_dry_remark_full_regis}
    ${title_remark}=    Get Text    ${pms_txt_remark2_full_regis}

    Should Be Equal As Strings    ${label_product_category} ${input_product_category}   ${rm.full_regis.dry_parcel['text_product_category']} ${product_category}
    Should Be Equal As Strings    ${label_pieces_amount} ${input_pieces_amount}   ${rm.full_regis.dry_parcel['text_pieces_amount']} ${pieces_amount}
    Should Be Equal As Strings    ${label_sale_channel} ${input_sale_channel}   ${rm.full_regis.dry_parcel['text_sale_channel']} ${sale_channel}
    Should Be Equal As Strings    ${label_vat} ${input_vat}   ${rm.full_regis.dry_parcel['text_vat']} ${vat}
    Should Be Equal As Strings    ${label_remark} ${input_remark}   ${rm.full_regis.dry_parcel['text_dry_remark']} ${remark}
    Should Be Equal As Strings    ${title_remark}   ${rm.full_regis['text_remark_2']}

    Page Should Contain Element    ${price_scheme}
    Page Should Contain Element    ${title_cod}
    Page Should Contain Element    ${title_insure}
    Page Should Contain Element    ${title_condition}
    Page Should Contain Element    ${label_one_mile}
    Page Should Contain Element    ${label_cancel_return_fee}
    Page Should Contain Element    ${label_rebate}

    #### parcel pickup ####
    Page Should Contain Element    ${title_parcel_pickup}

    ${text_branch}=    Replace String    ${pms_txt_parcel_pickup_table_full_regis}    {value}    ${branch}
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address} ${address_full}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${determined}

    Wait Until Element Is Visible    ${text_pickup_schedule}

Format Input Date
    [Arguments]    ${date}
    ${day}    common.Split String And Select    ${date}    /    0
    ${month}    common.Split String And Select    ${date}    /    1
    ${year}    common.Split String And Select    ${date}    /    2
    ${d}    Set Variable    ${year}-${month}-${day}
    RETURN    ${d}

Input Information In The Dry Parcel Tab
    [Arguments]    ${price_scheme}    ${price_scheme_date}    ${cod_scheme}    ${cod_scheme_date}    ${insure_scheme}    ${insure_scheme_date}
    ...    ${first_mile_start_date}    ${first_mile_end_date}    ${bounce_fee_start_date}    ${bounce_fee_end_date}
    ...    ${rebate_item}    ${rebate_percen}    ${rebate_item_2}    ${rebate_percen_2}
    ${price_scheme_day}    Format Input Date    ${price_scheme_date}
    ${cod_scheme_day}    Format Input Date    ${cod_scheme_date}
    ${insure_scheme_day}    Format Input Date    ${insure_scheme_date}
    ${first_mile_start_day}    Format Input Date    ${first_mile_start_date}
    ${first_mile_end_day}    Format Input Date    ${first_mile_end_date}
    ${bounce_fee_start_day}    Format Input Date    ${bounce_fee_start_date}
    ${bounce_fee_end_day}    Format Input Date    ${bounce_fee_end_date}

    ${select_price_scheme}=    Replace String    ${pms_cbo_price_scheme_full_regis}    {value}    ${price_scheme}
    ${select_price_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${price_scheme_day}
    ${select_cod_scheme}=    Replace String    ${pms_cbo_cod_scheme_full_regis}    {value}    ${cod_scheme}
    ${select_cod_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${cod_scheme_day}
    ${select_insure_scheme}=    Replace String    ${pms_cbo_insure_scheme_full_regis}    {value}    ${insure_scheme}
    ${select_insure_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${insure_scheme_day}
    ${select_first_mile_start_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${first_mile_start_day}
    ${select_first_mile_end_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${first_mile_end_day}
    ${select_bounce_fee_start_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${bounce_fee_start_day}
    ${select_bounce_fee_end_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${bounce_fee_end_day}
    ${btn_rebate}=    Replace String    ${pms_btn_rebate_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${btn_add_parcel_pickup}=    Replace String    ${pms_btn_add_parcel_pickup_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}

    Wait Until Element Is Visible    ${pms_txtbox_price_scheme_full_regis}
    Scroll Element Into View    ${pms_txtbox_price_scheme_full_regis}

    ### price scheme ###
    common.Click When Ready    ${pms_txtbox_price_scheme_full_regis}
    common.Click When Ready    ${select_price_scheme}
    common.Click When Ready    ${pms_txtbox_price_scheme_date_full_regis}
    common.Click When Ready    ${select_price_scheme_date}

    common.Click When Ready    ${pms_txtbox_cod_scheme_full_regis}
    common.Click When Ready    ${select_cod_scheme}
    common.Click When Ready    ${pms_txtbox_cod_scheme_date_full_regis}
    common.Click When Ready    ${select_cod_scheme_date}

    common.Click When Ready    ${pms_txtbox_insure_scheme_full_regis}
    common.Click When Ready    ${select_insure_scheme}
    common.Click When Ready    ${pms_txtbox_insure_scheme_date_full_regis}
    common.Click When Ready    ${select_insure_scheme_date}

    common.Click When Ready    ${pms_btn_first_mile_full_regis}
    common.Click When Ready    ${pms_txtbox_first_mile_start_date_full_regis}
    common.Click When Ready    ${select_first_mile_start_day}
    common.Click When Ready    ${pms_txtbox_first_mile_end_date_full_regis}
    common.Click When Ready    ${select_first_mile_end_day}

    common.Click When Ready    ${pms_btn_bounce_fee_full_regis}
    common.Click When Ready    ${pms_txtbox_bounce_fee_start_date_full_regis}
    common.Click When Ready    ${select_bounce_fee_start_day}
    common.Click When Ready    ${pms_txtbox_bounce_fee_end_date_full_regis}
    common.Click When Ready    ${select_bounce_fee_end_day}

    common.Click When Ready    ${btn_rebate}
    common.Click When Ready    ${pms_btn_plus_rebate_full_regis}
    common.Input When Ready    ${pms_txtbox_rebate_item_full_regis}    ${rebate_item}
    common.Input When Ready    ${pms_txtbox_rebate_percen_full_regis}    ${rebate_percen}
    common.Click When Ready    ${pms_btn_plus_rebate_full_regis}
    common.Input When Ready    ${pms_txtbox_rebate_item_2_full_regis}    ${rebate_item_2}
    common.Input When Ready    ${pms_txtbox_rebate_percen_2_full_regis}    ${rebate_percen_2}
    Scroll Element Into View    ${btn_add_parcel_pickup}
    common.Click When Ready    ${btn_add_parcel_pickup}

Verify Set Pickup Point Popup
    [Arguments]    ${branch}    ${branch_id}    ${address}    ${address_full}
    ${header}=    Replace String    ${pms_txt_title_set_pickup_popup}    {value}    ${rm.full_regis['text_title_pickup_point']}
    ${title_parcel_type}=    Replace String    ${pms_txt_table_list_set_pickup_popup}    {value}    ${rm.full_regis['text_parcel_type']}
    ${title_pickup_date}=    Replace String    ${pms_txt_table_list_set_pickup_popup}    {value}    ${rm.full_regis['text_pickup_date']}
    ${title_time}=    Replace String    ${pms_txt_table_list_set_pickup_popup}    {value}    ${rm.full_regis['text_time']}
    Wait Until Element Is Visible    ${header}    timeout=${DEFAULT_TIMEOUT}

    ${label_branch}=    Get Text    ${pms_txt_branch_set_pickup_popup}
    ${input_branch}=    Get Value    ${pms_txtbox_branch_set_pickup_popup}
    ${label_branch_id}=    Get Text    ${pms_txt_branch_id_set_pickup_popup}
    ${input_branch_id}=    Get Value    ${pms_txtbox_branch_id_set_pickup_popup}
    ${label_ul_code}=    Get Text    ${pms_txt_ul_code_set_pickup_popup}
    ${label_address}=    Get Text    ${pms_txt_address_set_pickup_popup}
    ${input_address}=    Get Value    ${pms_txtbox_address_set_pickup_popup}
    ${label_address_full}=    Get Text    ${pms_txt_address_full_set_pickup_popup}
    ${input_address_full}=    Get Value    ${pms_txtbox_address_full_set_pickup_popup}
    ${label_latitude}=    Get Text    ${pms_txt_latitude_set_pickup_popup}
    ${label_longitude}=    Get Text    ${pms_txt_longitude_set_pickup_popup}

    Should Be Equal As Strings    ${label_branch} ${input_branch}    ${rm.full_regis['text_branch']} ${branch}
    Should Be Equal As Strings    ${label_branch_id} ${input_branch_id}    ${rm.full_regis['text_branch_id']} ${branch_id}
    Should Be Equal As Strings    ${label_ul_code}    ${rm.full_regis['text_ul_code']}
    Should Be Equal As Strings    ${label_address} ${input_address}    ${rm.full_regis['text_address']} ${address}
    Should Be Equal As Strings    ${label_address_full} ${input_address_full}    ${rm.full_regis['text_address_full']} ${address_full}
    Should Be Equal As Strings    ${label_latitude}    ${rm.full_regis['text_latitude']}
    Should Be Equal As Strings    ${label_longitude}    ${rm.full_regis['text_longitude']}

    Wait Until Element Is Visible    ${title_parcel_type}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${title_pickup_date}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${title_time}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${pms_btn_add_pick_up_set_pickup_popup}    timeout=${DEFAULT_TIMEOUT}

Input Set Pickup Point Popup
    [Arguments]    ${parcel_type}    ${pickup_day}    ${pickup_time}
    ${txtbox_parcel_type}=    Replace String    ${pms_txtbox_search_set_pickup_popup}    {value}    ${rm.full_regis['text_parcel_type']}
    ${selected_parcel_type}=    Replace String    ${pms_cbo_parcel_type_set_pickup_popup}    {value}    ${parcel_type}
    ${txtbox_pickup_day}=    Replace String    ${pms_txtbox_search_set_pickup_popup}    {value}    ${rm.full_regis['text_pickup_date']}
    ${selected_pickup_day}=    Replace String    ${pms_cbo_pickup_date_set_pickup_popup}    {value}    ${pickup_day}
    ${txtbox_pickup_time}=    Replace String    ${pms_txtbox_search_set_pickup_popup}    {value}    ${rm.full_regis['text_time']}
    ${selected_pickup_time}=    Replace String    ${pms_cbo_pickup_time_set_pickup_popup}    {value}    ${pickup_time}
    # ${button_save}=    Replace String    ${pms_btn_save_set_pickup_popup}    {value}    ${rm['text_save']}
    ${button_save}=    Replace String    ${pms_btn_cancel_set_pickup_popup}    {value}    ยกเลิก

    common.Click When Ready    ${pms_btn_add_pick_up_set_pickup_popup}
    common.Click When Ready    ${txtbox_parcel_type}
    common.Click When Ready    ${selected_parcel_type}
    common.Click When Ready    ${txtbox_pickup_day}
    common.Click When Ready    ${selected_pickup_day}
    common.Click When Ready    ${txtbox_pickup_time}
    common.Click When Ready    ${selected_pickup_time}
    common.Click When Ready    ${button_save}

Verify Input Set Pickup Point
    [Arguments]    ${branch}    ${address}    ${address_full}    ${latitude_longitude}    ${determined}
    ${text_parcel_pickup}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}
    Scroll Element Into View    ${text_parcel_pickup}

    ${text_branch}=    Replace String    ${pms_txt_parcel_pickup_table_full_regis}    {value}    ${branch}
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address} ${address_full}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${determined}

    Wait Until Element Is Visible    ${text_pickup_schedule}

Click Chill Parcel Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_chill_parcel}

Verify Chill Parcel Tab Full Register Detail Page
    [Arguments]    ${cod}    ${product_category}    ${pieces_amount}    ${sale_channel}    ${vat}    ${remark}
    ...    ${branch}    ${address}    ${address_full}    ${latitude_longitude}    ${determined}  

    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_service_info']}
    ${service_info}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_service_info']}
    ${price_scheme}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_price_scheme']}
    ${title_cod}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_cod']}
    ${title_condition}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_condition']}
    ${label_one_mile}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_one_mile']}
    ${label_cancel_return_fee}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_cancel_return_fee']}
    ${label_rebate}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${title_parcel_pickup}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}
    Page Should Contain Element    ${label_step}

    #### part 1 ####
    ${selected_chill_parcel}=    Get Value    ${pms_btn_select_chill_parcel}
    ${selected_cod}=    Get Value    ${pms_checkbox_chill_cod}

    Should Be Equal As Strings    ${selected_chill_parcel}    true
    Should Be Equal As Strings    ${selected_cod}    ${cod}

    #### part 2 ####
    Page Should Contain Element    ${service_info}  

    ${label_product_category}=    Get Text    ${pms_txt_chill_product_category_full_regis}
    ${input_product_category}=    Get Text    ${pms_txtbox_chill_product_category_full_regis}
    ${label_pieces_amount}=    Get Text    ${pms_txt_chill_pieces_amount_full_regis}
    ${input_pieces_amount}=    Get Text    ${pms_txtbox_chill_pieces_amount_full_regis}
    ${label_sale_channel}=    Get Text    ${pms_txt_chill_sale_channel_full_regis}
    ${input_sale_channel}=    Get Text    ${pms_txtbox_chill_sale_channel_full_regis}
    ${label_vat}=    Get Text    ${pms_txt_chill_vat_full_regis}
    ${input_vat}=    Get Text    ${pms_txtbox_chill_vat_full_regis}
    ${label_remark}=    Get Text    ${pms_txt_chill_remark_full_regis}
    ${input_remark}=    Get Text    ${pms_txtbox_chill_remark_full_regis}
    ${title_remark}=    Get Text    ${pms_txt_remark2_full_regis}

    Should Be Equal As Strings    ${label_product_category} ${input_product_category}   ${rm.full_regis.chill_parcel['text_product_category']} ${product_category}
    Should Be Equal As Strings    ${label_pieces_amount} ${input_pieces_amount}   ${rm.full_regis.chill_parcel['text_pieces_amount']} ${pieces_amount}
    Should Be Equal As Strings    ${label_sale_channel} ${input_sale_channel}   ${rm.full_regis.chill_parcel['text_sale_channel']} ${sale_channel}
    Should Be Equal As Strings    ${label_vat} ${input_vat}   ${rm.full_regis.chill_parcel['text_vat']} ${vat}
    Should Be Equal As Strings    ${label_remark} ${input_remark}   ${rm.full_regis.chill_parcel['text_chill_remark']} ${remark}
    Should Be Equal As Strings    ${title_remark}   ${rm.full_regis['text_remark_2']}

    Page Should Contain Element    ${price_scheme}
    Page Should Contain Element    ${title_cod}
    Page Should Contain Element    ${title_condition}
    Page Should Contain Element    ${label_one_mile}
    Page Should Contain Element    ${label_cancel_return_fee}
    Page Should Contain Element    ${label_rebate}

    #### parcel pickup ####
    Page Should Contain Element    ${title_parcel_pickup}

    ${text_branch}=    Replace String    ${pms_txt_parcel_pickup_table_full_regis}    {value}    ${branch}
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address} ${address_full}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${determined}

    Wait Until Element Is Visible    ${text_pickup_schedule}

Input Information In The Chill Parcel Tab
    [Arguments]    ${price_scheme}    ${price_scheme_date}    ${cod_scheme}    ${cod_scheme_date}    ${first_mile_start_date}   
    ...    ${first_mile_end_date}    ${bounce_fee_start_date}    ${bounce_fee_end_date}    ${rebate_item}
    ...    ${rebate_percen}    ${rebate_item_2}    ${rebate_percen_2}
    #### ใช้งานชั่วคราว ####
    common.Click When Ready    ${pms_btn_select_chill_parcel}
    register_business_full_register.Select Add Service Cod Chill Parcel

    ${price_scheme_day}    Format Input Date    ${price_scheme_date}
    ${cod_scheme_day}    Format Input Date    ${cod_scheme_date}
    ${first_mile_start_day}    Format Input Date    ${first_mile_start_date}
    ${first_mile_end_day}    Format Input Date    ${first_mile_end_date}
    ${bounce_fee_start_day}    Format Input Date    ${bounce_fee_start_date}
    ${bounce_fee_end_day}    Format Input Date    ${bounce_fee_end_date}

    ${select_price_scheme}=    Replace String    ${pms_cbo_price_scheme_chill_full_regis}    {value}    ${price_scheme}
    ${select_price_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${price_scheme_day}
    ${select_cod_scheme}=    Replace String    ${pms_cbo_cod_scheme_chill_full_regis}    {value}    ${cod_scheme}
    ${select_cod_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${cod_scheme_day}
    ${select_first_mile_start_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${first_mile_start_day}
    ${select_first_mile_end_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${first_mile_end_day}
    ${select_bounce_fee_start_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${bounce_fee_start_day}
    ${select_bounce_fee_end_day}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${bounce_fee_end_day}
    ${btn_rebate}=    Replace String    ${pms_btn_rebate_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${btn_add_parcel_pickup}=    Replace String    ${pms_btn_add_parcel_pickup_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}

    Wait Until Element Is Visible    ${pms_txtbox_price_scheme_chill_full_regis}
    Scroll Element Into View    ${pms_txtbox_price_scheme_chill_full_regis}

    ### price scheme ###
    common.Click When Ready    ${pms_txtbox_price_scheme_chill_full_regis}
    common.Click When Ready    ${select_price_scheme}
    common.Click When Ready    ${pms_txtbox_price_scheme_date_chill_full_regis}
    common.Click When Ready    ${select_price_scheme_date}

    common.Click When Ready    ${pms_txtbox_cod_scheme_chill_full_regis}
    common.Click When Ready    ${select_cod_scheme}
    common.Click When Ready    ${pms_txtbox_cod_scheme_date_chill_full_regis}
    common.Click When Ready    ${select_cod_scheme_date}

    common.Click When Ready    ${pms_btn_first_mile_chill_full_regis}
    common.Click When Ready    ${pms_txtbox_first_mile_start_date_chill_full_regis}
    common.Click When Ready    ${select_first_mile_start_day}
    common.Click When Ready    ${pms_txtbox_first_mile_end_date_chill_full_regis}
    common.Click When Ready    ${select_first_mile_end_day}

    common.Click When Ready    ${pms_btn_bounce_fee_chill_full_regis}
    common.Click When Ready    ${pms_txtbox_bounce_fee_start_date_chill_full_regis}
    common.Click When Ready    ${select_bounce_fee_start_day}
    common.Click When Ready    ${pms_txtbox_bounce_fee_end_date_chill_full_regis}
    common.Click When Ready    ${select_bounce_fee_end_day}

    common.Click When Ready    ${btn_rebate}
    common.Click When Ready    ${pms_btn_plus_rebate_chill_full_regis}
    common.Input When Ready    ${pms_txtbox_rebate_item_chill_full_regis}    ${rebate_item}
    common.Input When Ready    ${pms_txtbox_rebate_percen_chill_full_regis}    ${rebate_percen}
    common.Click When Ready    ${pms_btn_plus_rebate_chill_full_regis}
    common.Input When Ready    ${pms_txtbox_rebate_item_2_chill_full_regis}    ${rebate_item_2}
    common.Input When Ready    ${pms_txtbox_rebate_percen_2_chill_full_regis}    ${rebate_percen_2}
    Scroll Element Into View    ${btn_add_parcel_pickup}
    common.Click When Ready    ${btn_add_parcel_pickup}

Click Return Business Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_return_business}

Verify Return Business Tab Full Register Detail Page
    [Arguments]    ${express}    ${insure}    ${product_category}    ${pieces_amount}    ${sale_channel}    ${vat}    ${remark}
    ...    ${branch}    ${address}    ${address_full}    ${address_full}    ${latitude_longitude}    ${determined}

    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_service_info']}
    ${service_info}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_service_info']}
    ${price_scheme}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_price_scheme']}
    ${title_insure}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_insure']}
    ${title_condition}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_condition']}
    ${label_one_mile}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_one_mile']}
    ${label_cancel_return_fee}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_cancel_return_fee']}
    ${label_rebate}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${title_parcel_pickup}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}
    Page Should Contain Element    ${label_step}

    #### part 1 ####
    ${selected_return_business}=    Get Value    ${pms_btn_select_return_business}
    ${selected_express}=    Get Value    ${pms_checkbox_return_business_express}
    ${selected_insure}=    Get Value    ${pms_checkbox_return_business_insure}

    Should Be Equal As Strings    ${selected_return_business}    true
    Should Be Equal As Strings    ${selected_express}    ${express}
    Should Be Equal As Strings    ${selected_insure}    ${insure}

    #### part 2 ####
    Page Should Contain Element    ${service_info} 

    ${label_product_category}=    Get Text    ${pms_txt_return_product_category_full_regis}
    ${input_product_category}=    Get Text    ${pms_txtbox_return_product_category_full_regis}
    ${label_pieces_amount}=    Get Text    ${pms_txt_return_pieces_amount_full_regis}
    ${input_pieces_amount}=    Get Text    ${pms_txtbox_return_pieces_amount_full_regis}
    ${label_sale_channel}=    Get Text    ${pms_txt_return_sale_channel_full_regis}
    ${input_sale_channel}=    Get Text    ${pms_txtbox_return_sale_channel_full_regis}
    ${label_vat}=    Get Text    ${pms_txt_return_vat_full_regis}
    ${input_vat}=    Get Text    ${pms_txtbox_return_vat_full_regis}
    ${label_remark}=    Get Text    ${pms_txt_return_remark_full_regis}
    ${input_remark}=    Get Text    ${pms_txtbox_return_remark_full_regis}
    ${title_remark}=    Get Text    ${pms_txt_remark2_full_regis}

    Should Be Equal As Strings    ${label_product_category} ${input_product_category}   ${rm.full_regis.return_business['text_product_category']} ${product_category}
    Should Be Equal As Strings    ${label_pieces_amount} ${input_pieces_amount}   ${rm.full_regis.return_business['text_pieces_amount']} ${pieces_amount}
    Should Be Equal As Strings    ${label_sale_channel} ${input_sale_channel}   ${rm.full_regis.return_business['text_sale_channel']} ${sale_channel}
    Should Be Equal As Strings    ${label_vat} ${input_vat}   ${rm.full_regis.return_business['text_vat']} ${vat}
    Should Be Equal As Strings    ${label_remark} ${input_remark}   ${rm.full_regis.return_business['text_return_remark']} ${remark}
    Should Be Equal As Strings    ${title_remark}   ${rm.full_regis['text_remark_2']}

    Page Should Contain Element    ${price_scheme}
    Page Should Contain Element    ${title_insure}
    Page Should Contain Element    ${title_condition}
    Page Should Contain Element    ${label_one_mile}
    Page Should Contain Element    ${label_cancel_return_fee}
    Page Should Contain Element    ${label_rebate}

    #### parcel pickup ####
    Page Should Contain Element    ${title_parcel_pickup}

    ${text_branch}=    Replace String    ${pms_txt_parcel_pickup_table_full_regis}    {value}    ${branch}
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address} ${address_full}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${determined}
    Wait Until Element Is Visible    ${text_pickup_schedule}

Input Information In The Return Business Tab
    [Arguments]    ${price_scheme}    ${price_scheme_date}    ${insure_scheme}    ${insure_scheme_date}
    #### ใช้งานชั่วคราว ####
    common.Click When Ready    ${pms_btn_select_return_business}
    common.Click When Ready    //input[@id='parcelType_parcelReturnBusiness_isExpressReturn']/..
    common.Click When Ready    //input[@id='parcelType_parcelReturnBusiness_isInsuReturn']//..
    #### ใช้งานชั่วคราว ####

    ${price_scheme_day}    Format Input Date    ${price_scheme_date}
    ${insure_scheme_day}    Format Input Date    ${insure_scheme_date}

    ${select_price_scheme}=    Replace String    ${pms_cbo_price_scheme_return_full_regis}    {value}    ${price_scheme}
    ${select_price_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${price_scheme_day}
    ${select_insure_scheme}=    Replace String    ${pms_cbo_insure_scheme_return_full_regis}    {value}    ${insure_scheme}
    ${select_insure_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${insure_scheme_day}

    Wait Until Element Is Visible    ${pms_txtbox_price_scheme_return_full_regis}
    Scroll Element Into View    ${pms_txtbox_price_scheme_return_full_regis}

    ### price scheme ###
    common.Click When Ready    ${pms_txtbox_price_scheme_return_full_regis}
    common.Click When Ready    ${select_price_scheme}
    common.Click When Ready    ${pms_txtbox_price_scheme_date_return_full_regis}
    common.Click When Ready    ${select_price_scheme_date}

    common.Click When Ready    ${pms_txtbox_insure_scheme_return_full_regis}
    common.Click When Ready    ${select_insure_scheme}
    common.Click When Ready    ${pms_txtbox_insure_scheme_return_date_full_regis}
    common.Click When Ready    ${select_insure_scheme_date}

Verify Request Detail Contact And Bank Information
    [Arguments]    ${bank_id}    ${bank_name}    ${bank_branch}    ${bank_account_name}    ${bank_account_no}    ${bank_account_type}
    ...    ${user_name}    ${user_position}    ${user_email}    ${user_phone}    ${user_phone_ex}
    Scroll Window To Vertical    0
    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_contact_and_bank_info']}
    ${title_bank_info}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm.full_regis['text_header_bank_info']}
    ${title_contact_info}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm.full_regis['text_header_contact_info']}
    Page Should Contain Element    ${label_step}

    ${label_bank_id}=    Get Text    ${pms_txt_bank_id_full_regis}
    ${input_bank_id}=    Get Text    ${pms_txtbox_bank_id_full_regis}
    ${label_bank_name}=    Get Text    ${pms_txt_bank_name_full_regis}
    ${input_bank_name}=    Get Text    ${pms_txtbox_bank_name_full_regis}
    ${label_bank_branch}=    Get Text    ${pms_txt_bank_branch_full_regis}
    ${input_bank_branch}=    Get Value    ${pms_txtbox_bank_branch_full_regis}
    ${label_bank_account_name}=    Get Text    ${pms_txt_bank_account_name_full_regis}
    ${input_bank_account_name}=    Get Value    ${pms_txtbox_bank_account_name_full_regis}
    ${label_bank_account_no}=    Get Text    ${pms_txt_bank_account_no_full_regis}
    ${input_bank_account_no}=    Get Value    ${pms_txtbox_bank_account_no_full_regis}
    ${label_bank_account_type}=    Get Text    ${pms_txt_bank_account_type_full_regis}
    ${input_bank_account_type}=    Get Text    ${pms_txtbox_bank_name_full_regis}
    ${actual_contact_heading}=    Get Text    ${pms_txt_list_contact_heading_full_regis}
    ${actual_contact_info}=    Get Text    ${pms_txt_list_contact_info_full_regis}
    ${title_remark}=    Get Text    ${pms_txt_remark3_full_regis}

    Wait Until Element Is Visible    ${title_bank_info}    timeout=${DEFAULT_TIMEOUT}
    Should Be Equal As Strings    ${label_bank_id} ${input_bank_id}    ${rm.full_regis.bank['text_country']} ${bank_id}
    Should Be Equal As Strings    ${label_bank_name} ${input_bank_name}    ${rm.full_regis.bank['text_bank']} ${bank_name}
    Should Be Equal As Strings    ${label_bank_branch} ${input_bank_branch}    ${rm.full_regis.bank['text_bank_branch']} ${bank_branch}
    Should Be Equal As Strings    ${label_bank_account_name} ${input_bank_account_name}    ${rm.full_regis.bank['text_bank_account_name']} ${bank_account_name}
    Should Be Equal As Strings    ${label_bank_account_no} ${input_bank_account_no}    ${rm.full_regis.bank['text_bank_account_no']} ${bank_account_no}
    Should Be Equal As Strings    ${label_bank_account_type} ${input_bank_account_type}    ${rm.full_regis.bank['text_bank_account_type']} ${bank_account_type}

    Wait Until Element Is Visible    ${title_contact_info}    timeout=${DEFAULT_TIMEOUT}
    Scroll Element Into View    ${title_contact_info}
    # Should Be Equal As Strings    ${actual_contact_heading}    ${user_name} ${user_position} ${user_email} ${user_phone} ${user_phone_ex}
    # Should Be Equal As Strings    ${actual_contact_info}    ${user_name} ${user_position} ${user_email} ${user_phone} ${user_phone_ex}
    # Should Be Equal As Strings    ${title_remark}   ${rm.full_regis['text_remark_3']}


########## legal entity  ###########
Verify Full Register Detail Page With Waiting For Confirm Status [legal entity]
    [Arguments]    ${first_name}    ${last_name}    ${req_type}    ${customer_type}    ${company_title}    ${company_name}    ${mobile_company}
    ...    ${mobile_company_ext}    ${company_address}    ${company_address_full}    ${title_name}    ${email}    ${mobile_no}    ${mobile_ext}

    ${title}=    Replace String    ${pms_txt_title_detail}    {value}    ${rm['text_request_detail']}
    Wait Until Element Is Visible    ${title}   timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${pms_txtbox_customer_type_full_regis}   timeout=${DEFAULT_TIMEOUT}

    #### part 1 ####
    ${label_req_no}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_request_number']}
    ${label_contact_name}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_contact_name']}
    ${label_req_date}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_request_date']}
    ${label_req_type}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_request_type']}
    ${label_req_ref}=    Replace String    ${pms_txt_detail_full_regis}    {value}    ${rm['text_reference_request']}

    ${label_req_no}=    Get Text    ${label_req_no}
    ${label_contact_name}=    Get Text    ${label_contact_name}
    ${label_req_date}=    Get Text    ${label_req_date}
    ${label_req_type}=    Get Text    ${label_req_type}
    ${label_req_ref}=    Get Text    ${label_req_ref}

    Should Be Equal As Strings    ${label_req_no}    ${rm['text_request_number']} ${req_no_full_regis}
    Should Be Equal As Strings    ${label_contact_name}    ${rm['text_contact_name']} ${first_name} ${last_name}
    Should Be Equal As Strings    ${label_req_date}   ${rm['text_request_date']} ${req_date_full_regis}
    Should Be Equal As Strings    ${label_req_type}    ${rm['text_request_type']} ${req_type}
    # Should Be Equal As Strings    ${label_req_ref}   ${rm['text_reference_request']} ${get_request_no}

    #### part 2 ####
    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_company_info']}
    ${text_contact_information}=    Replace String    ${pms_txt_in_detail_full_regis}        {value}    ${rm['text_contact_information']}
    Page Should Contain Element    ${label_step}
    Page Should Contain Element    ${text_contact_information}

    ${label_customer_type}=    Get Text    ${pms_txt_customer_type_full_regis}
    ${input_customer_type}=    Get Value    ${pms_txtbox_customer_type_full_regis}
    ${label_company_title}=    Get Text    ${pms_txt_company_title_full_regis}
    ${input_company_title}=    Get Text    ${pms_txtbox_company_title_full_regis}
    ${label_company_name}=    Get Text    ${pms_txt_company_name_full_regis}
    ${input_company_name}=    Get Value    ${pms_txtbox_company_name_full_regis}
    ${label_id_number}=    Get Text    ${pms_txt_id_number_full_regis}
    ${input_id_number}=    Get Value    ${pms_txtbox_id_number_full_regis}
    ${label_mobile_company}=    Get Text    ${pms_txt_company_mobile_full_regis}
    ${input_mobile_company}=    Get Value    ${pms_txtbox_company_mobile_full_regis}
    ${label_mobile_company_ext}=    Get Text    ${pms_txt_company_mobile_ext_full_regis}
    ${input_mobile_company_ext}=    Get Value    ${pms_txtbox_company_mobile_ext_full_regis}
    ${label_company_address}=    Get Text    ${pms_txt_company_address_full_regis}
    ${input_company_address}=    Get Value    ${pms_txtbox_company_address_full_regis}
    ${label_company_address_full}=    Get Text    ${pms_txt_company_address_full_full_regis}
    ${input_company_address_full}=    Get Text    ${pms_txtbox_company_address_full_full_regis}
    ${label_title_name}=    Get Text    ${pms_txt_title_name_full_regis}
    ${input_title_name}=    Get Text    ${pms_txtbox_title_name_full_regis}
    ${label_first_name}=    Get Text    ${pms_txt_first_name_full_regis}
    ${input_first_name}=    Get Value    ${pms_txtbox_first_name_full_regis}
    ${label_last_name}=    Get Text    ${pms_txt_last_name_full_regis}
    ${input_last_name}=    Get Value    ${pms_txtbox_last_name_full_regis}
    ${label_email}=    Get Text    ${pms_txt_email_full_regis}
    ${input_email}=    Get Value    ${pms_txtbox_email_full_regis}
    ${label_mobile_no}=    Get Text    ${pms_txt_mobile_no_full_regis}
    ${input_mobile_no}=    Get Value    ${pms_txtbox_mobile_no_full_regis}
    ${label_mobile_ext}=    Get Text    ${pms_txt_mobile_ext_full_regis}
    ${input_mobile_ext}=    Get Value    ${pms_txtbox_mobile_ext_full_regis}
    ${label_remark}=    Get Text    ${pms_txt_remark_full_regis}

    Should Be Equal As Strings    ${label_customer_type} ${input_customer_type}    ${rm['text_customer_type']} ${customer_type}
    Should Be Equal As Strings    ${label_company_title} ${input_company_title}    ${rm.full_regis['text_company_title']} ${company_title}
    Should Be Equal As Strings    ${label_company_name} ${input_company_name}    ${rm.full_regis['text_company_name']} ${company_name}
    # Should Be Equal As Strings    ${label_id_number} ${input_id_number}    ${rm.full_regis['text_id_number']} ${JuristicID}
    # Should Be Equal As Strings    ${label_mobile_company} ${input_mobile_company}    ${rm.full_regis['text_mobile_company']} ${mobile_company}
    # Should Be Equal As Strings    ${label_mobile_company_ext} ${input_mobile_company_ext}    ${rm.full_regis['text_mobile_company_ext']} ${mobile_company_ext}
    Should Be Equal As Strings    ${label_company_address} ${input_company_address}    ${rm.full_regis['text_company_address']} ${company_address}
    Should Be Equal As Strings    ${label_company_address_full} ${input_company_address_full}    ${rm.full_regis['text_company_address_full']} ${company_address_full}
    Should Be Equal As Strings    ${label_title_name} ${input_title_name}    ${rm.full_regis['text_title_name']} ${title_name}
    Should Be Equal As Strings    ${label_first_name} ${input_first_name}    ${rm.full_regis['text_first_name']} ${first_name}
    Should Be Equal As Strings    ${label_last_name} ${input_last_name}    ${rm.full_regis['text_last_name']} ${last_name}
    Should Be Equal As Strings    ${label_email} ${input_email}    ${rm.full_regis['text_email']} ${email}
    Should Be Equal As Strings    ${label_mobile_no} ${input_mobile_no}    ${rm.full_regis['text_mobile_no']} ${mobile_no}
    Should Be Equal As Strings    ${label_mobile_ext} ${input_mobile_ext}    ${rm.full_regis['text_mobile_ext']} ${mobile_ext}
    Should Be Equal As Strings    ${label_remark}    ${rm.full_regis['text_remark']}

Verify Supporting Document Page Legal Entity
    ${txt_title}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_step_supporting_document']} 
    ${txt_header}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_header_supporting_document']}
    ${txt_certificate_business_registration}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_certificate_business_registration']}
    ${txt_copy_file_20}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_copy_file_20']}
    ${txt_copy_id_card}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_copy_id_card']}
    ${txt_copy_of_bank_account}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_copy_of_bank_account']}
    ${txt_copy_of_house_registration}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_copy_of_house_registration']}
    ${txt_permission_form}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_permission_form']}
    ${txt_other_file}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_other_file']}

    Page Should Contain Element    ${txt_title}
    Page Should Contain Element    ${txt_header}
    Page Should Contain Element    ${txt_certificate_business_registration}
    Page Should Contain Element    ${txt_copy_file_20}
    Page Should Contain Element    ${txt_copy_id_card}
    Page Should Contain Element    ${txt_copy_of_bank_account}
    Page Should Contain Element    ${txt_copy_of_house_registration}
    Page Should Contain Element    ${txt_permission_form}
    Page Should Contain Element    ${txt_other_file}


Input Remark 4
    [Arguments]    ${value}
    common.Input When Ready    ${pms_txtbox_remark4_full_regis}    ${value}


Click Return Button
    ${btn_return}=    Replace String    ${pms_btn_full_regis}    {value}    ${rm.full_regis['text_return']}
    common.Click When Ready    ${btn_return} 


Verify Return Popup
    [Arguments]    ${remark_1}=${EMPTY}    ${remark_2}=${EMPTY}    ${remark_3}=${EMPTY}    ${remark_4}=${EMPTY}
    ${header_return_popup}=    Replace String    ${pms_txt_header_popup_full_regis}      {value}    ${rm.full_regis['text_header_return_popup']}
    Element Should Be Visible    ${header_return_popup}

    ${label_remark_1}=    Get Text    ${pms_txt_remark1_return_popup} 
    ${txt_remark_1}=    Get Text    ${pms_txtbox_remark1_return_popup}
    ${label_remark_2}=    Get Text    ${pms_txt_remark2_return_popup} 
    ${txt_remark_2}=    Get Text    ${pms_txtbox_remark2_return_popup}
    ${label_remark_3}=    Get Text    ${pms_txt_remark3_return_popup} 
    ${txt_remark_3}=    Get Text    ${pms_txtbox_remark3_return_popup}
    ${label_remark_4}=    Get Text    ${pms_txt_remark4_return_popup} 
    ${txt_remark_4}=    Get Text    ${pms_txtbox_remark4_return_popup}
 
    Should Be Equal As Strings    ${label_remark_1} ${txt_remark_1}    ${rm.full_regis['text_remark_page_1']} ${remark_1}
    Should Be Equal As Strings    ${label_remark_2} ${txt_remark_2}    ${rm.full_regis['text_remark_page_2']} ${remark_2}
    Should Be Equal As Strings    ${label_remark_3} ${txt_remark_3}    ${rm.full_regis['text_remark_page_3']} ${remark_3}
    Should Be Equal As Strings    ${label_remark_4} ${txt_remark_4}    ${rm.full_regis['text_remark_page_4']} ${remark_4}
    

Click Confirm Button
    ${btn_confirm}=    Replace String    ${pms_btn_full_regis}     {value}    ${rm.full_regis['text_confirm_popup']}
    common.Click When Ready  ${btn_confirm}

Verify Officer Section Page
    #[Arguments]    ${}
    #Inprogress
    ${txt_title}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_step_officer_section']} 
    ${txt_header_more_detail}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_header_more_detail']}
    ${txt_header_sale_info}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_header_sale_info']}
    ${txt_header_company_admin_info}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_header_company_admin_info']}
    ${txt_header_contract}=    Replace String    ${pms_txt_in_detail_full_regis}    {value}    ${rm.full_regis['text_header_contract']}
    
    ${label_company_name}=    Get Text    ${pms_txt_company_name_full_regis}
    ${txt_company_name}=    Get Value    ${pms_txtbox_company_name_full_regis}
    
        
    Page Should Contain Element    ${txt_title}
    Page Should Contain Element    ${txt_header_more_detail}
    Should Be Equal As Strings    ${label_company_name} ${txt_company_name}    
    Page Should Contain Element    ${txt_header_sale_info}

    Page Should Contain Element    ${txt_header_company_admin_info}

    Page Should Contain Element    ${txt_header_contract}
