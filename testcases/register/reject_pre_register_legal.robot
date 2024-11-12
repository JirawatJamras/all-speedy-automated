*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***


*** Test Cases ***
Reject Pre Register (Legal)
    [Documentation]    E2E 2 Scenario
    [Tags]    Register    UAT    In_Review
    Step Test:    Scenario 02 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่อปฎิเสธ  
    Register_S002
    Assign RM
    Step Test:    Scenario 10 RM : ปฏิเสธ Pre-Register (ลูกค้านิติบุคคล)
    Register_S010

*** Keywords ***
Register_S002
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่อปฎิเสธ  
    #[Tags]    Register    UAT
    Step Test:    Step No.1 กรอกข้อมูล
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
    register_business_pre_register.Select Title Name Legal Entity    ${Register_S002['title_name']}
    register_business_pre_register.Input First Name Legal Entity    ${Register_S002['first_name']}
    register_business_pre_register.Input Last Name Legal Entity    ${Register_S002['last_name']}
    register_business_pre_register.Input Email Legal Entity   ${Register_S002['email']}
    register_business_pre_register.Input Mobile No Legal Entity   ${Register_S002['mobile_no']}
    register_business_pre_register.Input Mobile Ext Legal Entity   ${Register_S002['mobile_ext']}
    common.Verify Capture Screenshot    Register_S002    Filled In Contact Information Success   

    Step Test:    Step No.2 "กดปุ่มลงทะเบียน"
    #Step Click btn กดปุ่มลงทะเบียน
    register_business_pre_register.Click Confirm
    #Expected
    register_business_pre_register.Verify Confirm Page    ${Register.Pre_register['text_register_success']}
    common.Verify Capture Screenshot    Register_S002    pre register success

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
    pms_requests_page.Select Request With Waiting For Assign Status [legal entity]
    ...    ${Register_S002['checkbox_partner_types']}
    ...    ${Register_S002['company_name']}
    ...    ${Register_S002['first_name']}
    ...    ${Register_S002['last_name']}
    ...    ${Register_S002['mobile_no']}
    ...    ${Register_S002['mobile_ext']}
    pms_request_detail_page.Click Assign RM Button
    pms_request_detail_page.Click Button To Assign RM    ${Register_S010['rm_name']}
    pms_request_detail_page.Click Save Button

Register_S010
    Step Test:    Step No.1 RM ได้รับคำขอที่ได้รับมอบหมายจาก RM Lead โดยคำขอจะมีสถานะ "กำลังพิจารณา" กดปุ่ม "ดำเนินการ"
    pms_requests_page.Select Request With Considering Status [legal entity]
    ...    ${Register_S002['checkbox_partner_types']}  
    ...    ${Register_S002['company_name']}  
    ...    ${Register_S002['first_name']}
    ...    ${Register_S002['last_name']}
    ...    ${Register_S002['mobile_no']}
    ...    ${Register_S002['mobile_ext']}
    ...    ${Register_S010['rm_name']}
    # Expected
    pms_request_detail_page.Verify Information On Request Details Page [legal entity]
    ...    ${Register_S002['company_title_name']}
    ...    ${Register_S002['company_name']}
    ...    ${Register_S002['company_address']}
    ...    ${Register_S002['select_company_address_full']}
    ...    ${Register_S002['title_name']}
    ...    ${Register_S002['first_name']}
    ...    ${Register_S002['last_name']}
    ...    ${Register_S002['email']}
    ...    ${Register_S002['mobile_no']}
    ...    ${Register_S002['mobile_ext']}
    ...    ${Register.text_blank['remark']}
    ...    ${Register_S010['rm_name']}
    ...    ${Register_S010['sale_email']}
    common.Verify Capture Screenshot    Register_S010    Verify Request Detail Page
    Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Register_S010    Verify Request Detail Page2

    Step Test:    Step No.2 RM ระบุเหตุผลในการปฎิเสธ "ทดสอบปฎิเสธ"
    pms_request_detail_page.Input Reject Reason    ${Register_S010['remark']}
    # Expected
    common.Verify Capture Screenshot    Register_S010    Verify Input Reject Reason

    Step Test:    Step No.3 กดปุ่ม "ปฎิเสธ"
    pms_request_detail_page.Click Reject Button
    # Expected
    pms_request_detail_page.Verify Reject Confirmation Popup
    common.Verify Capture Screenshot    Register_S010    Verify Reject Confirmation Popup

    Step Test:    Step No.4 กดปุ่ม "ยืนยัน"
    pms_request_detail_page.Click Confirm Reject Button
    pms_requests_page.Select Request With Rejected Status [legal entity]  
    ...    ${Register_S002['checkbox_partner_types']}  
    ...    ${Register_S002['company_name']}  
    ...    ${Register_S002['first_name']}
    ...    ${Register_S002['last_name']}
    ...    ${Register_S002['mobile_no']}
    ...    ${Register_S002['mobile_ext']}
    ...    ${Register_S010['rm_name']}
    # Expected
    pms_request_detail_page.Verify Information After Reject Request [legal entity]
    ...    ${Register_S002['company_title_name']}
    ...    ${Register_S002['company_name']}
    ...    ${Register_S002['company_address']}
    ...    ${Register_S002['select_company_address_full']}
    ...    ${Register_S002['title_name']}
    ...    ${Register_S002['first_name']}
    ...    ${Register_S002['last_name']}
    ...    ${Register_S002['email']}
    ...    ${Register_S002['mobile_no']}
    ...    ${Register_S002['mobile_ext']}
    ...    ${Register_S010['remark']}
    ...    ${Register_S010['rm_name']}
    ...    ${Register_S010['sale_email']}
    ...    ${Register_S010['sale_phone']}
    common.Verify Capture Screenshot    Register_S010    Verify Information After Reject Request
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Register_S010    Verify Information After Reject Request2

