*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot
Test Setup        Run Keywords    Open Chrome Browser    chrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Variables ***

*** Test Cases ***
Approve Outbound
    [Documentation]    RM : สร้างและอนุมัติคำขอ Full-Register (Outbound) ลูกค้านิติบุคคล
    [Tags]    Register    UAT
    Step Test:    Scenario 17 RM : สร้างและอนุมัติคำขอ Full-Register (Outbound) ลูกค้านิติบุคคล
    Register_S017
    
*** Keywords ***    
Register_S017
    [Documentation]    RM : สร้างและอนุมัติคำขอ Full-Register (Outbound) ลูกค้านิติบุคคล
    Log    Login
    common.Open URL    ${PMS_UAT_URL}
    pms_landing_page.Click Go Login Button
    pms_login_page.Input Email    ${pms_login_user_01['username']}
    pms_login_page.Input Password    ${pms_login_user_01['password']}
    pms_login_page.Click Log On Button
    pms_home_page.Select role Admin
    pms_home_page.Select PMS Menu   ${rm['text_manage_customer_information']}
    pms_home_page.Select PMS Sub-Menu   ${rm['text_mange_request']}
    # Go To    https://pms-uat.allspeedy.co.th/usermanager/requests

    Step Test:    Step No.1 RM กดปุ่ม "เพิ่มลูกค้าใหม่"
    pms_requests_page.Click Tab Full-Register
    pms_requests_page.Click Add New Customer
    # Expected
    # Inprogress
    pms_full_register_page.Verify Full Register Status    ${rm.text_status['non']}
    

    Step Test:    Step No.2 ระบุข้อมูลลูกค้าใหม่
    pms_full_register_page.Select Type Customer    ${Register_S017.company_data['type_customer']}
    pms_full_register_page.Select Title Name Company    ${Register_S017.company_data['title_name_company']}
    pms_full_register_page.Input Name Company    ${Register_S017.company_data['name_company']}
    pms_full_register_page.Input Tax Identification Number    ${Register_S017.company_data['tax_identification_number']}
    pms_full_register_page.Input Mobile Company    ${Register_S017.company_data['mobile_company']}
    pms_full_register_page.Input Mobile Company Ext    ${Register_S017.company_data['ext']}
    pms_full_register_page.Input Address Company    ${Register_S017.company_data['address']}
    pms_full_register_page.Input Postcode    ${Register_S017.company_data['postcode']}    ${Register_S017.company_data['postcode_full']}
    pms_full_register_page.Select Contact Data Title Name    ${Register_S017.company_data.contact_data['title_name']}
    pms_full_register_page.Input Contact Data First Name    ${Register_S017.company_data.contact_data['first_name']}
    pms_full_register_page.Input Contact Data Last Name    ${Register_S017.company_data.contact_data['last_name']}
    pms_full_register_page.Input Contact Data Email    ${Register_S017.company_data.contact_data['email']}
    pms_full_register_page.Input Contact Data Mobile Number    ${Register_S017.company_data.contact_data['mobile_number']}
    pms_full_register_page.Input Contact Data Mobile Number Ext    ${Register_S017.company_data.contact_data['ext']}

    Step Test:    Step No.3 กดปุ่ม"หน้าถัดไป"
    pms_full_register_page.Click Button Next
    # Expected

    Step Test:    Step No.4 ระบุข้อมูล
    pms_full_register_page.Click Tab Dry Parcel
    pms_full_register_page.Click Button Select For Edit Dry Parcel
    pms_full_register_page.Click Button COD Dry Parcel
    pms_full_register_page.Click Button Insure Dry Parcel
    pms_full_register_page.Input Product Type Dry Parcel    เสื้อผ้า
    pms_full_register_page.Input Deliveries Per Day Dry Parcel    10-99 ชิ้น
    pms_full_register_page.Input Sell Channel Dry Parcel    LINE