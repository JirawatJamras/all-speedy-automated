*** Variables ***
### term&con ###
${txt_term_and_condition}     //div[@class='ant-modal-title']//span[contains(@class,'ant-typography')]

${btn_accept_terms_service}     //button[.//span[text()='ยอมรับเงื่อนไขการใช้บริการ']]
${btn_close_condition_popup}     (//button[@type='button' and @class='ant-modal-close'])[1]

### create a parcel ###
${btn_parcel_type_dry}     //img[@alt='Dry']
${btn_parcel_type_chill}    //img[@alt='Chill']
${btn_close_popup_confirm}    //button[text()=' ยืนยัน']
${btn_close_popup_cancel}     //button[text()=' ยกเลิก']
${btn_choose_favorites}     //button[span[text()='เลือกจากรายการโปรด']]
${btn_select_favorites}     //span[text()='เลือก']
${btn_clear_phone_sender}    //input[@id='create_parcel_form_sender_tel']/../span/span
${btn_clear_name_sender}    //input[@id='create_parcel_form_sender_name']/../span/span
${btn_clear_address_sender}    //textarea[@id='create_parcel_form_sender_address_info']/../span/span[1]
${btn_clear_postcode_sender}    //input[@id='create_parcel_form_sender_address_full']/../../../span[2]
${btn_add_sender_to_favorites}    //div[@id='create_parcel_form_sender_isDefault']//span[@class='anticon anticon-heart']
${btn_next_to_receiver}    //div[@class='ant-space-item' and text()='ถัดไป']/../../../button
${btn_save_draft}    //span[contains(text(), 'บันทึกร่าง')]/../../button
${btn_add_receiver_to_favorites}    //div[@id='create_parcel_form_receiver_isDefault']//span[@class='anticon anticon-heart']

${txt_title_create_parcel_page}     //div[@class='ant-modal-title']//div[text()='สร้างพัสดุ']
${txt_frist_step_name}    //form[@id='create_parcel_form']/div[2]/div[1]/div/div[3]/div
${txt_close_popup}     //h2[@id='swal2-title']
${txt_favorites_title}    //div[text()='เลือกจากรายการโปรด']
${txt_favorites_search_no_data}    //div[contains(@class,'ant-radio-group')]//div[@class='ant-empty-description' and text()='No data']

${msg_error_phone_sender}    //input[@id='create_parcel_form_sender_tel']/../../../../div[2]/div/div
${msg_error_name_sender}    //input[@id='create_parcel_form_sender_name']/../../../../div[2]/div/div
${msg_error_address_sender}    //textarea[@id='create_parcel_form_sender_address_info']/../../../../div[2]/div/div
${msg_error_postcode_sender}    //input[@id='create_parcel_form_sender_address_full']/../../../../../../div[2]/div/div

${txtbox_search_favorites}     //input[@placeholder='ค้นหา']
${txtbox_phone_sender}    //input[@id='create_parcel_form_sender_tel']
${txtbox_name_sender}    //input[@id='create_parcel_form_sender_name']
${txtbox_address_sender}    //textarea[@id='create_parcel_form_sender_address_info']
${txtbox_postcode_sender}    //input[@id='create_parcel_form_sender_address_full']
${txtbox_postcode_sender_not_select_text}    //span[@class='ant-select-selection-placeholder']
${txtbox_postcode_sender_select_text_in}    //span[@class='ant-select-selection-item']
${txtbox_phone_receiver}    //input[@id='create_parcel_form_receiver_tel']
${txtbox_name_receiver}    //input[@id='create_parcel_form_receiver_name']
${txtbox_address_receiver}    //textarea[@id='create_parcel_form_receiver_address_info']
${txtbox_postcode_receiver}    //input[@id='create_parcel_form_receiver_address_full']
${txtbox_postcode_receiver_not_select_text}    //span[@class='ant-select-selection-placeholder']
${txtbox_postcode_receiver_select_text}    //span[@class='ant-select-selection-item']

${opt_default_favorites}    //span[contains(@class,'ant-typography bg-amber-500')]/../../../../..//input[@class='ant-radio-input']

${cbo_postcode_sender}    //div[@title='{value}']
${cbo_postcode_receiver}    //div[@title='{value}']

${value_add_sender_to_favorites}    //div[@id='create_parcel_form_sender_isDefault']
${value_add_receiver_to_favorites}    //div[@id='create_parcel_form_receiver_isDefault']

${tab_send_to_home}    //div[@data-node-key='home']
${tab_send_to_store}    //div[@data-node-key='store']

${status_active_sender}    //div[@step='1' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_receiver}    //div[@step='2' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_parcel}    //div[@step='3' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_promotion}    //div[@step='4' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']