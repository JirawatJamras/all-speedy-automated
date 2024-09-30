*** Variables ***
${b2c_txt_tracking parcel_delivery}    //h2[text()='ติดตามการจัดส่งพัสดุ สาขาหลัก']
${b2c_txt_parcel_search_results}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//div[@class='ant-row w-full css-1hobygo']
${b2c_txt_amount_of_parcel_search_results}    //span[contains(@class, 'ant-typography mb-2 md:mb-0 md:mr-4 css-1hobygo') and contains(text(), 'ผลการค้นหาทั้งหมด')]
${b2c_txt_many_parcel_search_results}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//div[contains(@class,' bg-slate-100 rounded-xl p-2 w-full min-h-')]//div[@class='ant-col css-1hobygo']
${b2c_txt_parcel_status}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]

${b2c_txtbox_search_parcel_number}    //span[text()='ค้นหาด้วยหมายเลขพัสดุ']/../../..//input[@placeholder='ระบุหมายเลขพัสดุ']
${b2c_txtbox_search_name_or_phone}    //span[text()='ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ']/../../..//input[@placeholder='ระบุชื่อหรือเบอร์โทรผู้รับ']

${b2c_btn_search_parcel}    //button[contains(@class,'ant-btn css-1hobygo ant-btn-default ant-btn-color-default ant-btn-variant-outlined ant-btn-lg ant-btn-compact-item ant-btn-compact-last-item')]
${b2c_btn_remove_search_parcel}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//span[@class='ant-input-clear-icon']
${b2c_btn_open_filter}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//span[text()='ตัวกรอง']/..
# ${b2c_btn_close_filter}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//button[contains(@class,'ant-btn css-1hobygo ant-btn-round ant-btn-default')]

${b2c_cbo_search_type_selection}    //div[@class='ant-select-selector']