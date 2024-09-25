*** Variables ***
${c2c_btn_log_on_login_page}                //*[@id='rc-tabs-2-panel-customer']//button[@type='submit']

${c2c_txtbox_email_login_page}              //input[@id='email']
${c2c_txtbox_password_login_page}           //input[@id='password']

${c2c_tab_customer_login_page}              //*[@id='rc-tabs-2-tab-customer']

${c2c_errormsg_email_login_page}            //*[@id='email_help']
${c2c_errormsg_password_login_page}         //*[@id='password_help']

${c2c_icon_show_password_login_page}        //*[@placeholder='ระบุรหัสผ่าน']/../..//*[@data-icon='eye-invisible']
${c2c_icon_hide_password_login_page}        //*[@placeholder='ระบุรหัสผ่าน']/../..//*[@data-icon='eye']

${c2c_expected_email_txtbox_login_page}     //input[@placeholder='ระบุอีเมล์/เบอร์ ALL MEMBER']
${c2c_show_password_login_page}             //input[@id='password' and @type='text']
${c2c_hide_password_login_page}             //input[@id='password' and @type='password']
