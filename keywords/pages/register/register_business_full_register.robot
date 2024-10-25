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
    ${select_link}=    Replace String    ${register_txt_link_register_gmail}     {value}    ${Register.Full_register['text_link_register']}
    ${select_link}=    Replace String    ${select_link}     {link}    ${rm_link_full_register}
    Scroll Into View By Xpath    ${select_link}    true

#Legal Entity
Verify Company Information Legal Entity Page
    [Arguments]    ${partner_type}    ${company_title_name}    ${company_name}    ${id_number}    
    ...    ${company_address}    ${select_company_address_full}    ${mobile_company}    ${mobile_company_ext}
    ...    ${title_name}    ${first_name}    ${last_name}    ${email}    ${mobile_no}    ${mobile_ext}
    #หัวข้อข้อมูลบริษัท
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_company_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_company_information']}
        
    Page Should Contain Element    ${txt_title}
    Wait Until Element Is Visible    ${txt_header}
    ${label_partner_type}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_partner_type']}
    ${txt_partner_type}=    Get Value    ${register_btn_partner_types_full_register}
    ${label_company_title_name}=    Get Text    ${register_txt_company_title_name} 
    ${txt_company_title_name}=    Get Text    ${register_cbo_company_title_name_full_register} 
    ${label_company_name}=    Get Text    ${register_txt_company_name}
    ${txt_company_name}=    Get Value    ${register_txtbox_company_name_full_register}
    ${label_id_number}=    Get Text    ${register_txt_id_number}
    ${txt_id_number}=    Get Value    ${register_txtbox_juristic_identification_number_full_register} 
    ${label_company_address}=    Get Text    ${register_txt_company_address}
    ${txt_company_address}=    Get Value    ${register_txtbox_company_address_full_register}
    ${label_select_company_address_full}=    Get Text    ${register_txt_company_address_full}
    ${txt_select_company_address_full}=    Get Text    ${register_cbo_company_address_full_full_register}
    ${label_mobile_company}=    Get Text    ${register_txt_mobile_company}
    ${txt_mobile_company}=     Get Value    ${register_txtbox_mobile_company_full_register}
    ${label_mobile_company_ext}=    Get Text    ${register_txt_mobile_company_ext}
    ${txt_mobile_company_ext}=     Get Value    ${register_txtbox_mobile_company_ext_full_register}
    ${txt_sub_topic}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_contact_information']}
    ${label_title_name}=    Get Text    ${register_txt_title_name}
    ${txt_title_name}=    Get Text    ${register_cbo_title_name_full_register}
    ${label_first_name}=    Get Text    ${register_txt_first_name}
    ${txt_first_name}=    Get Value    ${register_txtbox_first_name_full_register}
    ${label_last_name}=    Get Text    ${register_txt_last_name}
    ${txt_last_name}=    Get Value    ${register_txtbox_last_name_full_register}
    ${label_email}=    Get Text    ${register_txt_email}
    ${txt_email}=    Get Value    ${register_txtbox_email_full_register}
    ${label_mobile_no}=    Get Text    ${register_txt_mobile_no}
    ${txt_mobile_no}=    Get Value    ${register_txtbox_mobile_no_full_register}
    ${label_mobile_ext}=    Get Text    ${register_txt_mobile_ext}
    ${txt_mobile_ext}=    Get Value    ${register_txtbox_mobile_ext_full_register}

    Page Should Contain Element    ${label_partner_type}
    Should Be Equal As Strings    ${txt_partner_type}    ${partner_type}
    Should Be Equal As Strings    ${label_company_title_name} ${txt_company_title_name}    ${Register.Full_register['text_company_title_name']} ${company_title_name}
    Should Be Equal As Strings    ${label_company_name} ${txt_company_name}    ${Register.Full_register['text_company_name']} ${company_name}
    Should Be Equal As Strings    ${label_id_number} ${txt_id_number}    ${Register.Full_register['text_id_number']} ${id_number}
    Should Be Equal As Strings    ${label_company_address} ${txt_company_address}    ${Register.Full_register['text_company_address']} ${company_address}
    Should Be Equal As Strings    ${label_select_company_address_full} ${txt_select_company_address_full}    ${Register.Full_register['text_company_address_full']} ${select_company_address_full}
    Should Be Equal As Strings    ${label_mobile_company} ${txt_mobile_company}    ${Register.Full_register['text_mobile_company']} ${txt_mobile_company}
    Should Be Equal As Strings    ${label_mobile_company_ext} ${txt_mobile_company_ext}    ${Register.Full_register['text_mobile_company_extra']} ${txt_mobile_company_ext}
    Page Should Contain Element    ${txt_sub_topic}
    Should Be Equal As Strings    ${label_title_name} ${txt_title_name}    ${Register.Full_register['text_title_name']} ${title_name}
    Should Be Equal As Strings    ${label_first_name} ${txt_first_name}    ${Register.Full_register['text_first_name']} ${first_name}
    Should Be Equal As Strings    ${label_last_name} ${txt_last_name}    ${Register.Full_register['text_last_name']} ${last_name}
    Should Be Equal As Strings    ${label_email} ${txt_email}    ${Register.Full_register['text_email']} ${email}
    Should Be Equal As Strings    ${label_mobile_no} ${txt_mobile_no}    ${Register.Full_register['text_mobile']} ${mobile_no}
    Should Be Equal As Strings    ${label_mobile_ext} ${txt_mobile_ext}    ${Register.Full_register['text_mobile_extra']} ${mobile_ext}

Input Mobile Company Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_company_full_register}     ${value}  

Input Mobile Company Ext Legal Entity
    [Arguments]    ${value}  
    common.Input When Ready    ${register_txtbox_mobile_company_ext_full_register}     ${value}

Verify Supporting Document Page Legal Entity
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_supporting_document']} 
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_supporting_document']}
    ${txt_certificate_business_registration}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_certificate_business_registration']}
    ${txt_copy_file_20}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_copy_file_20']}
    ${txt_copy_id_card}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_copy_id_card']}
    ${txt_copy_of_bank_account}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_copy_of_bank_account']}
    ${txt_copy_of_house_registration}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_copy_of_house_registration']}
    ${txt_permission_form}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_permission_form']}
    ${txt_other_file}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_other_file']}
    ${txt_terms_of_service}=    Replace String    ${register_txt_term_and_privacy}    {value}    ${Register.Full_register['text_terms_of_service']}
    ${txt_privacy_policy}=    Replace String    ${register_txt_term_and_privacy}    {value}    ${Register.Full_register['text_privacy_policy']}

    Page Should Contain Element    ${txt_title}
    Page Should Contain Element    ${txt_header}
    Page Should Contain Element    ${txt_certificate_business_registration}
    Page Should Contain Element    ${txt_copy_file_20}
    Page Should Contain Element    ${txt_copy_id_card}
    Page Should Contain Element    ${txt_copy_of_bank_account}
    Page Should Contain Element    ${txt_copy_of_house_registration}
    Page Should Contain Element    ${txt_permission_form}
    Page Should Contain Element    ${txt_other_file}
    Page Should Contain Element    ${txt_terms_of_service}
    Page Should Contain Element    ${txt_privacy_policy}

 #Uploadfile
Cancel Block Input Upload
    Execute JavaScript    Array.from(document.querySelectorAll('input[name="file"]')).forEach(el => el.style.display = 'block');
    
Upload Certificate Business Registration
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    Cancel Block Input Upload
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['text_certificate_business_registration']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Copy File 20
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    Cancel Block Input Upload
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['text_copy_file_20']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Copy ID Card
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    Cancel Block Input Upload
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['text_copy_id_card']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Copy Of Bank Account
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    Cancel Block Input Upload
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['text_copy_of_bank_account']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Copy Of House Registration
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    Cancel Block Input Upload
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['text_copy_of_house_registration']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Permission form for Deduction from Bank Account
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    Cancel Block Input Upload
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['text_permission_form']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Upload Other File
    [Arguments]    ${file_path}
    ${file}    Normalize Path    ${file_path}
    Cancel Block Input Upload
    ${btn_upload}=    Replace String    ${register_btn_upload_full_register}     {value}    ${Register.Full_register['text_other_file']}
    Wait Until Element Is Visible    ${btn_upload}    timeout=${DEFAULT_TIMEOUT}
    Choose File    ${btn_upload}    ${file}

Click Acceptance Terms of Service
    ${click_checkbox}=    Replace String    ${register_btn_accept_terms_of_service_full_register}     {value}    ${Register.Full_register['text_terms_of_service']}
    Scroll Element Into View    ${click_checkbox}
    Select Checkbox    ${click_checkbox}

Click Acceptance Privacy Policy
    ${click_checkbox}=    Replace String    ${register_btn_accept_privacy_policy_full_register}     {value}    ${Register.Full_register['text_privacy_policy']}
    Scroll Element Into View    ${click_checkbox}
    Select Checkbox    ${click_checkbox}

#Individual
Verify Company Information Individual Page
    [Arguments]    ${partner_type}    ${title_name}    ${first_name}    ${last_name}    
    ...    ${id_number}    ${email}    ${company_address}
    ...    ${select_company_address_full}    ${mobile_no}    ${mobile_ext}
    #หัวข้อข้อมูลบริษัท
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_company_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_company_information']}
        
    Page Should Contain Element    ${txt_title}
    Wait Until Element Is Visible    ${txt_header}

    ${label_partner_type}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_partner_type']}
    ${txt_partner_type}=    Get Value    ${register_btn_partner_types_full_register}
    ${label_title_name}=    Get Text    ${register_txt_title_name}
    ${txt_title_name}=    Get Text    ${register_cbo_title_name_full_register}    
    ${label_first_name}=    Get Text    ${register_txt_first_name}
    ${txt_first_name}=    Get Value    ${register_txtbox_first_name_full_register}
    ${label_last_name}=    Get Text    ${register_txt_last_name}
    ${txt_last_name}=    Get Value    ${register_txtbox_last_name_full_register}   
    ${label_id_number}=    Get Text    ${register_txt_id_number}
    ${txt_id_number}=    Get Value    ${register_txtbox_juristic_identification_number_full_register}
    ${label_email}=    Get Text    ${register_txt_email}
    ${txt_email}=    Get Value    ${register_txtbox_email_full_register}   
    ${label_company_address}=    Get Text    ${register_txt_company_address}
    ${txt_company_address}=    Get Value    ${register_txtbox_company_address_full_register}
    ${label_select_company_address_full}=    Get Text    ${register_txt_company_address_full}
    ${txt_select_company_address_full}=    Get Text    ${register_cbo_company_address_full_full_register}
    ${label_mobile_no}=    Get Text    ${register_txt_mobile_no}
    ${txt_mobile_no}=    Get Value    ${register_txtbox_mobile_no_full_register}
    ${label_mobile_ext}=    Get Text    ${register_txt_mobile_ext}
    ${txt_mobile_ext}=    Get Value    ${register_txtbox_mobile_ext_full_register}

    Page Should Contain Element    ${label_partner_type}
    Should Be Equal As Strings    ${txt_partner_type}    ${partner_type}
    Should Be Equal As Strings    ${label_title_name} ${txt_title_name}    ${Register.Full_register['text_title_name']} ${title_name}
    Should Be Equal As Strings    ${label_first_name} ${txt_first_name}    ${Register.Full_register['text_customer_first_name']} ${first_name}
    Should Be Equal As Strings    ${label_last_name} ${txt_last_name}    ${Register.Full_register['text_last_name']} ${last_name}
    Should Be Equal As Strings    ${label_id_number} ${txt_id_number}    ${Register.Full_register['text_id_card_number']} ${id_number}
    Should Be Equal As Strings    ${label_email} ${txt_email}    ${Register.Full_register['text_email']} ${email}   
    Should Be Equal As Strings    ${label_company_address} ${txt_company_address}    ${Register.Full_register['text_company_address']} ${company_address}
    Should Be Equal As Strings    ${label_select_company_address_full} ${txt_select_company_address_full}    ${Register.Full_register['text_company_address_full']} ${select_company_address_full}
    Should Be Equal As Strings    ${label_mobile_no} ${txt_mobile_no}    ${Register.Full_register['text_mobile']} ${mobile_no}
    Should Be Equal As Strings    ${label_mobile_ext} ${txt_mobile_ext}    ${Register.Full_register['text_mobile_extra']} ${mobile_ext}

Verify Supporting Document Page Individual
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_supporting_document']} 
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_supporting_document']}
    ${txt_copy_id_card}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_copy_id_card']}
    ${txt_copy_of_house_registration}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_copy_of_house_registration']}
    ${txt_copy_of_bank_account}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_copy_of_bank_account']}
    ${txt_permission_form}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_permission_form']}
    ${txt_other_file}=    Replace String    ${register_txt_topic_full_register}    {value}    ${Register.Full_register['text_other_file']}
    ${txt_terms_of_service}=    Replace String    ${register_txt_term_and_privacy}    {value}    ${Register.Full_register['text_terms_of_service']}
    ${txt_privacy_policy}=    Replace String    ${register_txt_term_and_privacy}    {value}    ${Register.Full_register['text_privacy_policy']}

    Page Should Contain Element    ${txt_title}
    Page Should Contain Element    ${txt_header}
    Page Should Contain Element    ${txt_copy_id_card}
    Page Should Contain Element    ${txt_copy_of_house_registration}
    Page Should Contain Element    ${txt_copy_of_bank_account}
    Page Should Contain Element    ${txt_permission_form}
    Page Should Contain Element    ${txt_other_file}
    Page Should Contain Element    ${txt_terms_of_service}
    Page Should Contain Element    ${txt_privacy_policy}


#Both
 #Service Information
Click Tab Dry Parcel
    common.Scroll Window To Vertical    0 
    ${txt_tab}=    Replace String    ${register_tab_parcel_type_full_register}    {value}    ${Register.Full_register['text_tab_dry_parcel']}
    common.Click when ready    ${txt_tab}

Click Tab Chill Parcel
    common.Scroll Window To Vertical    0 
    ${txt_tab}=    Replace String    ${register_tab_parcel_type_full_register}    {value}    ${Register.Full_register['text_tab_chill_parcel']}
    common.Click when ready    ${txt_tab}

Click Tab Return Business
    common.Scroll Window To Vertical    0 
    ${txt_tab}=    Replace String    ${register_tab_parcel_type_full_register}    {value}    ${Register.Full_register['text_tab_return_business']}
    common.Click when ready    ${txt_tab}

Click Select Dry Parcel
    ${button_select}=    Replace String    ${register_btn_select_dry_parcel}    {value}    ${Register.Full_register['text_btn_select_parcel']}
    common.Click when ready    ${button_select}

Click Select Chill Parcel
    ${button_select}=    Replace String    ${register_btn_select_chill_parcel}    {value}    ${Register.Full_register['text_btn_select_parcel']}
    common.Click when ready    ${button_select}

Click Select Return Business
    ${button_select}=    Replace String    ${register_btn_select_return_business}    {value}    ${Register.Full_register['text_btn_select_parcel']}
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

Select Type Product Dry Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_type_product_dry_parcel}
    ${selected_type_product}=    Replace String    ${register_cbo_choice_checkbox}    {value}    ${value}
    common.Click when ready     ${selected_type_product}

Select Number By Day Dry Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_number_by_day_dry_parcel}
    ${selected_number_by_day}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_number_by_day}

Select Sale Channel Dry Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_sale_channel_dry_parcel}
    ${selected_sale_channel}=    Replace String    ${register_cbo_choice_checkbox}    {value}    ${value}
    common.Click when ready     ${selected_sale_channel}

Select Vat Dry Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_vat_dry_parcel}
    ${selected_vat}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_vat}

Input Remark Dry Parcel
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_remark_dry_parcel}     ${value}


Select Type Product Chill Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_type_product_chill_parcel}
    ${selected_type_product}=    Replace String    ${register_cbo_choice_checkbox}    {value}    ${value}
    common.Click when ready     ${selected_type_product}

Select Number By Day Chill Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_number_by_day_chill_parcel}
    ${selected_number_by_day}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_number_by_day}

Select Sale Channel Chill Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_sale_channel_chill_parcel}
    ${selected_sale_channel}=    Replace String    ${register_cbo_choice_checkbox}    {value}    ${value}
    common.Click when ready     ${selected_sale_channel}

Select Vat Chill Parcel
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_vat_chill_parcel}
    ${selected_vat}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_vat}

Input Remark Chill Parcel
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_remark_chill_parcel}     ${value}


Select Type Product Return Business
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_type_product_return_business} 
    ${selected_type_product}=    Replace String    ${register_cbo_choice_checkbox}    {value}    ${value}
    common.Click when ready     ${selected_type_product}

Select Number By Day Return Business
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_number_by_day_return_business}
    ${selected_number_by_day}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_number_by_day}

Select Sale Channel Return Business
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_sale_channel_return_business}
    ${selected_sale_channel}=    Replace String    ${register_cbo_choice_checkbox}    {value}    ${value}
    common.Click when ready     ${selected_sale_channel}

Select Vat Return Business
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_vat_return_business}
    ${selected_vat}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_vat}

Input Remark Return Business
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_remark_return_business}     ${value}

Verify Service Information Page Tab Dry Parcel
    [Arguments]    ${type_product}=${EMPTY}    ${number_by_day}=${Register.Full_register['text_input_default']}    ${sale_channel}=${EMPTY}    
    ...    ${vat}=${Register.Full_register['text_input_vat_default']}    ${remark}=${EMPTY}
    
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_service_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_service_information']}
    
    common.Scroll Window To Vertical    0
    Page Should Contain Element    ${txt_title}
    Click Tab Dry Parcel   
    Page Should Contain Element    ${txt_header}

    ${txt_add_cod}=    Get Text    ${register_btn_add_cod_dry_parcel}
    ${txt_add_insuaration}=    Get Text    ${register_btn_add_insurance_dry_parcel}
    ${txt_sub_topic}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_service_usage_information_topic']}
    ${label_type_product}=    Get Text    ${register_txt_type_product_general_dry_parcel}
    ${txt_type_product}=    Get Text    ${register_txtbox_type_product_dry_parcel}
    ${label_number_by_day}=    Get Text    ${register_txt_number_by_day_dry_parcel}
    ${txt_number_by_day}=    Get Text    ${register_cbo_number_by_day_dry_parcel}
    ${label_sale_channel}=    Get Text    ${register_txt_sale_channel_dry_parcel}
    ${txt_sale_channel}=    Get Text    ${register_txtbox_sale_channel_dry_parcel}
    ${label_vat}=    Get Text    ${register_txt_vat_dry_parcel}
    ${txt_vat}=    Get Text    ${register_cbo_vat_dry_parcel}
    ${label_remark}=    Get Text    ${register_txt_remark_dry_parcel}
    ${txt_remark}=    Get Text    ${register_txtbox_remark_dry_parcel}

    Should Be Equal As Strings    ${txt_add_cod}    ${Register.Full_register['text_btn_add_service_cod']}
    Should Be Equal As Strings    ${txt_add_insuaration}    ${Register.Full_register['text_btn_add_service_insurance']}
    Page Should Contain Element    ${txt_sub_topic}
    Should Be Equal As Strings    ${label_type_product} ${txt_type_product}    ${Register.Full_register['text_type_product']} ${type_product}
    Should Be Equal As Strings    ${label_number_by_day} ${txt_number_by_day}    ${Register.Full_register['text_number_by_day']} ${number_by_day}
    Should Be Equal As Strings    ${label_sale_channel} ${txt_sale_channel}    ${Register.Full_register['text_sale_channel']} ${sale_channel}
    Should Be Equal As Strings    ${label_vat} ${txt_vat}    ${Register.Full_register['text_vat']} ${vat}
    Should Be Equal As Strings    ${label_remark} ${txt_remark}    ${Register.Full_register['text_remark']} ${remark}

Verify Service Information Page Tab Chill Parcel
    [Arguments]    ${type_product}=${EMPTY}    ${number_by_day}=${Register.Full_register['text_input_default']}    ${sale_channel}=${EMPTY}    
    ...    ${vat}=${Register.Full_register['text_input_vat_default']}    ${remark}=${EMPTY}
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_service_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_service_information']}
     
    common.Scroll Window To Vertical    0 
    Page Should Contain Element    ${txt_title}
    Click Tab Chill Parcel
    Page Should Contain Element    ${txt_header}

    ${txt_add_cod}=    Get Text    ${register_btn_add_cod_chill_parcel}
    ${txt_sub_topic}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_service_usage_information_topic']}
    ${label_type_product}=    Get Text    ${register_txt_type_product_general_chill_parcel}
    ${txt_type_product}=    Get Text    ${register_txtbox_type_product_chill_parcel}
    ${label_number_by_day}=    Get Text    ${register_txt_number_by_day_chill_parcel}
    ${txt_number_by_day}=    Get Text    ${register_cbo_number_by_day_chill_parcel}
    ${label_sale_channel}=    Get Text    ${register_txt_sale_channel_chill_parcel}
    ${txt_sale_channel}=    Get Text    ${register_txtbox_sale_channel_chill_parcel}
    ${label_vat}=    Get Text    ${register_txt_vat_chill_parcel}
    ${txt_vat}=    Get Text    ${register_cbo_vat_chill_parcel}
    ${label_remark}=    Get Text   ${register_txt_remark_chill_parcel}
    ${txt_remark}=    Get Text    ${register_txtbox_remark_chill_parcel} 

    Should Be Equal As Strings    ${txt_add_cod}    ${Register.Full_register['text_btn_add_service_cod']}
    Page Should Contain Element    ${txt_sub_topic}     
    Should Be Equal As Strings    ${label_type_product} ${txt_type_product}    ${Register.Full_register['text_type_product']} ${type_product}
    Should Be Equal As Strings    ${label_number_by_day} ${txt_number_by_day}    ${Register.Full_register['text_number_by_day']} ${number_by_day}
    Should Be Equal As Strings    ${label_sale_channel} ${txt_sale_channel}    ${Register.Full_register['text_sale_channel']} ${sale_channel}
    Should Be Equal As Strings    ${label_vat} ${txt_vat}    ${Register.Full_register['text_vat_chill']} ${vat}
    Should Be Equal As Strings    ${label_remark} ${txt_remark}    ${Register.Full_register['text_remark']} ${remark}


Verify Service Information Page Tab Return Business
   [Arguments]    ${type_product}=${EMPTY}    ${number_by_day}=${Register.Full_register['text_input_default']}    ${sale_channel}=${EMPTY}    
    ...    ${vat}=${Register.Full_register['text_input_vat_default']}    ${remark}=${EMPTY}
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_service_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_service_information']}
     
    common.Scroll Window To Vertical    0
    Page Should Contain Element    ${txt_title}
    Click Tab Return Business
    Page Should Contain Element    ${txt_header}

    ${txt_add_express}=    Get Text    ${register_btn_add_express_return_business}
    ${txt_add_insuaration}=    Get Text    ${register_btn_add_insurance_return_business}
    
    ${txt_sub_topic}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_service_usage_information_topic']}
    ${label_type_product}=    Get Text    ${register_txt_type_product_general_return_business}
    ${txt_type_product}=    Get Text    ${register_txtbox_type_product_return_business}
    ${label_number_by_day}=    Get Text    ${register_txt_number_by_day_return_business}
    ${txt_number_by_day}=    Get Text    ${register_cbo_number_by_day_return_business}
    ${label_sale_channel}=    Get Text    ${register_txt_sale_channel_return_business}
    ${txt_sale_channel}=    Get Text    ${register_txtbox_sale_channel_return_business}
    ${label_vat}=    Get Text    ${register_txt_vat_return_business}
    ${txt_vat}=    Get Text    ${register_cbo_vat_return_business}
    ${label_remark}=    Get Text    ${register_txt_remark_return_business}
    ${txt_remark}=    Get Text    ${register_txtbox_remark_return_business} 

    Should Be Equal As Strings    ${txt_add_express}    ${Register.Full_register['text_btn_add_service_express']}
    Should Be Equal As Strings    ${txt_add_insuaration}    ${Register.Full_register['text_btn_add_service_insurance']}
    Page Should Contain Element    ${txt_sub_topic}
    Should Be Equal As Strings    ${label_type_product} ${txt_type_product}    ${Register.Full_register['text_type_product']} ${type_product}
    Should Be Equal As Strings    ${label_number_by_day} ${txt_number_by_day}    ${Register.Full_register['text_number_by_day']} ${number_by_day}
    Should Be Equal As Strings    ${label_sale_channel} ${txt_sale_channel}    ${Register.Full_register['text_sale_channel']} ${sale_channel}
    Should Be Equal As Strings    ${label_vat} ${txt_vat}    ${Register.Full_register['text_vat']} ${vat}
    Should Be Equal As Strings    ${label_remark} ${txt_remark}    ${Register.Full_register['text_remark']} ${remark}

Click Add Contact Information
    ${btn_add}=    Replace String    ${register_btn_add_contact_info}    {value}    ${Register.Full_register['text_contact_information']}
    common.Click When Ready  ${btn_add}

Verify Contact And Bank Information Page
    ${txt_title}=    Replace String    ${register_txt_title_full_register}    {value}    ${Register.Full_register['text_title_contact_and_bank_information']}
    ${txt_header}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_header_contact_and_bank_information']}
     
    #common.Scroll Window To Vertical    0 
    Page Should Contain Element    ${txt_title}
    Page Should Contain Element    ${txt_header}

    ${txt_sub_topic_contact}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_contact_information_topic']}
    ${label_user_name}=    Get text    ${register_txt_user_name}
    ${label_user_position}=   Get text    ${register_txt_user_position}
    ${label_user_email}=   Get text    ${register_txt_user_email}
    ${label_user_phone}=   Get text    ${register_txt_user_phone}
    ${label_user_phone_ex}=   Get text    ${register_txt_user_phone_ex}
    ${txt_sub_topic_bank}=    Replace String    ${register_txt_header_full_register}    {value}    ${Register.Full_register['text_bank_information_topic']}
    ${label_bank_id}=    Get text    ${register_txt_bank_id}
    ${label_bank_name}=    Get text    ${register_txt_bank_name}
    ${label_bank_account_type}=    Get text    ${register_txt_bank_account_type}
    ${label_bank_branch}=    Get text    ${register_txt_bank_branch}
    ${label_bank_account_name}=    Get text    ${register_txt_bank_account_name}
    ${label_bank_account_no}=    Get text    ${register_txt_bank_account_no}

    Page Should Contain Element    ${txt_sub_topic_contact}
    Should Be Equal As Strings    ${label_user_name}    ${Register.Full_register['text_user_name']}
    Should Be Equal As Strings    ${label_user_position}    ${Register.Full_register['text_user_position']}
    Should Be Equal As Strings    ${label_user_email}    ${Register.Full_register['text_user_email']}
    Should Be Equal As Strings    ${label_user_phone}    ${Register.Full_register['text_user_phone']}
    Should Be Equal As Strings    ${label_user_phone_ex}    ${Register.Full_register['text_user_phone_ex']}
    Page Should Contain Element    ${txt_sub_topic_bank}
    Should Be Equal As Strings    ${label_bank_id}    ${Register.Full_register['text_bank_id']}
    Should Be Equal As Strings    ${label_bank_account_type}    ${Register.Full_register['text_bank_account_type']}
    Should Be Equal As Strings    ${label_bank_name}    ${Register.Full_register['text_bank_name']}
    Should Be Equal As Strings    ${label_bank_branch}    ${Register.Full_register['text_bank_branch']}
    Should Be Equal As Strings    ${label_bank_account_name}    ${Register.Full_register['text_bank_account_name']}
    Should Be Equal As Strings    ${label_bank_account_no}    ${Register.Full_register['text_bank_account_no']}

Input User Name
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_user_name}     ${value}

Input User Position
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_user_position}     ${value}

Input User Email
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_user_email}     ${value}

Input User Phone
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_user_phone}     ${value}

Input User Phone Ex
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_user_phone_ex}     ${value}

Select Bank Id
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_bank_id}
    ${selected_bank_id}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_bank_id}

Select Bank Name
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_bank_name}
    ${selected_bank_name}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_bank_name}

Select Bank Accont Type
   [Arguments]    ${value}
    common.Click when ready    ${register_cbo_bank_account_type}
    ${selected_bank_account_type}=    Replace String    ${register_cbo_choice_select}     {value}    ${value}
    common.Click when ready     ${selected_bank_account_type}

Input Bank Branch
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_bank_branch}     ${value}

Input Bank Account Name
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_bank_account_name}     ${value}

Input Bank Account No
   [Arguments]    ${value}
   common.Input When Ready    ${register_txtbox_bank_account_no}     ${value}






#All page
Click Next 
    ${click_next}=    Replace String    ${register_btn_next_full_register}     {value}    ${Register.Full_register['btn_next']}
    common.Click when ready    ${click_next}
    Scroll Window To Vertical    0 

Click Cancel
    ${click_cancel}=    Replace String    ${register_btn_cancel_full_register}     {value}    ${Register.Full_register['btn_cancel']}
    common.Click when ready    ${click_cancel}

Verify Cancel Popup
    [Arguments]    ${header}    ${body}
    ${header_cancel_popup}=    Replace String    ${register_txt_header_cancel_popup_full_register}     {value}    ${header}
    Element Should Be Visible    ${header_cancel_popup}
    ${body_cancel_popup}=    Replace String    ${register_txt_body_cancel_popup_full_register}     {value}    ${body}
    Element Should Be Visible    ${body_cancel_popup} 

Click Button Confirm Cancel Popup
    ${click_button}=    Replace String    ${register_btn_cancel_popup_full_register}     {value}    ${Register.Full_register['confirm_cancel_popup']}
    common.Click when ready    ${click_button} 

Click Remark
    ${click_remark}=    Replace String    ${register_btn_remark_full_register}      {value}    ${Register.Full_register['btn_remark']}
    common.Click when ready    ${click_remark}

Verify Remark Popup
    [Arguments]     ${remark_1}=${Register.Full_register['text_no_remark']}    ${remark_2}=${Register.Full_register['text_no_remark']}
    ...    ${remark_3}=${Register.Full_register['text_no_remark']}    ${remark_4}=${Register.Full_register['text_no_remark']}

    ${header_remark_popup}=    Replace String    ${register_txt_header_remark_popup}     {value}    ${Register.Full_register['text_header_remark']}
    Element Should Be Visible    ${header_remark_popup}
    
    ${header_1}=    Replace String    ${register_txt_in_remark_popup}     {value}    1
    ${text_1}=    Replace String    ${register_txt_in_remark_popup}     {value}    2
    ${header_2}=    Replace String    ${register_txt_in_remark_popup}     {value}    3
    ${text_2}=    Replace String    ${register_txt_in_remark_popup}     {value}    4
    ${header_3}=    Replace String    ${register_txt_in_remark_popup}     {value}    5
    ${text_3}=    Replace String    ${register_txt_in_remark_popup}     {value}    6
    ${header_4}=    Replace String    ${register_txt_in_remark_popup}     {value}    7
    ${text_4}=    Replace String    ${register_txt_in_remark_popup}     {value}    8

    ${label_remark_1}=    Get Text    ${header_1}
    ${txt_remark_1}=    Get Text    ${text_1}
    ${label_remark_2}=    Get Text    ${header_2}
    ${txt_remark_2}=    Get Text    ${text_2}
    ${label_remark_3}=    Get Text    ${header_3}
    ${txt_remark_3}=    Get Text    ${text_3}
    ${label_remark_4}=    Get Text    ${header_4}
    ${txt_remark_4}=    Get Text    ${text_4}

    Should Be Equal As Strings    ${label_remark_1} ${txt_remark_1}   ${Register.Full_register['text_remark_page_1']} ${remark_1}
    Should Be Equal As Strings    ${label_remark_2} ${txt_remark_2}   ${Register.Full_register['text_remark_page_2']} ${remark_2}
    Should Be Equal As Strings    ${label_remark_3} ${txt_remark_3}   ${Register.Full_register['text_remark_page_3']} ${remark_3}
    Should Be Equal As Strings    ${label_remark_4} ${txt_remark_4}   ${Register.Full_register['text_remark_page_4']} ${remark_4}


Click Button Close Remark Popup
    common.Click when ready    ${register_btn_close_remark_popup}

Verify Popup Not Appear
    ${header_remark_popup}=    Replace String    ${register_txt_header_remark_popup}     {value}    ${Register.Full_register['text_header_remark']}
    Wait Until Element Is Not Visible    ${header_remark_popup}

Click Save
    ${click_save}=    Replace String    ${register_btn_save_full_register}     {value}    ${Register.Full_register['btn_save']}
    common.Click when ready    ${click_save}
  

Click Confirm
    ${click_confirm}=    Replace String    ${register_btn_confirm_full_register}     {value}    ${Register.Full_register['btn_confirm']}
    common.Click when ready    ${click_confirm}

Verify Confirm Page
    [Arguments]    ${text}
    ${register_success_text}=    Replace String    ${register_txt_success_full_register}     {value}    ${text}
    Wait Until Element Is Visible    ${register_success_text}    timeout=${DEFAULT_TIMEOUT}
    Page Should Contain Element    ${register_success_text}    
    
