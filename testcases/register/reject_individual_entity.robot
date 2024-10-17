*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Reject Individual Entity
    [Documentation]    E2E 4 Scenario
    [Tags]    Register    UAT    Run
    # Log    Scenario 4 Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา) เพื่ออนุมัติ
    # Register_S004
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
    register_business_pre_register.Verify Confirm Page    ${Register.Pre_register['txt_register_success']}

Register_S011
    [Documentation]    RM : อนุมัติ Pre-Register (ลูกค้าบุคคลธรรมดา)
    Log    Login
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    Sleep    3s
    common.Open URL    ${PMS_USER_MANAGER_UAT_URL}

    Log    Step No. 1 "RM ได้รับคำขอที่ได้รับมอบหมายจาก RM Lead โดยคำขอจะมีสถานะ กำลังพิจารณา กดปุ่ม ดำเนินการ"
    pms_requests_page.Click Tab Pre-Register
    # pms_requests_page.Click Tab Full-Register
    # pms_requests_page.Click Tab Company Admin
    # pms_requests_page.Click Tab Edit Company Information