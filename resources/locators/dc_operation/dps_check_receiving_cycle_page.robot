*** Variables ***
${dps_txt_receiving_cycle_list}    //div[@aria-hidden='false']//tr[contains(@class,'ant-table-row ant-table-row-level-0')]
${dps_txt_parcel_pickup_detail}    //button[@aria-label='Close']/..//span[text()='{value}']
${dps_txt_list_receiving_cycle}    //div[@aria-hidden='false']//td[text()='{company_name}']//..//td[text()='{branch}']//..//td[text()='{address}']//..//td[text()='{sub_district}']//..//td[text()='{district}']//..//td[text()='{province}']//..//td[text()='{postcode}']//..//td[text()='{tomorrow}']//..//td[text()='{receiving_time}']//..//td//div[text()='{receiving_type}']//..//..//td[text()='{courier}']//..//td[text()='{number_of_parcel}']/..//td[contains(text(),'{cutoff}')]/..//td//div[contains(text(),'{status}')]//..//..//button[@type='button']
${dps_txt_list_receiving_cycle_waiting}    //div[@aria-hidden='false']//td[text()='{company_name}']/..//td[text()='{address}']/..//td[text()='{sub_district}']/..//td[text()='{district}']//..//td[text()='{province}']/..//td[text()='{postcode}']/..//td[text()='{tomorrow}']/..//td[text()='{receiving_time}']/..//td//div[text()='{receiving_type}']/../..//td[text()='{courier}']/..//td[text()='{number_of_parcel}']/..//td[contains(text(),'{cutoff}')]/..//td//div[contains(text(),'{status}')]/../..//button[@type='button']
${dps_txt_company_parcel_pickup_detail}    //strong[text()='{text_company}']/../../..//span[text()='{company_name}']
${dps_txt_company_address_parcel_pickup_detail}    //strong[text()='{text_address}']/../../..//span[text()='{company_address}']
${dps_txt_sub_district_parcel_pickup_detail}    //strong[text()='{text_sub_district}']/../../..//span[text()='{sub_district}']
${dps_txt_district_parcel_pickup_detail}    //strong[text()='{text_district}']/../../..//span[text()='{district}']
${dps_txt_province_parcel_pickup_detail}    //strong[text()='{text_province}']/../../..//span[text()='{province}']
${dps_txt_postcode_parcel_pickup_detail}    //strong[text()='{text_postcode}']/../../..//span[text()='{postcode}']
${dps_txt_pickup_date_parcel_pickup_detail}    //strong[text()='{text_pickup}']/../../..//span[text()='{pickup_date}']
${dps_txt_receiving_type_parcel_pickup_detail}    //strong[text()='{text_receiving_type}']/../../..//span[text()='{receiving_type}']
${dps_txt_courier_parcel_pickup_detail}    //strong[text()='{text_courier}']/../../..//span[text()='{courier}']
${dps_txt_parcel_num_parcel_pickup_detail}    //strong[text()='{text_parcel_num}']/../../..//span[text()='{parcel_num}']
${dps_txt_status_parcel_pickup_detail}    //strong[text()='{text_status}']/../../..//div[text()='{status}']
${dps_txt_save_success_parcel_pickup_detail}    //p[text()='{value}']
${dps_txt_booking_id_parcel_pickup_detail}    //td[text()='{value}']
${dps_txt_company_name_parcel_pickup_detail}    //td[text()='{company}']/..//td[text()='{branch}']

${dps_date_recieve_picker}    //input[@id='dateRecieve'] 

${dps_popup_parcel_pickup_details}    //button[@aria-label='Close']/..//div[@class='ant-card-body']

${dps_btn_parcel_pickup_details}    //button[@aria-label='Close']/..//button//span[text()='{value}']
${dps_btn_filter_parcel_pickup_details}    //div[@aria-hidden='false']//span[text()='{value}']/..
${dps_btn_today_parcel_pickup}    //li[@class='ant-picker-now']//a
${dps_btn_search_parcel_pickup}    //div[@aria-hidden='false']//div[text()='{value}']/..
${dps_btn_close_parcel_pickup_details}    //button[@aria-label='Close']
${dps_btn_status_next_page_pickup_schedule}    //div[@aria-hidden='false']//span[@class='anticon anticon-right']/../..
${dps_btn_next_page_pickup_schedule}    //div[@aria-hidden='false']//span[@class='anticon anticon-right']/..
${dps_btn_pencil_receiving_cycle}    //div[@aria-hidden='false']//td[text()='{company_name}']//..//td[text()='{branch}']//..//td[text()='{address}']//..//td[text()='{sub_district}']//..//td[text()='{district}']//..//td[text()='{province}']//..//td[text()='{postcode}']//..//td[text()='{tomorrow}']//..//td[text()='{receiving_time}']//..//td//div[text()='{receiving_type}']/../..//td[text()='{number_of_parcel}']/..//td[contains(text(),'{cutoff}')]/..//td//div[contains(text(),'{status}')]//..//..//button[@type='button']
${dps_btn_pencil_receiving_cycle_waiting}    //div[@aria-hidden='false']//td[text()='{company_name}']/..//td[text()='{address}']/..//td[text()='{sub_district}']/..//td[text()='{district}']//..//td[text()='{province}']/..//td[text()='{postcode}']/..//td[text()='{tomorrow}']/..//td[text()='{receiving_time}']/..//td//div[text()='{receiving_type}']/../..//td[text()='{number_of_parcel}']/..//td[contains(text(),'{cutoff}')]/..//td//div[contains(text(),'{status}')]/../..//button[@type='button']

${dps_update_date_parcel_pickup}    //input[@id='dateModifyWaiting']/../..
${dps_update_date_all_parcel_pickup}    //input[@id='dateModify']/../..

${dps_cbo_vehicle_type}    //strong[text()='{value}']/../../..//div[@class='ant-select-selector']
${dps_cbo_warehouse_parcel_pickup}    //li[@role='menuitem']//span[text()='{value}']

${dps_tab_dps_menu}    //a[@href='/{value}']

${dps_img_loading}    //img[@alt='my gif']
