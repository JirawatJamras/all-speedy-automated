*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S009
    [Documentation]    RM : อนุมัติ Pre-Register (ลูกค้านิติบุคคล)
    [Tags]    Register    RM    UAT
    skip
    Log    Step No.1 RM ได้รับคำขอที่ได้รับมอบหมายจาก RM Lead โดยคำขอจะมีสถานะ "กำลังพิจารณา" กดปุ่ม "ดำเนินการ"
    pms_requests_page.Select Request With Considering Status [legal entity]
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['rm_name']}
    pms_request_detail_page.Verify Information On Request Details Page [legal entity]
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
    common.Verify Capture Screenshot     Register    Register_S009    Verify Request Detail Page
    
    
    Log    Step No.2 RM กรอกเบอร์โทรศัพท์ 
    pms_request_detail_page.Input Mobile Number In Sale Information    ${Register_S009['sale_phone']}
    pms_request_detail_page.Click Approve Button
    pms_requests_page.Select Request With Confirm Sent Link Status [legal entity]
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_name']}
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    ...    ${Register_S007['rm_name']}
    pms_request_detail_page.Verify Request Detail Page After RM Approve [legal entity]
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
    ...    ${Register_S009['sale_phone']}
    common.Verify Capture Screenshot     Register    Register_S009    Verify Approve Success
    
    Log    Step No.3 กดปุ่ม "อนุมัติ"
    register_business_full_register.Login mail    ${Register_S001['email']}    ${Register_S001['password']}
    register_business_full_register.Verify Email That Have Received Link
    common.Verify Capture Screenshot     Register    Register_S009    Verify Email That Have Received Link