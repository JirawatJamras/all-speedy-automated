*** Variables ***
${b2c_popup_sender_favorite_page}    //div[@class='ant-modal-content']//div//div[text()='ข้อมูลผู้ส่งพัสดุ']

${b2c_tab_sender_favorite_page}    //div[@role='tab' and text()='ผู้ส่งพัสดุ']

${b2c_list_sender_address_favorite_page}    //div[@class='ant-select-item-option-content' and contains(text(),'{value}')]

${b2c_btn_add_favorite_page}                      //button[@type='button']//span[text()='เพิ่ม']
${b2c_btn_clear_favorite_name_favorite_page}      //input[@id='favorite_form_name']/../..//span//span[@class='ant-input-clear-icon']
${b2c_btn_clear_sender_phone_favorite_page}       //input[@id='favorite_form_sender_tel']/../..//span//span[@class='ant-input-clear-icon']
${b2c_btn_clear_sender_name_favorite_page}        //input[@id='favorite_form_sender_name']/../..//span//span[contains(@class, 'ant-input-clear-icon')]
${b2c_btn_clear_sender_address_favorite_page}     //textarea[@id='favorite_form_sender_address_info']/../..//span//span[contains(@class, 'ant-input-clear-icon')]
${b2c_btn_clear_sender_postcode_favorite_page}    //input[@id='favorite_form_sender_address_full']/../..//span//span[contains(@class, 'ant-input-clear-icon')]
${b2c_btn_toggle_default_favorite_page}           //button[@id='favorite_form_isDefault']
${b2c_btn_save_info_favorite_page}                //button//span[text()='บันทึก']
${b2c_btn_cancel_favorite_page}                   //button//span[text()='ยกเลิก']
${b2c_btn_close_x_favorite_page}                  //button[@aria-label='Close']
${b2c_btn_cancel_close_x_favorite_page}           //button[contains(text(),'ยกเลิก')]
${b2c_btn_confirm_close_x_favorite_page}          //button[contains(text(),'ยืนยัน')]

${b2c_txtbox_favorite_name_favorite_page}      //input[@id='favorite_form_name']
${b2c_txtbox_sender_phone_favorite_page}       //input[@id='favorite_form_sender_tel']
${b2c_txtbox_sender_name_favorite_page}        //input[@id='favorite_form_sender_name']
${b2c_txtbox_sender_address_favorite_page}     //textarea[@id='favorite_form_sender_address_info']
${b2c_txtbox_sender_postcode_favorite_page}    //input[@id='favorite_form_sender_address_full']

${b2c_msg_errormsg_favorite_name_favorite_page}      //div[@id='favorite_form_name_help']//div[@class='ant-form-item-explain-error']
${b2c_msg_errormsg_sender_phone_favorite_page}       //div[@id='favorite_form_sender_tel_help']//div[@class='ant-form-item-explain-error']
${b2c_msg_errormsg_sender_name_favorite_page}        //div[@id='favorite_form_sender_name_help']//div[@class='ant-form-item-explain-error']
${b2c_msg_errormsg_sender_address_favorite_page}     //div[@id='favorite_form_sender_address_info_help']//div[@class='ant-form-item-explain-error']
${b2c_msg_errormsg_sender_postcode_favorite_page}    //div[@id='favorite_form_sender_address_full_help']//div[@class='ant-form-item-explain-error']

${b2c_txt_sender_name_card_favorite_page}        //strong[contains(text(),'ชื่อ')]/../..//span[contains(@class, 'ant-typography') and text()='{value}']
${b2c_txt_close_popup_favorite_page}             //h2[@class='swal2-title']//span[text()='ต้องการการปิด Pop-Up หรือไม่ ข้อมูลที่เปลี่ยนแปลงจะไม่บันทึก']
${b2c_txt_sender_postcode_full_favorite_page}    //input[@id='favorite_form_sender_address_full']/../..//span[text()]