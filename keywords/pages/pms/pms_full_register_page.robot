*** Keywords ***
Verify Full Register Status
    [Arguments]    ${status}
    Wait Until Element Is Visible    ${pms_txt_status}
    ${actual_txt_status}=    Get Text    ${pms_txt_status}
    Should Be Equal    ${actual_txt_status}    ${status}

Select Type Customer
    [Arguments]    ${type}
    ${select_list}=    Replace String    ${pms_txtbox_company_data_type_person_list}    {value}    ${type}
    common.Click When Ready  ${pms_txtbox_company_data_type_person_dropdown}
    common.Click When Ready  ${select_list}

Select Title Name Company
    [Arguments]    ${title_name}
    ${select_list}=    Replace String    ${pms_txtbox_company_data_type_company_list}    {value}    ${title_name}
    common.Click When Ready  ${pms_txtbox_company_data_type_company_dropdown}
    common.Click When Ready  ${select_list}

Input Name Company
    [Arguments]    ${name}
    common.Input When Ready  ${pms_txtbox_company_data_name_company}    ${name}

Input Tax Identification Number 
    [Arguments]    ${tax_number}
    common.Input When Ready  ${pms_txtbox_company_data_tax_identification_number}    ${tax_number}

Input Mobile Company
    [Arguments]    ${mobile}
    common.Input When Ready  ${pms_txtbox_company_data_mobile_company}    ${mobile}

Input Mobile Company Ext
    [Arguments]    ${mobile_ext}
    common.Input When Ready  ${pms_txtbox_company_data_mobile_company_ext}    ${mobile_ext}

Input Address Company
    [Arguments]    ${address}
    common.Input When Ready  ${pms_txtbox_company_data_address_company}    ${address}

Input Postcode
    [Arguments]    ${postcode}    ${postcode_full}
    ${select_list}=    Replace String    ${pms_txtbox_company_data_postcode_list}    {value}    ${postcode_full}
    common.Input When Ready    ${pms_txtbox_company_data_postcode_input}    ${postcode}
    common.Click When Ready    ${select_list}

Select Contact Data Title Name
    [Arguments]    ${title_name}
    ${select_list}=    Replace String    ${pms_txtbox_contact_data_title_name_list}    {value}    ${title_name}
    common.Click When Ready  ${pms_txtbox_contact_data_title_name}
    common.Click When Ready  ${select_list}

Input Contact Data First Name
    [Arguments]    ${first_name}
    common.Input When Ready  ${pms_txtbox_contact_data_first_name}    ${first_name}

Input Contact Data Last Name
    [Arguments]    ${last_name}
    common.Input When Ready  ${pms_txtbox_contact_data_last_name}    ${last_name}

Input Contact Data Email
    [Arguments]    ${email}
    common.Input When Ready  ${pms_txtbox_contact_data_email}    ${email}

Input Contact Data Mobile Number
    [Arguments]    ${mobile_number}
    common.Input When Ready  ${pms_txtbox_contact_data_mobile_number}    ${mobile_number}

Input Contact Data Mobile Number Ext
    [Arguments]    ${mobile_number_ext}
    common.Input When Ready  ${pms_txtbox_contact_data_ext}    ${mobile_number_ext}

Click Button Next 
    ${btn}=    Replace String    ${pms_btn_next}    {value}    ${Register_S017['txt_btn_next']}
    common.Click When Ready    ${btn}

Click Tab Dry Parcel
    common.Click When Ready    ${pms_tab_dry_parcel}

Click Tab chill Parcel
    common.Click When Ready    ${pms_tab_chill_parcel}

Click Tab Retrun Business
    common.Click When Ready    ${pms_tab_return_business}

Click Button Select For Edit Dry Parcel
    common.Click When Ready    ${pms_btn_select_for_edit_dry_parcel}

Click Button Select For Edit Chill Parcel
    common.Click When Ready    ${pms_btn_select_for_edit_chill_parcel}

Click Button Select For Edit Return Business
    common.Click When Ready    ${pms_btn_select_for_edit_return_business}

Click Button COD Dry Parcel
    common.Click When Ready    ${pms_btn_check_cod_dry_parcel}

Click Button Insure Dry Parcel
    common.Click When Ready    ${pms_btn_check_insure_dry_parcel}

Input Product Type Dry Parcel
    [Arguments]    ${product_type}
    ${select_list}=    Replace String    ${pms_txtbox_service_data_dry_parcel_product_type_list}    {value}    ${product_type}
    common.Click When Ready    ${pms_txtbox_service_data_dry_parcel_product_type}
    common.Click When Ready    ${select_list} 

Input Deliveries Per Day Dry Parcel
    [Arguments]    ${amount}
    ${select_list}=    Replace String    ${pms_txtbox_service_data_dry_parcel_deliveries_per_day_list}    {value}    ${amount}
    common.Click When Ready    ${pms_txtbox_service_data_dry_parcel_deliveries_per_day}
    common.Click When Ready    ${select_list} 

Input Sell Channel Dry Parcel
    [Arguments]    ${channel}
    ${select_list}=    Replace String    ${pms_txtbox_service_data_dry_parcel_sell_channel_list}    {value}    ${channel}
    common.Click When Ready    ${pms_txtbox_service_data_dry_parcel_sell_channel}
    common.Click When Ready    ${select_list} 

Input Vat Dry Parcel
    [Arguments]    ${amount}
    ${select_list}=    Replace String    ${pms_txtbox_service_data_dry_parcel_deliveries_per_day_list}    {value}    ${amount}
    common.Click When Ready    ${pms_txtbox_service_data_dry_parcel_deliveries_per_day}
    common.Click When Ready    ${select_list} 