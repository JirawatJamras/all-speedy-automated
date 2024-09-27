*** Variables ***
${b2c_txt_tracking parcel_delivery}    //h2
${b2c_txt_1parcel_search_results}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//div[@class='ant-row w-full css-1hobygo']
${b2c_txt_amount_of_parcel_search_results}    //span[contains(@class, 'ant-typography mb-2 md:mb-0 md:mr-4 css-1hobygo') and contains(text(), 'ผลการค้นหาทั้งหมด')]
${b2c_txt_10parcel_search_results}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//div[@class=' bg-slate-100 rounded-xl p-2 w-full min-h-[740px]']//div[@class='ant-col css-1hobygo']

${b2c_txtbox_search_parcel}    //span[text()='ค้นหาด้วยหมายเลขพัสดุ']/../../..//input[@placeholder='ระบุหมายเลขพัสดุ']

${b2c_btn_search_parcel}    //button[@class='ant-btn css-1hobygo ant-btn-default ant-btn-color-default ant-btn-variant-outlined ant-btn-lg ant-btn-compact-item ant-btn-compact-last-item bg-blue-500 hover:bg-blue-600 active:bg-blue-700 focus:outline-none focus:ring focus:ring-blue-300 bg-gradient-to-r from-blue-900 to-blue-500 text-white'] 
${b2c_btn_remove_search_parcel}    //div[@class='ant-card ant-card-bordered max-w-[1729px] hidden md:flex m-auto h-screen css-1hobygo']//span[@class='ant-input-clear-icon']