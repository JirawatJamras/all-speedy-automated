*** Variables ***
${pms_txtbox_customer_type}    //input[@id='customerType']
${pms_txtbox_company_title_name}    //input[@id='companyTitleName']
${pms_txtbox_company_name}    //input[@id='companyName']
${pms_txtbox_id_number}    //input[@id='idNumber']
${pms_txtbox_address}    //input[@id='address_addressInfo']
${pms_txtbox_postcode}    //input[@id='address_full']
${pms_txtbox_title_name}    //input[@id='titleName']/../..//span[@class='ant-select-selection-item']
${pms_txtbox_first_name}    //input[@id='firstName']
${pms_txtbox_last_name}    //input[@id='lastName']
${pms_txtbox_customer_email}    //input[@id='email']
${pms_txtbox_customer_phone}    //input[@id='mobileNo']
${pms_txtbox_customer_extra_phone}    //input[@id='mobileExt']
${pms_txtbox_link_full_register}    //input[@id='reqLink']
${pms_txtbox_remark}    //textarea[@id='remarkPre']
${pms_txtbox_sale_name}    //input[@id='rmName']
${pms_txtbox_sale_phone}    //input[@id='saleTell']
${pms_txtbox_sale_email}    //input[@id='saleEmail']

${pms_btn_reject}    //b[text()='ปฏิเสธ']/..

${pms_txt_request_status}    (//div[contains(@class,'ant-row ant-row-center') and text()='กำลังพิจารณา'])[1]
${pms_txt_request_status_in_detail}    //h1[text()='สถานะ : ']/..//div[contains(@class,'ant-row ant-row-center')]