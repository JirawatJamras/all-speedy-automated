*** Variables ***
${dps_btn_filter_history_parcel_page}    //div[text()='{value}']/..
${dps_btn_search_filter_history_parcel_page}    //div[text()='{value}']/..
${dps_btn_edit_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//td[text()='{value}']/..//button

${dps_txtbox_fitler_parcel_number_history_parcel_page}    //input[@id='parcelCode']

${dps_txt_title_history_parcel_history_parcel_page}    //strong[text()='{value}']
${dps_txt_header_timeline_history_parcel_page}    //strong[text()='{value}']
${dps_txt_header_parcel_detail_history_parcel_page}    //strong[text()='{value}']
${dps_txt_title_parcel_detail_history_parcel_page}    //div[contains(text(),'{value}')]
${dps_txt_value_parcel_detail_history_parcel_page}    //div[text()='{value}']
${dps_txt_value_tracking_number_history_parcel_page}    //p[text()='{value}']
${dps_txt_value_parcel_status_history_parcel_page}    //h1[contains(normalize-space(.), '{value}')]
${dps_txt_value_pouch_number_history_parcel_page}    //div[text()='{title}']/..//div[text()='{value}']
${dps_txt_value_parcel_size_history_parcel_page}    //div[text()='{title}']/..//div[contains(normalize-space(), '{value}')]
${dps_txt_value_destination_store_history_parcel_page}    //div[text()='{title}']/..//div[contains(normalize-space(.), '{value}')]
${dps_txt_value_sender_history_parcel_page}    //p[text()='{value}']
${dps_txt_value_sender_address_history_parcel_page}    //p[contains(normalize-space(.), '{value}')]
${dps_txt_value_receiver_history_parcel_page}    //p[text()='{value}']
${dps_txt_value_receiver_address_history_parcel_page}    //p[contains(normalize-space(.), '{value}')]
${dps_txt_step_title_in_timeline_history_parcel_page}    //div[@class='ant-steps-item-title']//h1
${dps_txt_step_description_in_timeline_history_parcel_page}    //div[@class='ant-steps-item-description']//h1
${dps_txt_time_in_timeline_history_parcel_page}    //div[@class='flex justify-center mt-10']//div[contains(@class,'text-end')]

${dps_tbl_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//tr[contains(@class,'ant-table-row')]
${dps_tbl_data_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//td[text()='{value}']

${dps_card_timeline_history_parcel_page}    //strong[text()='{value}']/../../../../..//div[@class='ant-card-body']