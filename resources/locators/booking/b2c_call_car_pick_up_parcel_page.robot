*** Variables ***
${b2c_btn_add_call_car_pickup_page}    //button//span[@aria-label='plus-circle']
${b2c_btn_x_in_add_popup}    //button[@aria-label='Close']
${b2c_btn_next_page_pickup_round}    //span[@class='anticon anticon-right']/..
${b2c_btn_filter_pickup_round}    //span[text()='{value}']/..
${b2c_btn_confirm_close_popup}    //button[contains(text(),'{value}')]
${btn_btn_search_pickup_round}    //span[text()='{value}']/..
${b2c_btn_save_in_add_popup}    //button//span[contains(text(),'{value}')]
${b2c_btn_cancel_in_add_popup}    //button//span[contains(text(),'{value}')]
${b2c_btn_basic_parcel_type_car_pickup_page}    //strong[text()='{value}']/../../../..//input[@id='basic_parcelType']/../..
${b2c_btn_previous_date_in_add_popup}    //td[@class='ant-picker-cell ant-picker-cell-disabled'][1]
${b2c_btn_confirm_in_asking_to_close_popup}    //button[text()='{value}']
${b2c_btn_delete_car_round_car_pickup_page}    (//*[@id="scrollableDiv"]//div[contains(@class,'ant-card ant-card-bordered')]//div[@class='ant-card-body']//h5[contains(text(),'{date} {time}')]/../../../..//span[contains(@class,'anticon anticon-delete')])[1]
${b2c_btn_last_page_car_pickup_page}    //ul[contains(@class,'ant-pagination')]//li[8]
${b2c_next_page_pickup_round}   //span[@class='anticon anticon-right']/../..
${btn_next_months_calendar_in_add_popup}    //button[@class='ant-picker-header-next-btn']

${b2c_txt_call_pickup_parcel_pickup_page}    //h2[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_schedule_in_add_popup}    //span[contains(text(),'{value}')]
${b2c_txt_car_round_name_in_add_popup}    //form[@id='basic']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_type_in_add_popup}    //label[@for='basic_parcelType']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_date_in_add_popup}    //label[@for='basic_date']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_time_in_add_popup}    //label[@for='basic_time']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_round}    //*[text()='{status}']/../../../..//*[text()='{round}']/../../../..//strong[contains(text(),'{pickupdate}')]/../../..//span[contains(normalize-space(),'{value}')]/../../../../..
${b2c_txt_cutoff_pickup_round}    //strong[text()='{cutoff}']/../../..//span[contains(text(),'{cutoff_value}')]/../../../../..//strong[contains(text(),'{parcel}')]/../../..//span[contains(normalize-space(),'{value}')]/../../../../..
${b2c_txt_location_pickup}    //strong[text()='{price}']/../../..//span[contains(normalize-space(),'{price_value}')]/../../../../..//strong[text()='{location}']/../../..//span[text()='{location_value}']
${b2c_txt_complete_save_pickup_round}    //div[@class='ant-message-notice-content']
${b2c_txt_status_and_id_pickup_round}    //span[text()='{status}']/../../../../../../../..//strong[text()='{booking_id}']
${txt_booking_status}    //span[contains(@class,'ant-tag ant-tag-borderless')]//h5[contains(@class,'ant-typography')]
${txt_parcel_pickup_schedule}    (//div[contains(@class,'ant-space-horizontal ant-space-align-center ant-space-gap-row-small ant-space-gap-col-small')]//h5[contains(@class,'ant-typography')])[1]
${txt_normal_parcel_pickup_schedule}    (//div[contains(@class,'ant-space-horizontal ant-space-align-center ant-space-gap-row-small ant-space-gap-col-small')]//h5[contains(text(),'{value}')])[1]
${b2c_txt_delete_complete_pickup_page}    //span[text()='{value}']
${b2c_txt_status_in_card_call_car_pickup_page}    //h5[text()='{value}']

${b2c_txtbox_parcel_type}    //input[@id='basic_parcelType']/../..
${b2c_txtbox_parcel_pickup_date}    //label[@for='basic_date']/../..//div[@class='ant-picker-input']
${b2c_txtbox_parcel_pickup_time}    //label[@for='basic_time']/../..//div[@class='ant-form-item-control-input']
${input_parcel_pickup_date}    //input[@id='parcelList_receivedDate']
${input_parcel_pickup_end_date}    (//input[@id='parcelList_receivedDate']/../..//input)[2]

${b2c_cbo_parcel_type}    //div[@id='basic_parcelType_list']/..//div[contains(text(),'{value}')]
${b2c_cbo_parcel_pickup_date}    //div[@class='ant-picker-body']//td[@title='{value}']
${b2c_cbo_parcel_pickup_time}    //div[@id='basic_time_list']/..//div[contains(text(),'{value}')]
${b2c_cbo_pickup_parcel_date_in_add_popup}    //strong[text()='{value}']/../../../..//input
${b2c_cbo_pickup_parcel_time_in_add_popup}    //strong[text()='{value}']/../../../..//input/../..
${b2c_cbo_time_pickup}    //div[text()='{value}']

${b2c_tbl_pickup_parcel_calendar}    //td[@title='{value}']

${b2c_card_pickup_parcel_schedule_call_car_pickup_page}    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
${b2c_card_parcel_pickup_list}    //div[@class='ant-card-body']//div[@class='ant-card-meta w-full']
${card_first_normal_parcel_pickup_list}    (//h5[contains(text(),'{title}')]/../../../../..//span[contains(normalize-space(),'{number_of_parcel}')]/../../../../..//span[contains(text(),'{address}')])[1]
${b2c_card_delete_pickup_parcel_call_car_pickup_page}    (//h5[text()='{value}'])[1]

${img_dry_parcel}    //div[@class='ant-space-item']//*[@alt='parcel']
${img_parcel_in_card}    (//div[@class='ant-card-body']//*[@alt='parcel'])[1]