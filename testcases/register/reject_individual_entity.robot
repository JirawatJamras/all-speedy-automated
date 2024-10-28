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
    #Assign RM
    Log    Scenario 11 RM : อนุมัติ Pre-Register (ลูกค้าบุคคลธรรมดา)
    Register_S011
    Log    Scenario 14 Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้าบุคคลธรรมดา
    Register_S014
    Log    Scenario 16 RM : ปฎิเสธคำขอ Full-Register (Inbound) ที่มีการส่งกลับแก้ไข (ลูกค้าบุคคลธรรมดา)
    #Register_S016



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
    [Documentation]    RM : อนุมัติ Pre-Register (ลูกค้าบุคคลธรรมดา)
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
    register_business_full_register.Get Link On Email
    common.Open URL    ${link_full_register}
    #common.Open URL    https://www-uat.allspeedy.co.th/business-register/fullRegister/11153137768697514178
    #Expected
    ${NationalID}=    Set Variable    8241022180734
    register_business_full_register.Verify Company Information Individual Page
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['title_name']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    #...    ${Register_S004['id_number']}
    ...    ${NationalID}
    ...    ${Register_S004['email']}
    ...    ${Register_S004['individual_address']}
    ...    ${Register_S004['select_individual_address_full']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    common.Verify Capture Screenshot    Register_S014    Verify Company Information
    
    Log    Step No.2 Click btn "ถัดไป"
    register_business_full_register.Click Next
    #Expected
    #Tab พัสดุทั่วไป
    register_business_full_register.Verify Service Information Page Tab Dry Parcel
    common.Verify Capture Screenshot    Register_S014    Tab Dry Parcel
    #Tab พัสดุควบคุมอุณหภูมิ
    register_business_full_register.Verify Service Information Page Tab Chill Parcel
    common.Verify Capture Screenshot    Register_S014    Tab Chill Parcel
    #Tab Return Business
    register_business_full_register.Verify Service Information Page Tab Return Business
    common.Verify Capture Screenshot    Register_S014    Tab Return Business


    Log    Step No.3 เปิดใช้งานพัสดุทั่วไป
    register_business_full_register.Click Tab Dry Parcel
    register_business_full_register.Click Select Dry Parcel
    register_business_full_register.Select Add Service Cod Dry Parcel
    register_business_full_register.Select Add Service Insuaration Dry Parcel
    register_business_full_register.Select Type Product Dry Parcel    ${Register_S014.dry_parcel['type_product']}
    register_business_full_register.Select Number By Day Dry Parcel    ${Register_S014.dry_parcel['number_by_day']}
    register_business_full_register.Select Sale Channel Dry Parcel    ${Register_S014.dry_parcel['sale_channel']}
    register_business_full_register.Input Remark Dry Parcel    ${Register_S014.dry_parcel['remark']}
    common.Verify Capture Screenshot    Register_S014    Enable Dry Parcel


    Log    Step No.4 กดปุ่ม "บันทึกร่าง" ที่ขั้นตอนข้อมูลบริการ
    register_business_full_register.Click Save
    common.Verify Capture Screenshot    Register_S014    Save Draft


    Log    Step No.5 กดปุ่ม "ยกเลิก"
    register_business_full_register.Click Cancel
    #Expected
    register_business_full_register.Verify Cancel Popup    ${Register.Full_register['text_header_cancel']}    ${Register.Pre_register['text_question_cancel']}
    common.Verify Capture Screenshot    Register_S014    Cancel popup


    Log    Step No.6 กดปุ่ม "ตกลง" ที่ Popup
    register_business_full_register.Click Button Confirm Cancel Popup
    common.Verify Capture Screenshot    Register_S014    Exit link Full register

    Log    Step No.7 กดเปิด Link Full Register เดิม ที่ได้รับทาง E-mail 
    common.Open URL    ${link_full_register}
    # common.Open URL    https://www-uat.allspeedy.co.th/business-register/fullRegister/11153137768697514178
    #Expected
    register_business_full_register.Verify Company Information Individual Page
    ...    ${Register_S004['checkbox_partner_types']}
    ...    ${Register_S004['title_name']}
    ...    ${Register_S004['first_name']}
    ...    ${Register_S004['last_name']}
    #...    ${Register_S004['id_number']}
    ...    ${NationalID}
    ...    ${Register_S004['email']}
    ...    ${Register_S004['individual_address']}
    ...    ${Register_S004['select_individual_address_full']}
    ...    ${Register_S004['mobile_no']}
    ...    ${Register_S004['mobile_ext']}
    common.Verify Capture Screenshot    Register_S014    Verify Company Information


    Log    Step No.8 กดปุ่ม "ถัดไป"
    register_business_full_register.Click Next
    Expected
    register_business_full_register.Verify Service Information Page Tab Dry Parcel
    ...    type_product=${Register_S014.dry_parcel['type_product']}
    ...    number_by_day=${Register_S014.dry_parcel['number_by_day']}
    ...    sale_channel=${Register_S014.dry_parcel['sale_channel']}
    ...    remark=${Register_S014.dry_parcel['remark']}
    common.Verify Capture Screenshot    Register_S014    Verify Dry Parcel


    Log    Step No.9 เปิดใช้งานพัสดุควบคุมอุณหภูมิ และ เปิดใช้งาน Return Business
    #Tab พัสดุควบคุมอุณหภูมิ
    register_business_full_register.Click Tab Chill Parcel
    register_business_full_register.Click Select Chill Parcel
    register_business_full_register.Select Add Service Cod Chill Parcel
    register_business_full_register.Select Type Product Chill Parcel    ${Register_S014.chill_parcel['type_product']}
    register_business_full_register.Select Number By Day Chill Parcel    ${Register_S014.chill_parcel['number_by_day']}
    register_business_full_register.Select Sale Channel Chill Parcel    ${Register_S014.chill_parcel['sale_channel']}
    register_business_full_register.Input Remark Chill Parcel    ${Register_S014.chill_parcel['remark']}
    common.Verify Capture Screenshot    Register_S014    Enable Chill Parcel

    #Tab Return Business
    register_business_full_register.Click Tab Return Business
    register_business_full_register.Click Select Return Business
    register_business_full_register.Select Add Service Express Return Business
    register_business_full_register.Select Add Service Insuaration Return Business
    register_business_full_register.Select Type Product Return Business    ${Register_S014.return_business['type_product']}
    register_business_full_register.Select Number By Day Return Business    ${Register_S014.return_business['number_by_day']}
    register_business_full_register.Select Sale Channel Return Business    ${Register_S014.return_business['sale_channel']}
    register_business_full_register.Input Remark Return Business    ${Register_S014.return_business['remark']}
    common.Verify Capture Screenshot    Register_S014    Enable Return Business


    Log    Step No.10 กดปุ่ม "ถัดไป"
    register_business_full_register.Click Next
    register_business_full_register.Click Add Contact Information
    #Expected
    register_business_full_register.Verify Contact And Bank Information Page
    common.Verify Capture Screenshot    Register_S014    Verify Contact And Bank Information Page


    Log    Step No.11 ระบุข้อมูลผู้ติดต่อ และ ข้อมูลธนาคาร
    #Step1 ระบุข้อมูลผู้ติดต่อ
    register_business_full_register.Input User Name    ${Register_S014.contact['user_name']}
    register_business_full_register.Input User Position    ${Register_S014.contact['user_position']}
    register_business_full_register.Input User Email    ${Register_S014.contact['user_email']}
    register_business_full_register.Input User Phone    ${Register_S014.contact['user_phone']}
    register_business_full_register.Input User Phone Ex    ${Register_S014.contact['user_phone_ex']}
    #Step2 ระบุข้อมูลธนาคาร
    register_business_full_register.Select Bank Id    ${Register_S014.bank['bank_id']}
    register_business_full_register.Select Bank Name    ${Register_S014.bank['bank_name']}
    register_business_full_register.Select Bank Accont Type    ${Register_S014.bank['bank_account_type']}
    register_business_full_register.Input Bank Branch    ${Register_S014.bank['bank_branch']}
    register_business_full_register.Input Bank Account Name    ${Register_S014.bank['bank_account_name']}
    register_business_full_register.Input Bank Account No    ${Register_S014.bank['bank_account_no']}
    common.Verify Capture Screenshot    Register_S014    Verify Contact And Bank Information

    Log    Step No.12 กดปุ่ม "ถัดไป"
    register_business_full_register.Click Next
    #Expected
    register_business_full_register.Verify Supporting Document Page Individual
    common.Verify Capture Screenshot    Register_S014    Verify Supporting Document Page


    Log    Step No.13 อัพโหลดเอกสารประกอบ
    register_business_full_register.Upload Copy ID Card    ${testpdf}
    register_business_full_register.Upload Copy Of House Registration    ${testpdf}
    register_business_full_register.Copy Of Bank Account    ${testpdf}
    register_business_full_register.Upload Permission form for Deduction from Bank Account    ${testpdf}
    register_business_full_register.Upload Other File    ${testpdf}
    register_business_full_register.Click Acceptance Terms of Service
    register_business_full_register.Click Acceptance Privacy Policy
    common.Verify Capture Screenshot    Register_S014    Uploaded Supporting Document Page
    
    Log    Step No.14 กดปุ่ม "ลงทะเบียน"
    register_business_full_register.Click Confirm
    register_business_full_register.Verify Confirm Page    ${Register.Full_register['text_register_success']}
    common.Verify Capture Screenshot    Register_S014    Full register success

    Log    Step No.15 กด Link Full Register เดิม ที่ได้รับทาง E-mail
    common.Open URL    ${link_full_register}
    # common.Open URL    https://www-uat.allspeedy.co.th/business-register/fullRegister/11153137768697514178
    #Expected
    # register_business_full_register.Verify Company Information Individual Page
    # ...    ${Register_S004['checkbox_partner_types']}
    # ...    ${Register_S004['title_name']}
    # ...    ${Register_S004['first_name']}
    # ...    ${Register_S004['last_name']}
    # #...    ${Register_S004['id_number']}
    # ...    ${NationalID}
    # ...    ${Register_S004['email']}
    # ...    ${Register_S004['individual_address']}
    # ...    ${Register_S004['select_individual_address_full']}
    # ...    ${Register_S004['mobile_no']}
    # ...    ${Register_S004['mobile_ext']}
    # common.Verify Capture Screenshot    Register_S014    Verify Company Information

    Log    Step No.16 กดปุ่ม "หมายเหตุการแก้ไข"
    # register_business_full_register.Click Remark
    # #Expected
    # register_business_full_register.Verify Remark Popup
    # ...    remark_4=comment
    # common.Verify Capture Screenshot    Register_S014    Verify remark popup

    Log    Step No.17 กดปุ่ม "x"
    # register_business_full_register.Click Button Close Remark Popup
    # #Expected
    # register_business_full_register.Verify Popup Not Appear
    # common.Verify Capture Screenshot    Register_S014    Verify popup not appear