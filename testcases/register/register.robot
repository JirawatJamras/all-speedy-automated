*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***
#Profile
${profile_icon_btn}    //span[@aria-label='user' and @class='anticon anticon-user text-xl mr-2']
${edit_btn}    //span[text()='แก้ไข']
${mobile_no_txtbox}    //span[text()='เบอร์โทรศัพท์ ']//.//..//..//..//..//input
${save_btn}    //span[text()='บันทึก']

#Profile Business
${profile_business_btn}    //span[@class='ant-dropdown-menu-title-content']//span[text()='โปรไฟล์บริษัท']//..
 #Company_information
${company_information_first_tab}    //div[@data-node-key='1']//div[text()='ข้อมูลบริษัท' and @aria-controls='rc-tabs-1-panel-1']
${company_information_second_tab}    //div[@data-node-key='1']//div[text()='ข้อมูลบริษัท' and @aria-controls='rc-tabs-0-panel-1']
${service_information_tab}    //div[@data-node-key='2']//div[text()='ข้อมูลบริการ']
${general_parcel_tab}    //div[@data-node-key='1']//div[text()='พัสดุทั่วไป']
${temperature_controlled_parcel_tab}    //div[@data-node-key='2']//div[text()='พัสดุควบคุมอุณหภูมิ']
${return_business_tab}    //div[@data-node-key='3']//div[text()='Return Business']
${contact_and_bank_information_tab}    //div[@data-node-key='3']//div[text()='ข้อมูลผู้ติดต่อและข้อมูลธนาคาร']
${supporting_documents_tab}    //div[@data-node-key='4']//div[text()='เอกสารประกอบ']

 #Manage_users
${manage_users_tab}    //div[@data-node-key='2']//div[text()='จัดการผู้ใช้งาน']
${super_user_tab}    //div[@data-node-key='2']//div[text()='Super User']
${user_tab}    //div[@data-node-key='3']//div[text()='User']
${add_user_btn}    //span[text()='เพิ่มผู้ใช้งาน']
  #Add User in Profile Business
${user_name_txtbox}    //label[@title='ชื่อ']//../..//input[@type='text']
${user_last_name_txtbox}    //label[@title='นามสกุล']//../..//input[@type='text']
${user_email_txtbox}    //label[@title='E-mail']//../..//input[@type='text']
${user_mobile_no_txtbox}    //label[@title='เบอร์โทรศัพท์']//../..//input[@type='text']
${user_mobile_ext_txtbox}    //label[@title='#ต่อ']//../..//input[@type='text']
${user_position_txtbox}    //label[@title='ตำแหน่งงาน']//../..//input[@type='text']

#Manage_branch
${manage_branch_tab}    //div[@data-node-key='3']//div[text()='จัดการสาขา']
${tracking_request_tab}    //div[@data-node-key='4']//div[text()='ติดตามรายการคำขอ']
${add_request_btn}    //span[text()='เพิ่มคำขอ']//..

#Invoice
${invoice_tab}    //div[@data-node-key='5']//div[text()='ใบแจ้งหนี้']

#Full-Register 
 #Company business tab
${Company_business_title}    //div[@class='ant-steps-item-content']//div[text()='ข้อมูลบริษัท']
${general_information_title}    //h4[text()='ข้อมูลทั่วไป']
${individual_radio_btn}    //span[text()='บุคคลธรรมดา']//..//span[@class='ant-radio ant-wave-target ant-radio-checked']

*** Keywords ***
Click Profile Icon
    Wait Until Element Is Visible    ${profile_icon_btn}
    Click Element    ${profile_icon_btn}

Click Profile Business
    Wait Until Element Is Visible    ${profile_business_btn}
    Click Element    ${profile_business_btn}   

Click Menu Manage Users
    Wait Until Element Is Visible    ${manage_users_tab} 
    Click Element    ${manage_users_tab}  

Click Menu Super User
    Wait Until Element Is Visible    ${super_user_tab}
    Click Element    ${super_user_tab}

Click Menu User
    Wait Until Element Is Visible    ${user_tab}
    Click Element    ${user_tab}

Click Add User
    Wait Until Element Is Visible    ${add_user_btn}
    Click Element    ${add_user_btn}    

Input User Name
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_name_txtbox}
    Input Text    ${user_name_txtbox}    ${Value}

Input User Last Name
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_last_name_txtbox}
    Input Text    ${user_last_name_txtbox}    ${Value}

Input User Email
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_email_txtbox}
    Input Text    ${user_email_txtbox}    ${Value}

Input User Mobile No
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_mobile_no_txtbox}
    Input Text    ${user_mobile_no_txtbox}    ${Value}

Input User Mobile Ext
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_mobile_ext_txtbox}
    Input Text    ${user_mobile_ext_txtbox}    ${Value}

Input User Position
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${user_position_txtbox}
    Input Text    ${user_position_txtbox}    ${Value}

Click Menu Manage Branches 
    Wait Until Element Is Visible    ${manage_branch_tab}
    Click Element    ${manage_branch_tab}

Click Checkbox User
    [Arguments]    ${Value}
    Wait Until Element Is Visible    //input[@usernamebranch='${Value}']//..
    Click Element    //input[@usernamebranch='${Value}']//..

Click Menu Tracking Request List
    Wait Until Element Is Visible    ${tracking_request_tab}
    Click Element    ${tracking_request_tab}

Click Add Request
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${add_request_btn}
    Click Element    ${add_request_btn}
    Wait Until Element Is Visible    //li[@class='ant-dropdown-menu-item ant-dropdown-menu-item-only-child']//a[text()='${Value}']
    Click Element    //li[@class='ant-dropdown-menu-item ant-dropdown-menu-item-only-child']//a[text()='${Value}']

Click Menu Service Information
    Wait Until Element Is Visible    ${service_information_tab}
    Click Element    ${service_information_tab}

Click Menu General Parcel
    Wait Until Element Is Visible    ${general_parcel_tab}
    Click Element    ${general_parcel_tab}

Click Menu Temperature Controlled Parcels
    Wait Until Element Is Visible    ${temperature_controlled_parcel_tab}
    Click Element    ${temperature_controlled_parcel_tab}

Click Menu Return Business
    Wait Until Element Is Visible    ${return_business_tab}
    Click Element    ${return_business_tab}

Click Menu Contact and Bank Information
    Wait Until Element Is Visible    ${contact_and_bank_information_tab}
    Click Element    ${contact_and_bank_information_tab}
Click Menu Supporting Documents
    Wait Until Element Is Visible    ${supporting_documents_tab}
    Click Element    ${supporting_documents_tab}

Click Menu Invoice
    Wait Until Element Is Visible    ${invoice_tab}
    Click Element    ${invoice_tab}

Click Edit Button
    Wait Until Element Is Visible    ${edit_btn}
    Click Element    ${edit_btn}

Edit Mobile No
    [Arguments]    ${Value}
    Wait Until Element Is Visible    ${mobile_no_txtbox}
    Clear Element Text    ${mobile_no_txtbox}
    Input Text    ${mobile_no_txtbox}    ${Value}

Click Save Button
    Wait Until Element Is Visible    ${save_btn}
    Clear Element Text    ${save_btn}

Verify Company information
    Wait Until Element Is Visible    ${Company_business_title}
    #Inprogress

*** Test Cases ***


Register_SC014
    #Register_014 Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้าบุคคลธรรมดา
    #Step 1 Open Url
    common.Open URL    https://www-uat.allspeedy.co.th/business-register/fullRegister/7142801012603045672
    #Expected
    Verify Company information
    #Step 2 Click ปุ่ม "ถัดไป"
    
    #Step 3 เปิดใช้งานพัสดุทั่วไป
    
    #Step 4 กดปุ่ม "บันทึกร่าง" ที่ขั้นตอนข้อมูลบริการ
    
    #Step 5 กดปุ่ม "ยกเลิก"

    #Step 6 กดปุ่ม "ตกลง" ที่ Popup

    #Step 7 กดเปิด Link Full Register เดิม ที่ได้รับทาง E-mail 

    #Step 8 กดปุ่ม "ถัดไป"

    #Step 9 กดแท็บ "พัสดุควบคุมอุณหภูมิ" and กดแท็บ "Return Business"

    #Step 10 กดปุ่ม "ถัดไป"

    #Step 11 ระบุข้อมูลผู้ติดต่อ

    #Step 12 กดปุ่ม "ถัดไป"
Register_SC023
    #Register_023 Customer : การ Login เข้าใช้งานระบบสำหรับลูกค้าธุรกิจ
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

Register_SC024
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button
    #Register_024 Customer : จัดการผู้ใช้งาน Super User
    #Step 1
    Click Profile Icon
    Click Profile Business
    Click Menu Manage Users
    Click Menu Super User
    Click Add User
    #Step 2
    Input User Name    Automate
    Input User Last Name    Superuser
    Input User Email    allspeedy.superuser@yopmail.com
    Input User Mobile No    0931234567
    #Input User Mobile Ext    0
    Input User Position    พนักงานแพคสินค้า
    #Step 3 ไม่มีปุ่มยืนยัน
    #Step 4 กดยกเลิกมาที่หน้าเดิมไม่ได้
    #Step 5 ไม่มีปุ่มดำเนินการ
    #Step 6 ไม่มีปุ่มแก้ไข
    #Step 7 ไม่มีปุ่มยกเลิก
    #Step 8 ไม่มีปุ่มย้อนกลับ

E2E Register SC025
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_025 Customer : จัดการผู้ใช้งาน User
    #Step 1
    Click Profile Icon
    Click Profile Business
    Click Menu Manage Users
    Click Menu User
    Click Add User
    #Step 2
    Input User Name    Automate
    Input User Last Name    User
    Input User Email    allspeedy.user@yopmail.com
    Input User Mobile No    0931234567
    #Input User Mobile Ext    0
    Input User Position    พนักงานแพคสินค้า
    #Step 3 ไม่มีปุ่ม "ยืนยัน"
    #Step 4 กด "ยกเลิก" มาที่หน้าเดิมไม่ได้
    #Step 5 ไม่มีปุ่ม "ดำเนินการ"
    #Step 6 ไม่มีปุ่ม "แก้ไข"
    #Step 7 ไม่มีปุ่ม "ยกเลิก"
    #Step 8 ไม่มีปุ่ม "ย้อนกลับ"

E2E Register SC026
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_026 Customer : จัดการสาขา
    #Step 1
    Click Profile Icon
    Click Profile Business
    Click Menu Manage Branches
    #Step 2 ไม่มีปุ่ม "ย้ายผู้ใช้งาน"
    Click Checkbox User    พิชิต สุริยัน
    #Step 3 ไม่มี Dropdown
    #Step 4 ไม่มี Dropdown ให้เลือก

E2E Register SC027
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_027 Customer : คำขอเพิ่ม Company Admin
    #Step 1 ไม่แสดงหน้า คำขอ Company Admin 
    Click Profile Icon
    Click Profile Business
    Click Menu Tracking Request list
    Click Add Request    ขอเพิ่ม Company Admin
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอ Company Admin 
    #Click Add Request    ขอเพิ่ม Company Admin
    #Step 6
    #Step 7
    #Step 8

E2E Register SC028
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_028 Customer : คำขอเพิ่ม Company Admin
    #Step 1 ไม่มีปุ่ม "ดำเนินการ"
    Click Profile Icon
    Click Profile Business
    Click Menu Manage Users
    #Step 2 ไม่มีปุ่ม "ยกเลิก" 
    #Step 3
    #Step 4
    #Step 5 
    #Step 6
    #Step 7
    #Step 8

E2E Register SC029
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_029 Customer : คำขอแก้ไขข้อมูลที่อยู่บริษัท
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลที่อยู่บริษัท
    Click Profile Icon
    Click Profile Business
    Click Menu Tracking Request list
    Click Add Request    ขอแก้ไขข้อมูลที่อยู่บริษัท
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลที่อยู่บริษัท 
    #Click Add Request    ขอแก้ไขข้อมูลที่อยู่บริษัท
    #Step 6
    #Step 7
    #Step 8 

E2E Register SC030
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_030 Customer : คำขอแก้ไขข้อมูลผู้ติดต่อ
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลผู้ติดต่อ
    Click Profile Icon
    Click Profile Business
    Click Menu Tracking Request list
    Click Add Request    ขอแก้ไขข้อมูลผู้ติดต่อ
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลผู้ติดต่อ
    #Click Add Request    ขอแก้ไขข้อมูลผู้ติดต่อ
    #Step 6
    #Step 7
    #Step 8 

E2E Register SC031
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_031 Customer : คำขอแก้ไขข้อมูลธนาคาร
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลธนาคาร
    Click Profile Icon
    Click Profile Business
    Click Menu Tracking Request list
    Click Add Request    ขอแก้ไขข้อมูลธนาคาร
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลธนาคาร
    #Click Add Request    ขอแก้ไขข้อมูลธนาคาร
    #Step 6
    #Step 7
    #Step 8   

E2E Register SC032
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_032 Customer : คำขอแก้ไขข้อมูลบริการ
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลบริการ
    Click Profile Icon
    Click Profile Business
    Click Menu Tracking Request list
    Click Add Request    ขอแก้ไขข้อมูลบริการ
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลบริการ
    #Click Add Request    ขอแก้ไขข้อมูลบริการ
    #Step 6
    #Step 7
    #Step 8           

E2E Register SC047
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    #Register_047 Customer : ตรวจสอบข้อมูลบริษัท
    #Step 1 Company Admin : กดปุ่ม "โปรไฟล์บริษัท"
    Click Profile Icon
    Click Profile Business
    #Step 2 กดแท็บ "แท็บข้อมูลบริการ" และ แท็บ "พัสดุทั่วไป"
    Click Menu Service Information
    Click Menu General Parcel
    #Step 3 กดแท็บ "พัสดุควบคุมอุณหภูมิ"
    Click Menu Temperature Controlled Parcels
    #Step 4 กดแท็บ "Return Business"
    Click Menu Return Business
    #Step 5 กดแท็บ "ข้อมูลผู้ติดต่อและข้อมูลธนาคาร"
    Click Menu Contact and Bank Information
    #Step 6 กดแท็บ "เอกสารประกอบ"
    Click Menu Supporting Documents
    #Step 7 กดแท็บ "จัดการผู้ใช้งาน"
    Click Menu Manage Users 
    #Step 8 กดแท็บ "Super User"
    Click Menu Super User 
    #Step 9 กดแท็บ "User"
    Click Menu User 
    #Step 10 กดแท็บ "จัดการสาขา"
    Click Menu Manage Branches  
    #Step 11 กดแท็บ "ติดตามรายการคำขอ"
    Click Menu Tracking Request List 
    #Step 12 กดแท็บ "ใบแจ้งหนี้"
    Click Menu Invoice

E2E Register SC048
    common.Open URL    ${B2C_UAT_URL}
    #Register_048 Customer : แก้ไขโปรไฟล์ของฉัน
    #Step 1 ชื่อ User (Company Admin) >โปรของฉัน
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button
    Click Profile Icon
    #Step 2 กดปุ่ม "แก้ไข"
    Click Edit Button
    #Step 3 แก้ไขเบอร์โทรศัพท์
    Edit Mobile No    0871000000
    #Step 4 กดปุ่ม "บันทึก"   ปุ่ม "บันทึก" ไม่มีแสดง
    #Click Save Button