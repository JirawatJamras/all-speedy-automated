*** Variables ***
${tab_sender_favorite_page}    //div[@data-node-key='sender']
${tab_selected_sender_favorite_page}    //div[@data-node-key='sender']//div[@class='ant-tabs-tab-btn']
${tab_receiver_favorite_page}    //div[@data-node-key='receiver']
${tab_selected_receiver_favorite_page}    //div[@data-node-key='receiver']//div[@class='ant-tabs-tab-btn']
${tab_shipping_origin_area_favorite_page}    //div[@data-node-key='place']
${tab_selected_shipping_origin_area_favorite_page}    //div[@data-node-key='place']//div[@class='ant-tabs-tab-btn']
${tab_send_home_favorite_page}    //div[@data-node-key='home']
${tab_selected_send_home_favorite_page}    //div[@data-node-key='home']//div[@id='favorite_form_receiver_placeType-tab-home']
${tab_send_store_favorite_page}    //div[@data-node-key='store']
${tab_selected_send_home_favorite_page}    //div[@data-node-key='store']//div[@id='favorite_form_receiver_placeType-tab-store']

${cbo_sender_address_favorite_page}    //div[@class='ant-select-item-option-content' and contains(text(),'{value}')]
${cbo_receiver_store}    //div[@title='{value}']
${cbo_receiver_postcode}    //div[@title='{value}']
${cbo_shipping_origin_store}    //div[@title='{value}']

${card_sender_favorite_page}    (//strong[text()='{favorite_name}']/../../..//*[@stroke='currentColor']/../../../../..//span[text()='{name}']/../..//span[text()='{phone}']/../../../..//span[text()='{address} ']/../../../../..)[1]
${card_receiver_send_home_favorite_page}    (//div[@aria-hidden='false']//strong[text()='{favorite_name}']/../../..//*[@stroke='currentColor']/../../../../..//span[text()='{name}']/../..//span[text()='{phone}']/../../../..//span[text()='{address}']/../../../../..)[1]
${card_receiver_send_store_favorite_page}    (//div[@aria-hidden='false']//strong[text()='{favorite_name}']/../../..//*[@loading='lazy']/../../../../..//span[text()='{name}']/../..//span[text()='{phone}']/../../../..//span[text()='{address}']/../../../../..)[1]
${card_skelton_favorite_page}    //ul[@class='ant-skeleton-paragraph']
${card_shipping_origin_favorite_page}    (//div[@aria-hidden='false']//strong[text()='{favorite_name}']/../../..//*[@loading='lazy']/../../../../..//span[text()='{address}']/../../../../..)[1]

${btn_edit_data_favorite_page}    //span[text()='{value}']/..
${btn_save_edit_data_favorite_page}    //span[text()='{value}']/..
${btn_add_sender_favorite_page}    //div[contains(@id,'sender')]//span[text()='{value}']/..
${btn_save_data_favorite_page}    //span[text()='{value}']/..
${btn_choose_store_favorite_page}    //b[text()='{value}']/..
${btn_add_receiver_favorite_page}    //div[contains(@id,'receiver')]//span[text()='{value}']/..
${btn_add_shipping_origin_area_favorite_page}    //div[contains(@id,'place')]//span[text()='{value}']/..
${btn_shipping_origin_set_to_default_area_favorite_page}    //button[@id='favorite_form_isDefault']
${btn_sender_clear_favorite_name_favorite_page}    //input[@id='favorite_form_name']/..//span[@class='ant-input-clear-icon']

${txtbox_sender_favorite_name_favorite_page}    //input[@id='favorite_form_name']
${txtbox_sender_phone_favorite_page}    //input[@id='favorite_form_sender_tel']
${txtbox_sender_name_favorite_page}    //input[@id='favorite_form_sender_name']
${txtbox_sender_address_favorite_page}    //textarea[@id='favorite_form_sender_address_info']
${txtbox_sender_postcode_value_favorite_page}    //input[@id='favorite_form_sender_address_full']/../..
${txtbox_sender_postcode_favorite_page}    //input[@id='favorite_form_sender_address_full']
${txtbox_receiver_favorite_name_favorite_page}    //input[@id='favorite_form_name']
${txtbox_receiver_phone_favorite_page}    //input[@id='favorite_form_receiver_tel']
${txtbox_receiver_name_favorite_page}    //input[@id='favorite_form_receiver_name']
${txtbox_receiver_address_favorite_page}    //textarea[@id='favorite_form_receiver_address_info']
${txtbox_receiver_postcode_value_favorite_page}    //input[@id='favorite_form_receiver_address_full']/../..
${txtbox_receiver_postcode_favorite_page}    //input[@id='favorite_form_receiver_address_full']
${txtbox_receiver_search_store_favorite_page}    //span[text()='{value}']/..//input[@class='ant-select-selection-search-input']
${txtbox_receiver_display_store_address_favorite_page}    //textarea[@id='favorite_form_receiver_address_display']
${txtbox_shipping_origin_favorite_name_favorite_page}    //input[@id='favorite_form_name']
${txtbox_shipping_origin_search_store_favorite_page}    //input[@class='ant-select-selection-search-input']

${txt_favorite_name_in_card_favorite_page}    //*//strong[text()='{value}']
${txt_sender_name_in_card_favorite_page}    //*//strong[contains(text(),'{value}')]/../..//span[text()]
${txt_sender_phone_in_card_favorite_page}    //*//strong[contains(text(),'{value}')]/../..//span[text()]
${txt_sender_address_in_card_favorite_page}    //*//strong[contains(text(),'{value}')]/../..//span[text()]
${txt_sender_data_in_popup_favorite_page}    //div[@class='ant-modal-title']
${txt_sender_favorite_name_in_popup_favorite_page}    //label[@for='favorite_form_name']
${txt_sender_phone_in_popup_favorite_page}    //label[@for='favorite_form_sender_tel']
${txt_sender_name_in_popup_favorite_page}    //label[@for='favorite_form_sender_name']
${txt_sender_address_in_popup_favorite_page}    //label[@for='favorite_form_sender_address_info']
${txt_sender_postcode_in_popup_favorite_page}    //label[@for='favorite_form_sender_address_full']
${txt_receiver_name_card_favorite_page}    //*//strong[contains(text(),'{value}')]/../..//span[text()]
${txt_receiver_phone_card_favorite_page}    //*//strong[contains(text(),'{value}')]/../..//span[text()]
${txt_receiver_address_favorite_page}    //*//strong[contains(text(),'{value}')]/../..//span[text()]
${txt_receiver_data_in_popup_favorite_page}    //div[@class='ant-modal-title']
${txt_receiver_favorite_name_in_popup_favorite_page}    //label[@for='favorite_form_name']
${txt_receiver_phone_in_popup_favorite_page}    //label[@for='favorite_form_receiver_tel']
${txt_receiver_name_in_popup_favorite_page}    //label[@for='favorite_form_receiver_name']
${txt_receiver_location_pickup_in_popup_favorite_page}    //strong[text()='{value}']
${txt_receiver_address_in_popup_favorite_page}    //label[@for='favorite_form_receiver_address_info']
${txt_receiver_postcode_in_popup_favorite_page}    //label[@for='favorite_form_receiver_address_full']
${txt_shipping_origin_area_data_in_popupfavorite_page}    //div[text()='{value}']
${txt_shipping_origin_favorite_name_in_popup_favorite_page}    //label[@for='favorite_form_name']
${txt_shipping_origin_set_to_default_in_popup_favorite_page}    //label[@for='favorite_form_isDefault']

${img_home}    //div[@class='ant-space-item']/*[@stroke='currentColor']
${img_store}    //div[@class='ant-space-item']//*[@loading='lazy']

${msg_successfully_favorite_page}    //div[@class='ant-message-custom-content ant-message-success']