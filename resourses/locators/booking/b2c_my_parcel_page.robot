*** Variables ***
${b2c_btn_in_transit}    //div[@id='rc-tabs-13-tab-1']
${b2c_btn_waiting_for_pick_up}    //div[@id='rc-tabs-13-tab-2']
${b2c_btn_delivery_completed}    //div[@id='rc-tabs-13-tab-3']
${b2c_btn_other}    //div[@id='rc-tabs-13-tab-4']
${b2c_btn_remove_search}    //span[@class='ant-input-clear-icon']

${b2c_txt_parcels_in_tab_is_in_transit}    //div[contains(@class,'ant-tabs-tabpane ant-tabs-tabpane-active h-')]

${b2c_form_filter}    //form[@id='parcelList']

${b2c_txtbox_parcel_number}    //input[@id='parcelList_parcelnumber']
${b2c_txtbox_name}    //input[@id='parcelList_nameparcel']
${b2c_txtbox_address}    //input[@id='parcelList_address']

${b2c_card_parcel_search_results}    //div[contains(@class,'grid grid-cols-1')]