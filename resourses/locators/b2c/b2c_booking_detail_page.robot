*** Variables ***
${b2c_crd_list_of_parcels}    //div[@class='hidden sm:inline']//div[contains(@class,'ant-card ant-card-bordered ant-card-hoverable')]//div[@class='ant-card-body']
${b2c_crd_list_of_pickup_schedule}    //div[@aria-hidden='false']//div[@class='ant-spin-container']//li[@class='ant-list-item']
${b2c_crd_parcel_list}    //div[@class='ant-list-item']//span[text()='{value}']/../../../../..//div[@class='ant-card-body']

${b2c_txt_booking_list}    //div[@class='hidden sm:inline']//span[contains(@class,'ant-typography')]//strong[text()='{value}']
${b2c_txt_list_of_parcels_status}    //div[@class='hidden sm:inline']//span[contains(@class,'ant-typography') and contains(text(),'{value}')]
${b2c_txt_sender_name}   //div[contains(@class, 'ant-card-body')]//span[contains(text(), '{value}')]
${b2c_txt_sender_phone}   //div[contains(@class,'ant-row') and contains(normalize-space(.), '{value}')]
${b2c_txt_receiver_name}   //div[contains(@class, 'ant-list-item')]//div[contains(@class, 'ant-card-body')]//span[contains(text(),'{value}')]
${b2c_txt_receiver_phone}   //div[contains(@class,'ant-row') and contains(normalize-space(.), '{value}')]
${b2c_txt_parcel_status_booking_detail_page}    //*[@class='hidden sm:inline']//span[text()='{value}']
${b2c_txt_booking_id_booking_detail_page}    //strong[text()='{value}']/../../..//div[2]//span
${b2c_txt_booking_name_booking_detail_page}    //strong[text()='{value}']/../../..//div[4]//span
${b2c_txt_booking_date_and_time_booking_detail_page}    //*[@class='hidden sm:inline']//strong[text()='{value}']/../../..//div[2]//span
${b2c_txt_shipping_origin_booking_detail_page}    //*[@class='hidden sm:inline']//strong[text()='ต้นทางจัดส่ง :']/../../..//div[2]//span
${b2c_txt_parcel_list_booking_detail_page}    //*[@class='hidden sm:inline']//strong[text()='{value}']
${b2c_txt_booking_summary_booking_detail_page}    //*[@class='hidden sm:inline']//strong[text()='{value}']
${b2c_txt_timestamp_after_print_label}    //span[text()='พิมพ์ใบจ่ายหน้าพัสดุ']/../../..//span[contains(text(),'{value}')]
${b2c_txt_edit_booking_list}    //div[@class='ant-modal-content']//div[text()='{value}']
${b2c_txt_parcel_type}    //form[@id='detail_form']//strong[contains(text(),'{value}')]/../../..
${b2c_txt_booking_name}    //form[@id='detail_form']//strong[contains(text(),'{value}')]/../../..//input
${b2c_txt_shipping_origin_aria}    //form[@id='detail_form']//strong[contains(text(),'{value}')]
${b2c_txt_search_result_store}    //div[@aria-selected]//div[contains(text(),'{value}')]
${b2c_txt_title_print_label}    //div[@class='ant-modal-content']//div[text()='{value}']
${b2c_txt_paper_size}    //span[text()='{value}']
${b2c_txt_list_paper_size}    //div[contains(text(),'{value}')]/../../..
${b2c_txt_parcel_label_detail}    //div[contains(@id,'print')]
${b2c_txt_booking_id}    //span[normalize-space()='{value}']
${b2c_txt_edit_complete}    //*[text()='{value}']
${b2c_txt_transaction_date}    //strong[text()='{value}']/../../..//span[contains(text(),'{value2}')]
${b2c_txt_shipping_origin}    //strong[text()='{value}']/../../..
${b2c_txt_import_time}    //th[@class='ant-table-cell' and text()='{value}']
${b2c_txt_file_name}    //th[@class='ant-table-cell' and text()='{value}']
${b2c_txt_import_file_result}    //th[@class='ant-table-cell' and text()='{value}']
${b2c_txt_file_import_error}    //th[@class='ant-table-cell' and text()='{value}']
${b2c_txt_import_file_in_popup}    (//label[@for='InputFile'])[2]
${b2c_txt_value_import_time}    //th[text()='{value}']/../../..//tr[1]//td[1]
${b2c_txt_value_import_file_name_}    //th[text()='{value}']/../../..//tr[1]//td[2]
${b2c_txt_value_import_success}    //th[text()='{value}']/../../..//tr[1]//td[3]//div[contains(@class,'text-white')]
${b2c_txt_value_import_fail}   //th[text()='{value}']/../../..//tr[1]//td[3]//div[contains(@class,'text-red-500')]
${b2c_txt_value_import_error_file}    //th[text()='{value}']/../../..//tr[1]//td[4]
${b2c_txt_heading_booking_list}    //div[@class='ant-card-head-title']//strong[text()='{value}']

${b2c_ico_trash_red}   //div[@id='__next']//div[contains(@class, 'ant-card')]//*[name()='svg' and contains(@data-icon,'trash')]//*[name()='path' and contains(@fill,'currentCol')]

${b2c_img_red_heart_front_sender}    (//strong[text()='ผู้ส่ง : '])[1]/../../../../span[@role='img' and contains(@style,'color: red')]
${b2c_img_white_heart_front_sender}    (//strong[text()='ผู้ส่ง : '])[1]/../../../../span[@role='img' and not(contains(@style,'color: red'))]
${b2c_img_red_heart_front_receiver}    (//strong[text()='ผู้รับ : '])[1]/../../../../span[@role='img' and contains(@style,'color: red')]
${b2c_img_white_heart_front_receiver}    (//strong[text()='ผู้รับ : '])[1]/../../../../span[@role='img' and not(contains(@style,'color: red'))]
${b2c_img_loading}    //div[@role='dialog']//img
${b2c_img_logo_speed_d}    //div[text()='{value}']/../../../..//img
${b2c_img_qr_code}    //div[text()='{value}']/../../../..//canvas
${b2c_img_loading_in_detail_after_set_origin_shipping}    //div[@role='dialog']//div[@class='ant-modal-content']//img[@class='bg-transparent']
${b2c_img_logo_home}    //div[contains(@class,'ant-col flex items-center')]//*[@stroke='currentColor']
${b2c_img_logo_store}    //div[contains(@class,'ant-col flex items-center')]//*[@draggable='false' and @loading='lazy']

${b2c_btn_print_the_parcel_payment_slip_disabled}   //button[@type='button' and contains(@class, 'ant-btn-primary') and contains(@class, 'bg-blue-800') and @disabled and span[text()='พิมพ์ใบจ่ายหน้าพัสดุ']]
${b2c_btn_edit_booking_list}    (//strong[text()='{value}']/../../..//button)[1]
${b2c_btn_select_store}    //button//b[text()='{value}']/..
${b2c_btn_save_shipping_origin}    //span[text()='{value}']/..
${b2c_btn_print_parcel_label}    //*[@class='hidden sm:inline']//button//span[text()='{value}']
${b2c_btn_print_parcel_label_popup}    //div[text()='{value}']/../../..//button//span[text()='{value}']
${b2c_btn_select_pickup_schedule}   //input[@class='ant-radio-input']/..
${b2c_btn_import_file_detail_page}    //span[text()='{value}']/..
${b2c_btn_import_file_in_popup}  //input[@id='InputFile']
${b2c_btn_template_in_popup}  //span[text()='{value}']/..
${b2c_btn_add_parcel_in_booking_detail_page}    //span[text()='{value}']/..
${b2c_btn_edit_created_parcel}    //span[text()='{value}']/..
${b2c_btn_save_edit_created_parcel}    //span[text()='{value}']/..
${b2c_btn_cleal_sender_phone}    //input[@id='create_parcel_form_sender_tel']/..//span[@role='button']
${b2c_btn_cleal_sender_name}    //input[@id='create_parcel_form_sender_name']/..//span[@role='button']
${b2c_btn_cleal_sender_address}    //textarea[@id='create_parcel_form_sender_address_info']/..//span[@role='button']
${b2c_btn_cleal_sender_postcode}    //input[@id='create_parcel_form_sender_address_full']/../../..//span[@class='ant-select-clear']
${b2c_btn_cleal_receiver_phone}    //input[@id='create_parcel_form_receiver_tel']/..//span[@role='button']
${b2c_btn_cleal_receiver_name}    //input[@id='create_parcel_form_receiver_name']/..//span[@role='button']
${b2c_btn_cleal_receiver_address}    //textarea[@id='create_parcel_form_receiver_address_info']/..//span[@role='button']
${b2c_btn_cleal_receiver_postcode}    //input[@id='create_parcel_form_receiver_address_full']/../../..//span[@class='ant-select-clear']
${b2c_btn_cleal_parcel_remark_postcode}    //textarea[@id='create_parcel_form_remark']/..//span[@role='button']
${b2c_btn_import_error_file}    //th[text()='{value}']/../../..//tr[1]//td[4]//a
${b2c_btn_increase_cod_value}    //input[@id='create_parcel_form_codValue']/../..//span[@role='button' and @aria-label='Increase Value']
${b2c_btn_increase_insure_value}    //input[@id='create_parcel_form_insureAmount']/../..//span[@role='button' and @aria-label='Increase Value']
${b2c_btn_confirm_phone_number}    //span[@aria-label='check']/../../..

${b2c_cbo_paper_size}    //span[text()='{value}']/../..//span[@class='ant-select-selection-item']

${b2c_txtbox_search_store}    //span[text()='{value}']/..//input
${b2c_txtbox_sender_postcode_edit}    //input[@id='create_parcel_form_sender_address_full']/..
${b2c_txtbox_receiver_postcode_edit}    //input[@id='create_parcel_form_receiver_address_full']/..
${b2c_txtbox_trigger_phone_number}    //input[@id='trigger_phoneNumber']

${b2c_tab_shipping_origin_aria}    //div[@role='tab']//div[text()='{value}']
${b2c_tab_pickup_Schedule}    //div[@role='tab']//div[text()='{value}']

${b2c_dialog_create_parcel}    //*[@role='dialog']