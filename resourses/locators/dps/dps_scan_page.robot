*** Variables ***
${dps_txtbox_on_scan_in_page}    (//input[@placeholder='Search...'])[1]
${dps_txtbox_on_scan_out_page}    (//input[@placeholder='Search...'])[2]

${dps_btn_search_scan_in_page}    //span[text()='{value}']/../..//button
${dps_btn_search_scan_out_page}    (//span[text()='{value}']/../..//button)[2]
${dps_btn_scan_in_tab_is_active_scan_page}    //div[text()='{value}' and @aria-selected='true']
${dps_btn_confirm_scan_out_scan_out_page}    //span[text()='{value}']/../..//button
${dps_btn_confirm_on_asking_confirm_scan_out_popup}    //div[@class='ant-modal-content']//span[text()='{value}']/..

${dps_txt_scan_header_ion_scan_page}    //div[@class='ant-card-head-wrapper']//span[text()='{value}']
${dps_txt_title_parcel_detail}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_parcel_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']    
${dps_txt_title_customer_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_parcel_size}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_warehouse_crossdock}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_warehouse_destination}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_parcel_status}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_courier}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_pouch_number}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_receiving_date}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_warehouse_source}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_send_parcel_to}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_route}   //span[contains(@class,'ant-typography')]//strong[text()='{value}']
${dps_txt_title_label_route}    //div[@class='mt-5']/div[1]/span[1]
${dps_txt_title_label_store}    //div[@class='mt-5']/div[2]/span[1]
${dps_txt_title_label_customer}    //div[@class='mt-5']/div[3]/span[1]
${dps_txt_title_label_phone}    //div[@class='mt-5']/div[4]/span[1]
${dps_txt_title_label_pouch_number}    //div[@class='mt-5']/div[5]/span[1]
${dps_txt_title_label_wh}    //div[@class='mt-5']/div[6]/span[1]
${dps_txt_value_parcel_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_customer_id}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_parcel_size1}    //input[@type='number' and contains(@class,'ant-input')]
${dps_txt_value_parcel_size2}    //input[@type='number' and contains(@class,'ant-input')]/../span
${dps_txt_value_parcel_size3}    //input[@type='number' and contains(@class,'ant-input')]/../../input
${dps_txt_value_warehouse_crossdock}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_warehouse_destination}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/div/div/span[2]
${dps_txt_value_parcel_status}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_courier}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/div/div/span[2]
${dps_txt_value_pouch_number}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_receiving_date}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_warehouse_source}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_send_parcel_to}    //span[contains(@class,'ant-typography')]//strong[text()='{value}']/../../../div[2]/span
${dps_txt_value_route}    (//div[@class="ant-form-item-control-input-content"]//input)[2]
${dps_txt_value_label_route}    //div[@class='mt-5']/div[1]/span[2]
${dps_txt_value_label_store}    //div[@class='mt-5']/div[2]/span[2]
${dps_txt_value_label_customer}    //div[@class='mt-5']/div[3]/span[2]
${dps_txt_value_label_phone}    //div[@class='mt-5']/div[4]/span[2]
${dps_txt_value_label_pouch_number}    //div[@class='mt-5']/div[5]/span[2]
${dps_txt_value_label_wh}    //div[@class='mt-5']/div[6]/span[2]
${dps_txt_label_sender_title_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_title}']
${dps_txt_label_sender_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_name}']
${dps_txt_label_sender_phone_in_scan_in_scan_page}   //div[@aria-hidden='false']//strong[text()='{label_sender_phone}']
${dps_txt_label_shipping_origin_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_origin}']
${dps_txt_label_sender_address_in_scan_in_scan_page}    (//div[@aria-hidden='false']//strong[text()='{label_sender_address}'])[1]
${dps_txt_value_sender_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_name}']/../../..//span[text()='{value_sender_name}']
${dps_txt_value_sender_phone_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_phone}']/../../..//span[text()='{value_sender_phone}']
${dps_txt_value_shipping_origin_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_origin}']/../../..//span[text()='{value_shipping_origin}']
${dps_txt_value_sender_address_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_address}']/../../..//span[contains(normalize-space(.), '{value_sender_address}')]

${dps_txt_label_receiver_title_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_title}']
${dps_txt_label_receiver_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_name}']
${dps_txt_label_receiver_phone_in_scan_in_scan_page}   //div[@aria-hidden='false']//strong[text()='{label_receiver_phone}']
${dps_txt_label_shipping_destination_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_destination}']
${dps_txt_label_receiver_address_in_scan_in_scan_page}    (//div[@aria-hidden='false']//strong[text()='{label_receiver_address}'])[2]
${dps_txt_value_receiver_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_name}']/../../..//span[text()='{value_receiver_name}']
${dps_txt_value_receiver_phone_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_phone}']/../../..//span[text()='{value_receiver_phone}']
${dps_txt_value_shipping_destination_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_destination}']/../../..//span[text()='{value_shipping_destination}']
${dps_txt_value_receiver_address_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_receiver_address}']/../../..//span[contains(normalize-space(.), '{value_receiver_address}')]
${dps_txt_save_data_success}    //p[text()='{value}']
