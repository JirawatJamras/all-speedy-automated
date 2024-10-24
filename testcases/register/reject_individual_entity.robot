*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Reject Individual Entity
    [Documentation]    E2E 4 Scenario
    [Tags]    Register    UAT    In_Review
    Log    Scenario 4 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา) เพื่ออนุมัติ
    Register_S004
    Assign RM
    Log    Scenario 11 RM : อนุมัติ Pre-Register (ลูกค้าบุคคลธรรมดา)
    Register_S011

*** Keywords ***
Register_S004
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา) เพื่ออนุมัติ
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
    register_business_pre_register.Click Confirm
    #Expected
    register_business_pre_register.Verify Confirm Page    ${Register.Pre_register['text_register_success']}
    common.Verify Capture Screenshot    Register_S004    Pre-Register Success

Assign RM
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Manage Request Sub-Menu
    pms_requests_page.Select Pending Tab
    pms_requests_page.Select Request With Waiting For Assign Status [Individual]
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    pms_request_detail_page.Click Assign RM Button
    pms_request_detail_page.Click Button To Assign RM    ${Register_S011['rm_name']}
    pms_request_detail_page.Click Save Button

Register_S011
    # Log    Login
    # common.Open URL    ${PMS_UAT_URL}
    # pms_landing_page.Click Go Login Button
    # pms_login_page.Input Email    ${pms_login_user_01['username']}
    # pms_login_page.Input Password    ${pms_login_user_01['password']}
    # pms_login_page.Click Log On Button
    # pms_home_page.Select Role Admin
    # pms_home_page.Select Manage Customer Menu
    # pms_home_page.Select Manage Request Sub-Menu
 
    Log    Step No. 1 "RM ได้รับคำขอที่ได้รับมอบหมายจาก RM Lead โดยคำขอจะมีสถานะ กำลังพิจารณา กดปุ่ม ดำเนินการ"
    pms_requests_page.Click Tab Pre-Register
    pms_requests_page.Select Request With Considering Status [Individual]
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    ...    ${Register_S011['rm_name']}
    #Expected
    pms_request_detail_page.Verify Information On Request Details Page [Individual]
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['title_name']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['individual_address']}
    ...    ${Register_S004['select_individual_address_full']}
    ...    ${Register_S004['email']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    ...    ${Register_S011['remark']}
    ...    ${Register_S011['rm_name']}
    ...    ${Register_S011['sale_email']}
    Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Register_S011    Verify Request Detail Page2
    Scroll Window To Vertical    0
    common.Verify Capture Screenshot    Register_S011    Verify Request Detail Page

    Log    Step No. 2 RM กรอกเบอร์โทรศัพท์
    Input Mobile Number In Sale Information    ${Register_S011['sale_phone']}

    Log    Step No. 3 กดปุ่ม "อนุมัติ"
    pms_request_detail_page.Click Approve Button
    # Expected
    pms_requests_page.Select Request With Confirm Sent Link Status [Individual]
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    ...    ${Register_S011['rm_name']}
    pms_request_detail_page.Verify Request Detail Page After RM Approve [Individual]
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['title_name']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['individual_address']}
    ...    ${Register_S004['select_individual_address_full']}
    ...    ${Register_S004['email']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    ...    ${Register_S011['remark']}
    ...    ${Register_S011['rm_name']}
    ...    ${Register_S011['sale_email']}
    ...    ${Register_S011['sale_phone']}
    common.Verify Capture Screenshot    Register_S011    Verify Approve Success Detail Page
    register_business_full_register.Login mail    ${Register['email']}    ${Register['password']}
    register_business_full_register.Verify Email That Have Received Link
    common.Verify Capture Screenshot    Register_S011    Verify Email That Have Received Link

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