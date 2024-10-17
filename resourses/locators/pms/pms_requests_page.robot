*** Variables ***
${pms_tab_in_request_page}    //div[@role='tab' and text()='{value}']

${pms_btn_edit_process}    (//div[contains(@class,'ant-row ant-row-center')]//*[@alt='edit'])[1]

${pms_btn_list_in_request_page}    (//div[@aria-hidden='false']//div[@aria-hidden='false']//tbody//tr//td[text()='{types}']/..//td[text()='{company}']/..//td[text()='{name}']/..//td[text()='{tel}']/..//td[text()='{ext}']/..//div[text()='{status}']/../..//img)[1]
