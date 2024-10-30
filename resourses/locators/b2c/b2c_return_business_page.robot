*** Variables ***
${btn_add_booking}    //span[text()='{value}']/..
${btn_accept_condition}    //span[text()='{value}']/..
${btn_save_return_business}    //button//span[text()='{value}']
${btn_popup_return_business}    //button//span[text()='{value}']

${txt_return_business_header}    //div[@class='ant-card-head-title']//h3
${txt_link_return_business_header}    //div[@class='ant-modal-title']//span[contains(@class,'ant-typography') and contains(@class,'text-xl')]
${txt_link_name_return_business}    //label[@for='return_linkName']
${txt_phone_return_business}    //label[@for='return_tel']
${txt_name_return_business}    //label[@for='return_name']
${txt_shipping_payer_return_business}    //label[@for='return_paymentBy']
${txt_location_pickup_return_business}    //form[contains(@class,'ant-form ant-form-vertical')]//h5

${txt_heading_booking_list}    //div[@class='ant-card-head-title']//strong[text()='{value}']
${txt_heading_parcel_list_return_business}    //div[@class='ant-card-head-title']//strong[text()='{value}']
${txt_heading_summary_booking_return_business}    //div[@class='ant-card-head-title']//strong[text()='{value}']
${txt_booking_id_return_business}    //strong[text()='{value}']/../../..//div[2]//span
${txt_booking_name_return_business}    //strong[text()='{value}']/../../..//div[4]//span
${txt_booking_time_return_business}    //strong[text()='{value}']/../../..
${txt_shipping_origin_return_business}    //strong[text()='{value}']
${txt_discount_return_business}    //span[text()='{value}']/../..
${txt_insure_return_business}    //span[text()='{value}']/../..
${txt_cod_return_business}    //span[text()='{value}']/../..
${txt_total_return_business}    //strong[text()='{value}']/../../..
${txt_return_business_return_business}    //div[@class='ant-modal-title']//div['{value}']
${txt_sender_info_return_business}    //form[@id='create_parcel_form']//span[text()='{value}']
${txt_sender_phone_return_business}    //label[@for='create_parcel_form_sender_tel']
${txt_sender_name_return_business}    //label[@for='create_parcel_form_sender_name']
${txt_sender_address_return_business}    //label[@for='create_parcel_form_sender_address_info']
${txt_sender_address_full_return_business}    //label[@for='create_parcel_form_sender_address_full']
${txt_list_parcel_size_return_business}    //div[@class='ant-list-item']//strong[text()='{value}']/../..
${txt_remark_full_return_business}    //label[@for='create_parcel_form_remark']

${txt_address_return_business}    //label[@for='return_address_info']
${txt_postcode_return_business}    //label[@for='return_address_full']
${txt_topic_in_popup}    //*[text()='{value}']
${txt_link_name_in_popup}    //label[@for='trigger_linkId']
${txt_phone_in_popup}    //label[@for='trigger_tel']
${txt_name_in_popup}    //label[@for='trigger_name']
${txt_shipping_payer_in_popup}    //*[text()='{label}']//..//*[text()='{value}']
${txt_address_in_popup}    //label[@title='{value}']


${txtbox_link_name_return_business}    //input[@id='return_linkName']
${txtbox_phone_return_business}    //input[@id='return_tel']
${txtbox_name_return_business}    //input[@id='return_name']
${txtbox_address_return_business}    //textarea[@id='return_address_info']
${txtbox_postcode_return_business}    //input[@id='return_address_full']
${txtbox_link_name_in_popup}    //input[@id="trigger_linkId"]
${txtbox_phone_in_popup}    //input[@id="trigger_tel"]
${txtbox_name_in_popup}    //input[@id="trigger_name"]
${txtbox_address_in_popup}    //label[@title='{value}']//..//..//textarea

${txtbox_link_name_delete}    //input[@id='return_linkName']//..//span[@role='button']
${txtbox_phone_delete}    //input[@id='return_tel']//..//span[@role='button']
${txtbox_name_delete}    //input[@id='return_name']//..//span[@role='button']
${txtbox_address_delete}    //textarea[@id='return_address_info']//..//span[@role='button']
${txtbox_postcode_delete}    //input[@id='return_address_full']//..//..//..//span[@aria-label='close-circle']

${txtbox_sender_phone_return_business}    //input[@id='create_parcel_form_sender_tel']
${txtbox_sender_name_return_business}    //input[@id='create_parcel_form_sender_name']
${txtbox_sender_address_return_business}    //textarea[@id='create_parcel_form_sender_address_info']
${txtbox_sender_postcode_return_business}    //input[@id='create_parcel_form_sender_address_full']

${btn_add_parcel_return_business}    //span[@aria-label='plus-circle']/../..
${btn_select_address_return_business}    //div[@id='create_parcel_form_sender_address_full_list']/..//div[text()='{value}']
${btn_select_parcel_size_return_business}    //div[@class='ant-list-item']//strong[contains(normalize-space(.), '{value}')]
${btn_parcel_booking_return_business}    //span[text()='{value}']/..

${opt_postcode_choice_return_business}    //*[text()='{value}']
${opt_owner_pay_return_business}    //span[text()='{value}']/..//input[@value='owner']//..

${tab_send_home_return_business}    //div[@data-node-key='home' and @class='ant-tabs-tab ant-tabs-tab-active']

${crd_booking_return_business}    (//div[@class='ant-card-body']//*[contains(text(),'{link_name}')]//..//..//tbody//tr//span[contains(normalize-space(),'{name} {phone}')]//..//..//..//..//..//span[text()='{address}'])[1]
${crd_id_booking_return_business}    //.//..//..//..//..//..//*[text()='ID']//..//..//span//span
${crd_parcel_return_business}    //span[text()='{value}']/../../../../..//div[@class='ant-card-body']

${msg_popup_success}    //span[text()='{value}']
