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
${register_txt_topic_full_register}    //*[contains(text(),'{value}')] 
${register_txt_header_cancel_popup_full_register}    //div[@class='ant-modal-header']//span[text()='{value}']
${register_txt_body_cancel_popup_full_register}    //div[@class='ant-modal-body']//p[text()='{value}']

${register_txt_company_title_name}    //label[@for='companyTitleName']
${register_txt_company_name}    //label[@for='companyName']
${register_txt_id_number}    //label[@for='idNumber']
${register_txt_company_address}    //label[@for='companyAddress_addressInfo']
${register_txt_company_address_full}    //label[@for='companyAddress_full']
${register_txt_mobile_company}    //label[@for='mobileCompany']
${register_txt_mobile_company_ext}    //label[@for='mobileCompanyExt']
${register_txt_title_name}    //label[@for='titleName']
${register_txt_first_name}    //label[@for='firstName']
${register_txt_last_name}    //label[@for='lastName']
${register_txt_email}    //label[@for='email']
${register_txt_mobile_no}    //label[@for='mobileNo']
${register_txt_mobile_ext}    //label[@for='mobileExt']


${register_txt_type_product_general_dry_parcel}    //label[@for='parcelType_parcelDry_typeProduct']//span
${register_txt_number_by_day_dry_parcel}    //label[@for='parcelType_parcelDry_numberByDay']//span
${register_txt_sale_channel_dry_parcel}    //label[@for='parcelType_parcelDry_saleChannel']//span
${register_txt_vat_dry_parcel}    //label[@for='parcelType_parcelDry_isVat']//span
${register_txt_remark_dry_parcel}    //label[@for='parcelType_parcelDry_remark']

${register_txt_type_product_general_chill_parcel}    //label[@for='parcelType_parcelChill_typeProductControlTem']//span
${register_txt_number_by_day_chill_parcel}    //label[@for='parcelType_parcelChill_NumberByDayControlTem']//span
${register_txt_sale_channel_chill_parcel}    //label[@for='parcelType_parcelChill_salePathControlTem']//span
${register_txt_vat_chill_parcel}    //label[@for='parcelType_parcelChill_vatControlTem']//span
${register_txt_remark_chill_parcel}    //label[@for='parcelType_parcelChill_notationControlTem']

${register_txt_type_product_general_return_business}    //label[@for='parcelType_parcelReturnBusiness_typeProductReturn']//span
${register_txt_number_by_day_return_business}    //label[@for='parcelType_parcelReturnBusiness_NumberByDayReturn']//span
${register_txt_sale_channel_return_business}    //label[@for='parcelType_parcelReturnBusiness_salePathReturn']//span
${register_txt_vat_return_business}    //label[@for='parcelType_parcelReturnBusiness_vatReturn']//span
${register_txt_remark_return_business}    //label[@for='parcelType_parcelReturnBusiness_notationReturn']

${register_txt_user_name}    //label[@for='users_0_name']//span
${register_txt_user_position}    //label[@for='users_0_position']//span
${register_txt_user_email}    //label[@for='users_0_email']//span
${register_txt_user_phone}    //label[@for='users_0_phone']//span
${register_txt_user_phone_ex}    //label[@for='users_0_phoneEX']

${register_txt_bank_id}    //label[@for='bankId']//span
${register_txt_bank_name}    //label[@for='bankName']//span
${register_txt_bank_account_type}    //label[@for='bankAccountType']//span
${register_txt_bank_branch}    //label[@for='bankBranch']//span
${register_txt_bank_account_name}    //label[@for='bankAccountName']//span
${register_txt_bank_account_no}    //label[@for='bankNo']//span

${register_txt_term_and_privacy}    //div[@class="ant-space-item"]//label//span//a[text()='{value}']
${register_txt_success_full_register}    //h1[text()='{value}']

${register_tab_parcel_type_full_register}    //div[@role='tab' and text()='{value}']//..

${register_btn_partner_types_full_register}    //span[@class='ant-radio ant-wave-target ant-radio-checked']//input
${register_btn_next_full_register}    //button//div[text()='{value}']
${register_btn_cancel_full_register}    //button//span[text()='{value}']
${register_btn_remark_full_register}    //button//span[text()='{value}']
${register_btn_close_remark_popup}    //span[@class='ant-modal-close-x']

${register_btn_save_full_register}    //button//span[text()='{value}']
${register_btn_cancel_popup_full_register}     //button[@type='button']//span[text()='{value}']
${register_btn_confirm_full_register}    //b[text()='{value}']
${register_btn_upload_full_register}    //*[contains(text(),'{value}')]/../../..//input
${register_btn_accept_terms_of_service_full_register}    //a[contains(text(),'{value}')]/../..//input
${register_btn_accept_privacy_policy_full_register}    //a[contains(text(),'{value}')]/../..//input

${register_btn_add_service_full_register}    //div[@class='flex items-center gap-1']//span[text()='{value}']
${register_btn_add_cod_dry_parcel}    //input[@id='parcelType_parcelDry_isCod']//..//..//span//div
${register_btn_add_insurance_dry_parcel}    //input[@id='parcelType_parcelDry_isInsure']//..//..//span//div
${register_btn_add_cod_chill_parcel}    //input[@id='parcelType_parcelChill_isCodOfTemp']//..//..//span//div
${register_btn_add_express_return_business}    //input[@id='parcelType_parcelReturnBusiness_isExpressReturn']//..//..//span//div
${register_btn_add_insurance_return_business}    //input[@id='parcelType_parcelReturnBusiness_isInsuReturn']//..//..//span//div


${register_btn_select_dry_parcel}    //button[@id="parcelType_parcelDry_isActive"]//div[text()='{value}']
${register_btn_select_chill_parcel}    //button[@id="parcelType_parcelChill_isActive"]//div[text()='{value}']
${register_btn_select_return_business}    //button[@id="parcelType_parcelReturnBusiness_isActive"]//div[text()='{value}']

${register_btn_add_contact_info}    //span[text()='{value}']//..//..//button

${register_cbo_company_title_name_full_register}    //input[@id='companyTitleName']//..//..//span[@class='ant-select-selection-item']
${register_cbo_title_name_full_register}    //input[@id='titleName']//..//..//span[@class='ant-select-selection-item']
${register_cbo_company_address_full_full_register}    //input[@id='companyAddress_full']//..//..//span[@class='ant-select-selection-item']

${register_cbo_choice_checkbox}    //div[contains(@class,'ant-select-dropdown ant-tree-select-dropdown')]//span[@title='{value}']
${register_cbo_choice_select}    //div[@aria-selected='false']//div[text()='{value}'][@class='ant-select-item-option-content']

${register_cbo_type_product_dry_parcel}    //input[@id='parcelType_parcelDry_typeProduct']//..//..
${register_cbo_number_by_day_dry_parcel}    //input[@id='parcelType_parcelDry_numberByDay']//..//..
${register_cbo_sale_channel_dry_parcel}    //input[@id='parcelType_parcelDry_saleChannel']//..//..
${register_cbo_vat_dry_parcel}    //input[@id='parcelType_parcelDry_isVat']//..//..

${register_cbo_type_product_chill_parcel}    //input[@id='parcelType_parcelChill_typeProductControlTem']//..//..
${register_cbo_number_by_day_chill_parcel}    //input[@id='parcelType_parcelChill_NumberByDayControlTem']//..//..
${register_cbo_sale_channel_chill_parcel}    //input[@id='parcelType_parcelChill_salePathControlTem']//..//..
${register_cbo_vat_chill_parcel}    //input[@id='parcelType_parcelChill_vatControlTem']//..//..

${register_cbo_type_product_return_business}    //input[@id='parcelType_parcelReturnBusiness_typeProductReturn']//..//..
${register_cbo_number_by_day_return_business}    //input[@id='parcelType_parcelReturnBusiness_NumberByDayReturn']//..//..
${register_cbo_sale_channel_return_business}    //input[@id='parcelType_parcelReturnBusiness_salePathReturn']//..//..
${register_cbo_vat_return_business}    //input[@id='parcelType_parcelReturnBusiness_vatReturn']//..//..



${register_txtbox_company_name_full_register}    //input[@id='companyName']
${register_txtbox_juristic_identification_number_full_register}    //input[@id='idNumber']
${register_txtbox_company_address_full_register}    //input[@id='companyAddress_addressInfo']
${register_txtbox_mobile_company_full_register}    //input[@id='mobileCompany']
${register_txtbox_mobile_company_ext_full_register}    //input[@id='mobileCompanyExt']
${register_txtbox_first_name_full_register}    //input[@id='firstName']
${register_txtbox_last_name_full_register}    //input[@id='lastName']
${register_txtbox_email_full_register}    //input[@id='email']
${register_txtbox_mobile_no_full_register}    //input[@id='mobileNo']
${register_txtbox_mobile_ext_full_register}    //input[@id='mobileExt']

${register_txtbox_type_product_dry_parcel}    //input[@id='parcelType_parcelDry_typeProduct']//..//..//..//..//div[@class='ant-select-selection-overflow']
${register_txtbox_sale_channel_dry_parcel}    //input[@id='parcelType_parcelDry_saleChannel']//..//..//..//..//div[@class='ant-select-selection-overflow']
${register_txtbox_remark_dry_parcel}    //textarea[@id='parcelType_parcelDry_remark']

${register_txtbox_type_product_chill_parcel}    //input[@id='parcelType_parcelChill_typeProductControlTem']//..//..//..//..//div[@class='ant-select-selection-overflow']
${register_txtbox_sale_channel_chill_parcel}    //input[@id='parcelType_parcelChill_salePathControlTem']//..//..//..//..//div[@class='ant-select-selection-overflow']
${register_txtbox_remark_chill_parcel}    //textarea[@id='parcelType_parcelChill_notationControlTem']

${register_txtbox_type_product_return_business}    //input[@id='parcelType_parcelReturnBusiness_typeProductReturn']//..//..//..//..//div[@class='ant-select-selection-overflow']
${register_txtbox_sale_channel_return_business}    //input[@id='parcelType_parcelReturnBusiness_salePathReturn']//..//..//..//..//div[@class='ant-select-selection-overflow']
${register_txtbox_remark_return_business}    //textarea[@id='parcelType_parcelReturnBusiness_notationReturn']

${register_txtbox_user_name}    //input[@id='users_0_name']
${register_txtbox_user_position}    //input[@id='users_0_position']
${register_txtbox_user_email}    //input[@id='users_0_email']
${register_txtbox_user_phone}    //input[@id='users_0_phone']
${register_txtbox_user_phone_ex}    //input[@id='users_0_phoneEX']

${register_cbo_bank_id}    //input[@id='bankId']//..//..
${register_cbo_bank_name}    //input[@id='bankName']//..//..
${register_cbo_bank_account_type}    //input[@id='bankAccountType']//..//..
${register_txtbox_bank_branch}    //input[@id='bankBranch']
${register_txtbox_bank_account_name}    //input[@id='bankAccountName']
${register_txtbox_bank_account_no}    //input[@id='bankNo']
