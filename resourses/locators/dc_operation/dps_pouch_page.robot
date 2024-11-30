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
${dps_txt_th_parcel_in_table_pouch_detail}    //tr[th='{txt_pouch_number}' and th='{txt_destination_warehouse}' and th='{txt_pickup_place}' and th='{txt_type}' and th='{txt_parcel_status}']
${dps_txt_destination_inventory_pouch_detail}    //td[text()='{destination_inventory}']/..//td[5]//button[@aria-checked='true']

${dps_cbo_destination_inventory_in_filter}    //input[@id='destDc']/../..

${dps_img_pencil_in_pouch_in_pouch_list}    //tr[td[1]='{pouch_number}' and td[2]='{inventory_crossdock}' and td[3]='{destination_inventory}'  and td[5]//button[@aria-checked='{checked}'] and contains(td[6], '{update_date}')]//td[7]//img[@src='/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fedit-3.9188d6d3.png&w=1080&q=75']
${dps_img_star_symbol_pouch_label}    //div[@class='mt-12']//img[contains(@alt,'DCSB')]
${dps_img_label_hourglass_symbol_pouch_label}    //div[@class='mt-12']//img[contains(@alt,'RDCLP')]
${dps_img_qr_pouch_label}    //div[@class='print-section ']//div[contains(@class,'ant-qrcode')]