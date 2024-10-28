*** Variables ***
${pms_txt_title_detail}    //div[@class='ant-card-head-title']//span[text()='{value}']
${pms_txt_detail_full_regis}    //span[contains(text(),'{value}')]/..
${pms_txt_step_full_regis}    //div[@class='ant-steps-item ant-steps-item-process ant-steps-item-active']//div[text()='{value}']
${pms_text_in_detail_full_regis}    //*[contains(text(),'{value}')]
${pms_txt_customer_type_full_regis}    //label[@for='customerType']
${pms_txt_company_title_full_regis}    //label[@for='companyTitleName']
${pms_txt_company_name_full_regis}    //label[@for='companyName']
${pms_txt_id_number_full_regis}    //label[@for='idNumber']
${pms_txt_company_mobile_full_regis}    //label[@for='mobileCompany']
${pms_txt_company_mobile_ext_full_regis}    //label[@for='mobileCompanyExt']
${pms_txt_company_address_full_regis}    //label[@for='companyAddress_addressInfo']
${pms_txt_company_address_full_full_regis}    //label[@for='companyAddress_full']
${pms_txt_title_name_full_regis}    //label[@for='titleName']
${pms_txt_first_name_full_regis}    //label[@for='firstName']
${pms_txt_last_name_full_regis}    //label[@for='lastName']
${pms_txt_email_full_regis}    //label[@for='email']
${pms_txt_mobile_no_full_regis}    //label[@for='mobileNo']
${pms_txt_mobile_ext_full_regis}    //label[@for='mobileExt']
${pms_txt_remark_full_regis}    //label[@for='remark']
${pms_txt_dry_product_category_full_regis}    //label[@for='parcelType_parcelDry_productCategory']
${pms_txt_dry_pieces_amount_full_regis}    //label[@for='parcelType_parcelDry_piecesAmount']
${pms_txt_dry_sale_channel_full_regis}    //label[@for='parcelType_parcelDry_saleChannel']
${pms_txt_dry_vat_full_regis}    //label[@for='parcelType_parcelDry_isVat']
${pms_txt_dry_remark_full_regis}    //label[@for='parcelType_parcelDry_remark']
${pms_txt_parcel_pickup_table_full_regis}    //tbody[@class='ant-table-tbody']//td[text()='{value}']/..//td[contains(text(),'{value2}')]/..//td[text()='{value3}']/..//span[text()='{value4}']/../..//button
${pms_txt_remark2_full_regis}    //label[@for='remark2']
${pms_txt_chill_product_category_full_regis}    //label[@for='parcelType_parcelChill_typeProductControlTem']
${pms_txt_chill_pieces_amount_full_regis}    //label[@for='parcelType_parcelChill_NumberByDayControlTem']
${pms_txt_chill_sale_channel_full_regis}    //label[@for='parcelType_parcelChill_salePathControlTem']
${pms_txt_chill_vat_full_regis}    //label[@for='parcelType_parcelChill_vatControlTem']
${pms_txt_chill_remark_full_regis}    //label[@for='parcelType_parcelChill_notationControlTem']
${pms_txt_return_product_category_full_regis}    //label[@for='parcelType_parcelReturnBusiness_typeProductReturn']
${pms_txt_return_pieces_amount_full_regis}    //label[@for='parcelType_parcelReturnBusiness_NumberByDayReturn']
${pms_txt_return_sale_channel_full_regis}    //label[@for='parcelType_parcelReturnBusiness_salePathReturn']
${pms_txt_return_vat_full_regis}    //label[@for='parcelType_parcelReturnBusiness_vatReturn']
${pms_txt_return_remark_full_regis}    //label[@for='parcelType_parcelReturnBusiness_notationReturn']
${pms_txt_title_set_pickup_popup}    //div[@class='ant-modal-title']//span[text()='{value}']
${pms_txt_branch_set_pickup_popup}    //label[@for='branchName']
${pms_txt_branch_id_set_pickup_popup}    //label[@for='branchId']
${pms_txt_ul_code_set_pickup_popup}    //label[@for='ulCode']
${pms_txt_address_set_pickup_popup}    //label[@for='address_addressInfo']
${pms_txt_address_full_set_pickup_popup}    //label[@for='address_full']
${pms_txt_latitude_set_pickup_popup}    //label[@for='lat']
${pms_txt_longitude_set_pickup_popup}    //label[@for='lng']
${pms_txt_table_list_set_pickup_popup}    //thead[@class='ant-table-thead']//th[text()='{value}']


${pms_txtbox_customer_type_full_regis}    //input[@id='customerType']
${pms_txtbox_company_title_full_regis}    //input[@id='companyTitleName']/../..//span[text()]
${pms_txtbox_company_name_full_regis}    //input[@id='companyName']
${pms_txtbox_id_number_full_regis}    //input[@id='idNumber']
${pms_txtbox_company_mobile_full_regis}    //input[@id='mobileCompany']
${pms_txtbox_company_mobile_ext_full_regis}    //input[@id='mobileCompanyExt']
${pms_txtbox_company_address_full_regis}    //input[@id='companyAddress_addressInfo']
${pms_txtbox_company_address_full_full_regis}    //input[@id='companyAddress_full']/../..//span[text()]
${pms_txtbox_title_name_full_regis}    //input[@id='titleName']/../..//span[text()]
${pms_txtbox_first_name_full_regis}    //input[@id='firstName']
${pms_txtbox_last_name_full_regis}    //input[@id='lastName']
${pms_txtbox_email_full_regis}    //input[@id='email']
${pms_txtbox_mobile_no_full_regis}    //input[@id='mobileNo']
${pms_txtbox_mobile_ext_full_regis}    //input[@id='mobileExt']
${pms_txtbox_dry_product_category_full_regis}    //label[@for='parcelType_parcelDry_productCategory']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_dry_pieces_amount_full_regis}    //label[@for='parcelType_parcelDry_piecesAmount']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_dry_sale_channel_full_regis}    //label[@for='parcelType_parcelDry_saleChannel']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_dry_vat_full_regis}    //label[@for='parcelType_parcelDry_isVat']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_dry_remark_full_regis}    //textarea[@id='parcelType_parcelDry_remark']
${pms_txtbox_chill_product_category_full_regis}    //label[@for='parcelType_parcelChill_typeProductControlTem']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_chill_pieces_amount_full_regis}    //label[@for='parcelType_parcelChill_NumberByDayControlTem']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_chill_sale_channel_full_regis}    //label[@for='parcelType_parcelChill_salePathControlTem']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_chill_vat_full_regis}    //label[@for='parcelType_parcelChill_vatControlTem']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_chill_remark_full_regis}    //textarea[@id='parcelType_parcelChill_notationControlTem']
${pms_txtbox_return_product_category_full_regis}    //label[@for='parcelType_parcelReturnBusiness_typeProductReturn']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_return_pieces_amount_full_regis}    //label[@for='parcelType_parcelReturnBusiness_NumberByDayReturn']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_return_sale_channel_full_regis}    //label[@for='parcelType_parcelReturnBusiness_salePathReturn']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_return_vat_full_regis}    //label[@for='parcelType_parcelReturnBusiness_vatReturn']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_return_remark_full_regis}    //textarea[@id='parcelType_parcelReturnBusiness_notationReturn']
${pms_txtbox_price_scheme_full_regis}    //input[@id='parcelType_parcelDry_priceScheme']/..
${pms_txtbox_price_scheme_date_full_regis}    //input[@id='parcelType_parcelDry_priceActiveDate']/..
${pms_txtbox_cod_scheme_full_regis}    //input[@id='parcelType_parcelDry_codScheme']/..
${pms_txtbox_cod_scheme_date_full_regis}    //input[@id='parcelType_parcelDry_codActiveDate']/..
${pms_txtbox_insure_scheme_full_regis}    //input[@id='parcelType_parcelDry_insureScheme']/..
${pms_txtbox_insure_scheme_date_full_regis}    //input[@id='parcelType_parcelDry_insureActiveDate']/..
${pms_txtbox_first_mile_start_date_full_regis}    //input[@id='parcelType_parcelDry_firstMileStartdate']/..
${pms_txtbox_first_mile_end_date_full_regis}    //input[@id='parcelType_parcelDry_firstMileEnddate']/..
${pms_txtbox_bounce_fee_start_date_full_regis}    //input[@id='parcelType_parcelDry_bounceFeeStartdate']/..
${pms_txtbox_bounce_fee_end_date_full_regis}    //input[@id='parcelType_parcelDry_bounceFeeEnddate']/..
${pms_txtbox_rebate_item_full_regis}    //input[@id='parcelType_parcelDry_itemTo_0']
${pms_txtbox_rebate_percen_full_regis}    //input[@id='parcelType_parcelDry_rebatePercen_0']
${pms_txtbox_rebate_item_2_full_regis}    //input[@id='parcelType_parcelDry_itemTo_1']
${pms_txtbox_rebate_percen_2_full_regis}    //input[@id='parcelType_parcelDry_rebatePercen_1']
${pms_txtbox_branch_set_pickup_popup}    //input[@id='branchName']
${pms_txtbox_branch_id_set_pickup_popup}    //input[@id='branchId']
${pms_txtbox_address_set_pickup_popup}    //input[@id='address_addressInfo']
${pms_txtbox_address_full_set_pickup_popup}    //input[@id='address_full']
${pms_txtbox_search_set_pickup_popup}    //span[text()='{value}']/..//input/..
${pms_txtbox_price_scheme_chill_full_regis}    //input[@id='parcelType_parcelChill_priceScheme']/..
${pms_txtbox_price_scheme_date_chill_full_regis}    //input[@id='parcelType_parcelChill_priceActiveDate']/..
${pms_txtbox_cod_scheme_chill_full_regis}    //input[@id='parcelType_parcelChill_codScheme']/..
${pms_txtbox_cod_scheme_date_chill_full_regis}    //input[@id='parcelType_parcelChill_codActiveDate']/..
${pms_txtbox_first_mile_start_date_chill_full_regis}    //input[@id='parcelType_parcelChill_firstmileStartdate']/..
${pms_txtbox_first_mile_end_date_chill_full_regis}    //input[@id='parcelType_parcelChill_firstmileEnddate']/..
${pms_txtbox_bounce_fee_start_date_chill_full_regis}    //input[@id='parcelType_parcelChill_bounceFeeStartdate']/..
${pms_txtbox_bounce_fee_end_date_chill_full_regis}    //input[@id='parcelType_parcelChill_bounceFeeEnddate']/..
${pms_txtbox_rebate_item_chill_full_regis}    //input[@id='parcelType_parcelChill_itemTo_0']
${pms_txtbox_rebate_percen_chill_full_regis}    //input[@id='parcelType_parcelChill_rebatePercen_0']
${pms_txtbox_rebate_item_2_chill_full_regis}    //input[@id='parcelType_parcelChill_itemTo_1']
${pms_txtbox_rebate_percen_2_chill_full_regis}    //input[@id='parcelType_parcelChill_rebatePercen_1']
${pms_txtbox_remark4_full_regis}    //textarea[@id='remark4']

${pms_btn_full_regis}    //b[text()='{value}']/..
${pms_btn_select_dry_parcel}    //button[@id='parcelType_parcelDry_isActive']
${pms_btn_select_chill_parcel}    //button[@id='parcelType_parcelChill_isActive']
${pms_btn_select_return_business}    //button[@id='parcelType_parcelReturnBusiness_isActive']
${pms_btn_first_mile_full_regis}    //button[@id='parcelType_parcelDry_firstMile']
${pms_btn_bounce_fee_full_regis}    //button[@id='parcelType_parcelDry_bounceFee']
${pms_btn_rebate_full_regis}    //span[text()='{value}']/..//button[@aria-checked='false']
${pms_btn_plus_rebate_full_regis}    //div[@id='parcelType_parcelDry_rebateItem']//button
${pms_btn_add_parcel_pickup_full_regis}    //*[text()='{value}']/../..//button
${pms_btn_add_pick_up_set_pickup_popup}    //div[@class='ant-modal-content']//thead[@class='ant-table-thead']//button
${pms_btn_save_set_pickup_popup}    //span[text()='{value}']/../..
${pms_btn_cancel_set_pickup_popup}    //b[text()='ยกเลิก']/..
${pms_btn_first_mile_chill_full_regis}    //button[@id='parcelType_parcelChill_firstMile']
${pms_btn_bounce_fee_chill_full_regis}    //button[@id='parcelType_parcelChill_bounceFee']
${pms_btn_plus_rebate_chill_full_regis}    //div[@id='parcelType_parcelChill_rebateItem']//button
   

${pms_checkbox_dry_cod}    //input[@id='parcelType_parcelDry_isCod']
${pms_checkbox_dry_insure}    //input[@id='parcelType_parcelDry_isInsure']
${pms_checkbox_chill_cod}    //input[@id='parcelType_parcelChill_isCodOfTemp']
${pms_checkbox_return_business_express}    //input[@id='parcelType_parcelReturnBusiness_isExpressReturn']
${pms_checkbox_return_business_insure}    //input[@id='parcelType_parcelReturnBusiness_isInsuReturn']

${pms_tab_dry_parcel}    //div[@data-node-key='defaultPost']//div[@role='tab']
${pms_tab_chill_parcel}    //div[@data-node-key='controlTem']//div[@role='tab']
${pms_tab_return_business}    //div[@data-node-key='return']//div[@role='tab']

${pms_cbo_price_scheme_full_regis}    //div[@id='parcelType_parcelDry_priceScheme_list']/..//div[text()='{value}']
${pms_cbo_date_pick_full_regis}    //div[@class='ant-picker-dropdown css-ccdg5a ant-picker-dropdown-placement-topLeft']//div[@class='ant-picker-date-panel']//td[@title='{value}']
${pms_cbo_cod_scheme_full_regis}    //div[@id='parcelType_parcelDry_codScheme_list']/..//div[text()='{value}']
${pms_cbo_insure_scheme_full_regis}    //div[@id='parcelType_parcelDry_insureScheme_list']/..//div[text()='{value}']
${pms_cbo_parcel_type_set_pickup_popup}    //div[@class='rc-virtual-list']//div[text()='{value}']
${pms_cbo_pickup_date_set_pickup_popup}    //div[@class='ant-select-tree-list']//span[text()='{value}']
${pms_cbo_pickup_time_set_pickup_popup}    //div[@class='ant-select-tree-list']//span[text()='{value}']
${pms_cbo_price_scheme_chill_full_regis}    //div[@id='parcelType_parcelChill_priceScheme_list']/..//div[text()='{value}']
${pms_cbo_cod_scheme_chill_full_regis}    //div[@id='parcelType_parcelChill_codScheme_list']/..//div[text()='{value}']
