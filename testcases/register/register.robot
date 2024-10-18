*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***


*** Test Cases ***
Approve Legal Entity
    [Documentation]    E2E 32 Scenario
    Log    Scenario 1 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่ออนุมัติ
    [Tags]    Register    UAT
    Register_S001
    Log    Scenario 7 RM Lead : Assign RM ทีละรายการในคำขอ Pre-Register
    Register_S007
    Log    Scenario 9 RM : อนุมัติ Pre-Register (ลูกค้านิติบุคคล)
    Register_S009
    Log    Scenario 13 Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้านิติบุคคล
    Register_S013
    Log    Scenario 15 RM : อนุมัติคำขอ Full-Register (Inbound) ที่มีการส่งกลับแก้ไข (ลูกค้านิติบุคคล)
    #Register_S015   Ampere
    Log    Scenario 20 RM : การ Update Vendor Code ในข้อมูลลูกค้า
    #Register_S020
    #Register_S022-49
*** Keywords ***    
Register_S001
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่ออนุมัติ   
    Log    Step No.1 กรอกข้อมูล
    #Step1 เข้าสู่ระบบ
    common.Open URL    ${B2C_UAT_URL}
    #Step2 Click tab ลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab  
    #Step3 Click btn ลงทะเบียนลูกค้าธุรกิจ
    register_business_customers_page.Click Menu Register Business
    #Step4 กรอกข้อมูลลงทะเบียน
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S001['checkbox_partner_types']}
    register_business_pre_register.Select Company Title Name Legal Entity     ${Register_S001['company_title_name']}
    register_business_pre_register.Input Company Name Legal Entity    ${Register_S001['company_name']}
    register_business_pre_register.Set Juristic ID Legal Entity
    register_business_pre_register.Input Juristic Identification Number Legal Entity    ${JuristicID}
    register_business_pre_register.Input Company Address Legal Entity    ${Register_S001['company_address']}
    register_business_pre_register.Input Company Address Full Legal Entity    ${Register_S001['search_company_address_full']}    ${Register_S001['select_company_address_full']}
    # common.Verify Capture Screenshot    Register_S001    filled in general information success
    # common.Scroll Window To Vertical    0
    register_business_pre_register.Select Title Name Legal Entity    ${Register_S001['title_name']}
    register_business_pre_register.Input First Name Legal Entity    ${Register_S001['first_name']}
    register_business_pre_register.Input Last Name Legal Entity    ${Register_S001['last_name']}
    register_business_pre_register.Input Email Legal Entity    ${Register_S001['email']}
    register_business_pre_register.Input Mobile No Legal Entity    ${Register_S001['mobile_no']}
    register_business_pre_register.Input Mobile Ext Legal Entity    ${Register_S001['mobile_ext']}
    common.Verify Capture Screenshot    Register_S001    filled in contact information success   

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    #Step Click btn กดปุ่มลงทะเบียน
    register_business_pre_register.Click Confirm
    #Expected
    register_business_pre_register.Verify Confirm Page        ${Register.Pre_register['txt_register_success']}

Register_S002
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่อปฎิเสธ  
    #[Tags]    Register    UAT
    Log    Step No.1 กรอกข้อมูล
    #Step1 เข้าสู่ระบบ
    common.Open URL    ${B2C_UAT_URL}
    #Step2 Click tab ลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab  
    #Step3 Click btn ลงทะเบียนลูกค้าธุรกิจ
    register_business_customers_page.Click Menu Register Business
    #Step4 กรอกข้อมูลลงทะเบียน
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S002['checkbox_partner_types']}
    register_business_pre_register.Select Company Title Name Legal Entity     ${Register_S002['company_title_name']}
    register_business_pre_register.Input Company Name Legal Entity    ${Register_S002['company_name']}
    register_business_pre_register.Set Juristic ID Legal Entity
    register_business_pre_register.Input Juristic Identification Number Legal Entity    ${JuristicID}
    register_business_pre_register.Input Company Address Legal Entity    ${Register_S002['company_address']}
    register_business_pre_register.Input Company Address Full Legal Entity    ${Register_S002['search_company_address_full']}    ${Register_S002['select_company_address_full']}
    # common.Verify Capture Screenshot    Register_S001    filled in general information success
    # common.Scroll Window To Vertical    0
    register_business_pre_register.Select Title Name Legal Entity    ${Register_S002['title_name']}
    register_business_pre_register.Input First Name Legal Entity    ${Register_S002['first_name']}
    register_business_pre_register.Input Last Name Legal Entity    ${Register_S002['last_name']}
    register_business_pre_register.Input Email Legal Entity    ${Register_S002['email']}
    register_business_pre_register.Input Mobile No Legal Entity    ${Register_S002['mobile_no']}
    register_business_pre_register.Input Mobile Ext Legal Entity    ${Register_S002['mobile_ext']}
    common.Verify Capture Screenshot    Register_S002    filled in contact information success   

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    #Step Click btn กดปุ่มลงทะเบียน
    register_business_pre_register.Click Confirm
    #Expected
    register_business_pre_register.Verify Confirm Page    ${Register.Pre_register['txt_register_success']}

Register_S003
    [Documentation]    Customer : ยกเลิกลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล)
    #[Tags]    Register    UAT
    Log    Step No.1 กรอกข้อมูล
    Log    Step No.1 กรอกข้อมูล
    #Step1 เข้าสู่ระบบ
    common.Open URL    ${B2C_UAT_URL}
    #Step2 Click tab ลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab  
    #Step3 Click btn ลงทะเบียนลูกค้าธุรกิจ
    register_business_customers_page.Click Menu Register Business
    #Step4 กรอกข้อมูลลงทะเบียน
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S003['checkbox_partner_types']}
    register_business_pre_register.Select Company Title Name Legal Entity     ${Register_S003['company_title_name']}
    register_business_pre_register.Input Company Name Legal Entity    ${Register_S003['company_name']}
    register_business_pre_register.Set Juristic ID Legal Entity
    register_business_pre_register.Input Juristic Identification Number Legal Entity    ${JuristicID}
    register_business_pre_register.Input Company Address Legal Entity    ${Register_S003['company_address']}
    register_business_pre_register.Input Company Address Full Legal Entity    ${Register_S003['search_company_address_full']}    ${Register_S003['select_company_address_full']}
    # common.Verify Capture Screenshot    Register_S001    filled in general information success
    # common.Scroll Window To Vertical    0
    register_business_pre_register.Select Title Name Legal Entity    ${Register_S003['title_name']}
    register_business_pre_register.Input First Name Legal Entity    ${Register_S003['first_name']}
    register_business_pre_register.Input Last Name Legal Entity    ${Register_S003['last_name']}
    register_business_pre_register.Input Email Legal Entity    ${Register_S003['email']}
    register_business_pre_register.Input Mobile No Legal Entity    ${Register_S003['mobile_no']}
    register_business_pre_register.Input Mobile Ext Legal Entity    ${Register_S003['mobile_ext']}
    common.Verify Capture Screenshot    Register_S003    filled in contact information success
    Log    Step No.2 ยกเลิกลงทะเบียน
    #Step Click btn ยกเลิก
    register_business_pre_register.Click Cancel
    register_business_pre_register.Verify Cancel Popup    ${Register.Pre_register['txt_header_cancel']}    ${Register.Pre_register['txt_question_cancel']}
    Log    Step No.3 ตกลงยกเลิกลงทะเบียน
    #Step Click btn ตกลง
    register_business_pre_register.Click Button Confirm Cancel Popup

Register_S004
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา) เพื่ออนุมัติ
    #[Tags]    Register    UAT
    Log    Step No.1 กรอกข้อมูล
    #Step1 เข้าสู่ระบบ
    common.Open URL    ${B2C_UAT_URL}
    #Step2 Click tab ลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab  
    #Step3 Click btn ลงทะเบียนลูกค้าธุรกิจ
    register_business_customers_page.Click Menu Register Business
    #Step4 กรอกข้อมูลลงทะเบียน
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S004['checkbox_partner_types']}
    register_business_pre_register.Select Title Name Individual    ${Register_S004['title_name']}
    register_business_pre_register.Input First Name Individual    ${Register_S004['first_name']}
    register_business_pre_register.Input Last Name Individual    ${Register_S004['last_name']}
    register_business_pre_register.Set National ID Individual
    register_business_pre_register.Input National ID Individual    ${NationalID}
    register_business_pre_register.Input Email Individual    ${Register_S004['email']}
    register_business_pre_register.Input Address Individual    ${Register_S004['individual_address']}
    register_business_pre_register.Input Address Full Individual    ${Register_S004['search_individual_address_full']}    ${Register_S004['select_individual_address_full']}
    register_business_pre_register.Input Mobile No Individual    ${Register_S004['mobile_no']}
    register_business_pre_register.Input Mobile Ext Individual    ${Register_S004['mobile_ext']}
    common.Verify Capture Screenshot    Register_S004    filled in contact information success   

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    #Step Click btn กดปุ่มลงทะเบียน
    register_business_pre_register.Click Confirm
    #Expected
    register_business_pre_register.Verify Confirm Page    ${Register.Pre_register['txt_register_success']}

Register_S005
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา) เพื่อปฎิเสธ
    #[Tags]    Register    UAT
    Log    Step No.1 กรอกข้อมูล
    #Step1 เข้าสู่ระบบ
    common.Open URL    ${B2C_UAT_URL}
    #Step2 Click tab ลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab  
    #Step3 Click btn ลงทะเบียนลูกค้าธุรกิจ
    register_business_customers_page.Click Menu Register Business
    #Step4 กรอกข้อมูลลงทะเบียน
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S005['checkbox_partner_types']}
    register_business_pre_register.Select Title Name Individual    ${Register_S005['title_name']}
    register_business_pre_register.Input First Name Individual    ${Register_S005['first_name']}
    register_business_pre_register.Input Last Name Individual    ${Register_S005['last_name']}
    register_business_pre_register.Set National ID Individual
    register_business_pre_register.Input National ID Individual    ${NationalID}
    register_business_pre_register.Input Email Individual    ${Register_S005['email']}
    register_business_pre_register.Input Address Individual    ${Register_S005['individual_address']}
    register_business_pre_register.Input Address Full Individual    ${Register_S005['search_individual_address_full']}    ${Register_S005['select_individual_address_full']}
    register_business_pre_register.Input Mobile No Individual    ${Register_S005['mobile_no']}
    register_business_pre_register.Input Mobile Ext Individual    ${Register_S005['mobile_ext']}
    common.Verify Capture Screenshot    Register_S005    filled in contact information success   

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    #Step Click btn กดปุ่มลงทะเบียน
    register_business_pre_register.Click Confirm
    #Expected
    register_business_pre_register.Verify Confirm Page    ${Register.Pre_register['txt_register_success']}


Register_S006
    [Documentation]    Customer : ยกเลิกลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา)
    #[Tags]    Register    UAT
    Log    Step No.1 กรอกข้อมูล
    #Step1 เข้าสู่ระบบ
    common.Open URL    ${B2C_UAT_URL}
    #Step2 Click tab ลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab  
    #Step3 Click btn ลงทะเบียนลูกค้าธุรกิจ
    register_business_customers_page.Click Menu Register Business
    #Step4 กรอกข้อมูลลงทะเบียน
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S006['checkbox_partner_types']}
    register_business_pre_register.Select Title Name Individual    ${Register_S006['title_name']}
    register_business_pre_register.Input First Name Individual    ${Register_S006['first_name']}
    register_business_pre_register.Input Last Name Individual    ${Register_S006['last_name']}
    register_business_pre_register.Set National ID Individual
    register_business_pre_register.Input National ID Individual    ${NationalID}
    register_business_pre_register.Input Email Individual    ${Register_S006['email']}
    register_business_pre_register.Input Address Individual    ${Register_S005['individual_address']}
    register_business_pre_register.Input Address Full Individual    ${Register_S006['search_individual_address_full']}    ${Register_S006['select_individual_address_full']}
    register_business_pre_register.Input Mobile No Individual    ${Register_S006['mobile_no']}
    register_business_pre_register.Input Mobile Ext Individual    ${Register_S006['mobile_ext']}
    common.Verify Capture Screenshot    Register_S006    filled in contact information success

    Log    Step No.2 ยกเลิกลงทะเบียน
    #Step Click btn ยกเลิก
    register_business_pre_register.Click Cancel
    register_business_pre_register.Verify Cancel Popup    ${Register.Pre_register['txt_header_cancel']}    ${Register.Pre_register['txt_question_cancel']}
    Log    Step No.3 ตกลงยกเลิกลงทะเบียน
    #Step Click btn ตกลง
    register_business_pre_register.Click Button Confirm Cancel Popup

Register_S007
    [Documentation]    RM Lead : Assign RM ทีละรายการในคำขอ Pre-Register
    #Step1 
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Manage Request Sub-Menu
    pms_requests_page.Select Pending Tab
    pms_requests_page.Select Request With Status Waiting For Assign
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    pms_request_detail_page.Verify Request Detail Page With Status Waiting For Assign
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S007['request_type']}
    ...    ${Register_S007['reference_request']}
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_title_name']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['company_address']}
    ...    ${Register_S001['select_company_address_full']}
    ...    ${Register_S001['title_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['email']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    common.Verify Capture Screenshot    Register_S007    Verify Request Detail Page With Status Waiting For Assign
    pms_request_detail_page.Click Assign RM Button
    pms_request_detail_page.Verify Assign RM Popup
    common.Verify Capture Screenshot    Register_S007    Verify Assign RM Popup
    pms_request_detail_page.Click Button To Assign RM    ${Register_S007['rm_name']}
    pms_request_detail_page.Verify Assign To RM     ${Register_S007['rm_name']}
    common.Verify Capture Screenshot    Register_S007    Verify Assign To RM 
    pms_request_detail_page.Click Save Button
    pms_requests_page.Verify Save Assign To RM Success
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['rm_name']}
    common.Verify Capture Screenshot    Register_S007    Verify Save Assign To RM Success

Register_S009
    [Documentation]    RM : อนุมัติ Pre-Register (ลูกค้านิติบุคคล)
    pms_requests_page.Select Request With Considering Status
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['rm_name']}
    pms_request_detail_page.Verify Information On Request Details Page
    ...    ${Register_S001['company_title_name']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['company_address']}
    ...    ${Register_S001['select_company_address_full']}
    ...    ${Register_S001['title_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['email']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['remark']}
    ...    ${Register_S007['rm_name']}
    ...    ${Register_S009['sale_email']}
    common.Verify Capture Screenshot    Register_S009    Verify Request Detail Page
    pms_request_detail_page.Input Mobile Number In Sale Information    ${Register_S009['sale_phone']}
    pms_request_detail_page.Click Approve Button
    pms_requests_page.Verify Approve Success
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['rm_name']}
    common.Verify Capture Screenshot    Register_S009    Verify Approve Success
    register_business_full_register.Login mail    ${Register_S001['email']}    ${Register_S001['password']}
    register_business_full_register.Verify Email That Have Received Link
    common.Verify Capture Screenshot    Register_S009    Verify Email That Have Received Link

Register_S013
    [Documentation]    Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้านิติบุคคล 
    Log    Step No.1 ลูกค้ากด Link Full Register ที่ได้รับทาง E-mail
    register_business_full_register.Get Link On Email
    common.Open URL    ${link_full_register}
    
    #Expected
    #Inprogress
    register_business_full_register.Verify Company information Legal Entity
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_title_name']}
    ...    ${Register_S001['company_name']}
    ...    ${JuristicID}
    # ...    ${Register_S001['id_number']}
    ...    ${Register_S001['company_address']}
    ...    ${Register_S001['select_company_address_full']}
    ...    ${Register_S001['title_name']} 
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['email']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    common.Verify Capture Screenshot    Register_S013    Verify Company Information

    Log    Step No.2 กรอกข้อมูลเบอร์โทรศัพท์
    register_business_full_register.Input Mobile Company Legal Entity    ${Register_S013['mobile_company']}
    register_business_full_register.Input Mobile Company Ext Legal Entity    ${Register_S013['mobile_company_ext']}
    
    Log    Step No.3 กดปุ่ม "ถัดไป"
    #register_business_full_register.Click Next
    Log    Step No.4 เปิดใช้งานพัสดุทั่วไป

    Log    Step No.5 กดปุ่ม "บันทึกร่าง" ที่ขั้นตอนข้อมูลบริการ
    #register_business_full_register.Click Save
    Log    Step No.6 กดปุ่ม "ยกเลิก"
    #register_business_full_register.Click Cancel
    Log    Step No.7 กดปุ่ม "ตกลง" ที่ Popup
    
    Log    Step No.8 กดเปิด Link Full Register เดิม ที่ได้รับทาง E-mail 
    #common.Open URL    ${link_full_register}
    Log    Step No.9 กดปุ่ม "ถัดไป"
    #register_business_full_register.Click Next 
    Log    Step No.10 เปิดใช้งานพัสดุควบคุมอุณหภูมิ และ เปิดใช้งาน Return Business

    Log    Step No.11 กดปุ่ม "ถัดไป"
    #register_business_full_register.Click Next 
    Log    Step No.12 ระบุข้อมูลผู้ติดต่อ

    Log    Step No.13 กดปุ่ม "ถัดไป"
    #register_business_full_register.Click Next 
    Log    Step No.14 อัปโหลดเอกสารประกอบ

    Log    Step No.15 กดปุ่ม "ลงทะเบียน"

    Log    Step No.16 กด Link Full Register เดิม ที่ได้รับทาง E-mail 
    common.Open URL    ${link_full_register}
    Log    Step No.17 กดปุ่ม "หมายเหตุการแก้ไข"

    Log    Step No.18 กดปุ่ม "x"

Register_S014
    [Documentation]    Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้าบุคคลธรรมดา
    Log    Step No.1 ลูกค้ากด Link Full Register ที่ได้รับทาง E-mail
    #Step login email same input email in S004
    # common.Open URL    https://yopmail.com/
    # ${email}=    Evaluate    "${Register_S004['email']}".split("@")[0]
    # register_business_full_register.Login Yopmail    ${email}
    #step get link for full-register
    #${link_full_register}=    Set Variable    https://www-uat.allspeedy.co.th/business-register/fullRegister/7142801012603045672
    #common.Open URL    ${link_full_register}
    
    
    #Expected
    register_business_full_register.Verify Company information
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['title_name']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['id_number']}
    ...    ${Register_S004['email']}
    ...    ${Register_S004['individual_address']}
    ...    ${Register_S004['select_individual_address_full']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    
    Log    Step No.2 Click btn "ถัดไป"
    #Step1 Click tab พัสดุทั่วไป
    #Expected
    #Step2 Click tab พัสดุควบคุมอุณหภูมิ
    #Expected
    #Step3 Click tab Return Business
    #Expected
    Log    Step No.3 เปิดใช้งานพัสดุทั่วไป
    #Expected
    Log    Step No.4 กดปุ่ม "บันทึกร่าง" ที่ขั้นตอนข้อมูลบริการ
    #Expected
    Log    Step No.5 กดปุ่ม "ยกเลิก"
    #Expected
    Log    Step No.6 กดปุ่ม "ตกลง" ที่ Popup
    #Expected
    Log    Step No.7 กดเปิด Link Full Register เดิม ที่ได้รับทาง E-mail 
    #Expected
    Log    Step No.8 กดปุ่ม "ถัดไป"
    #Expected
    Log    Step No.9 เปิดใช้งานพัสดุควบคุมอุณหภูมิ และ เปิดใช้งาน Return Business
    #Step1 เปิดใช้งานพัสดุควบคุมอุณหภูมิ
    #Expected
    #Step2 เปิดใช้งาน Return Business
    #Expected
    Log    Step No.10 กดปุ่ม "ถัดไป"
    #Expected
    Log    Step No.11 ระบุข้อมูลผู้ติดต่อ และ ข้อมูลธนาคาร
    #Step1 ระบุข้อมูลผู้ติดต่อ
    #Expected
    #Step2 ระบุข้อมูลธนาคาร
    #Expected   
    Log    Step No.12 กดปุ่ม "ถัดไป"
    #Expected
    Log    Step No.13 อัพโหลดเอกสารประกอบ
    #Expected
    Log    Step No.14 กดปุ่ม "ลงทะเบียน"
    #Expected
    Log    Step No.15 กด Link Full Register เดิม ที่ได้รับทาง E-mail
    #Expected 
    Log    Step No.16 กดปุ่ม "หมายเหตุการแก้ไข"
    #Expected
    Log    Step No.17 กดปุ่ม "x"
    #Expected

Register_S023
    [Documentation]    Customer : การ Login เข้าใช้งานระบบสำหรับลูกค้าธุรกิจ
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

Register_S024
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button
    [Documentation]    Customer : จัดการผู้ใช้งาน Super User
    #Step 1
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Manage Users
    register_business_profile_business.Click Menu Super User
    register_business_profile_business.Click Add User
    #Step 2
    register_business_profile_business.Input User Name    Automate
    register_business_profile_business.Input User Last Name    Superuser
    register_business_profile_business.Input User Email    allspeedy.superuser@yopmail.com
    register_business_profile_business.Input User Mobile No    0931234567
    #register_business_profile_business.Input User Mobile Ext    0
    register_business_profile_business.Input User Position    พนักงานแพคสินค้า
    #Step 3 ไม่มีปุ่มยืนยัน
    #Step 4 กดยกเลิกมาที่หน้าเดิมไม่ได้
    #Step 5 ไม่มีปุ่มดำเนินการ
    #Step 6 ไม่มีปุ่มแก้ไข
    #Step 7 ไม่มีปุ่มยกเลิก
    #Step 8 ไม่มีปุ่มย้อนกลับ

Register_S025
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : จัดการผู้ใช้งาน User
    #Step 1
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Manage Users
    register_business_profile_business.Click Menu User
    register_business_profile_business.Click Add User
    #Step 2
    register_business_profile_business.Input User Name    Automate
    register_business_profile_business.Input User Last Name    User
    register_business_profile_business.Input User Email    allspeedy.user@yopmail.com
    register_business_profile_business.Input User Mobile No    0931234567
    #register_business_profile_business.Input User Mobile Ext    0
    register_business_profile_business.Input User Position    พนักงานแพคสินค้า
    #Step 3 ไม่มีปุ่ม "ยืนยัน"
    #Step 4 กด "ยกเลิก" มาที่หน้าเดิมไม่ได้
    #Step 5 ไม่มีปุ่ม "ดำเนินการ"
    #Step 6 ไม่มีปุ่ม "แก้ไข"
    #Step 7 ไม่มีปุ่ม "ยกเลิก"
    #Step 8 ไม่มีปุ่ม "ย้อนกลับ"

Register_S026
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : จัดการสาขา
    #Step 1
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Manage Branches
    #Step 2 ไม่มีปุ่ม "ย้ายผู้ใช้งาน"
    register_business_profile_business.Click Checkbox User    พิชิต สุริยัน
    #Step 3 ไม่มี Dropdown
    #Step 4 ไม่มี Dropdown ให้เลือก

Register_S027
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : คำขอเพิ่ม Company Admin
    #Step 1 ไม่แสดงหน้า คำขอ Company Admin 
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Tracking Request list
    register_business_profile_business.Click Add Request    ขอเพิ่ม Company Admin
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอ Company Admin 
    #Click Add Request    ขอเพิ่ม Company Admin
    #Step 6
    #Step 7
    #Step 8

Register_S028
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : คำขอเพิ่ม Company Admin
    #Step 1 ไม่มีปุ่ม "ดำเนินการ"
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Manage Users
    #Step 2 ไม่มีปุ่ม "ยกเลิก" 
    #Step 3
    #Step 4
    #Step 5 
    #Step 6
    #Step 7
    #Step 8

Register_S029
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : คำขอแก้ไขข้อมูลที่อยู่บริษัท
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลที่อยู่บริษัท
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Tracking Request list
    register_business_profile_business.Click Add Request    ขอแก้ไขข้อมูลที่อยู่บริษัท
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลที่อยู่บริษัท 
    #Click Add Request    ขอแก้ไขข้อมูลที่อยู่บริษัท
    #Step 6
    #Step 7
    #Step 8 

Register_S030
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : คำขอแก้ไขข้อมูลผู้ติดต่อ
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลผู้ติดต่อ
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Tracking Request list
    register_business_profile_business.Click Add Request    ขอแก้ไขข้อมูลผู้ติดต่อ
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลผู้ติดต่อ
    #Click Add Request    ขอแก้ไขข้อมูลผู้ติดต่อ
    #Step 6
    #Step 7
    #Step 8 

Register_S031
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : คำขอแก้ไขข้อมูลธนาคาร
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลธนาคาร
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Tracking Request list
    register_business_profile_business.Click Add Request    ขอแก้ไขข้อมูลธนาคาร
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลธนาคาร
    #Click Add Request    ขอแก้ไขข้อมูลธนาคาร
    #Step 6
    #Step 7
    #Step 8   

Register_S032
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : คำขอแก้ไขข้อมูลบริการ
    #Step 1 ไม่แสดงหน้า คำขอแก้ไขข้อมูลบริการ
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    register_business_profile_business.Click Menu Tracking Request list
    register_business_profile_business.Click Add Request    ขอแก้ไขข้อมูลบริการ
    #Step 2 
    #Step 3
    #Step 4
    #Step 5 ไม่แสดงหน้า คำขอแก้ไขข้อมูลบริการ
    #Click Add Request    ขอแก้ไขข้อมูลบริการ
    #Step 6
    #Step 7
    #Step 8           

Register_S047
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button

    [Documentation]    Customer : ตรวจสอบข้อมูลบริษัท
    #Step 1 Company Admin : กดปุ่ม "โปรไฟล์บริษัท"
    register_business_profile_business.Click Profile Icon
    register_business_profile_business.Click Profile Business
    #Step 2 กดแท็บ "แท็บข้อมูลบริการ" และ แท็บ "พัสดุทั่วไป"
    register_business_profile_business.Click Menu Service Information
    register_business_profile_business.Click Menu General Parcel
    #Step 3 กดแท็บ "พัสดุควบคุมอุณหภูมิ"
    register_business_profile_business.Click Menu Temperature Controlled Parcels
    #Step 4 กดแท็บ "Return Business"
    register_business_profile_business.Click Menu Return Business
    #Step 5 กดแท็บ "ข้อมูลผู้ติดต่อและข้อมูลธนาคาร"
    register_business_profile_business.Click Menu Contact and Bank Information
    #Step 6 กดแท็บ "เอกสารประกอบ"
    register_business_profile_business.Click Menu Supporting Documents
    #Step 7 กดแท็บ "จัดการผู้ใช้งาน"
    register_business_profile_business.Click Menu Manage Users 
    #Step 8 กดแท็บ "Super User"
    register_business_profile_business.Click Menu Super User 
    #Step 9 กดแท็บ "User"
    register_business_profile_business.Click Menu User 
    #Step 10 กดแท็บ "จัดการสาขา"
    register_business_profile_business.Click Menu Manage Branches  
    #Step 11 กดแท็บ "ติดตามรายการคำขอ"
    register_business_profile_business.Click Menu Tracking Request List 
    #Step 12 กดแท็บ "ใบแจ้งหนี้"
    register_business_profile_business.Click Menu Invoice

Register_S048
    common.Open URL    ${B2C_UAT_URL}
    [Documentation]    Customer : แก้ไขโปรไฟล์ของฉัน
    #Step 1 ชื่อ User (Company Admin) >โปรของฉัน
    register_general_customers_page.Select Business Customers Tab
    b2c_login_page.Input Email    idc@gmail.com
    b2c_login_page.Input Password    P@ssw0rd
    b2c_login_page.Click Log On Button
    register_business_profile_business.Click Profile Icon
    #step click โปรไฟล์ของฉัน
    #Step 2 กดปุ่ม "แก้ไข"
    register_business_profiles.Click Edit Button
    #Step 3 แก้ไขเบอร์โทรศัพท์
    register_business_profiles.Edit Mobile No    0871000000
    #Step 4 กดปุ่ม "บันทึก"   ปุ่ม "บันทึก" ไม่มีแสดง
    #register_business_profiles.Click Save Button