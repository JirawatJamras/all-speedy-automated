*** Variables ***
${dps_btn_print_pouch_label_pouch_detail_page}    //span[text()=' Print Pouch Label']/..
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
${dps_destination_warehouse_in_pouch_label}    //div[@class='print-section ']//h1

${dps_cbo_destination_inventory_in_filter}    //input[@id='destDc']/../..

${dps_img_pencil_in_pouch_in_pouch_list}    //tr[td[1]='{pouch_number}' and td[2]='{inventory_crossdock}' and td[3]='{destination_inventory}'  and td[5]//button[@aria-checked='{checked}'] and contains(td[6], '{update_date}')]//td[7]//img[@src='/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fedit-3.9188d6d3.png&w=1080&q=75']