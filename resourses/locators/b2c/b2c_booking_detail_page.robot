*** Variables ***
${b2c_crd_list_of_parcels}    //div[@class='ant-list ant-list-split ant-list-grid w-full css-1hobygo']//div[@class='ant-spin-nested-loading css-1hobygo']//div[@class='ant-spin-container']//div[@class='ant-row css-1hobygo']//div//div[@class='ant-card-body']
${b2c_crd_list_of_pickup_schedule}    //div[@aria-hidden='false']//div[@class='ant-spin-container']//li[@class='ant-list-item']

${b2c_txt_booking_list}    //div[@class='ant-space css-1hobygo ant-space-horizontal ant-space-align-center ant-space-gap-row-small ant-space-gap-col-small']//strong[contains(text(),'{value}')]
${b2c_txt_list_of_parcels_status}    //div[contains(@class,'ant-list ant-list-split ant-list-grid w-full css-1hobygo')]//div[contains(@class,'ant-spin-nested-loading css-1hobygo')]//div[contains(@class,'ant-spin-container')]//div[contains(@class,'ant-row css-1hobygo')]//div//span[contains(@class,'ant-typography absolute w-[200px] h-8 pt-1 align-middle text-center right-2 top-0 rounded-br-md rounded-bl-md bg-[#fefe02] css-10o2jwh')][contains(text(),'{value}')]
${b2c_txt_sender_name}   //div[contains(@class, 'ant-card-body')]//span[contains(text(), '{value}')]
${b2c_txt_sender_phone}   //div[@class='ant-row css-10o2jwh' and contains(normalize-space(.), '{value}')]
${b2c_txt_receiver_name}   //div[contains(@class, 'ant-list-item')]//div[contains(@class, 'ant-card-body')]//span[contains(text(),'{value}')]
${b2c_txt_receiver_phone}   //div[contains(@class, 'ant-list-item')]//div[contains(@class, 'ant-card-body')]/div/div[@class='ant-row css-10o2jwh' and contains(normalize-space(.), '{value}')]
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

${b2c_ico_trash_red}   //div[@id='__next']//div[contains(@class, 'ant-card')]//*[name()='svg' and contains(@data-icon,'trash')]//*[name()='path' and contains(@fill,'currentCol')]
${b2c_ico_location_receiver}    //div[contains(@class,'ant-col flex items-center')]

${b2c_img_red_heart_front_sender}    //body/div[@id='__next']/div[contains(@class,'ant-layout css-1hobygo')]/div[contains(@class,'ant-layout css-1hobygo')]/main[contains(@class,'ant-layout-content component_layoutContent__n_j3m css-1hobygo')]/div[contains(@class,'sm:hidden w-auto')]/div[contains(@class,'ant-card ant-card-bordered css-1hobygo')]/div[contains(@class,'ant-card-body')]/div[contains(@class,'ant-row css-1hobygo')]/div[contains(@class,'ant-col h-[800px] max-w-[400px] overflow-auto flex border-red-300 css-1hobygo')]/div[contains(@class,'ant-card ant-card-bordered w-[400px] min-w-[370px] mx-2 css-1hobygo')]/div[contains(@class,'ant-card-body')]/div[contains(@class,'css-1hobygo')]/div[contains(@class,'ant-list ant-list-split ant-list-grid css-1hobygo')]/div[contains(@class,'ant-spin-nested-loading css-1hobygo')]/div[contains(@class,'ant-spin-container')]/div[contains(@class,'ant-row css-1hobygo')]/div/div[contains(@class,'ant-col css-1hobygo')]/div[contains(@class,'ant-list-item')]/div[contains(@class,'ant-card ant-card-bordered ant-card-hoverable min-w-[400px] css-10o2jwh')]/div[contains(@class,'ant-card-body')]/div/div[1]/span[@role="img"][@style="font-size: 20px; color: red;"]
${b2c_img_white_heart_front_sender}    //body/div[@id='__next']/div[contains(@class,'ant-layout css-1hobygo')]/div[contains(@class,'ant-layout css-1hobygo')]/main[contains(@class,'ant-layout-content component_layoutContent__n_j3m css-1hobygo')]/div[contains(@class,'sm:hidden w-auto')]/div[contains(@class,'ant-card ant-card-bordered css-1hobygo')]/div[contains(@class,'ant-card-body')]/div[contains(@class,'ant-row css-1hobygo')]/div[contains(@class,'ant-col h-[800px] max-w-[400px] overflow-auto flex border-red-300 css-1hobygo')]/div[contains(@class,'ant-card ant-card-bordered w-[400px] min-w-[370px] mx-2 css-1hobygo')]/div[contains(@class,'ant-card-body')]/div[contains(@class,'css-1hobygo')]/div[contains(@class,'ant-list ant-list-split ant-list-grid css-1hobygo')]/div[contains(@class,'ant-spin-nested-loading css-1hobygo')]/div[contains(@class,'ant-spin-container')]/div[contains(@class,'ant-row css-1hobygo')]/div/div[contains(@class,'ant-col css-1hobygo')]/div[contains(@class,'ant-list-item')]/div[contains(@class,'ant-card ant-card-bordered ant-card-hoverable min-w-[400px] css-10o2jwh')]/div[contains(@class,'ant-card-body')]/div/div[1]/span[@role="img"][@style="font-size: 20px;"]
${b2c_img_red_heart_front_receiver}    //body/div[@id='__next']/div[@class='ant-layout css-1hobygo']/div[@class='ant-layout css-1hobygo']/main[@class='ant-layout-content component_layoutContent__n_j3m css-1hobygo']/div[@class='hidden sm:inline']/div[@class='ant-card ant-card-bordered css-1hobygo']/div[@class='ant-card-body']/div[@class='ant-row css-1hobygo']/div[@class='ant-col w-[66%] css-1hobygo']/div[@class='ant-space css-1hobygo ant-space-vertical ant-space-gap-row-small ant-space-gap-col-small']/div[@class='ant-space-item']/div[@class='ant-card ant-card-bordered w-full max-w-[1200px] css-1hobygo']/div[@class='ant-card-body']/div[@class='ant-checkbox-group w-full flex justify-center css-1hobygo']/div[@class='ant-list ant-list-split ant-list-grid w-full css-1hobygo']/div[@class='ant-spin-nested-loading css-1hobygo']/div[@class='ant-spin-container']/div[@class='ant-row css-1hobygo']/div/div[@class='ant-col css-1hobygo']/div[@class='ant-list-item']/div[@class='ant-card ant-card-bordered ant-card-hoverable min-w-[400px] css-10o2jwh']/div[@class='ant-card-body']/div/div[2]/span[@role="img"][@style="font-size: 20px; color: red;"]
${b2c_img_white_heart_front_receiver}    //body/div[@id='__next']/div[@class='ant-layout css-1hobygo']/div[@class='ant-layout css-1hobygo']/main[@class='ant-layout-content component_layoutContent__n_j3m css-1hobygo']/div[@class='hidden sm:inline']/div[@class='ant-card ant-card-bordered css-1hobygo']/div[@class='ant-card-body']/div[@class='ant-row css-1hobygo']/div[@class='ant-col w-[66%] css-1hobygo']/div[@class='ant-space css-1hobygo ant-space-vertical ant-space-gap-row-small ant-space-gap-col-small']/div[@class='ant-space-item']/div[@class='ant-card ant-card-bordered w-full max-w-[1200px] css-1hobygo']/div[@class='ant-card-body']/div[@class='ant-checkbox-group w-full flex justify-center css-1hobygo']/div[@class='ant-list ant-list-split ant-list-grid w-full css-1hobygo']/div[@class='ant-spin-nested-loading css-1hobygo']/div[@class='ant-spin-container']/div[@class='ant-row css-1hobygo']/div/div[@class='ant-col css-1hobygo']/div[@class='ant-list-item']/div[@class='ant-card ant-card-bordered ant-card-hoverable min-w-[400px] css-10o2jwh']/div[@class='ant-card-body']/div/div[2]/span[@role="img"][@style="font-size: 20px;"]
${b2c_img_loading}    //div[@role='dialog']//img
${b2c_img_logo_speed_d}    //div[text()='{value}']/../../../..//img
${b2c_img_qr_code}    //div[text()='{value}']/../../../..//canvas
${b2c_img_loading_in_detail}    //div[@class='flex items-center justify-center h-full w-full']//img
${b2c_img_loading_in_detail_after_set_origin_shipping}    //div[@role='dialog']//div[@class='ant-modal-content']//img[@class='bg-transparent']

${b2c_btn_print_the_parcel_payment_slip_disabled}   //button[@type='button' and contains(@class, 'ant-btn-primary') and contains(@class, 'bg-blue-800') and @disabled and span[text()='พิมพ์ใบจ่ายหน้าพัสดุ']]
${b2c_btn_edit_booking_list}    (//strong[text()='{value}']/../../..//button)[1]
${b2c_btn_select_store}    //button//b[text()='{value}']/..
${b2c_btn_save_shipping_origin}    //span[text()='{value}']/..
${b2c_btn_print_parcel_label}    //*[@class='hidden sm:inline']//button//span[text()='{value}']
${b2c_btn_print_parcel_label_popup}    //div[text()='{value}']/../../..//button//span[text()='{value}']
${b2c_btn_select_pickup_schedule}   //input[@class='ant-radio-input']/..
${b2c_btn_import_file_detail_page}    //span[text()='{value}']/..
${b2c_btn_import_file_in_popup}  //input[@id='InputFile']/
${b2c_btn_template_in_popup}  //span[text()='{value}']/..

${b2c_cbo_paper_size}    //span[text()='{value}']/../..//span[@class='ant-select-selection-item']

${b2c_txtbox_search_store}    //span[text()='{value}']/..//input

${b2c_tab_shipping_origin_aria}    //div[@role='tab']//div[text()='{value}']
${b2c_tab_pickup_Schedule}    //div[@role='tab']//div[text()='{value}']

${b2c_dialog_create_parcel}    //*[@role='dialog']