*** Variables ***

### create a parcel ###
${parcel_type_dry_btn}     //img[@alt='Dry']
${parcel_type_chill_btn}    //img[@alt='Chill']
${title_create_parcel_page_txt}     //div[@class='ant-modal-title']//div[text()='สร้างพัสดุ']
${frist_step_name}    //form[@id="create_parcel_form"]/div[2]/div[1]/div/div[3]/div
${close_noti_txt}     //h2[@id='swal2-title']
${close_noticonfirm_btn}    //button[contains(@class, 'swal2-confirm') and contains(text(), 'ยืนยัน')]
${close_noti_btn}     (//button[@type='button' and @aria-label='Close'])[2]

${choose_favorites_btn}     //button[span[text()='เลือกจากรายการโปรด']]
${favorites_defult_text}     //div[@class='ant-space-item']//span[contains(@class, 'ant-typography') and contains(@class, 'bg-amber-500')]
${search_favorites_txtbox}     //input[@placeholder='ค้นหา']

${select_favorites_btn}     //button[contains(@class, 'ant-btn') and contains(@class, 'bg-green-500')]

${favorites_title_text}    //div[@class='border-b border-b-blue-500 text-[#085390]']
${favorites_accetp_btn}    //button[span[text()='เลือก']]
${favorites_default_text}    //ul[@class="ant-list-items"]/li[1]/label/span[2]/div/div/div[2]/span
${favorites_search_text}    //span[@class="ant-input-affix-wrapper css-1hobygo ant-input-outlined my-2"]/input
${favorites_search_nodata_text}    //div[@class="ant-empty-description"]
${choose_default_favorites_btn}    //span[@class="ant-typography bg-amber-500 rounded-full px-2 css-1hobygo"]/../../../../../../label
${accept_favorites_btn}    //button[@class="ant-btn css-1hobygo ant-btn-round ant-btn-primary ant-btn-color-primary ant-btn-variant-solid bg-green-500 hover:bg-green-600 active:bg-green-700 focus:outline-none focus:ring focus:ring-green-300 text-white"]
${cancel_favorites_btn}    //button[@class="ant-btn css-1hobygo ant-btn-round ant-btn-default ant-btn-dangerous ant-btn-color-dangerous ant-btn-variant-outlined bg-white hover:bg-red-50 active:bg-red-200 focus:outline-none focus:ring focus:ring-slate-50 border-red-700 text-red-700"]

${select_favorites_btn}     //button[contains(@class, 'ant-btn') and contains(@class, 'bg-green-500')]

${phone_sender_txtbox}    //input[@id="create_parcel_form_sender_tel"]
${name_sender_txtbox}    //input[@id="create_parcel_form_sender_name"]
${address_sender_txtbox}    //textarea[@id="create_parcel_form_sender_address_info"]
${postcode_sender_txtbox}    //input[@id="create_parcel_form_sender_address_full"]

${phone_sender_error_txt}    //input[@id="create_parcel_form_sender_tel"]/../../../../div[2]/div/div
${name_sender_error_txt}    //input[@id="create_parcel_form_sender_name"]/../../../../div[2]/div/div
${address_sender_error_txt}    //textarea[@id="create_parcel_form_sender_address_info"]/../../../../div[2]/div/div
${postcode_sender_error_txt}    //input[@id="create_parcel_form_sender_address_full"]/../../../../../../div[2]/div/div

${phone_sender_clear_btn}    //input[@id="create_parcel_form_sender_tel"]/../span/span
${name_sender_clear_btn}    //input[@id="create_parcel_form_sender_name"]/../span/span
${address_sender_clear_btn}    //textarea[@id="create_parcel_form_sender_address_info"]/../span/span[1]
${postcode_sender_clear_btn}    //input[@id="create_parcel_form_sender_address_full"]/../../../span[2]



${next_to_receiver_btn}    //div[@class="ant-space-item" and text()="ถัดไป"]/../../../button
