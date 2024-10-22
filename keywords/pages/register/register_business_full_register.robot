*** Keywords ***
Login mail
    [Arguments]    ${email}    ${password}
    common.Open URL    https://mail.google.com/
    common.Input When Ready    ${register_txtbox_email_gmail}   ${email}
    common.Click when ready    ${register_btn_next_gmail}
    common.Input When Ready    ${register_txtbox_password_gmail}   ${password}
    common.Click when ready    ${register_btn_next_gmail}

Get Link On Email
    ${select_link}=    Replace String    ${register_link_register_gmail}     {value}    ${rm_link_full_register}
    Wait Until Element Is Visible    ${select_link}   ${DEFAULT_TIMEOUT}
    ${link_full_register}=    Get Text    ${select_link}
    Set Suite Variable    ${link_full_register}

Verify Email That Have Received Link
    common.Click when ready    ${register_btn_inbox_gmail} 
    ${select_link}=    Replace String    ${register_txt_link_register_gmail}     {value}    ${Register.Full_register['txt_link_register']}
    ${select_link}=    Replace String    ${select_link}     {link}    ${rm_link_full_register}
    Scroll Into View By Xpath    ${select_link}    true

#Legal Entity
Verify Company information Legal Entity Page
    [Arguments]    ${partner_types}    ${company_title_name}    ${company_name}    ${id_number}    
    ...    ${company_address}    ${select_company_address_full}    ${title_name}
    ...    ${first_name}    ${last_name}    ${email}    ${mobile_no}    ${mobile_ext}
    #หัวข้อข้อมูลบริษัท
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['txt_title_company_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_header_company_information']}
        
    Page Should Contain Element    ${txt_title}
    Wait Until Element Is Visible    ${txt_header}

    ${txt_partner_types}=    Get Value    ${register_btn_partner_types_full_register}
    ${txt_company_title_name}=    Get Text    ${register_dropdown_company_title_name_legal_entity_full_register} 
    ${txt_company_name}=    Get Value    ${register_txtbox_company_name_legal_entity_full_register}
    ${txt_id_number}=    Get Value    ${register_txtbox_juristic_identification_number_legal_entity_full_register} 
    ${txt_company_address}=    Get Value    ${register_txtbox_company_address_legal_entity_full_register}
    ${txt_select_company_address_full}=    Get Text    ${register_dropdown_company_address_full_legal_entity_full_register}
    ${txt_mobile_company}=     Get Value    ${register_txtbox_mobile_company_legal_entity_full_register}
    ${txt_mobile_company_ext}=     Get Value    ${register_txtbox_mobile_company_ext_legal_entity_full_register}
    ${txt_title_name}=    Get Text    ${register_dropdown_title_name_legal_entity_full_register}
    ${txt_first_name}=    Get Value    ${register_txtbox_first_name_legal_entity_full_register}
    ${txt_last_name}=    Get Value    ${register_txtbox_last_name_legal_entity_full_register}
    ${txt_email}=    Get Value    ${register_txtbox_email_legal_entity_full_register}
    ${txt_mobile_no}=    Get Value    ${register_txtbox_mobile_no_legal_entity_full_register}
    ${txt_mobile_ext}=    Get Value    ${register_txtbox_mobile_ext_legal_entity_full_register}

    Should Be Equal As Strings    ${txt_partner_types}     ${partner_types}
    Should Be Equal As Strings    ${txt_company_title_name}     ${company_title_name}
    Should Be Equal As Strings    ${txt_company_name}     ${company_name}
    Should Be Equal As Strings    ${txt_id_number}     ${id_number}
    Should Be Equal As Strings    ${txt_company_address}     ${company_address}
    Should Be Equal As Strings    ${txt_select_company_address_full}     ${select_company_address_full}
    Should Be Empty    ${txt_mobile_company}
    Should Be Empty    ${txt_mobile_company_ext}
    Should Be Equal As Strings    ${txt_title_name}     ${title_name}
    Should Be Equal As Strings    ${txt_first_name}     ${first_name}
    Should Be Equal As Strings    ${txt_last_name}     ${last_name}
    Should Be Equal As Strings    ${txt_email}     ${email}
    Should Be Equal As Strings    ${txt_mobile_no}     ${mobile_no}
    Should Be Equal As Strings    ${txt_mobile_ext}     ${mobile_ext}

Input Mobile Company Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_company_legal_entity_full_register}     ${value}  

Input Mobile Company Ext Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_company_ext_legal_entity_full_register}     ${value}

#Uploadfile
Upload Certificate Business Registration
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['txt_certificate_business_registration']}
    Execute JavaScript    Array.from(document.querySelectorAll('input[name="file"]')).forEach(el => el.style.display = 'block');
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Copy File 20
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['txt_copy_file_20']}
    Execute JavaScript    document.querySelector('input[type="file"]').style.display = 'block';
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Copy ID Card
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['txt_copy_id_card']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Copy Of Bank Account
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['txt_copy_of_bank_account']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Copy Of House Registration
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['txt_copy_of_house_registration']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Permission form for Deduction from Bank Account
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['txt_permission_form']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Other File
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['txt_other_file']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Click Acceptance Terms of Service
    ${click_checkbox}=    Replace String    ${register_btn_accept_terms_of_service_full_register}     {value}    ${Register.Full_register['txt_terms_of_service']}
    Scroll Element Into View    ${click_checkbox}
    Select Checkbox    ${click_checkbox}

Click Acceptance Privacy Policy
    ${click_checkbox}=    Replace String    ${register_btn_accept_privacy_policy_full_register}     {value}    ${Register.Full_register['txt_privacy_policy']}
    Scroll Element Into View    ${click_checkbox}
    Select Checkbox    ${click_checkbox}


#Both
#Service Information
Click Tab Dry Parcel
    ${txt_tab}=    Replace String    ${register_tab_parcel_type_full_register}    {value}    ${Register.Full_register['txt_tab_dry_parcel']}
    common.Click when ready    ${txt_tab}

Click Tab Chill Parcel
    ${txt_tab}=    Replace String    ${register_tab_parcel_type_full_register}    {value}    ${Register.Full_register['txt_tab_chill_parcel']}
    common.Click when ready    ${txt_tab}

Click Tab Return Business
    ${txt_tab}=    Replace String    ${register_tab_parcel_type_full_register}    {value}    ${Register.Full_register['txt_tab_return_business']}
    common.Click when ready    ${txt_tab}

Click Select Dry Parcel
    ${button_select}=    Replace String    ${register_btn_select_dry_parcel}    {value}    ${Register.Full_register['txt_btn_select_parcel']}
    common.Click when ready    ${button_select}

Click Select Chill Parcel
    ${button_select}=    Replace String    ${register_btn_select_chill_parcel}    {value}    ${Register.Full_register['txt_btn_select_parcel']}
    common.Click when ready    ${button_select}

Click Select Return Business
    ${button_select}=    Replace String    ${register_btn_select_return_business}    {value}    ${Register.Full_register['txt_btn_select_parcel']}
    common.Click when ready    ${button_select}

Select Add Service Cod Dry Parcel
    common.Click when ready    ${register_btn_add_cod_dry_parcel}

Select Add Service Insuaration Dry Parcel
    common.Click when ready    ${register_btn_add_insurance_dry_parcel}

Select Add Service Cod Chill Parcel
    common.Click when ready    ${register_btn_add_cod_chill_parcel}

Select Add Service Express Return Business
    common.Click when ready    ${register_btn_add_express_return_business} 

Select Add Service Insuaration Return Business
    common.Click when ready    ${register_btn_add_insurance_return_business}   

# Select Type Product Dry Parcel


# Select Number By Day Dry Parcel


# Select Sale Channel Dry Parcel

# Select Vat Dry Parcel

# Input Remark Dry Parcel



# Select Type Product Chill Parcel


# Select Number By Day Chill Parcel


# Select Sale Channel Chill Parcel

# Select Vat Chill Parcel

# Input Remark Chill Parcel



# Select Type Product Return Business


# Select Number By Day Return Business


# Select Sale Channel Return Business

# Select Vat Return Business

# Input Remark Return Business

Verify Service Information Page Tab Dry Parcel  
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['txt_title_service_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_header_service_information']}
    
    Scroll Window To Vertical    0
    Page Should Contain Element    ${txt_title}
    Click Tab Dry Parcel   
    Page Should Contain Element    ${txt_header}

    ${txt_add_cod}=    Get Text    ${register_btn_add_cod_dry_parcel}
    ${txt_add_insuaration}=    Get Text    ${register_btn_add_insurance_dry_parcel}
    ${txt_sub_topic}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_service_usage_information_topic']}
    ${label_type_product}=    Get Text    ${register_txt_type_product_general_dry_parcel}
    ${label_number_by_day}=    Get Text    ${register_txt_number_by_day_dry_parcel}
    ${label_sale_channel}=    Get Text    ${register_txt_sale_channel_dry_parcel}
    ${label_vat}=    Get Text    ${register_txt_vat_dry_parcel}
    ${label_remark}=    Get Text   ${register_txt_remark_dry_parcel} 

    Should Be Equal As Strings    ${txt_add_cod}    ${Register.Full_register['txt_btn_add_service_cod']}
    Should Be Equal As Strings    ${txt_add_insuaration}    ${Register.Full_register['txt_btn_add_service_insurance']}
    Page Should Contain Element    ${txt_sub_topic}
    Should Be Equal As Strings    ${label_type_product}    ${Register.Full_register['txt_type_product']}
    Should Be Equal As Strings    ${label_number_by_day}    ${Register.Full_register['txt_number_by_day']}
    Should Be Equal As Strings    ${label_sale_channel}    ${Register.Full_register['txt_sale_channel']}
    Should Be Equal As Strings    ${label_vat}    ${Register.Full_register['txt_vat']}
    Should Be Equal As Strings    ${label_remark}    ${Register.Full_register['txt_remark']}

Verify Service Information Page Tab Chill Parcel
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['txt_title_service_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_header_service_information']}
     
    Scroll Window To Vertical    0 
    Page Should Contain Element    ${txt_title}
    Click Tab Chill Parcel
    Page Should Contain Element    ${txt_header}

    ${txt_add_cod}=    Get Text    ${register_btn_add_cod_chill_parcel}
    ${txt_sub_topic}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_service_usage_information_topic']}
    ${label_type_product}=    Get Text    ${register_txt_type_product_general_chill_parcel}
    ${label_number_by_day}=    Get Text    ${register_txt_number_by_day_chill_parcel}
    ${label_sale_channel}=    Get Text    ${register_txt_sale_channel_chill_parcel}
    ${label_vat}=    Get Text    ${register_txt_vat_chill_parcel}
    ${label_remark}=    Get Text   ${register_txt_remark_chill_parcel} 

    Should Be Equal As Strings    ${txt_add_cod}    ${Register.Full_register['txt_btn_add_service_cod']}
    Page Should Contain Element    ${txt_sub_topic}     
    Should Be Equal As Strings    ${label_type_product}    ${Register.Full_register['txt_type_product']}
    Should Be Equal As Strings    ${label_number_by_day}    ${Register.Full_register['txt_number_by_day']}
    Should Be Equal As Strings    ${label_sale_channel}    ${Register.Full_register['txt_sale_channel']}
    Should Be Equal As Strings    ${label_vat}    ${Register.Full_register['txt_vat_chill']}
    Should Be Equal As Strings    ${label_remark}    ${Register.Full_register['txt_remark']}


Verify Service Information Page Tab Return Business
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['txt_title_service_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_header_service_information']}
     
    Scroll Window To Vertical    0
    Page Should Contain Element    ${txt_title}
    Click Tab Return Business
    Page Should Contain Element    ${txt_header}

    ${txt_add_express}=    Get Text    ${register_btn_add_express_return_business}
    ${txt_add_insuaration}=    Get Text    ${register_btn_add_insurance_return_business}
    
    ${txt_sub_topic}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['txt_service_usage_information_topic']}
    ${label_type_product}=    Get Text    ${register_txt_type_product_general_return_business}
    ${label_number_by_day}=    Get Text    ${register_txt_number_by_day_return_business}
    ${label_sale_channel}=    Get Text    ${register_txt_sale_channel_return_business}
    ${label_vat}=    Get Text    ${register_txt_vat_return_business}
    ${label_remark}=    Get Text    ${register_txt_remark_return_business} 

    Should Be Equal As Strings    ${txt_add_express}    ${Register.Full_register['txt_btn_add_service_express']}
    Should Be Equal As Strings    ${txt_add_insuaration}    ${Register.Full_register['txt_btn_add_service_insurance']}
    Page Should Contain Element    ${txt_sub_topic}
    Should Be Equal As Strings    ${label_type_product}    ${Register.Full_register['txt_type_product']}
    Should Be Equal As Strings    ${label_number_by_day}    ${Register.Full_register['txt_number_by_day']}
    Should Be Equal As Strings    ${label_sale_channel}    ${Register.Full_register['txt_sale_channel']}
    Should Be Equal As Strings    ${label_vat}    ${Register.Full_register['txt_vat']}
    Should Be Equal As Strings    ${label_remark}    ${Register.Full_register['txt_remark']}


#All page
Click Next 
    ${click_next}=    Replace String    ${register_btn_next_full_register}     {value}    ${Register.Full_register['btn_next']}
    common.Click when ready    ${click_next}
    
Click Cancel
    ${click_cancel}=    Replace String    ${register_btn_cancel_full_register}     {value}    ${Register.Full_register['btn_cancel']}
    common.Click when ready    ${click_cancel}

Click Save
    ${click_save}=    Replace String    ${register_btn_save_full_register}     {value}    ${Register.Full_register['btn_save']}
    common.Click when ready    ${click_save}

Verify Cancel Popup
    [Arguments]    ${header}    ${body}
    ${header_cancel_popup}=    Replace String    ${register_txt_header_cancel_popup_full_register}     {value}    ${header}
    Element Should Be Visible    ${header_cancel_popup}
    ${body_cancel_popup}=    Replace String    ${register_txt_body_cancel_popup_full_register}     {value}    ${body}
    Element Should Be Visible    ${body_cancel_popup} 

Click Button Confirm Cancel Popup
    ${click_button}=    Replace String    ${register_btn_cancel_popup_full_register}     {value}    ${Register.Full_register['confirm_cancel_popup']}
    common.Click when ready    ${click_button}       

Click Confirm
    ${click_confirm}=    Replace String    ${register_btn_confirm_full_register}     {value}    ${Register.Full_register['btn_confirm']}
    common.Click when ready    ${click_confirm}
    
