*** Variables ***
${dps_txt_receiving_cycle_list}    //div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')]
${dps_txt_parcel_pickup_detail}    //button[@aria-label='Close']/..//span[text()='{value}']

${dps_popup_parcel_pickup_details}    //button[@aria-label='Close']/..//div[@class='ant-card-body']

${dps_btn_parcel_pickup_details}    //button[@aria-label='Close']/..//button//span[text()='{value}']

${dps_cbo_vehicle_type}    //strong[text()='{value}']/../../..//div[@class='ant-select-selector']

${dps_tab_dps_menu}    //a[@href='/{value}']

${dps_img_loading}    //img[@alt='my gif']