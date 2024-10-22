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

${register_tab_parcel_type_full_register}    //div[@role='tab' and text()='{value}']//..

${register_btn_partner_types_full_register}    //span[@class='ant-radio ant-wave-target ant-radio-checked']//input
${register_btn_next_full_register}    //button//div[text()='{value}']
${register_btn_cancel_full_register}    //button//span[text()='{value}']
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

${register_cbo_company_title_name_legal_entity_full_register}    //input[@id='companyTitleName']//..//..//span[@class='ant-select-selection-item']
${register_cbo_title_name_legal_entity_full_register}    //input[@id='titleName']//..//..//span[@class='ant-select-selection-item']
${register_cbo_company_address_full_legal_entity_full_register}    //input[@id='companyAddress_full']//..//..//span[@class='ant-select-selection-item']

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

${register_txtbox_type_product_dry_parcel}    //input[@id='parcelType_parcelDry_typeProduct']
${register_txtbox_number_by_day_dry_parcel}    //input[@id='parcelType_parcelDry_numberByDay']
${register_txtbox_sale_channel_dry_parcel}    //input[@id='parcelType_parcelDry_saleChannel']
${register_txtbox_vat_dry_parcel}    //input[@id='parcelType_parcelDry_isVat']
${register_txtbox_remark_dry_parcel}    //input[@id='parcelType_parcelDry_remark']

${register_txtbox_type_product_general_chill_parcel}    //input[@id='parcelType_parcelDry_typeProductControlTem']
${register_txtbox_number_by_day_chill_parcel}    //input[@id='parcelType_parcelDry_NumberByDayControlTem']
${register_txtbox_sale_channel_chill_parcel}    //input[@id='parcelType_parcelDry_salePathControlTem']
${register_txtbox_vat_chill_parcel}    //input[@id='parcelType_parcelDry_vatControlTem']
${register_txtbox_remark_chill_parcel}    //input[@id='parcelType_parcelDry_notationControlTem']

