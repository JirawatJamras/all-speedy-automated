*** Variables ***
${dps_btn_filter_history_parcel_page}    //div[text()='{value}']/..
${dps_btn_search_filter_history_parcel_page}    //div[text()='{value}']/..
${dps_btn_edit_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//td[text()='{value}']/..//button

${dps_txtbox_fitler_parcel_number_history_parcel_page}    //input[@id='parcelCode']

${dps_txt_title_history_parcel_history_parcel_page}    //strong[text()='{value}']
${dps_txt_header_timeline_history_parcel_page}    //strong[text()='{value}']
${dps_txt_header_parcel_detail_history_parcel_page}    //strong[text()='{value}']
${dps_txt_title_parcel_detail_history_parcel_page}    //div[text()='{value}']
${dps_text_value_sender_history_parcel_page}    //p[text()='{value}']
${dps_text_value_sender_address_history_parcel_page}    //p[contains(normalize-space(.), '{value}')]
${dps_text_value_receiver_history_parcel_page}    //div[text()='{value}']


${dps_tbl_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//tr[contains(@class,'ant-table-row')]
${dps_tbl_data_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//td[text()='{value}']

${dps_card_timeline_history_parcel_page}    //strong[text()='{value}']/../../../../..//div[@class='ant-card-body']