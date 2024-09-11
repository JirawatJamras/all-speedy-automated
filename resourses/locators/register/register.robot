*** Variables ***
${register_btn_business}        //a[@href='/business-register']//u[text()="ลงทะเบียนลูกค้าธุรกิจ"]

${partnertype_txt}        //h5[text()="ประเภทคู่ค้า"]
${checkbox_locator}            //input[@name='customerType' and @value='นิติบุคคล']/parent::span
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







