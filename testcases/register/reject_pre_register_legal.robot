*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***


*** Test Cases ***
AReject Pre Register (Legal)
    [Documentation]    E2E 2 Scenarios
    [Tags]    Register    UAT
    Log    Scenario 1 RM : ปฏิเสธ Pre-Register (ลูกค้านิติบุคคล)
    # Register_S002
    Register_S010

*** Keywords ***
Register_S002
    [Documentation]    Customer : ลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล) เพื่อปฎิเสธ  
    Log    Step No.1 กรอกข้อมูล
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab  
    register_business_customers_page.Click Menu Register Business
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
    common.Verify Capture Screenshot    Register_S002    filled in contact information success   

    Log    Step No.2 "กดปุ่มลงทะเบียน"
    register_business_pre_register.Click Confirm

Register_S010
    Log    Login
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    Wait Until Element Is Visible    ${pms_img_cpall_header}    timeout=${DEFAULT_TIMEOUT}
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select Role Admin
    pms_home_page.Select Manage Customer Menu
    pms_home_page.Select Manage Request Sub-Menu

    Log    Step No.1 RM ได้รับคำขอที่ได้รับมอบหมายจาก RM Lead โดยคำขอจะมีสถานะ "กำลังพิจารณา" กดปุ่ม "ดำเนินการ"
    Go To    https://pms-uat.allspeedy.co.th/usermanager/requests/detail?id=9402877258967172463
    pms_request_detail_page.Verify Information On Request Details Page
    ...    ${Register_S010['company_title_name']}
    ...    ${Register_S010['company_name']}
    ...    ${Register_S010['id_number']}
    ...    ${Register_S010['address']}
    ...    ${Register_S010['postcode']}
    ...    ${Register_S010['title_name']}
    ...    ${Register_S010['customer_first_name']}
    ...    ${Register_S010['customer_last_name']}
    ...    ${Register_S010['customer_email']}
    ...    ${Register_S010['customer_phone']}
    ...    ${Register_S010['customer_phone_extra']}
    ...    ${Register_S010['link_full_register']}
    ...    ${EMPTY}
    ...    ${Register_S010['sale_name']}
    ...    ${EMPTY}
    ...    ${Register_S010['sale_email']}
    Log    Step No.2 RM ระบุเหตุผลในการปฎิเสธ "ทดสอบปฎิเสธ"
    
    Log    Step No.3 กดปุ่ม "ปฎิเสธ"
    Log    Step No.4 กดปุ่ม "ยืนยัน"

