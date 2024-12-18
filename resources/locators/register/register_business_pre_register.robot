*** Variables ***
${register_btn_partner_types}    //span[text()='{value}']
${register_btn_confirm}    //b[text()='{value}']
${register_btn_cancel}    //span[text()='{value}']
${register_btn_cancel_popup}     //button[@type='button']//span[text()='{value}']

${register_cbo_company_title_name_legal_entity}    //input[@id='companyTitleName']//..//..
${register_cbo_title_name_legal_entity}    //input[@id='titleName']//..//..
${register_cbo_choice_title_name}     //div[text()='{value}'][@class='ant-select-item-option-content']
${register_cbo_company_address_full_legal_entity}    //input[@id='companyAddress_full']
${register_cbo_choice_company_address_full_legal_entity}    //div[text()='{value}'][@class='ant-select-item-option-content']
${register_cbo_title_name_individual}    //input[@id='Form_titleName']//..//..
${register_cbo_address_full_individual}    //input[@id='Form_companyAddress_full']
${register_cbo_choice_address_full_individual}    //div[text()='{value}'][@class='ant-select-item-option-content']

${register_txtbox_company_name_legal_entity}    //input[@id='companyName']
${register_txtbox_juristic_identification_number_legal_entity}    //input[@id='idNumber']
${register_txtbox_company_address_legal_entity}    //input[@id='companyAddress_addressInfo']
${register_txtbox_first_name_legal_entity}    //input[@id='firstName']
${register_txtbox_last_name_legal_entity}    //input[@id='lastName']
${register_txtbox_email_legal_entity}    //input[@id='email']
${register_txtbox_mobile_no_legal_entity}    //input[@id='mobileNo']
${register_txtbox_mobile_ext_legal_entity}    //input[@id='mobileExt']
${register_txtbox_first_name_individual}    //input[@id='Form_firstName']
${register_txtbox_last_name_individual}    //input[@id='Form_lastName']
${register_txtbox_national_id_individual}    //input[@id='Form_idNumber']
${register_txtbox_email_individual}    //input[@id='Form_email']
${register_txtbox_address_individual}    //input[@id='Form_companyAddress_addressInfo']
${register_txtbox_mobile_no_individual}    //input[@id='Form_mobileNo']
${register_txtbox_mobile_ext_individual}    //input[@id='Form_mobileExt']

${register_txt_success}    //h1[text()='{value}']
${register_txt_header_cancel_popup}    //div[@class='ant-modal-header']//span[text()='{value}']
${register_txt_body_cancel_popup}    //div[@class='ant-modal-body']//p[text()='{value}']
