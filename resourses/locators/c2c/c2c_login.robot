*** Variables ***
${c2c_btn_log_on_login_page}                //*[@class='btn btn-small' and text()='เข้าสู่ระบบ']

${c2c_txtbox_email_login_page}              //input[@type='email' and @placeholder='อีเมล']
${c2c_txtbox_password_login_page}           //input[@type='password' and @placeholder='รหัสผ่าน (ความยาว 6-15 ตัวอักษร)']

${c2c_tab_customer_login_page}              //*[@id='rc-tabs-2-tab-customer']

${c2c_errormsg_email_login_page}            //*[@id='email_help']
${c2c_errormsg_password_login_page}         //*[@id='password_help']

${c2c_icon_show_password_login_page}        //*[@placeholder='ระบุรหัสผ่าน']/../..//*[@data-icon='eye-invisible']
${c2c_icon_hide_password_login_page}        //*[@placeholder='ระบุรหัสผ่าน']/../..//*[@data-icon='eye']

${c2c_expected_email_txtbox_login_page}     //input[@placeholder='ระบุอีเมล์/เบอร์ ALL MEMBER']
${c2c_show_password_login_page}             //input[@id='password' and @type='text']
${c2c_hide_password_login_page}             //input[@id='password' and @type='password']
