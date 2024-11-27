*** Variables ***

${pms_btn_reject}    //b[text()='ปฏิเสธ']/..
${pms_btn_edit_process}    (//div[contains(@class,'ant-row ant-row-center')]//*[@alt='edit'])[1]

${pms_txt_request_status}    (//div[contains(@class,'ant-row ant-row-center') and text()='กำลังพิจารณา'])[1]
${pms_txt_request_status_in_detail}    //h1[text()='สถานะ : ']/..//div[contains(@class,'ant-row ant-row-center')]