*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S002_S004_S005_S008
    [Documentation]    Customer : ลงทะเบียน Pre-Register และ RM Lead : Assign RM ทีละหลายรายการในคำขอ Pre-Register
    [Tags]    Register    RM_Lead_Assign_Multiple    UAT    Defect088
    Log    Scenario 2 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่อปฎิเสธ
    Register_S002
    Log    Scenario 4 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา) เพื่ออนุมัติ
    Register_S004
    Log    Scenario 5 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา) เพื่อปฎิเสธ
    Register_S005
    Log    Scenario 8 RM Lead : Assign RM ทีละหลายรายการในคำขอ Pre-Register
    Register_S008


*** Keywords ***
Register_S002
    Log    Step No.1 กรอกข้อมูล
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab  
    register_business_customers_page.Click Menu Register Business
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S002['checkbox_partner_types']}
    register_business_pre_register.Select Company Title Name Legal Entity     ${Register_S002['company_title_name']}
    register_business_pre_register.Input Company Name Legal Entity    ${Register_S002['company_name']}
    register_business_pre_register.Input Juristic Identification Number Legal Entity    ${Register_S002['id_number']}
    register_business_pre_register.Input Company Address Legal Entity    ${Register_S002['company_address']}
    register_business_pre_register.Input Company Address Full Legal Entity    ${Register_S002['search_company_address_full']}    ${Register_S002['select_company_address_full']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Pre Register 002 fill information 1
    
    register_business_pre_register.Select Title Name Legal Entity    ${Register_S002['title_name']}
    register_business_pre_register.Input First Name Legal Entity    ${Register_S002['first_name']}
    register_business_pre_register.Input Last Name Legal Entity    ${Register_S002['last_name']}
    register_business_pre_register.Input Email Legal Entity   ${Register_S002['email']}
    register_business_pre_register.Input Mobile No Legal Entity   ${Register_S002['mobile_no']}
    register_business_pre_register.Input Mobile Ext Legal Entity   ${Register_S002['mobile_ext']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Pre Register 002 information 2

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    register_business_pre_register.Click Confirm
    register_business_pre_register.Verify Confirm Page        ${Register.Pre_register['text_register_success']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Pre Register 002 Success

Register_S004
    Log    Step No.1 กรอกข้อมูล
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab  
    register_business_customers_page.Click Menu Register Business
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S004['checkbox_partner_types']}
    register_business_pre_register.Select Title Name Individual    ${Register_S004['title_name']}
    register_business_pre_register.Input First Name Individual    ${Register_S004['first_name']}
    register_business_pre_register.Input Last Name Individual    ${Register_S004['last_name']}
    register_business_pre_register.Input National ID Individual    ${Register_S004['id_number']}
    register_business_pre_register.Input Email Individual    ${Register_S004['email']}
    register_business_pre_register.Input Address Individual    ${Register_S004['individual_address']}
    register_business_pre_register.Input Address Full Individual    ${Register_S004['search_individual_address_full']}    ${Register_S004['select_individual_address_full']}
    register_business_pre_register.Input Mobile No Individual    ${Register_S004['mobile_no']}
    register_business_pre_register.Input Mobile Ext Individual    ${Register_S004['mobile_ext']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Pre Register 004 fill information 

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    register_business_pre_register.Click Confirm
    # Expected
    register_business_pre_register.Verify Confirm Page    ${Register.Pre_register['text_register_success']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Pre Register 004 Success

Register_S005
    Log    Step No.1 กรอกข้อมูล
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab  
    register_business_customers_page.Click Menu Register Business
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S005['checkbox_partner_types']}
    register_business_pre_register.Select Title Name Individual    ${Register_S005['title_name']}
    register_business_pre_register.Input First Name Individual    ${Register_S005['first_name']}
    register_business_pre_register.Input Last Name Individual    ${Register_S005['last_name']}
    register_business_pre_register.Input National ID Individual    ${Register_S005['id_number']}
    register_business_pre_register.Input Email Individual    ${Register_S005['email']}
    register_business_pre_register.Input Address Individual    ${Register_S005['individual_address']}
    register_business_pre_register.Input Address Full Individual    ${Register_S005['search_individual_address_full']}    ${Register_S005['select_individual_address_full']}
    register_business_pre_register.Input Mobile No Individual    ${Register_S005['mobile_no']}
    register_business_pre_register.Input Mobile Ext Individual    ${Register_S005['mobile_ext']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Pre Register 005 fill information

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    register_business_pre_register.Click Confirm
    register_business_pre_register.Verify Confirm Page       ${Register.Pre_register['text_register_success']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Pre Register 005 Success

Register_S008
    Log    Step No.1 RM Lead ได้รับคำขอที่มีสถานะ "รอบมอบหมาย" คลิกที่แท็บรอดำเนินการเพื่อเลือกรายการคำขอที่ต้องการ กดปุ่ม "Assign RM" 
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Manage Request Sub-Menu
    pms_requests_page.Select Pending Tab
    pms_requests_page.Select Checkbox Request [legal entity]
    ...    ${Register_S002['checkbox_partner_types']}
    ...    ${Register_S002['company_name']}
    ...    ${Register_S002['first_name']}
    ...    ${Register_S002['last_name']}
    ...    ${Register_S002['mobile_no']}
    ...    ${Register_S002['mobile_ext']}
    pms_requests_page.Select Checkbox Request [Individual]
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    pms_requests_page.Select Checkbox Request [Individual]
    ...    ${Register_S005['checkbox_partner_types']}
    ...    ${Register_S005['first_name']}
    ...    ${Register_S005['last_name']}
    ...    ${Register_S005['mobile_no']}
    ...    ${Register_S005['mobile_ext']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Select Checkbox
    pms_requests_page.Click Assign RM Button
    pms_requests_page.Verify Assign RM Popup
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Verify Assign RM Popup

    Log    Step No.2 กดปุ่ม "มอบหมาย" เพื่อเลือก RM "Yada Deenok"
    pms_requests_page.Click Button To Assign RM    ${Register_S008['rm_name']}
    pms_requests_page.Verify Already Assign To RM Popup    ${Register_S008['rm_name']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Verify Already Assign To RM Popup

    Log    Step No.3 กดปุ่ม "บันทึก"
    pms_requests_page.Click Save Button
    pms_requests_page.Verify Save Assign To RM Success [legal entity]
    ...    ${Register_S002['checkbox_partner_types']}
    ...    ${Register_S002['company_name']}
    ...    ${Register_S002['first_name']}
    ...    ${Register_S002['last_name']}
    ...    ${Register_S002['mobile_no']}
    ...    ${Register_S002['mobile_ext']}
    ...    ${Register_S008['rm_name']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Assign RM 002
    pms_requests_page.Verify Save Assign To RM Success [Individual]
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    ...    ${Register_S008['rm_name']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Assign RM 004
    pms_requests_page.Verify Save Assign To RM Success [Individual]
    ...    ${Register_S005['checkbox_partner_types']}
    ...    ${Register_S005['first_name']}
    ...    ${Register_S005['last_name']}
    ...    ${Register_S005['mobile_no']}
    ...    ${Register_S005['mobile_ext']}
    ...    ${Register_S008['rm_name']}
    common.Verify Capture Screenshot     Register    Register_S002_S004_S005_S008    Assign RM 005