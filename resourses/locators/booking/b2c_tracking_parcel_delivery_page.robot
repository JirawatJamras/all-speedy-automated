*** Variables ***
${b2c_txt_parcel_search_results}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//div[contains(@class,'grid grid-cols-1')]//div[contains(@class,'ant-col css-')]
${b2c_txt_amount_of_parcel_search_results}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//span[contains(@class,'ant-typography') and contains(text(),'ผลการค้นหาทั้งหมด')]
${b2c_txt_parcel_status}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]

${b2c_txtbox_search_parcel_number}    //span[text()='ค้นหาด้วยหมายเลขพัสดุ']/../../..//input[@placeholder='ระบุหมายเลขพัสดุ']
${b2c_txtbox_search_name_or_phone}    //span[text()='ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ']/../../..//input[@placeholder='ระบุชื่อหรือเบอร์โทรผู้รับ']

${b2c_btn_search_parcel}    //button[contains(@class,'ant-btn-default')]//span[text()='{value}']
${b2c_btn_remove_search_parcel}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//span[@class='ant-input-clear-icon']
${b2c_btn_open_filter}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//span[text()='ตัวกรอง']/..

${b2c_cbo_search_type_selection}    //div[@class='ant-select-selector']

${b2c_msg_error_msg_in_modal}    //div[@class=' text-center font-bold text-xl mt-2']