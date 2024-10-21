*** Variables ***
${pms_tab_in_request_page}    //div[@role='tab' and text()='{value}']

${pms_txt_request_num}    /../../..//td[2]   ##ต่อหลัง ${pms_btn_list_in_request_page}
${pms_txt_request_date}    /../../..//td[3]   ##ต่อหลัง ${pms_btn_list_in_request_page}
${pms_txt_assigned_list_in_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td['{request_no}']/..//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//td[text()='{rm}']/..//div[text()='{status}'])

${pms_btn_edit_process}    (//div[contains(@class,'ant-row ant-row-center')]//*[@alt='edit'])[1]
${pms_btn_assign_rm_multi_tnx}    //button//span[text()='{value}']

${pms_btn_list_in_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//div[text()='{status}']/../..//img)[1]
${pms_btn_assigned_list_in_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{req_no}']/..//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//td[text()='{rm}']/..//div[text()='{status}']/../..//img)[1]
${pms_btn_add_new_customer}    //span[text()='{value}']/../../button
${pms_btn_checkbox_request_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//div[text()='{status}']/../..//input/..)[1]


