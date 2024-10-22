*** Variables ***
${pms_tab_in_request_page}    //div[@role='tab' and text()='{value}']
${pms_subtab_in_request_page}    //div[@aria-hidden='false']//div[@role='tab' and text()='{value}']

${pms_txt_request_num}    /../../..//td[2]   ##ต่อหลัง ${pms_btn_list_in_request_page}
${pms_txt_request_date}    /../../..//td[3]   ##ต่อหลัง ${pms_btn_list_in_request_page}
${pms_txt_assigned_list_in_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{request_no}']/..//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//td[text()='{rm}']/..//div[text()='{status}'])
${pms_txt_all_rm_name}    //div[@class='ant-card-head-title']//span[text()='{value}']
${pms_txt_tile_assign_rm}    //div[@class='ant-modal-title']//span[text()='{value}']
${pms_txt_already_assign_to_rm_popup}    //td[text()='{req}']/..//td[text()='{rmname}']
${pms_txt_req_number_popup}    //span[text()='{value}']/../../../..//td[text()='{req}']

${pms_txtbox_rm_name}    //input[@id='rmName']

${pms_btn_edit_process}    (//div[contains(@class,'ant-row ant-row-center')]//*[@alt='edit'])[1]
${pms_btn_assign_rm_multi_tnx}    //button//span[text()='{value}']
${pms_btn_to_assign_rm}    //td[text()='{value}']/..//button
${pms_btn_save_popup}    //div[text()='{value}']/..

${pms_btn_list_in_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//div[text()='{status}']/../..//img)[1]
${pms_btn_assigned_list_in_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{req_no}']/..//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//td[text()='{rm}']/..//div[text()='{status}']/../..//img)[1]
${pms_btn_add_new_customer}    //span[text()='{value}']/../../button
${pms_btn_checkbox_request_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//div[text()='{status}']/../..//input/..)[1]

###### Full-Register #######

${pms_txt_request_num_full_regis}    /../../..//td[1]   ##ต่อหลัง ${pms_btn_list_in_request_page}
${pms_txt_request_date_full_regis}    /../../..//td[2]   ##ต่อหลัง ${pms_btn_list_in_request_page}

${pms_btn_list_full_regis_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//td[text()='{rm}']/..//div[text()='{status}']/../..//img)[1]