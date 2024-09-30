*** Variables ***
${b2c_popup_sender_favorite_page}    //div[@class='ant-modal-content']//div//div[text()='ข้อมูลผู้ส่งพัสดุ']

${b2c_tab_sender_favorite_page}      //div[@role='tab' and text()='ผู้ส่งพัสดุ']

${b2c_btn_add_favorite_page}                    //button[@type='button']//span[text()='เพิ่ม']
${b2c_btn_clear_favorite_name_favorite_page}    //input[@id='favorite_form_name']/../..//span//span[@class='ant-input-clear-icon']
${b2c_btn_clear_sender_phone_favorite_page}       //input[@id='favorite_form_sender_tel']/../..//span//span[@class='ant-input-clear-icon']
${b2c_btn_toggle_default_favorite_page}         //button[@id='favorite_form_isDefault']

${b2c_txtbox_favorite_name_favorite_page}    //input[@id='favorite_form_name']
${b2c_txtbox_sender_phone_favorite_page}         //input[@id='favorite_form_sender_tel']

${b2c_msg_errormsg_favorite_name_favorite_page}    //div[@id='favorite_form_name_help']//div[@class='ant-form-item-explain-error']
${b2c_msg_errormsg_sender_phone_favorite_page}     //div[@id='favorite_form_sender_tel_help']//div[@class='ant-form-item-explain-error']