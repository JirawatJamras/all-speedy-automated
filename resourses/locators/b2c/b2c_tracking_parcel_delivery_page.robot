*** Variables ***
${b2c_txt_tracking parcel_delivery}    //h2
${b2c_txt_parcel_search_results}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//div[@class='ant-row w-full css-1hobygo']
${b2c_txt_amount_of_parcel_search_results}    //span[contains(@class, 'ant-typography mb-2 md:mb-0 md:mr-4 css-1hobygo') and contains(text(), 'ผลการค้นหาทั้งหมด')]
${b2c_txt_many_parcel_search_results}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//div[@class=' bg-slate-100 rounded-xl p-2 w-full min-h-[740px]']//div[@class='ant-col css-1hobygo']
# ${b2c_txt_receive_parcel_into_system_status}    //div[@class='bg-[#FCB56F] w-[180px] text-white text-center py-2 px-4 top-0 mt-0 absolute rounded-b-xl left-6 max-[500px]:px-2' and text()='รับพัสดุเข้าระบบ']

${b2c_txtbox_search_parcel_number}    //span[text()='ค้นหาด้วยหมายเลขพัสดุ']/../../..//input[@placeholder='ระบุหมายเลขพัสดุ']
${b2c_txtbox_search_name_or_phone}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//input[@placeholder='ระบุชื่อหรือเบอร์โทรผู้รับ']

${b2c_btn_search_parcel}    //button[@class='ant-btn css-1hobygo ant-btn-default ant-btn-color-default ant-btn-variant-outlined ant-btn-lg ant-btn-compact-item ant-btn-compact-last-item bg-blue-500 hover:bg-blue-600 active:bg-blue-700 focus:outline-none focus:ring focus:ring-blue-300 bg-gradient-to-r from-blue-900 to-blue-500 text-white'] 
${b2c_btn_remove_search_parcel}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//span[@class='ant-input-clear-icon']
# ${b2c_btn_filter}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//button[@class='ant-btn css-1hobygo ant-btn-round ant-btn-default ant-btn-color-default ant-btn-variant-outlined ant-btn-lg flex items-center justify-center bg-blue-500 hover:bg-blue-600 active:bg-blue-700 focus:outline-none focus:ring focus:ring-blue-300 bg-gradient-to-r from-blue-900 to-blue-500 text-white ant-dropdown-trigger bg-blue-500 hover:bg-blue-600 active:bg-blue-700 focus:outline-none focus:ring focus:ring-blue-300 bg-gradient-to-r from-blue-900 to-blue-500 text-white']
# ${b2c_btn_receive_parcel_into_system_filter}    //span[@class='ant-dropdown-menu-title-content' and text()='รับพัสดุเข้าระบบ']

${b2c_cbo_search_type_selection}    //div[@class='ant-select-selector']
${b2c_cbo_search_by_parcel_number}    //div[text()='ค้นหาด้วยหมายเลขพัสดุ']
${b2c_cbo_search_by_name_or_phone}    //div[text()='ค้นหาด้วยชื่อ/เบอร์โทรผู้รับ']

${b2c_msg_specify_parcel_number}    //div[text()='กรุณาระบุหมายเลขพัสดุ']
${b2c_msg_specify_name_or_phone}    //div[text()='กรุณระบุชื่อหรือเบอร์โทรผู้รับ']
${b2c_msg_input_incorrect_parcel_number}    //div[text()='กรุณาระบุหมายเลขพัสดุ ให้ถูกต้อง']
${b2c_msg_input_incorrect_name_or_phone}    //div[text()='กรุณาระบุผู้ชื่อรับพัสดุ/เบอร์โทรศัพท์ ให้ถูกต้อง']