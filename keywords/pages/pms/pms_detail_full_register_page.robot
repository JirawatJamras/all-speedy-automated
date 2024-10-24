*** Keywords ***
Click Next Page Button
    ${btn_next_page}=    Replace String    ${pms_btn_next_page}    {value}    ${rm['text_next_page']}
    Scroll Element Into View    ${btn_next_page}
    common.Click When Ready    ${btn_next_page}
    
Click Dry Parcel Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_dry_parcel}

Verify Dry Parcel Tab Full Register Detail Page
    [Arguments]    ${cod}    ${insure}    ${product_category}    ${pieces_amount}    ${sale_channel}    ${vat}    ${remark}
    ...    ${branch}    ${address}    ${latitude_longitude}    ${pickup_schedule}

    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_service_info']}
    ${service_info}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_service_info']}
    ${price_scheme}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_price_scheme']}
    ${title_cod}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_cod']}
    ${title_insure}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_insure']}
    ${title_condition}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_condition']}
    ${label_one_mile}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_one_mile']}
    ${label_cancel_return_fee}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_cancel_return_fee']}
    ${label_rebate}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${title_parcel_pickup}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}
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
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${pickup_schedule}

Format Input Date
    [Arguments]    ${date}
    ${day}    common.Split String And Select    ${date}    /    0
    ${month}    common.Split String And Select    ${date}    /    1
    ${year}    common.Split String And Select    ${date}    /    2
    ${d}    Set Variable    ${year}-${month}-${day}
    RETURN    ${d}

Input Information In The Dry Parcel Tab
    [Arguments]    ${price_scheme}    ${price_scheme_date}

    ${price_scheme_day}    Format Input Date    ${price_scheme_date}

    ${select_price_scheme}=    Replace String    ${pms_cbo_price_scheme_full_regis}    {value}    ${price_scheme}
    ${select_price_scheme_date}=    Replace String    ${pms_cbo_date_pick_full_regis}    {value}    ${price_scheme_day}

    Wait Until Element Is Visible    ${pms_txtbox_price_scheme_full_regis}
    Scroll Element Into View    ${pms_txtbox_price_scheme_full_regis}

    ### price scheme ###
    common.Click When Ready    ${pms_txtbox_price_scheme_full_regis}
    common.Click When Ready    ${select_price_scheme}

    common.Click When Ready    ${pms_txtbox_price_scheme_date_full_regis}
    common.Click When Ready    ${select_price_scheme_date}
    Sleep    4s
    



Click Chill Parcel Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_chill_parcel}

Verify Chill Parcel Tab Full Register Detail Page
    [Arguments]    ${cod}    ${product_category}    ${pieces_amount}    ${sale_channel}    ${vat}    ${remark}
    ...    ${branch}    ${address}    ${latitude_longitude}    ${pickup_schedule}  

    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_service_info']}
    ${service_info}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_service_info']}
    ${price_scheme}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_price_scheme']}
    ${title_cod}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_cod']}
    ${title_condition}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_condition']}
    ${label_one_mile}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_one_mile']}
    ${label_cancel_return_fee}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_cancel_return_fee']}
    ${label_rebate}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${title_parcel_pickup}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}
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

    ${text_branch}=    Replace String    ${pms_txt_parcel_pickup_table_full_regis}    {value}    ${branch}
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${pickup_schedule}

    #### parcel pickup ####
    Page Should Contain Element    ${title_parcel_pickup}

    ${text_branch}=    Replace String    ${pms_txt_parcel_pickup_table_full_regis}    {value}    ${branch}
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${pickup_schedule}

Click Return Business Tab
    Scroll Window To Vertical    0
    common.Click When Ready    ${pms_tab_return_business}

Verify Return Business Tab Full Register Detail Page
    [Arguments]    ${express}    ${insure}    ${product_category}    ${pieces_amount}    ${sale_channel}    ${vat}    ${remark}
    ...    ${branch}    ${address}    ${latitude_longitude}    ${pickup_schedule}

    ${label_step}=    Replace String    ${pms_txt_step_full_regis}    {value}    ${rm.full_regis['text_step_service_info']}
    ${service_info}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_service_info']}
    ${price_scheme}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_price_scheme']}
    ${title_insure}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_insure']}
    ${title_condition}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_title_condition']}
    ${label_one_mile}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_one_mile']}
    ${label_cancel_return_fee}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_cancel_return_fee']}
    ${label_rebate}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_rebate']}
    ${title_parcel_pickup}=    Replace String    ${pms_text_in_detail_full_regis}    {value}    ${rm.full_regis['text_parcel_pickup']}
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
    ${text_address}=    Replace String    ${text_branch}    {value2}    ${address}
    ${text_latitude_longitude}=    Replace String    ${text_address}    {value3}    ${latitude_longitude}
    ${text_pickup_schedule}=    Replace String    ${text_latitude_longitude}    {value4}    ${pickup_schedule}

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
    ${text_contact_information}=    Replace String    ${pms_text_in_detail_full_regis}        {value}    ${rm['text_contact_information']}
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



