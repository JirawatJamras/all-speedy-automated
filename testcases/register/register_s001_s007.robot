*** Settings ***
Resource          ../../resources/init_website.robot
Resource          ../../resources/import.robot
Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Run Keywords    Close Browser
                  ...    AND   Delete ID Number    ${Register_S001['id_number']}

*** Test Cases ***
Register_S001_S007
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่ออนุมัติ และ RM Lead : Assign RM ทีละรายการในคำขอ Pre-Register
    [Tags]    Register    RM_Lead_Assign_Transaction    Regression
    Log    Scenario 1 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่ออนุมัติ
    Register_S001
    Log    Scenario 7 RM Lead : Assign RM ทีละรายการในคำขอ Pre-Register
    Register_S007

*** Keywords ***    
Register_S001
    Log    Step No.1 กรอกข้อมูล
    common.Open URL    ${B2C_URL}
    register_general_customers_page.Select Business Customers Tab  
    register_business_customers_page.Click Menu Register Business
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S001['checkbox_partner_types']}
    register_business_pre_register.Select Company Title Name Legal Entity     ${Register_S001['company_title_name']}
    register_business_pre_register.Input Company Name Legal Entity    ${Register_S001['company_name']}
    register_business_pre_register.Input Juristic Identification Number Legal Entity    ${Register_S001['id_number']}
    register_business_pre_register.Input Company Address Legal Entity    ${Register_S001['company_address']}
    register_business_pre_register.Input Company Address Full Legal Entity    ${Register_S001['search_company_address_full']}    ${Register_S001['select_company_address_full']}
    common.Verify Capture Screenshot      Register    Register_S001_S007    1.1.S001_filled in information 1
    register_business_pre_register.Select Title Name Legal Entity    ${Register_S001['title_name']}
    register_business_pre_register.Input First Name Legal Entity    ${Register_S001['first_name']}
    register_business_pre_register.Input Last Name Legal Entity    ${Register_S001['last_name']}
    register_business_pre_register.Input Email Legal Entity    ${Register_S001['email']}
    register_business_pre_register.Input Mobile No Legal Entity    ${Register_S001['mobile_no']}
    register_business_pre_register.Input Mobile Ext Legal Entity    ${Register_S001['mobile_ext']}
    common.Verify Capture Screenshot     Register    Register_S001_S007    1.2.S001_filled in information 2

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    register_business_pre_register.Click Confirm
    # Expected
    register_business_pre_register.Verify Confirm Page        ${Register.Pre_register['text_register_success']}
    common.Verify Capture Screenshot     Register    Register_S001_S007    2.S001_Verify Confirm Page    

Register_S007
    Log    Step No.1 RM Lead ได้รับคำขอที่มีสถานะ "รอมอบหมาย" กดปุ่ม "ดำเนินการ"
    common.Open URL    ${PMS_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Manage Request Sub-Menu
    pms_requests_page.Select Pending Tab
    pms_requests_page.Select Request With Waiting For Assign Status [legal entity]
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    # Expected
    Log Defect No:  New Defect 12/12/2024 : Defect292
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
    common.Verify Capture Screenshot      Register    Register_S001_S007    1.S007_Verify Request Detail Page With Status Waiting For Assign
    
    Log    Step No.2 RM Lead กดปุ่ม "Assign RM"
    pms_request_detail_page.Click Assign RM Button
    # Expected
    pms_request_detail_page.Verify Assign RM Popup
    common.Verify Capture Screenshot      Register    Register_S001_S007    2.S007_Verify Assign RM Popup
    
    Log    Step No.3 กดปุ่ม "มอบหมาย" เพื่อเลือก RM "Yada Deenok"
    pms_request_detail_page.Click Button To Assign RM    ${Register_S007['rm_name']}
    # Expected
    pms_request_detail_page.Verify Assign To RM     ${Register_S007['rm_name']}
    common.Verify Capture Screenshot      Register    Register_S001_S007    3.S007_Verify Assign To RM 
    
    Log    Step No.4 กดปุ่ม "บันทึก"
    pms_request_detail_page.Click Save Button
    # Expected
    pms_requests_page.Verify Save Assign To RM Success [legal entity] 
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['rm_name']}
    common.Verify Capture Screenshot      Register    Register_S001_S007    4.S007_Verify Save Assign To RM Success