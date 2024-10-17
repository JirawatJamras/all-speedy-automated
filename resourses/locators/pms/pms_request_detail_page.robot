*** Variables ***
${pms_txtbox_company_title_name}    //input[@id='companyTitleName']
${pms_txtbox_company_name}    //input[@id='companyName']
${pms_txtbox_id_number}    //input[@id='idNumber']
${pms_txtbox_mobile_company}    //input[@id='mobileCompany']
${pms_txtbox_mobile_company_ext}    //input[@id='mobileCompanyExt']
${pms_txtbox_address}    //input[@id='address_addressInfo']
${pms_txtbox_postcode}    //input[@id='address_full']
${pms_txtbox_title_name}    //input[@id='titleName']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_first_name}    //input[@id='firstName']
${pms_txtbox_last_name}    //input[@id='lastName']
${pms_txtbox_customer_email}    //input[@id='email']
${pms_txtbox_customer_phone}    //input[@id='mobileNo']
${pms_txtbox_customer_phone_extra}    //input[@id='mobileExt']
${pms_txtbox_link_full_register}    //input[@id='reqLink']
${pms_txtbox_remark}    //textarea[@id='remarkPre']
${pms_txtbox_sale_name}    //input[@id='rmName']
${pms_txtbox_sale_phone}    //input[@id='saleTell']
${pms_txtbox_sale_email}    //input[@id='saleEmail']


${pms_btn_reject}    //b[text()='ปฏิเสธ']/..
${pms_btn_approve}    //b[text()='{value}']/..

${pms_txt_request_detail_header}    //span[text()='{value}']
${pms_txt_customer_type}    //label[@for='customerType']
${pms_txt_company_titile_name}    //label[@for='companyTitleName']
${pms_txt_company_name}    //label[@for='companyName']
${pms_txt_company_id_number}    //label[@for='idNumber']
${pms_txt_mobile_company}    //label[@for='mobileCompany']
${pms_txt_mobile_company_ext}    //label[@for='mobileCompanyExt']
${pms_txt_address}    //label[@for='address_addressInfo']
${pms_txt_postcode}    //label[@for='address_full']
${pms_txt_contact_data_header}    //form[contains(@class,'ant-form ant-form-vertical')]//h1[contains(@class,'mb-2')]
${pms_txt_title_name}    //label[@for='titleName']
${pms_txt_customer_first_name}    //label[@for='firstName']
${pms_txt_customer_last_name}    //label[@for='lastName']
${pms_txt_customer_email}    //label[@for='email']
${pms_txt_customer_phone}    //label[@for='mobileNo']
${pms_txt_cusotmer_phone_extra}    //label[@for='mobileExt']
${pms_txt_link_full_register}    //label[@for='reqLink']
${pms_txt_remark}    //label[@for='remarkPre']
${pms_txt_sale_data_header}    //div[contains(@class,'ant-col') and contains(@class,'font-semibold')]
${pms_txt_sale_name}    //label[@for='rmName']
${pms_txt_sale_phone}    //label[@for='saleTell']
${pms_txt_sale_email}    //label[@for='saleEmail']
${pms_txt_sale_information}    //div[text()='{value}']
${pms_txt_in_request_detail_page}    //div[@class='ant-card-body']//div[contains(text(),'{value}')]/../..
