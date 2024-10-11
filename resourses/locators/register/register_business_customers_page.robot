*** Variables ***
${txt_menu_register}    //u[text()='{value}']
#old
${register_btn_register_business_customer_page}        //a[@href='/business-register']//u[text()="ลงทะเบียนลูกค้าธุรกิจ"]
${register_btn_login_business_customers_page}    //div[@class='ant-col css-ullmxi']/button/b
${register_btn_forgotpassword_business_customers_page}    //a[@href='/auth/forgot-password']/u

${register_txt_email_business_customers_page}     //label[@for='emailBusiness']
${register_txt_password_business_customers_page}     //label[@for='passwordBusiness']