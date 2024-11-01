*** Variables ***
${b2c_btn_add_call_car_pickup_page}    //button//span[@aria-label='plus-circle']
${btn_save_in_add_popup}    //button//span[contains(text(),'{value}')]
${btn_cancel_in_add_popup}    //button//span[contains(text(),'{value}')]

${b2c_txt_call_pickup_parcel_pickup_page}    //h2[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_schedule}    //h5[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_schedule_in_add_popup}    //span[contains(text(),'{value}')]
${b2c_txt_car_round_name_in_add_popup}    //form[@id='basic']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_type_in_add_popup}    //label[@for='basic_parcelType']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_date_in_add_popup}    //label[@for='basic_date']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_time_in_add_popup}    //label[@for='basic_time']//strong[contains(text(),'{value}')]
${b2c_txt_parcel_pickup_round}    //*[contains(text(),'{value}')]  #รอบพิเศษ 01-11-2567 09:00:00 - 12:00 น
${b2c_txt_complete_save_pickup_round}    //div[@class='ant-message-notice-content']

${txt_booking_status}    //span[contains(@class,'ant-tag ant-tag-borderless')]//h5[contains(@class,'ant-typography')]
${txt_parcel_pickup_schedule}    (//div[contains(@class,'ant-space-horizontal ant-space-align-center ant-space-gap-row-small ant-space-gap-col-small')]//h5[contains(@class,'ant-typography')])[1]
${txt_normal_parcel_pickup_schedule}    (//div[contains(@class,'ant-space-horizontal ant-space-align-center ant-space-gap-row-small ant-space-gap-col-small')]//h5[contains(text(),'{value}')])[1]
${txt_date_parcel_pickup}    //strong[text()='วันที่รถเข้ารับพัสดุ:']/../../..//span[contains(@class,'ant-typography') and text()='น.']
${txt_cut_off_time}    //strong[text()='เวลา Cut Off รอบรถ:']/../../..//span[contains(@class,'ant-typography') and text()='25-10-2567 16:55:00']
${txt_amount_of_parcel}    //strong[text()='จำนวนพัสดุ:']/../../..//span[contains(@class,'ant-typography') and text()=' รายการ']
${txt_total_price}    //strong[text()='ราคา:']/../../..//span[contains(@class,'ant-typography') and text()=' บาท']
${txt_location_pickup}    //strong[text()='จุดรับพัสดุ:']/../../..//span[contains(@class,'ant-typography') and text()='200 ชั้น 19 ห้อง1901 จัสมินอินเตอร์เนชั่นแนลทาวเวอร์ ปากเกร็ด ปากเกร็ด นนทบุรี 11120']

${b2c_txtbox_parcel_type}    //input[@id='basic_parcelType']/../..
${b2c_txtbox_parcel_pickup_date}    //label[@for='basic_date']/../..//div[@class='ant-picker-input']
${b2c_txtbox_parcel_pickup_time}    //label[@for='basic_time']/../..//div[@class='ant-form-item-control-input']

${b2c_cbo_parcel_type}    //div[@id='basic_parcelType_list']/..//div[contains(text(),'{value}')]
${b2c_cbo_parcel_pickup_date}    //div[@class='ant-picker-body']//td[@title='{value}']
${b2c_cbo_parcel_pickup_time}    //div[@id='basic_time_list']/..//div[contains(text(),'{value}')]

${b2c_card_parcel_pickup_list}    //div[@class='ant-card-body']//div[@class='ant-card-meta w-full']
${card_frist_parcel_pickup_list}    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div[1]
${card_first_normal_parcel_pickup_list}    (//h5[contains(text(),'{title}')]/../../../../..//span[contains(normalize-space(),'{number_of_parcel}')]/../../../../../../../../../..)[1]

################# OLD ###################
${btn_basic_parcel_type_car_pickup_page}    //strong[text()='{value}']/../../../..//input[@id='basic_parcelType']/../..
${b2c_btn_placeholder_date_pickup_in_add_popup}    //*[@class='ant-modal-content']//strong[text()='วันที่รถเข้ารับพัสดุ']/../../../..//input
${b2c_btn_previous_date_in_add_popup}    //td[@class='ant-picker-cell ant-picker-cell-disabled'][1]
${b2c_b2n_active_date_in_add_popup}    //td[@class='ant-picker-cell ant-picker-cell-in-view']
${btn_next_months_calendar_in_add_popup}    //button[@class='ant-picker-header-next-btn']
${b2c_btn_cancel_in_asking_to_close_popup}    //button[text()=' ยกเลิก']
${b2c_btn_confirm_in_asking_to_close_popup}    //button[text()='{value}']
${b2c_btn_x_in_add_popup}    //button[@aria-label='Close']
${b2c_btn_save_in_detail_popup}    //span[text()='บันทึก']/..
${b2c_btc_filter_pickup_page}    //span[text()='ตัวกรอง']/..
${b2c_btn_search_in_filter}    //span[text()='ค้นหา']/..
${btn_delete_car_round_car_pickup_page}    (//*[@id="scrollableDiv"]//div[contains(@class,'ant-card ant-card-bordered')]//div[@class='ant-card-body']//h5[contains(text(),'{date} {time}')]/../../../..//span[contains(@class,'anticon anticon-delete')])[1]
${btn_next_page_car_pickup_page}    //li[@title='Next Page']//button[@class='ant-pagination-item-link']

${b2c_txt_pickup_parcel_date_in_add_popup}    //strong[text()='วันที่รถเข้ารับพัสดุ']
${b2c_txt_pickup_parcel_time_selected_value_in_add_popup}    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//span[@class='ant-select-selection-item']
${b2c_txt_complete_save_information_car_pickup_page}    //*[text()='บันทึกข้อมูลสำเร็จ']
${b2c_txt_h5_special_round_car_pickup_page}    //h5[contains(text(),'รอบพิเศษ')]
${b2c_txt_asking_to_close_popup_in_add_popup}    //h2[@id='swal2-title']
${b2c_txt_pickup_parcel_schedule_in_detail_popup}    //h5[text()='รายการเรียกรถเข้ารับพัสดุ']
${b2c_txt_select_pickup_booking_list_in_detail_popup}    //h5[text()='เลือกรายการบุ๊คกิ้งเข้ารอบพัสดุ']
${b2c_txt_pickup_parcel_schedule_pickup_page}    //h5[text()='รอบรถเข้ารับพัสดุ']
${b2c_txt_pickup_date_in_filter}    //strong[text()='วันที่รถเข้ารับพัสดุ']
${b2c_txt_delete_complete_pickup_page}    //span[text()='ลบข้อมูลสำเร็จ']

${b2c_cbo_car_round_name_call_car_pickup_page}    //strong[text()='ชื่อรอบรถ']/../../../..//input[@id='basic_pickupType']
${b2c_cbo_parcel_type_call_car_pickup_page}    //strong[text()='ประเภทพัสดุ']/../../../..//span[@class='ant-select-selection-item']
${cbo_pickup_parcel_date_in_add_popup}    //strong[text()='{value}']/../../../..//input
${cbo_pickup_parcel_time_in_add_popup}    //strong[text()='{value}']/../../../..//input/../..
${b2c_cdo_2_pickup_parcel_time_in_add_popup}    //strong[text()='เวลารถเข้ารับพัสดุ']/../../../..//input
# ${cbo_parcel_type}    //div[@class='rc-virtual-list-holder-inner']//div[@title='${value}']
${cbo_time_pickup}    //div[text()='{value}']

${b2c_tbl_pickup_parcel_calendar_in_add_popup}    //*[contains(@class,'ant-picker-dropdown')]
${tbl_pickup_parcel_calendar}    //td[@title='{value}']

${b2c_card_pickup_parcel_schedule_call_car_pickup_page}    //*[@id="scrollableDiv"]/div/div/div/div[1]/div/div/div/div

${img_dry_parcel}    //div[@class='ant-space-item']//*[@alt='parcel']
${img_parcel_in_card}    (//div[@class='ant-card-body']//*[@alt='parcel'])[1]


