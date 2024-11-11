*** Variables ***
${b2c_btn_log_on}       //div[@aria-hidden='false' and contains(@id,'business')]//button[@type='submit']//b[text()='{value}']
${b2c_btn_forgot_password_login_page}    //u[text()='ลืมรหัสผ่าน?']/../..//a

${b2c_txtbox_email}    //input[@id='emailBusiness']
${b2c_txtbox_password}    //input[@id='passwordBusiness']

${b2c_error_message_emailbusiness}        //div[@id='emailBusiness_help']
${b2c_error_message_passwordbusiness}     //div[@id='passwordBusiness_help']