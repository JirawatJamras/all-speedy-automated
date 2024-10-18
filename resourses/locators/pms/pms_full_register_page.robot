*** Variables ***
${pms_txt_status}    //div[contains(@class,"ant-card-head-wrapper")]//span[contains(@class,'text-[#2A3DA7]')]

${pms_txtbox_company_data_type_person_dropdown}    //input[@id='customerType']/../..
${pms_txtbox_company_data_type_person_list}    //div[contains(@class,'ant-select-item')and @title='{value}']
${pms_txtbox_company_data_type_company_dropdown}    //input[@id='companyTitleName']/../..
${pms_txtbox_company_data_type_company_list}    //div[contains(@class,'ant-select-item')and @title='{value}']
${pms_txtbox_company_data_name_company}    //input[@id='companyName']
${pms_txtbox_company_data_tax_identification_number}    //input[@id='idNumber']
${pms_txtbox_company_data_mobile_company}    //input[@id='mobileCompany']
${pms_txtbox_company_data_mobile_company_ext}    //input[@id='mobileCompanyExt']
${pms_txtbox_company_data_address_company}    //input[@id='companyAddress_addressInfo']
${pms_txtbox_company_data_postcode_input}    //input[@id='companyAddress_full']
${pms_txtbox_company_data_postcode_list}    //div[contains(@class,'ant-select-item')and @title='{value}']
${pms_txtbox_contact_data_title_name}    //input[@id='titleName']/../..
${pms_txtbox_contact_data_title_name_list}    //div[contains(@class,'ant-select-item')and @title='{value}']
${pms_txtbox_contact_data_first_name}    //input[@id='firstName']
${pms_txtbox_contact_data_last_name}    //input[@id='lastName']
${pms_txtbox_contact_data_email}    //input[@id='email']
${pms_txtbox_contact_data_mobile_number}    //input[@id='mobileNo']
${pms_txtbox_contact_data_ext}    //input[@id='mobileExt']
${pms_txtbox_service_data_dry_parcel_product_type}    //input[@aria-describedby="parcelType_parcelDry_productCategory_help"]/../../..
${pms_txtbox_service_data_dry_parcel_product_type_list}    //span[@title='{value}']
${pms_txtbox_service_data_dry_parcel_deliveries_per_day}    //input[@id="parcelType_parcelDry_piecesAmount"]/../../..
${pms_txtbox_service_data_dry_parcel_deliveries_per_day_list}    //div[@title='{value}']
${pms_txtbox_service_data_dry_parcel_sell_channel}    //input[@aria-describedby="parcelType_parcelDry_saleChannel_help"]/../../..
${pms_txtbox_service_data_dry_parcel_sell_channel_list}    //span[contains(@title,'{value}')]
${pms_txtbox_service_data_dry_parcel_vat}    //input[@id="parcelType_parcelDry_isVat"]/../../..
${pms_txtbox_service_data_dry_parcel_vat_list}    //div[@title='{value}']

${pms_btn_next}    //b[text()='{value}']/../../button[@type='button']
${pms_btn_select_for_edit_dry_parcel}    //button[@id="parcelType_parcelDry_isActive"]
${pms_btn_select_for_edit_chill_parcel}    //button[@id="parcelType_parcelChill_isActive"]
${pms_btn_select_for_edit_return_business}    //button[@id="parcelType_parcelReturnBusiness_isActive"]
${pms_btn_check_cod_dry_parcel}    //input[@id="parcelType_parcelDry_isCod"]/..
${pms_btn_check_insure_dry_parcel}    //input[@id="parcelType_parcelDry_isInsure"]/..


${pms_tab_dry_parcel}    //div[@data-node-key="defaultPost"]
${pms_tab_chill_parcel}    //div[@data-node-key="controlTem"]
${pms_tab_return_business}    //div[@data-node-key="return"]