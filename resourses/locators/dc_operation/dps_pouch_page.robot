*** Variables ***
${dps_btn_print_pouch_label_pouch_detail_page}    //span[text()=' {value}']/..
${dps_btn_close_pouch_and_print_label_on_warning_popup}    //span[text()='{value}']/..
${dps_btn_close_x_button_on_popup}    //div[@class='ant-modal-mask']/..//button[@aria-label='Close']
${dps_btn_filter_pouch_page}    //span[text()='{value}']/..
${dps_btn_search_filter_pouch_page}    //div[text()='{value}']/..

${dps_txt_pouch_in_pouch_list}    //tr[td[1]='{pouch_number}' and td[2]='{inventory_crossdock}' and td[3]='{destination_inventory}' and td[5]//button[@aria-checked='{checked}'] and contains(td[6], '{update_date}')]
${dps_txt_title_pouch_pouch_page}    //strong[text()='{value}']
${dps_txt_transaction_complete_popup}    //div[text()='{value}']
${dps_txt_warning_confirm_to_close_pouch}    //div[@class='ant-modal-content']//div[@class='ant-modal-title']//h1[contains(normalize-space(), '{value}')]
${dps_txt_title_pouch_detail}    //div[text()='{value}']
${dps_txt_pouch_number_pouch_detail}    //span[text()='{value}']
${dps_txt_crossdock_warehouse_pouch_detail}    //span[text()='{value}']
${dps_txt_pouch_status_pouch_detail}    //span[text()='{value}']
${dps_txt_parcel_amount_pouch_detail}    //span[text()='{value}']
${dps_txt_origin_warehouse_pouch_detail}    //span[text()='{value}']
${dps_txt_destination_warehouse_pouch_detail}    //span[text()='{value}']
${dps_txt_destination_warehouse_in_pouch_label}    //div[@class='print-section ']//h1
${dps_txt_number_in_pouch_label}    //div[@class='print-section ']//h1/..//div//span
${dps_txt_route_in_pouch_label}    //div[@class='print-section ']/div/div/div[3]//span
${dps_txt_pouch_number_pouch_label}    //div[@class='print-section ']//div[@id='barcodePouch']
${dps_txt_title_parcel_in_pouch_list_pouch_label}    //h1[text()='{value}']
${dps_txt_tr_parcel_in_table_pouch_detail}    //div[@class='ant-modal-content']//tr[td[1]='{parcel_number}' and td[2]='{destination_warehouse}' and td[3]='{pickup_place}' and td[4]='{type}' and td//h1[contains(normalize-space(), '{parcel_status}')]]
${dps_txt_th_parcel_in_table_poch_detail}    //tr[th='{txt_pouch_number}' and th='{txt_destination_warehouse}' and th='{txt_pickup_place}' and th='{txt_type}' and th='{txt_parcel_status}']

${dps_cbo_destination_inventory_in_filter}    //input[@id='destDc']/../..

${dps_img_pencil_in_pouch_in_pouch_list}    //tr[td[1]='{pouch_number}' and td[2]='{inventory_crossdock}' and td[3]='{destination_inventory}'  and td[5]//button[@aria-checked='{checked}'] and contains(td[6], '{update_date}')]//td[7]//img[@src='/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fedit-3.9188d6d3.png&w=1080&q=75']
${dps_img_star_symbol_pouch_label}    //div[@class='print-section ']/div/div/div/div/div[2]//img[@src='data:image/png;base64,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 ']
${dps_img_qr_pouch_label}    //div[@class='print-section ']//div[contains(@class,'ant-qrcode')]