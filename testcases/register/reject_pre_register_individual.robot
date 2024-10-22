*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***


*** Test Cases ***
Reject Pre Register (Individual)
    [Documentation]    E2E 1 Scenario
    [Tags]    Register    UAT    In_Review
    Log    Scenario 05 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่อปฎิเสธ  
    Register_S005
    Assign RM
    Log    Scenario 12 RM : ปฎิเสธ Pre-Register (ลูกค้าบุคคลธรรมดา)
    Register_S012


*** Keywords ***
Register_S005
    Log    Step No.1 กรอกข้อมูล
    #Step1 เข้าสู่ระบบ
    common.Open URL    ${B2C_UAT_URL}
    #Step2 Click tab ลูกค้าธุรกิจ
    register_general_customers_page.Select Business Customers Tab  
    #Step3 Click btn ลงทะเบียนลูกค้าธุรกิจ
    register_business_customers_page.Click Menu Register Business
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

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    register_business_pre_register.Click Confirm
    register_business_pre_register.Verify Confirm Page        ${Register.Pre_register['text_register_success']}
    common.Verify Capture Screenshot    Register_S005    Verify Confirm Page After Register Successful

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
    ...    ${Register_S005['checkbox_partner_types']}
    ...    ${Register_S005['first_name']}
    ...    ${Register_S005['last_name']}
    ...    ${Register_S005['mobile_no']}
    ...    ${Register_S005['mobile_ext']}
    pms_request_detail_page.Click Assign RM Button
    pms_request_detail_page.Click Button To Assign RM    ${Register_S012['rm_name']}
    pms_request_detail_page.Click Save Button

Register_S012
    Log    Step No.1 RM ได้รับคำขอที่ได้รับมอบหมายจาก RM Lead โดยคำขอจะมีสถานะ "กำลังพิจารณา" กดปุ่ม "ดำเนินการ"
    pms_requests_page.Select Request With Considering Status [Individual]
    ...    ${Register_S005['checkbox_partner_types']}  
    ...    ${Register_S005['first_name']}
    ...    ${Register_S005['last_name']}
    ...    ${Register_S005['mobile_no']}
    ...    ${Register_S005['mobile_ext']}
    ...    ${Register_S012['rm_name']}
    # Expected
    pms_request_detail_page.Verify Information On Request Details Page [Individual]
    ...    ${Register_S005['checkbox_partner_types']}
    ...    ${Register_S005['title_name']}
    ...    ${Register_S005['first_name']}
    ...    ${Register_S005['last_name']}
    ...    ${Register_S005['individual_address']}
    ...    ${Register_S005['select_individual_address_full']}
    ...    ${Register_S005['email']}
    ...    ${Register_S005['mobile_no']}
    ...    ${Register_S005['mobile_ext']}
    ...    ${Register.text_blank['remark']}
    ...    ${Register_S012['rm_name']}
    ...    ${Register_S012['sale_email']}
    common.Verify Capture Screenshot    Register_S012    Verify Request Detail Page
    Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Register_S012    Verify Request Detail Page2

    Log    Step No.2 RM ระบุเหตุผลในการปฎิเสธ "ทดสอบปฎิเสธ"
    pms_request_detail_page.Input Reject Reason    ${Register_S012['remark']}
    # Expected
    common.Verify Capture Screenshot    Register_S012    Verify Input Reject Reason

    Log    Step No.3 กดปุ่ม "ปฎิเสธ"
    pms_request_detail_page.Click Reject Button
    # Expected
    pms_request_detail_page.Verify Reject Confirmation Popup
    common.Verify Capture Screenshot    Register_S012    Verify Reject Confirmation Popup

    Log    Step No.4 กดปุ่ม "ยืนยัน"
    pms_request_detail_page.Click Confirm Reject Button
    pms_requests_page.Select Request With Rejected Status [Individual]
    ...    ${Register_S005['checkbox_partner_types']}  
    ...    ${Register_S005['first_name']}
    ...    ${Register_S005['last_name']}
    ...    ${Register_S005['mobile_no']}
    ...    ${Register_S005['mobile_ext']}
    ...    ${Register_S012['rm_name']}
    # Expected
    pms_request_detail_page.Verify Information After Reject Request [Individual]
    ...    ${Register_S005['checkbox_partner_types']}
    ...    ${Register_S005['title_name']}
    ...    ${Register_S005['first_name']}
    ...    ${Register_S005['last_name']}
    ...    ${Register_S005['individual_address']}
    ...    ${Register_S005['select_individual_address_full']}
    ...    ${Register_S005['email']}
    ...    ${Register_S005['mobile_no']}
    ...    ${Register_S005['mobile_ext']}
    ...    ${Register_S012['remark']}
    ...    ${Register_S012['rm_name']}
    ...    ${Register_S012['sale_email']}
    ...    ${Register_S012['sale_phone']}
    common.Verify Capture Screenshot    Register_S012    Verify Information After Reject Request
    common.Scroll Window To Vertical    500
    common.Verify Capture Screenshot    Register_S012    Verify Information After Reject Request2