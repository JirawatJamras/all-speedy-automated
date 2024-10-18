*** Keywords ***
Verify Information On Request Details Page
    [Arguments]    ${company_title_name}    ${company_name}    ${address}    ${postcode}
    ...            ${title_name}    ${customer_first_name}    ${customer_last_name}    ${customer_email}    ${customer_phone}
    ...            ${customer_phone_extra}    ${remark}    ${sale_name}    ${sale_email}
    ${pms_txt_request_detail_header}=    Replace String    ${pms_txt_request_detail_header}    {value}    ${rm['text_request_detail']}
    Wait Until Element Is Visible    ${pms_txt_request_detail_header}    timeout=${DEFAULT_TIMEOUT}
    ${label_request_detail_header}=    Get Text    ${pms_txt_request_detail_header}
    ${label_company_title_name}=    Get Text    ${pms_txt_company_titile_name}
    ${value_company_title_name}=    Get Value    ${pms_txtbox_company_title_name}
    ${label_company_name}=    Get Text    ${pms_txt_company_name}
    ${value_company_name}=    Get Value    ${pms_txtbox_company_name}
    ${label_id_number}=    Get Text    ${pms_txt_company_id_number}
    ${value_id_number}=    Get Value    ${pms_txtbox_id_number} 
    ${label_address}=    Get Text    ${pms_txt_address}
    ${value_address}=    Get Element Attribute    ${pms_txtbox_address}    placeholder
    ${label_postcode}=    Get Text    ${pms_txt_postcode}
    ${value_postcode}=    Get Element Attribute    ${pms_txtbox_postcode}    placeholder
    ${label_contact_data_header}=    Get Text    ${pms_txt_contact_data_header}
    ${label_title_name}=    Get Text    ${pms_txt_title_name}
    ${value_title_name}=    Get Text    ${pms_txtbox_title_name} 
    ${label_customer_first_name}=    Get Text    ${pms_txt_customer_first_name}
    ${value_first_name}=    Get Element Attribute    ${pms_txtbox_first_name}    placeholder
    ${label_customer_last_name}=    Get Text    ${pms_txt_customer_last_name}
    ${value_last_name}=    Get Element Attribute    ${pms_txtbox_last_name}    placeholder
    ${label_customer_email}=    Get Text    ${pms_txt_customer_email}
    ${value_customer_email}=    Get Value    ${pms_txtbox_customer_email} 
    ${label_customer_phone}=    Get Text    ${pms_txt_customer_phone}
    ${value_customer_phone}=    Get Value    ${pms_txtbox_customer_phone} 
    ${label_customer_phone_extra}=    Get Text    ${pms_txt_cusotmer_phone_extra}
    ${value_customer_phone_extra}=    Get Value    ${pms_txtbox_customer_phone_extra} 
    ${label_link_full_register}=    Get Text    ${pms_txt_link_full_register}
    ${value_link_full_register}=    Get Element Attribute   ${pms_txtbox_link_full_register}    placeholder
    ${label_remark}=    Get Text    ${pms_txt_remark}
    ${value_remark}=    Get Text    ${pms_txtbox_remark}
    ${label_sale_data_header}=    Get Text    ${pms_txt_sale_data_header}
    ${label_sale_name}=    Get Text    ${pms_txt_sale_name}
    ${value_sale_name}=    Get Element Attribute    ${pms_txtbox_sale_name}    placeholder
    ${label_sale_phone}=    Get Text    ${pms_txt_sale_phone}
    ${value_sale_phone}=    Get Element Attribute    ${pms_txtbox_sale_phone}    placeholder
    ${label_sale_email}=    Get Text    ${pms_txt_sale_email}
    ${value_sale_email}=    Get Element Attribute    ${pms_txtbox_sale_email}    placeholder
    Should Be Equal As Strings    ${label_request_detail_header}     ${rm['text_request_detail']}
    Should Be Equal As Strings    ${label_company_title_name} ${value_company_title_name}    ${rm['text_company_title_name']} ${company_title_name}
    Should Be Equal As Strings    ${label_company_name} ${value_company_name}    ${rm['text_company_name']} ${company_name}
    Should Be Equal As Strings    ${label_id_number} ${value_id_number}    ${rm['text_id_number']} ${JuristicID}
    Should Be Equal As Strings    ${label_address} ${value_address}    ${rm['text_address']} ${address}
    Should Be Equal As Strings    ${label_postcode} ${value_postcode}    ${rm['text_postcode']} ${postcode}
    Should Be Equal As Strings    ${label_contact_data_header}    ${rm['text_contact_information']}
    Should Be Equal As Strings    ${label_title_name} ${value_title_name}    ${rm['text_title_name']} ${title_name}
    Should Be Equal As Strings    ${label_customer_first_name} ${value_first_name}    ${rm['text_customer_first_name']} ${customer_first_name}
    Should Be Equal As Strings    ${label_customer_last_name} ${value_last_name}    ${rm['text_customer_last_name']} ${customer_last_name}
    Should Be Equal As Strings    ${label_customer_email} ${value_customer_email}    ${rm['text_customer_email']} ${customer_email}
    Should Be Equal As Strings    ${label_customer_phone} ${value_customer_phone}    ${rm['text_customer_phone']} ${customer_phone}
    Should Be Equal As Strings    ${label_customer_phone_extra} ${value_customer_phone_extra}    ${rm['text_customer_phone_extra']} ${customer_phone_extra}
    Should Be Equal As Strings    ${label_link_full_register}    ${rm['text_link_full_register']}
    Should Be Equal As Strings    ${label_remark} ${value_remark}    ${rm['text_remark']} ${remark}
    Should Be Equal As Strings    ${label_sale_data_header}    ${rm['text_sale_information']}
    Should Be Equal As Strings    ${label_sale_name} ${value_sale_name}    ${rm['text_sale_name']} ${sale_name}
    Should Be Equal As Strings    ${label_sale_phone} ${value_sale_phone}    ${rm['text_sale_phone']} ${EMPTY}
    Should Be Equal As Strings    ${label_sale_email} ${value_sale_email}    ${rm['text_sale_email']} ${sale_email}

Input Mobile Number In Sale Information
    [Arguments]    ${value}
    ${pms_txt_sale_information}=    Replace String    ${pms_txt_sale_information}    {value}    ${rm['text_sale_information']}
    Scroll Into View By Xpath      ${pms_txt_sale_information}    true
    Input When Ready    ${pms_txtbox_sale_phone}    ${value}

Click Approve Button
    ${pms_btn_approve}=    Replace String    ${pms_btn_approve}    {value}    ${rm['text_approve']}
    Click When Ready    ${pms_btn_approve}

Verify Request Detail Page With Status Waiting For Assign
    [Arguments]    ${first_name}    ${last_name}    ${request_type}    ${reference_request}    ${partner_types}    ${company_title}
    ...    ${company_name}    ${company_address}    ${address_full}    ${title_name}    ${customer_firstname}    ${customer_lastname}
    ...    ${email}    ${mobile_no}    ${mobile_ext}

    ${title}=    Replace String    ${pms_txt_request_detail_header}    {value}    ${rm['text_request_detail']} 
    ${text_list_in_detail_page}=    Replace String    ${pms_txt_in_request_detail_page}    {value}    ${rm['text_request_number']} 
    Sleep    2s
    ${actual_text_list}=    Get Text    ${text_list_in_detail_page}
    ${actual_text_list}=    Replace String    ${actual_text_list}    \n    ${SPACE}
    Wait Until Element Is Visible    ${title}    timeout=${DEFAULT_TIMEOUT}
    Should Be Equal As Strings    ${actual_text_list}
    ...    ${rm['text_request_number']} ${get_request_no} ${rm['text_contact_name']} ${first_name} ${last_name} ${rm['text_request_date']} ${get_request_date} ${rm['text_request_type']} ${request_type} ${rm['text_reference_request']} ${reference_request} ${rm['text_rm']}

    ${label_customer_type}=    Get Text    ${pms_txt_customer_type}
    ${input_customer_type}=    Get Value    ${pms_txtbox_customer_type}
    ${label_company_titile}=    Get Text    ${pms_txt_company_titile_name}
    ${input_company_titile}=    Get Value    ${pms_txtbox_company_title_name}
    ${label_company_name}=    Get Text    ${pms_txt_company_name}
    ${input_company_name}=    Get Value    ${pms_txtbox_company_name}
    ${label_company_id_number}=    Get Text    ${pms_txt_company_id_number}
    ${input_company_id_number}=    Get Value    ${pms_txtbox_id_number}
    ${label_mobile_company}=    Get Text    ${pms_txt_mobile_company}
    ${input_mobile_company}=    Get Value    ${pms_txtbox_mobile_company}
    ${label_mobile_company_ext}=    Get Text    ${pms_txt_mobile_company_ext}
    ${input_mobile_company_ext}=    Get Value    ${pms_txtbox_mobile_company_ext}
    ${label_address}=    Get Text    ${pms_txt_address}
    ${input_address}=    Get Element Attribute    ${pms_txtbox_address}    placeholder
    ${label_address_full}=    Get Text    ${pms_txt_postcode}
    ${input_address_full}=    Get Element Attribute    ${pms_txtbox_postcode}    placeholder
    ${label_title_name}=    Get Text    ${pms_txt_title_name}
    ${input_title_name}=    Get Text    ${pms_txtbox_title_name}
    ${label_customer_first_name}=    Get Text    ${pms_txt_customer_first_name}
    ${input_customer_first_name}=    Get Element Attribute    ${pms_txtbox_first_name}    placeholder
    ${label_customer_last_name}=    Get Text    ${pms_txt_customer_last_name}
    ${input_customer_last_name}=    Get Element Attribute    ${pms_txtbox_last_name}    placeholder
    ${label_email}=    Get Text    ${pms_txt_customer_email}
    ${input_email}=    Get Value    ${pms_txtbox_customer_email}
    ${label_customer_phone}=    Get Text    ${pms_txt_customer_phone}
    ${input_customer_phone}=    Get Value    ${pms_txtbox_customer_phone}
    ${label_customer_phone_extra}=    Get Text    ${pms_txt_cusotmer_phone_extra}
    ${input_customer_phone_extra}=    Get Value    ${pms_txtbox_customer_phone_extra} 
    ${label_link_full_register}=    Get Text    ${pms_txt_link_full_register}
    ${label_remark}=    Get Text    ${pms_txt_remark}

    Should Be Equal As Strings    ${label_customer_type} ${input_customer_type}    ${rm['text_partner_type']} ${partner_types}
    Should Be Equal As Strings    ${label_company_titile} ${input_company_titile}    ${rm['text_company_title_name']} ${company_title}
    Should Be Equal As Strings    ${label_company_name} ${input_company_name}    ${rm['text_company_name']} ${company_name}
    Should Be Equal As Strings    ${label_company_id_number} ${input_company_id_number}    ${rm['text_id_number']} ${JuristicID}
    Should Be Equal As Strings    ${label_mobile_company} ${input_mobile_company}    ${rm['text_mobile_company']} ${EMPTY}
    Should Be Equal As Strings    ${label_mobile_company_ext} ${input_mobile_company_ext}    ${rm['text_mobile_company_extra']} ${EMPTY}
    Should Be Equal As Strings    ${label_address} ${input_address}    ${rm['text_address']} ${company_address}
    Should Be Equal As Strings    ${label_address_full} ${input_address_full}    ${rm['text_postcode']} ${address_full}
    Should Be Equal As Strings    ${label_title_name} ${input_title_name}    ${rm['text_title_name']} ${title_name}
    Should Be Equal As Strings    ${label_customer_first_name} ${input_customer_first_name}    ${rm['text_customer_first_name']} ${customer_firstname}
    Should Be Equal As Strings    ${label_customer_last_name} ${input_customer_last_name}    ${rm['text_customer_last_name']} ${customer_lastname}
    Should Be Equal As Strings    ${label_email} ${input_email}    ${rm['text_customer_email']} ${email}
    Should Be Equal As Strings    ${label_customer_phone} ${input_customer_phone}    ${rm['text_customer_phone']} ${mobile_no}
    Should Be Equal As Strings    ${label_customer_phone_extra} ${input_customer_phone_extra}    ${rm['text_customer_phone_extra']} ${mobile_ext}
    Should Be Equal As Strings    ${label_link_full_register}    ${rm['text_link_full_register']}
    Should Be Equal As Strings    ${label_remark}    ${rm['text_remark']}

Click Assign RM Button
    ${btn_assign_rm}=    Replace String    ${pms_btn_assign_rm}    {value}    ${rm['text_assign_rm']}
    Scroll Element Into View    ${btn_assign_rm}
    Click When Ready    ${btn_assign_rm}

Verify Assign RM Popup
    ${title_assign_rm_popup}=    Replace String    ${pms_txt_title_assign_rm_popup}    {value}    ${rm['text_assign_rm']}
    ${request_no}=    Replace String    ${pms_txt_request_no_in_assign_rm_popup}    {value}    ${get_request_no}
    ${all_rm}=    Replace String    ${pms_txt_all_rm_in_assign_rm_popup}    {value}    ${rm['text_list_of_all_rm']}

    Wait Until Element Is Visible    ${title_assign_rm_popup}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${request_no}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${all_rm}    timeout=${DEFAULT_TIMEOUT}
    Wait Until Element Is Visible    ${pms_txtbox_search_rm_name}

Click Button To Assign RM 
    [Arguments]    ${rm_name}
    ${btn_assign_to_rm}=    Replace String    ${pms_btn_assign_to_rm}    {value}    ${rm_name}
    Scroll Element Into View    ${btn_assign_to_rm}
    Click When Ready    ${btn_assign_to_rm}

Verify Assign To RM 
    [Arguments]    ${rm_name}
    ${rm_table}=    Replace String    ${pms_txt_already_assign_to_rm_in_popup}    {value}    ${rm['text_rm_in_popup']}
    ${rm_table_complete}=    Replace String    ${rm_table}    {rmname}    ${rm_name}
    Scroll Element Into View    ${rm_table_complete}

Click Save Button
    ${btn_save}=    Replace String    ${pms_btn_save}    {value}    ${rm['text_save']}
    Scroll Element Into View    ${btn_save}
    Click When Ready    ${btn_save}



# Verify Request Detail Page After RM Approve
