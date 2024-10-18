*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S007
    [Documentation]    RM Lead : Assign RM ทีละรายการในคำขอ Pre-Register  
    [Tags]    Register    UAT    In_Review
    #Step1 
    register01
    register07
    register09

*** Keywords ***
register01
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
    # common.Verify Capture Screenshot    Register_S001    filled in contact information success   

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    #Step Click btn กดปุ่มลงทะเบียน
    register_business_pre_register.Click Confirm
    #Expected
    register_business_pre_register.Verify Confirm Page        ${Register.Pre_register['txt_register_success']}

register07
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

register09
    # common.Open URL    ${PMS_UAT_URL}
    # pms_landing_page.Click Go Login Button
    # pms_login_page.Input Email    ${pms_login_user_01['username']}
    # pms_login_page.Input Password    ${pms_login_user_01['password']}
    # pms_login_page.Click Log On Button
    # pms_home_page.Select Role Admin
    # pms_home_page.Select Manage Customer Menu
    # pms_home_page.Select Manage Request Sub-Menu
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
