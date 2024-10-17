*** Variables ***
${register_txtbox_email_yopmail}    //input[@id='login']
${register_button_next_yopmail}    //div[@id='refreshbut']
${register_txt_link_full_register}    //div[@id='mail']
 
${register_txtbox_email_gmail}    //input[@type='email']
${register_txtbox_password_gmail}    //input[@type='password']
${register_button_next_gmail}    //button//span[text()='Next']
${register_button_inbox_gmail}    //tbody//tr//span[@email='support@allspeedy.co.th']//..//..//..//..
${register_txt_link_register_gmail}    //p[text()='{value} ']//span

#Full-Register 
 #Company business tab
${Company_business_title}    //div[@class='ant-steps-item-content']//div[text()='ข้อมูลบริษัท']
${general_information_title}    //h4[text()='ข้อมูลทั่วไป']
${individual_radio_btn}    //span[text()='บุคคลธรรมดา']//..//span[@class='ant-radio ant-wave-target ant-radio-checked']
