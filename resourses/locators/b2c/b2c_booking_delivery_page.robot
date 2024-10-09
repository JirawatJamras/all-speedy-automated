*** Variables ***
### booking page ###
${txt_title_booking}    //div[contains(@class,'ant-layout')]//h2[contains(@class,'ant-typography')]

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
${btn_save_draft}    //span[contains(text(), 'บันทึกร่าง')]/../../button
${btn_add_receiver_to_favorites}    //div[@id='create_parcel_form_receiver_isDefault']//span[@class='anticon anticon-heart']
${btn_next}    //div[@class='ant-space-item' and text()='ถัดไป']/../../../button
${btn_parcel_booking}    //span[contains(text(),'จองเลขพัสดุ')]
${btn_parcel_size}    //*[@id="create_parcel_form"]//span//strong[text()='{value}']
${btn_parcel_select_A4}    //strong[text()= 'A4']/../../../div[@class='ant-card-body']
${btn_parcel_select_A3}    //strong[text()= 'A3']/../../../div[@class='ant-card-body']
${btn_parcel_select_XS}    //strong[text()= 'XS']/../../../div[@class='ant-card-body']
${btn_parcel_select_S}    //strong[text()= 'S']/../../../div[@class='ant-card-body']
${btn_parcel_select_M}    //strong[text()= 'M']/../../../div[@class='ant-card-body']
${btn_parcel_select_L}    //strong[text()= 'L']/../../../div[@class='ant-card-body']
${btn_parcel_select_XL}    //strong[text()= 'XL']/../../../div[@class='ant-card-body']
${btn_parcel_select_XXL}    //strong[text()= 'XXL']/../../../div[@class='ant-card-body']
${btn_use_code}    //button//span[text()='ใช้โค้ด']
${btn_choose_favorites_list}    //strong[text()='{value_name}' and text()='{value_phone}' ]/../../../../../div[2]/span[text()='{value_address}' and text()='{value_subdistrict}' and text()='{value_district}' and text()='{value_province}' and text()='{value_postal_code}']/../../../../label


${txt_title_create_parcel_page}     //div[@class='ant-modal-title']//div[text()='สร้างพัสดุ']
${txt_frist_step_name}    //form[@id='create_parcel_form']/div[2]/div[1]/div/div[3]/div
${txt_close_popup}     //h2[@id='swal2-title']
${txt_favorites_title}    //div[text()='เลือกจากรายการโปรด']
${txt_favorites_search_no_data}    //div[contains(@class,'ant-radio-group')]//div[@class='ant-empty-description' and text()='No data']
${txt_parcel_sender_information}    //div[@class='ant-steps ant-steps-horizontal Booking_stepsContainerDesktop__GbpI9 max-[680px]:hidden css-9920sk ant-steps-label-vertical']//div[@class='ant-steps-item-title'][contains(text(),'ข้อมูลผู้ส่งพัสดุ')]
${txt_phone_sender}    //label[@for='create_parcel_form_sender_tel']/span
${txt_name_sender}    //label[@for='create_parcel_form_sender_name']/span
${txt_address_sender}    //label[@for='create_parcel_form_sender_address_info']/span
${txt_postcode_sender}    //label[@for='create_parcel_form_sender_address_full']/span
${txt_parcel_receiver_information}    //div[@class='ant-steps ant-steps-horizontal Booking_stepsContainerDesktop__GbpI9 max-[680px]:hidden css-9920sk ant-steps-label-vertical']//div[@class='ant-steps-item-title'][contains(text(),'ข้อมูลผู้รับพัสดุ')]
${txt_phone_receiver}    //label[@for='create_parcel_form_receiver_tel']/span
${txt_name_receiver}    //label[@for='create_parcel_form_receiver_name']/span
${txt_address_receiver}    //label[@for='create_parcel_form_receiver_address_info']/span
${txt_postcode_receiver}    //label[@for='create_parcel_form_receiver_address_full']/span
${txt_location_receiver}    //div[@class='ant-space-item']//span[@class='ant-typography text-xl css-1hobygo']
${txt_booking_id}    //strong[contains(text(), 'บุ๊คกิ้ง ID :')]/../../../div[2]
${txt_booking_time}    //strong[contains(text(), 'วันเวลาทำรายการ :')]/../../../div[2]
${txt_booking_name}    //strong[contains(text(), 'ชื่อบุ๊คกิ้ง :')]/../../../div[4]
${txt_parcel_id}    //div[@class='ant-list-item']//div[@class='ant-card-head']//div[@class='ant-card-head-wrapper']//strong
${txt_booking_id_in_list}    //span[text()='{value}']
${txt_booking_status_in_list}    //span[text()='{value}']/../span[2]
${txt_booking_name_in_list}    //span[text()='{value}']/../../../../div[2]/div/div/span
${txt_booking_date_in_list}    //span[text()='{value}']/../../../../div[2]/div[2]/div[2]/div[1]/div[1]/div[1]/div[2]/span
${txt_booking_item_in_list}    //span[text()='{value}']/../../../../div[2]/div[2]/div[2]/div[2]/div/div/div[2]
${txt_booking_price_in_list}    //span[text()='{value}']/../../../../div[2]/div[2]/div[2]/div[2]/div/div/div[4]
${txt_selected_coupon_and_code}    (//*[@id="create_parcel_form_promotion"]//span//strong)[1]
${txt_my_coupon_and_code}    (//*[@id="create_parcel_form_promotion"]//span//strong)[2]
${txt_insure_amount}    //label[@title='จำนวนเงินซื้อประกัน']
${txt_cod}    //label[@title='เก็บเงินปลายทาง']
${txt_remark}    //label[@title='หมายเหตุ']
${txt_selected_code_detail}    //span//strong[text()='คูปองและโค้ดส่วนลดที่เลือก']/../..

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
${txtbox_full_postcode_sender}    //span[@class='ant-select-selection-item']
${txtbox_phone_receiver}    //input[@id='create_parcel_form_receiver_tel']
${txtbox_name_receiver}    //input[@id='create_parcel_form_receiver_name']
${txtbox_address_receiver}    //textarea[@id='create_parcel_form_receiver_address_info']
${txtbox_postcode_receiver}    //input[@id='create_parcel_form_receiver_address_full']
${txtbox_postcode_receiver_not_select_text}    //span[@class='ant-select-selection-placeholder']
${txtbox_postcode_receiver_select_text}    //span[@class='ant-select-selection-item']
${txtbox_full_postcode_receiver}    //span[text()='แขวงตำบล/ อำเภอ/ จังหวัด/ รหัสไปรษณีย์ ']/../../..//div[@class='ant-select-selector']//span[1]
${opt_default_favorites}    //span[contains(@class,'ant-typography bg-amber-500')]/../../../../..//input[@class='ant-radio-input']
${txtbox_parcel_remark}    //label[text()='หมายเหตุ']/../..//textarea[@id='create_parcel_form_remark']
${txtbox_promotion}    //input[@placeholder='ระบุโค้ดส่วนลด']
${txtbox_cod}    //input[@id='create_parcel_form_codValue']
${txtbox_insure_amount}    //label[text()='จำนวนเงินซื้อประกัน']/../..//input[@id='create_parcel_form_insureAmount']

${cbo_postcode_sender}    //div[@title='{value}']
${cbo_postcode_receiver}    //div[@title='{value}']

${value_add_sender_to_favorites}    //div[@id='create_parcel_form_sender_isDefault']
${value_add_receiver_to_favorites}    //div[@id='create_parcel_form_receiver_isDefault']

${tab_send_to_home}    //div[@data-node-key='home']
${tab_send_to_store}    //div[@data-node-key='store']
${tab_send_to_home_verify}    //div[@role='tab' and @aria-selected='true']//div[text()='ส่งที่บ้าน']

${status_active_sender}    //div[@step='1' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_receiver}    //div[@step='2' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_parcel}    //div[@step='3' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']
${status_active_promotion}    //div[@step='4' and @class='ant-steps-item ant-steps-item-process ant-steps-item-active']