*** Settings ***
Resource          ../../resourses/import.robot
Resource          ../../resourses/init_website.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***
${profile_icon_btn}    //span[@aria-label='user' and @class='anticon anticon-user text-xl mr-2']
${profile_business_btn}    //span[@class='ant-dropdown-menu-title-content']//span[text()='โปรไฟล์บริษัท']//..
${manage_users_tab}    //div[@data-node-key='2']//div[text()='จัดการผู้ใช้งาน']
${super_user_tab}    //div[@data-node-key='2']//div[text()='Super User']
$${user_tab}    //div[@data-node-key='3']//div[text()='User']
${add_user_btn}    //span[text()='เพิ่มผู้ใช้งาน']

${user_name_txtbox}    //label[@title='ชื่อ']//../..//input[@type='text']
${user_last_name_txtbox}    //label[@title='นามสกุล']//../..//input[@type='text']
${user_email_txtbox}    //label[@title='E-mail']//../..//input[@type='text']
${user_mobile_no_txtbox}    //label[@title='เบอร์โทรศัพท์']//../..//input[@type='text']
${user_mobile_ext_txtbox}    //label[@title='#ต่อ']//../..//input[@type='text']
${user_position_txtbox}    //label[@title='ตำแหน่งงาน']//../..//input[@type='text']

${manage_branch_tab}    //div[@data-node-key='3']//div[text()='จัดการสาขา']
${tracking_request_tab}    //div[@data-node-key='4']//div[text()='ติดตามรายการคำขอ']
${add_request_btn}    //span[text()='เพิ่มคำขอ']//..

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

*** Test Cases ***
E2E Register SC023
    #Register_023 Customer : การ Login เข้าใช้งานระบบสำหรับลูกค้าธุรกิจ
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

E2E Register SC024
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

