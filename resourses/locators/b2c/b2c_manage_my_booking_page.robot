*** Variables ***
${b2c_txt_my_parcel}    //h2[text()='พัสดุของฉัน สาขาหลัก']

${b2c_btn_delivered_parcel}    //span[text()='รายการพัสดุที่จัดส่ง']/../..
${b2c_btn_received_parcel}    //div[@id='rc-tabs-5-tab-2']
${b2c_btn_in_transit}    //div[text()='อยู่ระหว่างจัดส่ง']
${b2c_btn_waiting_for_pick_up}    //div[@id='rc-tabs-4-tab-2']
${b2c_btn_delivery_completed}    //div[@id='rc-tabs-4-tab-3']
${b2c_btn_other}    //div[@id='rc-tabs-4-tab-4']

${b2c_txt_parcels_in_tab_is_in_transit}    //div[contains(@class,'ant-tabs-tabpane ant-tabs-tabpane-active h-')]