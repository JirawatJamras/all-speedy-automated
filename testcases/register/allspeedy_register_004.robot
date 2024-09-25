*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***
AllSpeedy_Register_004_ID_22
    [Documentation]          [ลงทะเบียน (Pre Register) ในส่วนของข้อมูลบริษัท (ข้อมูลทั่วไป) สำหรับลูกค้าธุรกิจ ] กรอก URL ไม่ถูกต้อง
    [Tags]    AllSpeedy_Register_004    UAT    Low    Regression
    ${iserror}    Run Keyword And Return Status    common.Open URL    ${AllSpeedy_Register_004_ID_22['wrong_url']}
    general_customers_page.Verify This Site Can Not Be Reached Page    ${iserror}
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_22    Verify Incorrect Web Page

AllSpeedy_Register_004_ID_23
    [Documentation]          [ลงทะเบียน (Pre Register) ในส่วนของข้อมูลบริษัท (ข้อมูลทั่วไป) สำหรับลูกค้าธุรกิจ ] กรอก URL ถูกต้อง
    [Tags]    AllSpeedy_Register_004    UAT    Low    Regression    Bix
    common.Open URL    ${B2C_UAT_URL}
    general_customers_page.Select Business Customers Tab
    business_customers_page.Verify Business Customers Tab Page    AllSpeedy_Register_004_ID_23
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_23    Verify Business Customers Tab Page
    business_customers_page.Click Register Business Customers Button
    business_customers_register_page.Verify Pre-Register Form For Legal Entity Page    AllSpeedy_Register_004_ID_23
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_23    Verify Pre-Register Form For Legal Entity Page
    business_customers_register_page.Select Partner Type Radio Button    ${AllSpeedy_Register_004_ID_23.NormalPerson['expected']}
    business_customers_register_page.Verify Pre-Register Form For Normal Person Page    AllSpeedy_Register_004_ID_23
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_23    Verify Pre-Register Form For Normal Person Page

AllSpeedy_Register_004_ID_25
    [Documentation]          [ลงทะเบียน (Pre Register) ในส่วนของข้อมูลบริษัท (ข้อมูลทั่วไป) สำหรับลูกค้าธุรกิจ ] ขั้นตอนการระบุข้อมูลบริษัท (ข้อมูลทั่วไป) ประเภทคู่ค้า นิติบุคคล: กรอกข้อมูลเลขประจำตัวผู้เสียภาษีไม่ถูกต้อง
    [Tags]    AllSpeedy_Register_004    UAT1    Low    Regression    Peach
    common.Open URL    ${B2C_UAT_URL}
    general_customers_page.Select Business Customers Tab
    business_customers_page.Click Register Business Customers Button
    business_customers_register_page.Input Tax Identification Number    ${AllSpeedy_Register_004_ID_25.invaild_tax_identification_01['input']}
    business_customers_register_page.Verify Invalid Input Tax Identification Number    ${AllSpeedy_Register_004_ID_25.invaild_tax_identification_01['expected']}
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_25    Verify Taxpayer ID Number Field When Input Less Than 13 Digits
    common.Clear Value Input Text     ${register_txtbox_tax_identification_number_register_page}
    business_customers_register_page.Input Tax Identification Number    ${AllSpeedy_Register_004_ID_25.invaild_tax_identification_02['input']}
    business_customers_register_page.Verify Maximum Tax Identification Number That Can Be Inputted
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_25    Verify Taxpayer ID Number Field Should Contain Exactly 13 Digits
    common.Clear Value Input Text     ${register_txtbox_tax_identification_number_register_page}
    business_customers_register_page.Input Tax Identification Number    ${AllSpeedy_Register_004_ID_25.invaild_tax_identification_03['input']}
    business_customers_register_page.Verify Input Characters In Tax Identification Number Is Empty
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_25    Verify Taxpayer ID Number Field When Inputted As Characters Is Empty

AllSpeedy_Register_004_ID_28
    [Documentation]          [ลงทะเบียน (Pre Register) ในส่วนของข้อมูลบริษัท (ข้อมูลทั่วไป) สำหรับลูกค้าธุรกิจ ] ขั้นตอนการระบุข้อมูลบริษัท (ข้อมูลทั่วไป) ประเภทคู่ค้า นิติบุคคล: กรอกเบอร์ต่อ (#ต่อ) ไม่ถูกต้อง
    [Tags]    AllSpeedy_Register_004    UAT1    Low    Regression    Peach
    common.Open URL    ${B2C_UAT_URL}
    general_customers_page.Select Business Customers Tab
    business_customers_page.Click Register Business Customers Button
    business_customers_register_page.Input Mobile Ext    ${AllSpeedy_Register_004_ID_28.invalid_mobile_ext_01['input']}
    business_customers_register_page.Verify Maximum Input Mobile Ext That Can Be Inputted
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_28    Verify Mobile Extra Field Should Contain Exactly 10 Digits
    common.Clear Value Input Text     ${register_textbox_mobile_ext_register_page}
    business_customers_register_page.Input Mobile Ext    ${AllSpeedy_Register_004_ID_28.invalid_mobile_ext_02['input']}
    business_customers_register_page.Verify Input Characters In Mobile Ext Is Empty
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_28    Verify Mobile Extra Field When Inputted As Characters Is Empty

AllSpeedy_Register_004_ID_29    #เปลี่ยน ID หลังจากแก้ testcase
    [Documentation]    [ลงทะเบียน (Pre Register) ในส่วนของข้อมูลบริษัท (ข้อมูลทั่วไป) สำหรับลูกค้าธุรกิจ ] ขั้นตอนการระบุข้อมูลบริษัท (ข้อมูลทั่วไป) ประเภทคู่ค้า นิติบุคคล: กรอกข้อมูลถูกต้องครบถ้วน                        
    [Tags]    AllSpeedy_Register_004    UAT    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    general_customers_page.Select Business Customers Tab
    register.Click Register On Button
    business_customers_register_page.Click Checkbox Partner Types Legal    ${AllSpeedy_Register_004_ID_29['checkbox_partner_types']}
    register.Verify PartnerType LegalEntity    ${AllSpeedy_Register_004_ID_29['checkbox_partner_types_expected']} 
    business_customers_register_page.Select Company Title Name     ${AllSpeedy_Register_004_ID_29['company_title_name']}
    business_customers_register_page.Verify Company Title Name     ${AllSpeedy_Register_004_ID_29['company_title_name_expected']}
    business_customers_register_page.Input Company Name    ${AllSpeedy_Register_004_ID_29['company_name']}
    business_customers_register_page.Verify Input Company Name     ${AllSpeedy_Register_004_ID_29['company_name_expected']}
    business_customers_register_page.Input Id Number    ${AllSpeedy_Register_004_ID_29['id_number']}
    business_customers_register_page.Verify Input Id Number     ${AllSpeedy_Register_004_ID_29['id_number_expected']}
    business_customers_register_page.Input Company Address    ${AllSpeedy_Register_004_ID_29['company_address']}
    business_customers_register_page.Verify Input Company Address     ${AllSpeedy_Register_004_ID_29['company_address_expected']}
    business_customers_register_page.Input Company Address Full    ${AllSpeedy_Register_004_ID_29['search_company_address_full']}    ${AllSpeedy_Register_004_ID_29['select_company_address_full']}
    business_customers_register_page.Verify Input Company Address Full    ${AllSpeedy_Register_004_ID_29['company_address_full_expected']}
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_29    filled in general information success
    common.Scroll Window To Vertical    0
    business_customers_register_page.Select Title Name    ${AllSpeedy_Register_004_ID_29['title_name']}
    business_customers_register_page.Verify Title Name     ${AllSpeedy_Register_004_ID_29['title_name_expected']}
    business_customers_register_page.Input First Name    ${AllSpeedy_Register_004_ID_29['first_name']}
    business_customers_register_page.Verify Input First Name    ${AllSpeedy_Register_004_ID_29['first_name_expected']}
    business_customers_register_page.Input Last Name    ${AllSpeedy_Register_004_ID_29['first_name']}
    business_customers_register_page.Verify Input Last Name    ${AllSpeedy_Register_004_ID_29['first_name_expected']}
    business_customers_register_page.Input Email    ${AllSpeedy_Register_004_ID_29['email']}
    business_customers_register_page.Verify Input Email    ${AllSpeedy_Register_004_ID_29['email_expected']}
    business_customers_register_page.Input Mobile No    ${AllSpeedy_Register_004_ID_29['mobile_no']}
    business_customers_register_page.Verify Input Mobile No    ${AllSpeedy_Register_004_ID_29['mobile_no_expected']}
    business_customers_register_page.Input Mobile Ext    ${AllSpeedy_Register_004_ID_29['mobile_ext']}
    business_customers_register_page.Verify Input Mobile Ext    ${AllSpeedy_Register_004_ID_29['mobile_ext']}
    common.Verify Capture Screenshot    AllSpeedy_Register_004_ID_29    filled in contact information success   