*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S013
    [Documentation]    Customer : ลงทะเบียน Full-Register (Inbound) ลูกค้านิติบุคคล
    [Tags]    Register    Customer_Full_Register_Inbound    UAT
    skip
    Log    Step No.1 ลูกค้ากด Link Full Register ที่ได้รับทาง E-mail
    register_business_full_register.Get Link On Email
    common.Open URL    ${link_full_register}
    #Expected
    register_business_full_register.Verify Company Information Legal Entity Page
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_title_name']}
    ...    ${Register_S001['company_name']}
    ...    ${JuristicID}
    # ...    ${Register_S001['id_number']}
    ...    ${Register_S001['company_address']}
    ...    ${Register_S001['select_company_address_full']}
    ...    ${EMPTY}
    ...    ${EMPTY}
    ...    ${Register_S001['title_name']} 
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['email']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}
    common.Verify Capture Screenshot     Register    Register_S013    Verify Company Information

    Log    Step No.2 กรอกข้อมูลเบอร์โทรศัพท์
    register_business_full_register.Input Mobile Company Legal Entity    ${Register_S013['mobile_company']}
    register_business_full_register.Input Mobile Company Ext Legal Entity    ${Register_S013['mobile_company_ext']}
    common.Verify Capture Screenshot     Register    Register_S013    filled in mobile success
    

    Log    Step No.3 กดปุ่ม "ถัดไป"
    register_business_full_register.Click Next
    #Expected
    #Tab พัสดุทั่วไป
    register_business_full_register.Verify Service Information Page Tab Dry Parcel
    common.Verify Capture Screenshot     Register    Register_S013    Verify Tab Dry Parcel
    #Tab พัสดุควบคุมอุณหภูมิ
    register_business_full_register.Verify Service Information Page Tab Chill Parcel
    common.Verify Capture Screenshot     Register    Register_S013     Verify Tab Chill Parcel
    #Tab Return Business
    register_business_full_register.Verify Service Information Page Tab Return Business
    common.Verify Capture Screenshot     Register    Register_S013     Verify Tab Return Business

    Log    Step No.4 เปิดใช้งานพัสดุทั่วไป
    register_business_full_register.Click Tab Dry Parcel
    register_business_full_register.Click Select Dry Parcel
    register_business_full_register.Select Add Service Cod Dry Parcel
    register_business_full_register.Select Add Service Insuaration Dry Parcel
    register_business_full_register.Select Type Product Dry Parcel    ${Register_S013.dry_parcel['type_product']}
    register_business_full_register.Select Number By Day Dry Parcel    ${Register_S013.dry_parcel['number_by_day']}
    register_business_full_register.Select Sale Channel Dry Parcel    ${Register_S013.dry_parcel['sale_channel']}
    register_business_full_register.Input Remark Dry Parcel    ${Register_S013.dry_parcel['remark']}
    common.Verify Capture Screenshot     Register    Register_S013    Enable Dry Parcel

    Log    Step No.5 กดปุ่ม "บันทึกร่าง" ที่ขั้นตอนข้อมูลบริการ
    register_business_full_register.Click Save
    common.Verify Capture Screenshot     Register    Register_S013    Save Draft

    Log    Step No.6 กดปุ่ม "ยกเลิก"
    register_business_full_register.Click Cancel
    #Expected
    register_business_full_register.Verify Cancel Popup    ${Register.Full_register['text_header_cancel']}    ${Register.Pre_register['text_question_cancel']}
    common.Verify Capture Screenshot     Register    Register_S013    Cancel popup

    Log    Step No.7 กดปุ่ม "ตกลง" ที่ Popup
    register_business_full_register.Click Button Confirm Cancel Popup
    common.Verify Capture Screenshot     Register    Register_S013    Exit link Full register

    Log    Step No.8 กดเปิด Link Full Register เดิม ที่ได้รับทาง E-mail 
    common.Open URL    ${link_full_register}
    #Expected    
    register_business_full_register.Verify Company Information Legal Entity Page
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_title_name']}
    ...    ${Register_S001['company_name']}
    ...    ${JuristicID}
    # ...    ${Register_S001['id_number']}
    ...    ${Register_S001['company_address']}
    ...    ${Register_S001['select_company_address_full']}
    ...    ${Register_S013['mobile_company']}
    ...    ${Register_S013['mobile_company_ext']}
    ...    ${Register_S001['title_name']} 
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['email']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}    
    common.Verify Capture Screenshot     Register    Register_S013    Verify Company Information


    Log    Step No.9 กดปุ่ม "ถัดไป"
    register_business_full_register.Click Next
    #Expected
    register_business_full_register.Verify Service Information Page Tab Dry Parcel
    ...    type_product=${Register_S013.dry_parcel['type_product']}
    ...    number_by_day=${Register_S013.dry_parcel['number_by_day']}
    ...    sale_channel=${Register_S013.dry_parcel['sale_channel']}
    ...    remark=${Register_S013.dry_parcel['remark']}
    common.Verify Capture Screenshot     Register    Register_S013    Verify Dry Parcel

    Log    Step No.10 เปิดใช้งานพัสดุควบคุมอุณหภูมิ และ เปิดใช้งาน Return Business
    #Tab พัสดุควบคุมอุณหภูมิ
    register_business_full_register.Click Tab Chill Parcel
    register_business_full_register.Click Select Chill Parcel
    register_business_full_register.Select Add Service Cod Chill Parcel
    register_business_full_register.Select Type Product Chill Parcel    ${Register_S013.chill_parcel['type_product']}
    register_business_full_register.Select Number By Day Chill Parcel    ${Register_S013.chill_parcel['number_by_day']}
    register_business_full_register.Select Sale Channel Chill Parcel    ${Register_S013.chill_parcel['sale_channel']}
    register_business_full_register.Input Remark Chill Parcel    ${Register_S013.chill_parcel['remark']}
    common.Verify Capture Screenshot     Register    Register_S013    Enable Chill Parcel

    #Tab Return Business
    register_business_full_register.Click Tab Return Business
    register_business_full_register.Click Select Return Business
    register_business_full_register.Select Add Service Express Return Business
    register_business_full_register.Select Add Service Insuaration Return Business
    register_business_full_register.Select Type Product Return Business    ${Register_S013.return_business['type_product']}
    register_business_full_register.Select Number By Day Return Business    ${Register_S013.return_business['number_by_day']}
    register_business_full_register.Select Sale Channel Return Business    ${Register_S013.return_business['sale_channel']}
    register_business_full_register.Input Remark Return Business    ${Register_S013.return_business['remark']}
    common.Verify Capture Screenshot     Register    Register_S013    Enable Return Business

    Log    Step No.11 กดปุ่ม "ถัดไป"
    register_business_full_register.Click Next
    register_business_full_register.Click Add Contact Information
    #Expected
    register_business_full_register.Verify Contact And Bank Information Page
    common.Verify Capture Screenshot     Register    Register_S013    Verify Contact And Bank Information Page
        
    Log    Step No.12 ระบุข้อมูลผู้ติดต่อ
    #Step1 ระบุข้อมูลผู้ติดต่อ
    register_business_full_register.Input User Name    ${Register_S013.contact['user_name']}
    register_business_full_register.Input User Position    ${Register_S013.contact['user_position']}
    register_business_full_register.Input User Email    ${Register_S013.contact['user_email']}
    register_business_full_register.Input User Phone    ${Register_S013.contact['user_phone']}
    register_business_full_register.Input User Phone Ex    ${Register_S013.contact['user_phone_ex']}
    #Step2 ระบุข้อมูลธนาคาร
    register_business_full_register.Select Bank Id    ${Register_S013.bank['bank_id']}
    register_business_full_register.Select Bank Name    ${Register_S013.bank['bank_name']}
    register_business_full_register.Select Bank Accont Type    ${Register_S013.bank['bank_account_type']}
    register_business_full_register.Input Bank Branch    ${Register_S013.bank['bank_branch']}
    register_business_full_register.Input Bank Account Name    ${Register_S013.bank['bank_account_name']}
    register_business_full_register.Input Bank Account No    ${Register_S013.bank['bank_account_no']}
    common.Verify Capture Screenshot     Register    Register_S013    Verify Contact And Bank Information
    

    Log    Step No.13 กดปุ่ม "ถัดไป"
    register_business_full_register.Click Next
    #Expected
    register_business_full_register.Verify Supporting Document Page Legal Entity
    common.Verify Capture Screenshot     Register    Register_S013    Verify Supporting Document Page

    Log    Step No.14 อัปโหลดเอกสารประกอบ
    register_business_full_register.Upload Certificate Business Registration    ${testpdf}
    register_business_full_register.Upload Copy File 20    ${testpdf}
    register_business_full_register.Upload Copy ID Card    ${testpdf}
    register_business_full_register.Copy Of Bank Account    ${testpdf}
    register_business_full_register.Upload Copy Of House Registration    ${testpdf}
    register_business_full_register.Upload Permission form for Deduction from Bank Account    ${testpdf}
    register_business_full_register.Upload Other File    ${testpdf}
    register_business_full_register.Click Acceptance Terms of Service
    register_business_full_register.Click Acceptance Privacy Policy
    common.Verify Capture Screenshot     Register    Register_S013    Uploaded Supporting Document Page

    Log    Step No.15 กดปุ่ม "ลงทะเบียน"
    register_business_full_register.Click Confirm
    register_business_full_register.Verify Confirm Page    ${Register.Full_register['text_register_success']}
    common.Verify Capture Screenshot     Register    Register_S013    Full register success


    #ต้องไปทำ S0015 ในส่วนที่ RM ต้อง Comment
    Log    Step No.16 กด Link Full Register เดิม ที่ได้รับทาง E-mail 
    common.Open URL    ${link_full_register}
    #Expected    
    register_business_full_register.Verify Company Information Legal Entity Page
    ...    ${Register_S001['checkbox_partner_types']}
    ...    ${Register_S001['company_title_name']}
    ...    ${Register_S001['company_name']}
    ...    ${JuristicID}
    # ...    ${Register_S001['id_number']}
    ...    ${Register_S001['company_address']}
    ...    ${Register_S001['select_company_address_full']}
    ...    ${Register_S013['mobile_company']}
    ...    ${Register_S013['mobile_company_ext']}
    ...    ${Register_S001['title_name']} 
    ...    ${Register_S001['first_name']}
    ...    ${Register_S001['last_name']}
    ...    ${Register_S001['email']}
    ...    ${Register_S001['mobile_no']}
    ...    ${Register_S001['mobile_ext']}    
    common.Verify Capture Screenshot     Register    Register_S013    Verify Company Information
    
    Log    Step No.17 กดปุ่ม "หมายเหตุการแก้ไข"
    register_business_full_register.Click Remark
    #Expected
    register_business_full_register.Verify Remark Popup
    ...    remark_4=comment
    common.Verify Capture Screenshot     Register    Register_S013    Verify remark popup

    
    Log    Step No.18 กดปุ่ม "x"
    register_business_full_register.Click Button Close Remark Popup
    #Expected
    register_business_full_register.Verify Popup Not Appear
    common.Verify Capture Screenshot     Register    Register_S013    Verify popup not appear