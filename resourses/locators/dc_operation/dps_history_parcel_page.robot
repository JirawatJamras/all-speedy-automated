*** Variables ***
${dps_btn_filter_history_parcel_page}    //div[text()='{value}']/..
${dps_btn_search_filter_history_parcel_page}    //div[text()='{value}']/..
${dps_btn_edit_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//td[text()='{value}']/..//button
${dps_btn_reprint_label_history_parcel_page}    //div[text()='{value}']/../..
${dps_btn_cancel_reprint_label_history_parcel_page}    //div[text()='{label_type}']/../..//div[text()='{value}']/../..
${dps_btn_clear_parcel_number_history_parcel_page}    //input[@id='parcelCode']/..//span[@class='ant-input-clear-icon']

${dps_txtbox_fitler_parcel_number_history_parcel_page}    //input[@id='parcelCode']

${dps_txt_title_history_parcel_history_parcel_page}    //strong[text()='{value}']
${dps_txt_header_timeline_history_parcel_page}    //strong[text()='{value}']
${dps_txt_header_parcel_detail_history_parcel_page}    //strong[text()='{value}']
${dps_txt_title_parcel_detail_history_parcel_page}    //div[contains(text(),'{value}')]
${dps_txt_value_parcel_detail_history_parcel_page}    //div[text()='{value}']
${dps_txt_value_parcel_detail_with_title_history_page}    //div[text()='{title}']/..//div[2]
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
${dps_txt_step_description_in_timeline_history_parcel_page}    //div[@class='ant-steps-item-description']
${dps_txt_time_in_timeline_history_parcel_page}    //div[@class='flex justify-center mt-10']//div[contains(@class,'text-end')]
${dps_txt_title_reprint_label_in_card_history_parcel_page}    //div[@class='ant-modal-content']//div[text()='{value}']
${dps_txt_destination_warehouse_in_pouch_label_history_parcel_page}    //div[@class='ant-modal-content']//div[text()='{label_type}']/..//div[contains(@class,'w-[2in] h-[3in] bg-white m-0')]//h1[text()='{destination_warehouse}']
${dps_txt_route_in_pouch_label_history_parcel_page}    //div[@class='ant-modal-content']//div[text()='{label_type}']/..//div[contains(@class,'w-[2in] h-[3in] bg-white m-0')]//span[contains(normalize-space(),'{route}')]

${dps_tbl_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//tr[contains(@class,'ant-table-row')]
${dps_tbl_data_history_parcel_history_parcel_page}    //tbody[@class='ant-table-tbody']//td[text()='{value}']

${dps_card_timeline_history_parcel_page}    //strong[text()='{value}']/../../../../..//div[@class='ant-card-body']
${dps_card_reprint_label_history_parcel_page}    //div[@class='ant-modal-content']//div[text()='{value}']/../..

${dps_cbo_reprint_label_history_parcel_page}    //a[contains(@class,'ant-dropdown-trigger ant-dropdown-open')]
${dps_cbo_value_in_reprint_label_history_parcel_page}    //div[text()='{value}']/../..

${dps_img_rdclp_warehouse_symbol_in_pouch_label_history_parcel_page}    //div[@class='ant-modal-content']//div[text()='{label_type}']/..//div[contains(@class,'w-[2in] h-[3in] bg-white m-0')]//*[@alt='RDCLP']