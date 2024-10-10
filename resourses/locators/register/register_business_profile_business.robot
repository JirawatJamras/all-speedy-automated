*** Variables ***
#Profile Business
${profile_icon_btn}    //span[@aria-label='user' and @class='anticon anticon-user text-xl mr-2']
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