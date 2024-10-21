*** Variables ***
### booking page ###
${txt_title_booking}    //div[contains(@class,'ant-layout')]//h2[contains(@class,'ant-typography')][contains(text(), '{value}')]

### term&con ###
${txt_term_and_condition}     //div[@class='ant-modal-title']//span[contains(@class,'ant-typography')]

${btn_accept_terms_service}     //button[@class='ant-btn css-1hobygo ant-btn-default ant-btn-color-default ant-btn-variant-outlined bg-gradient-to-r from-blue-900 text-white to-blue-400 shadow-xl']
${btn_close_condition_popup}     (//button[@type='button' and @class='ant-modal-close'])[1]

### create a parcel ###
${btn_parcel_type_dry}     //img[@alt='Dry']
${btn_parcel_type_chill}    //img[@alt='Chill']
${btn_add_sender_to_favorites}    //div[@id='create_parcel_form_sender_isDefault']//span[@class='anticon anticon-heart']
${btn_add_sender_to_favorites_is_red}    //div[@id='create_parcel_form_sender_isDefault' and @value='true']
${btn_save_draft}    //span[contains(text(), '{value}')]/../../button
${btn_add_receiver_to_favorites}    //div[@id='create_parcel_form_receiver_isDefault']//span[@class='anticon anticon-heart']
${btn_next}    //div[@class='ant-space-item' and text()='{value}']/../../../button
${btn_parcel_booking}    //span[contains(text(),'{value}')]
${btn_parcel_size}    //*[@id="create_parcel_form"]//span//strong[text()='{value}']
${btn_parcel_select_A4}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_parcel_select_A3}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_parcel_select_XS}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_parcel_select_S}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_parcel_select_M}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_parcel_select_L}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_parcel_select_XL}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_parcel_select_XXL}    //strong[text()= '{value}']/../../../div[@class='ant-card-body']
${btn_use_code}    //button//span[text()='ใช้โค้ด']
${btn_use_coupon}    //div[contains(@class,'ant-row max-sm:hidden')]//span[text()='{value}']/..
${btn_choose_favorites_list}    //strong[text()='{value_name}' and text()='{value_phone}' ]/../../../../../div[2]/span[text()='{value_address}' and text()='{value_subdistrict}' and text()='{value_district}' and text()='{value_province}' and text()='{value_postal_code}']/../../../../label
${btn_choose_store}    //b[text()='{value}']/..
${btn_close_popup}    //div[@class='ant-modal-header']/..//button//span[@aria-label='close']
${btn_confirm_to_close_popup}    //button//span[@aria-label='check']
${btn_card_latest_booking}    (//div[@class='ant-spin-container']//div[@class='ant-card-body'])[1]

${txt_title_create_parcel_page}     //div[@class='ant-modal-title']/div[@class='max-sm:border-b pb-2 border-blue-800 text-blue-800']
${txt_parcel_sender_information}    //div[@class='ant-steps ant-steps-horizontal Booking_stepsContainerDesktop__GbpI9 max-[680px]:hidden css-9920sk ant-steps-label-vertical']//div[@class='ant-steps-item-title'][contains(text(),'{value}')]
${txt_phone_sender}    //label[@for='create_parcel_form_sender_tel']/span
${txt_name_sender}    //label[@for='create_parcel_form_sender_name']/span
${txt_address_sender}    //label[@for='create_parcel_form_sender_address_info']/span
${txt_postcode_sender}    //label[@for='create_parcel_form_sender_address_full']/span
${txt_full_postcode_sender}    //span[@class='ant-select-selection-item']
${txt_parcel_receiver_information}    //div[@class='ant-steps ant-steps-horizontal Booking_stepsContainerDesktop__GbpI9 max-[680px]:hidden css-9920sk ant-steps-label-vertical']//div[@class='ant-steps-item-title'][contains(text(),'{value}')]
${txt_phone_receiver}    //label[@for='create_parcel_form_receiver_tel']/span
${txt_name_receiver}    //label[@for='create_parcel_form_receiver_name']/span
${txt_address_receiver}    //label[@for='create_parcel_form_receiver_address_info']/span
${txt_address_receiver_for_7_11_select}    //label[@for='create_parcel_form_receiver_address_display']/span
${txt_postcode_receiver}    //label[@for='create_parcel_form_receiver_address_full']/span
${txt_full_postcode_receiver}    //span[@class='ant-select-selection-item']
${txt_location_receiver}    //div[@class='ant-space-item']//span[@class='ant-typography text-xl css-1hobygo']
${txt_booking_id}    //strong[contains(text(), '{value}')]/../../../div[2]
${txt_booking_time}    //strong[contains(text(), '{value}')]/../../../div[2]
${txt_booking_name}    //strong[contains(text(), '{value}')]/../../../div[4]
${txt_parcel_id}    //div[@class='ant-list-item']//div[@class='ant-card-head']//div[@class='ant-card-head-wrapper']//strong
${txt_booking_id_in_list}    //span[text()='{value}']
${txt_booking_status_in_list}    //span[text()='{value}']/../span[2]
${txt_booking_name_in_list}    //span[text()='{value}']/../../../../div[2]/div/div/span
${txt_booking_date_in_list}    //span[text()='{value}']/../../../../div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/span
${txt_booking_item_in_list}    //span[text()='{value}']/../../../../div[2]/div[2]/div[2]/div[2]/div/div/div[2]
${txt_booking_price_in_list}    //span[text()='{value}']/../../../../div[2]/div[2]/div[2]/div[2]/div/div/div[4]
${txt_selected_coupon_and_code}    (//*[@id="create_parcel_form_promotion"]//span//strong)[1]
${txt_my_coupon_and_code}    (//*[@id="create_parcel_form_promotion"]//span//strong)[2]
${txt_insure_amount}    //label[@title='{value}']
${txt_cod}    //label[@title='{value}']
${txt_remark}    //label[@title='{value}']
${txt_selected_code_detail}    //span//strong[text()='คูปองและโค้ดส่วนลดที่เลือก']/../..
${txt_store_address}    //textarea[@id='create_parcel_form_receiver_address_display']
${txt_edit_booking_popup}    //div[@class='ant-modal-content']//div[text()='{value}']
${booking_txt_parcel_id_booking_detail_page}    //*[@id="__next"]/div/div[3]/main/div[1]/div/div[2]/div/div[1]/div/div[4]/div/div[2]/div/div/div/div/div/div/div/div/div/div[1]/div/div/div/div/div/span/strong
${txt_booking_card_skeleton}    (//div[@class='ant-skeleton-content'])[1]

${txtbox_phone_sender}    //input[@id='create_parcel_form_sender_tel']
${txtbox_name_sender}    //input[@id='create_parcel_form_sender_name']
${txtbox_address_sender}    //textarea[@id='create_parcel_form_sender_address_info']
${txtbox_postcode_sender}    //input[@id='create_parcel_form_sender_address_full']
${txtbox_postcode_sender_not_select_text}    //span[@class='ant-select-selection-placeholder']
${txtbox_postcode_sender_select_text_in}    //span[@class='ant-select-selection-item']
${txtbox_full_postcode_sender}    //input[@id='create_parcel_form_sender_address_full']
${txtbox_phone_receiver}    //input[@id='create_parcel_form_receiver_tel']
${txtbox_name_receiver}    //input[@id='create_parcel_form_receiver_name']
${txtbox_address_receiver}    //textarea[@id='create_parcel_form_receiver_address_info']
${txtbox_postcode_receiver}    //input[@id='create_parcel_form_receiver_address_full']
${txtbox_postcode_receiver_not_select_text}    //span[@class='ant-select-selection-placeholder']
${txtbox_postcode_receiver_select_text}    //span[@class='ant-select-selection-item']
${txtbox_full_postcode_receiver}    //span[text()='{value} ']/../../..//div[@class='ant-select-selector']//span[1]
${txtbox_parcel_remark}    //label[text()='หมายเหตุ']/../..//textarea[@id='create_parcel_form_remark']
${txtbox_promotion}    //input[@placeholder='ระบุโค้ดส่วนลด']
${txtbox_cod}    //input[@id='create_parcel_form_codValue']
${txtbox_insure_amount}    //label[text()='จำนวนเงินซื้อประกัน']/../..//input[@id='create_parcel_form_insureAmount']
${txtbox_store_receiver}    //div[@id='create_parcel_form_receiver_placeType-panel-store']//input[@class='ant-select-selection-search-input']
${txtbox_store_receiver_value}    //div[@id='create_parcel_form_receiver_placeType-panel-store']//input[@class='ant-select-selection-search-input']/../../span[2]

${cbo_postcode_sender}    //div[@title='{value}']
${cbo_postcode_receiver}    //div[@title='{value}']
${cbo_store_receiver}    //div[@title='{value}']

${tab_send_to_home}    //div[@data-node-key='home']
${tab_send_to_store}    //div[@data-node-key='store']
${tab_send_to_home_verify}    //div[@role='tab' and @aria-selected='true']//div[text()='ส่งที่บ้าน']

${status_active_sender}    //div[@step='1' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_receiver}    //div[@step='2' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_parcel}    //div[@step='3' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_promotion}    //div[@step='4' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']