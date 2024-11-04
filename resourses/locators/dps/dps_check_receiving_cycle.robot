*** Variables ***
${dps_txt_receiving_cycle_list}    //div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')]
${dps_txt_parcel_pickup_detail}    //button[@aria-label='Close']/..//span[text()='{value}']
${dps_txt_list_receiving_cycle}    //tr[contains(@class,'ant-table-row ant-table-row-level-0')]//td[text()='{company_name}']//..//td[text()='{branch}']//..//td[text()='{address}']//..//td[text()='{sub_district}']//..//td[text()='{district}']//..//td[text()='{province}']//..//td[text()='{postcode}']//..//td[text()='{tomorrow}']//..//td[text()='{receiving_time}']//..//td//div[text()='{receiving_type}']//..//..//td[text()='{courier}']//..//td[text()='{number_of_parcel}']//..//td//div[contains(text(),'{status}')]//..//..//button[@type='button']

${dps_popup_parcel_pickup_details}    //button[@aria-label='Close']/..//div[@class='ant-card-body']

${dps_btn_parcel_pickup_details}    //button[@aria-label='Close']/..//button//span[text()='{value}']

${dps_cbo_vehicle_type}    //strong[text()='{value}']/../../..//div[@class='ant-select-selector']

${dps_tab_dps_menu}    //a[@href='/{value}']

${dps_img_loading}    //img[@alt='my gif']

