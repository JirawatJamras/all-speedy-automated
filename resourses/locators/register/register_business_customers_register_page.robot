*** Variables ***
#old pre register
# ${register_dropdown_company_title_name_register_page}    //span[text()='คำนำหน้าประเภทจดทะเบียนบริษัท']/../../..//span[@title='เลือก..']
# ${register_dropdown_title_name_register_page}    //span[text()='คำนำหน้าชื่อ ']/../../..//span[@title='เลือก..']

${register_select_company_title_name_register_page}    //span[text()='คำนำหน้าประเภทจดทะเบียนบริษัท']/../../..//span[@class='ant-select-selection-item']
${register_select_title_name_register_page}    //span[text()='คำนำหน้าชื่อ ']/../../..//span[@class='ant-select-selection-item']

${register_txtbox_company_name_register_page}    //input[@id='companyName']
${register_txtbox_tax_identification_number_register_page}    //input[@id='idNumber']
${register_txtbox_company_address_register_page}    //input[@id='companyAddress_addressInfo']
${register_txtbox_company_address_full_register_page}    //input[@id='companyAddress_full']
${register_txtbox_first_name_register_page}    //input[@id='firstName']
${register_txtbox_last_name_register_page}    //input[@id='lastName']
${register_txtbox_email_register_page}    //input[@id='email']
${register_txtbox_mobile_no_register_page}    //input[@id='mobileNo']
${register_txtbox_mobile_ext_register_page}    //input[@id='mobileExt']

${register_txt_legal_entity_business_customers_register_page}    //input[@value='นิติบุคคล']/../../span[2]
${register_txt_normal_person_business_customers_register_page}    //input[@value='บุคคลธรรมดา']/../../span[2]
${register_txt_company_title_name_business_customers_register_page}    //label[@for='companyTitleName']/span
${register_txt_company_name_business_customers_register_page}    //label[@for='companyName']/span
${register_txt_tax_identification_number_business_customers_register_page}    //label[@for='idNumber']/span
${register_txt_company_address_business_customers_register_page}    //label[@for='companyAddress_addressInfo']/span
${register_txt_company_address_full_business_customers_register_page}    //label[@for='companyAddress_full']/span
${register_txt_prefix_name_business_customers_register_page}    //label[@for='titleName']/span
${register_txt_firstname_business_customers_register_page}    //label[@for='firstName']/span
${register_txt_lastname_business_customers_register_page}    //label[@for='lastName']/span
${register_txt_email_business_customers_register_page}    //label[@for='email']/span
${register_txt_mobileNumber_business_customers_register_page}    //label[@for='mobileNo']/span
${register_txt_mobileExt_business_customers_register_page}    //label[@for='mobileExt']
${register_txt_form_prefix_name_business_customers_register_page}    //label[@for='Form_titleName']/span
${register_txt_form_firstName_business_customers_register_page}    //label[@for='Form_firstName']/span
${register_txt_form_lastname_business_customers_register_page}    //label[@for='Form_lastName']/span
${register_txt_form_idnumber_business_customers_register_page}    //label[@for='Form_idNumber']/span
${register_txt_form_email_business_customers_register_page}    //label[@for='Form_email']/span
${register_txt_form_company_address_business_customers_register_page}    //label[@for='Form_companyAddress_addressInfo']/span
${register_txt_form_company_address_full_business_customers_register_page}    //label[@for='Form_companyAddress_full']/span
${register_txt_form_mobile_number_business_customers_register_page}    //label[@for='Form_mobileNo']/span
${register_txt_form_mobileExt_business_customers_register_page}    //label[@for='Form_mobileExt']

${register_btn_cancel_business_customers_register_page}    //span[text()='ยกเลิก']/..
${register_btn_register_business_customers_register_page}    //b[text()='ลงทะเบียน']/..

${register_msg_tax_identification_number_business_customers_register_page}    //div[@id='idNumber_help'][@role='alert']//div
${register_msg_error_business_customers_register_page}    //div[@id='email_help']/div
