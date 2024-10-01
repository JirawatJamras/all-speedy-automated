*** Variables ***
${b2c_txt_my_parcel}    //h2[text()='พัสดุของฉัน สาขาหลัก']

${b2c_btn_delivered_parcel}    //span[text()='รายการพัสดุที่จัดส่ง']/../..
${b2c_btn_received_parcel}    //div[@id='rc-tabs-5-tab-2']
${b2c_btn_in_transit}    //div[text()='อยู่ระหว่างจัดส่ง']
${b2c_btn_waiting_for_pick_up}    //div[@id='rc-tabs-4-tab-2']
${b2c_btn_delivery_completed}    //div[@id='rc-tabs-4-tab-3']
${b2c_btn_other}    //div[@id='rc-tabs-4-tab-4']
${b2c_btn_filter}    //span[text()='ตัวกรอง']/..
${b2c_btn_search_filter}    //span[text()='ค้นหา']/..
${b2c_btn_remove_search}    //span[@class='ant-input-clear-icon']

${b2c_txt_parcels_in_tab_is_in_transit}    //div[contains(@class,'ant-tabs-tabpane ant-tabs-tabpane-active h-')]

${b2c_form_filter}    //form[@id='parcelList']

${b2c_txtbox_parcel_number}    //input[@placeholder='ระบุข้อมูล' and @id='parcelList_parcelnumber']

${b2c_card_parcel_search_results}    //div[@class='ant-row w-full css-1hobygo']