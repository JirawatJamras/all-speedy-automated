*** Variables ***
${dps_txtbox_on_scan_in_page}    (//input[@placeholder='Search...'])[1]

${dps_btn_search_scan_in_page}    //span[text()='{value}']/../..//button
${dps_btn_scan_in_tab_is_active_scan_page}    //div[text()='{value}' and @aria-selected='true']

${dps_txt_scan_header_ion_scan_page}    //div[@class='ant-card-head-wrapper']//span[text()='{value}']
${dps_txt_label_sender_title_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography') and contains(@class,'text-2xl')])[2]
${dps_txt_label_sender_name_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[20]
${dps_txt_label_sender_phone_in_scan_in_scan_page}   (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[22]
${dps_txt_label_shipping_origin_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[24]
${dps_txt_label_sender_address_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[26]
${dps_txt_value_sender_name_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_name}']/../../..//span[text()='{value_sender_name}']
${dps_txt_value_sender_phone_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_phone}']/../../..//span[text()='{value_sender_phone}']
${dps_txt_value_shipping_origin_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_shipping_origin}']/../../..//span[text()='{value_shipping_origin}']
${dps_txt_value_sender_address_in_scan_in_scan_page}    //div[@aria-hidden='false']//strong[text()='{label_sender_address}']/../../..//span[contains(normalize-space(.), '{value_sender_address}')]

${dps_txt_label_receiver_title_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography') and contains(@class,'text-2xl')])[3]
${dps_txt_label_receiver_name_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[27]
${dps_txt_label_receiver_phone_in_scan_in_scan_page}   (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[29]
${dps_txt_label_shipping_origin_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[31]
${dps_txt_label_receiver_address_in_scan_in_scan_page}    (//div[@aria-hidden='false']//span[contains(@class,'ant-typography text-lg')])[33]