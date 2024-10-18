*** Variables ***
# Gmail
${register_txtbox_email_gmail}    //input[@type='email']
${register_txtbox_password_gmail}    //input[@type='password']
${register_btn_next_gmail}    //button//span[text()='Next']
${register_btn_inbox_gmail}    //tbody//tr//span[@email='support@allspeedy.co.th']//..//..//..//..
${register_link_register_gmail}    //span//a[@href='{value}']
${register_txt_link_register_gmail}    //p[text()='{value} ']//span//a[@href='{link}']

# Full Register
${register_txt_title_full_register}    //div[@class='ant-steps-item ant-steps-item-process ant-steps-item-active']//div[text()='{value}']
${register_txt_header_full_register}    //*[text()='{value}'] 
${register_txt_header_cancel_popup_full_register}    //div[@class='ant-modal-header']//span[text()='{value}']
${register_txt_body_cancel_popup_full_register}    //div[@class='ant-modal-body']//p[text()='{value}']

${register_btn_partner_types_full_register}    //span[@class='ant-radio ant-wave-target ant-radio-checked']//input
${register_btn_next_full_register}    //button//div[text()='{value}']
${register_btn_cancel_full_register}    //button//span[text()='{value}']
${register_btn_save_full_register}    //button//span[text()='{value}']
${register_btn_cancel_popup_full_register}     //button[@type='button']//span[text()='{value}']
${register_btn_confirm_full_register}    //b[text()='{value}']

${register_dropdown_company_title_name_legal_entity_full_register}    //input[@id='companyTitleName']//..//..//span[@class='ant-select-selection-item']
${register_dropdown_title_name_legal_entity_full_register}    //input[@id='titleName']//..//..//span[@class='ant-select-selection-item']
${register_dropdown_company_address_full_legal_entity_full_register}    //input[@id='companyAddress_full']//..//..//span[@class='ant-select-selection-item']

${register_txtbox_company_name_legal_entity_full_register}    //input[@id='companyName']
${register_txtbox_juristic_identification_number_legal_entity_full_register}    //input[@id='idNumber']
${register_txtbox_company_address_legal_entity_full_register}    //input[@id='companyAddress_addressInfo']
${register_txtbox_mobile_company_legal_entity_full_register}    //input[@id='mobileCompany']
${register_txtbox_mobile_company_ext_legal_entity_full_register}    //input[@id='mobileCompanyExt']
${register_txtbox_first_name_legal_entity_full_register}    //input[@id='firstName']
${register_txtbox_last_name_legal_entity_full_register}    //input[@id='lastName']
${register_txtbox_email_legal_entity_full_register}    //input[@id='email']
${register_txtbox_mobile_no_legal_entity_full_register}    //input[@id='mobileNo']
${register_txtbox_mobile_ext_legal_entity_full_register}    //input[@id='mobileExt']

${register_btn_upload_full_register}    //*[contains(text(),'{value}')]/../../..//input



