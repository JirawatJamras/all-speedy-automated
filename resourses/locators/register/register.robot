*** Variables ***
${register_btn_business}        //a[@href='/business-register']//u[text()="ลงทะเบียนลูกค้าธุรกิจ"]


${EmailBusiness_txt}     //input[@id='emailBusiness']
${PasswordBusiness_txt}     //input[@id='passwordBusiness']



${partnertype_txt}        //h5[text()="ประเภทคู่ค้า"]
${checkbox_locator}            //input[@name='customerType' and @value='นิติบุคคล']/parent::span
${NaturalPerson_checkbox}             //label[span[text()='บุคคลธรรมดา']]
${companyname_txtbox}            //input[@placeholder='ชื่อบริษัท']
${tax_identification_number}      //*[@id="idNumber"]
${addresscompany_textbox}      //*[@id='address_addressInfo']
${addressfull_textbox}     //span[@class='ant-select-selection-placeholder' and text()='ระบุไปรษณีย์']
${Prefixname_dropdown}     //div[@class='ant-select-selector']
${FirstName_txtbox}     //input[@id='firstName']
${LastName_txtbox}      //input[@id='lastName']
${email_txtbox}      //input[@id='email']
${MobileNo_txtbox}      //input[@id='mobileNo']
${MobileExt_txtbox}      //input[@id='mobileExt']



${FormfirstName_txtbox}     //div[@class='ant-form-item-control-input']//input[@id='Form_firstName']
${FormlastName_txtbox}     //input[@id='Form_lastName']
${FormidNumber_txtbox}     //input[@id='Form_idNumber']
${Formemail_txtbox}     //input[@id='Form_email']
${Form_address_addressInfo_txtbox}     //input[@id='Form_address_addressInfo']
${Form_address_full_txtbox}      //input[@id='Form_address_full']

${Form_mobileNo_txtbox}     //input[@id='Form_mobileNo']
${Form_mobileExt_txtbox}     //input[@id='Form_mobileExt']







