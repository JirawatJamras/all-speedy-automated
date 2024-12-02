*** Variables ***
${b2c_txt_parcel_search_results}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//div[contains(@class,'grid grid-cols-1')]//div[contains(@class,'ant-col css-')]
${b2c_txt_parcel_status}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]

${b2c_btn_search_parcel}    //button[contains(@class,'ant-btn-default')]//span[text()='{value}']
${b2c_btn_remove_search_parcel}    //div[contains(@class,'ant-card ant-card-bordered max-w-')]//span[@class='ant-input-clear-icon']

${b2c_cbo_search_type_selection}    //div[@class='ant-select-selector']