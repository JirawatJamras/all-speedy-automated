*** Keywords ***
Verify Information On Request Details Page
    [Arguments]    ${company_title_name}    ${company_name}    ${id_number}    ${address}    ${postcode}
    ...            ${title_name}    ${customer_first_name}    ${customer_last_name}    ${customer_email}    ${customer_phone}
    ...            ${customer_phone_extra}    ${link_full_register}    ${remark}    ${sale_name}    ${sale_phone}    ${sale_email}
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
    ${value_link_full_register}=    Get Element Attribute    ${pms_txtbox_link_full_register}    placeholder
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
    Should Be Equal As Strings    ${label_id_number} ${value_id_number}    ${rm['text_id_number']} ${id_number}
    Should Be Equal As Strings    ${label_address} ${value_address}    ${rm['text_address']} ${address}
    Should Be Equal As Strings    ${label_postcode} ${value_postcode}    ${rm['text_postcode']} ${postcode}
    Should Be Equal As Strings    ${label_contact_data_header}    ${rm['text_contact_information']}
    Should Be Equal As Strings    ${label_title_name} ${value_title_name}    ${rm['text_title_name']} ${title_name}
    Should Be Equal As Strings    ${label_customer_first_name} ${value_first_name}    ${rm['text_customer_first_name']} ${customer_first_name}
    Should Be Equal As Strings    ${label_customer_last_name} ${value_last_name}    ${rm['text_customer_last_name']} ${customer_last_name}
    Should Be Equal As Strings    ${label_customer_email} ${value_customer_email}    ${rm['text_customer_email']} ${customer_email}
    Should Be Equal As Strings    ${label_customer_phone} ${value_customer_phone}    ${rm['text_customer_phone']} ${customer_phone}
    Should Be Equal As Strings    ${label_customer_phone_extra} ${value_customer_phone_extra}    ${rm['text_customer_phone_extra']} ${customer_phone_extra}
    Should Be Equal As Strings    ${label_link_full_register} ${value_link_full_register}    ${rm['text_link_full_register']} ${link_full_register}
    Should Be Equal As Strings    ${label_remark} ${value_remark}    ${rm['text_remark']} ${remark}
    Should Be Equal As Strings    ${label_sale_data_header}    ${rm['text_sale_information']}
    Should Be Equal As Strings    ${label_sale_name} ${value_sale_name}    ${rm['text_sale_name']} ${sale_name}
    Should Be Equal As Strings    ${label_sale_phone} ${value_sale_phone}    ${rm['text_sale_phone']} ${sale_phone}
    Should Be Equal As Strings    ${label_sale_email} ${value_sale_email}    ${rm['text_sale_email']} ${sale_email}
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Register_S010    Verify Booking Summary
    common.Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Register_S010    Verify Booking Summary
