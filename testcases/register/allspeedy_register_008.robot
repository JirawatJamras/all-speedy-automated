*** Settings ***
Resource          ../../resourses/import.robot
Suite Setup       Run Keywords    Open Chrome Browser    chrome    #headlesschrome
                  ...    AND   Set Folder Result with date
Suite Teardown    Close Browser


*** Test Cases ***

AllSpeedy_Register_008_ID_18
    [Documentation]    [ลงทะเบียน (Pre Register) ในส่วนของข้อมูลบริษัท (ข้อมูลทั่วไป) สำหรับลูกค้าธุรกิจ ] ขั้นตอนการระบุข้อมูลบริษัท (ข้อมูลทั่วไป) ประเภทคู่ค้า นิติบุคคล: กรอกข้อมูลถูกต้องครบถ้วน                        
    [Tags]    AllSpeedy_Register_008    UAT    Medium    Regression
    common.Open URL    ${B2C_UAT_URL}
    register_landing_page.Click Go business Tab
    register.Click Register On Button
    business_register_page.Click Checkbox Partner Types Legal    ${AllSpeedy_Register_008_ID_18['checkbox_partner_types']}
    register.Verify PartnerType LegalEntity    ${AllSpeedy_Register_008_ID_18['checkbox_partner_types_expected']} 
    business_register_page.Select Company Title Name     ${AllSpeedy_Register_008_ID_18['company_title_name']}
    business_register_page.Verify Company Title Name     ${AllSpeedy_Register_008_ID_18['company_title_name_expected']}
    business_register_page.Input Company Name    ${AllSpeedy_Register_008_ID_18['company_name']}
    business_register_page.Verify Input Company Name     ${AllSpeedy_Register_008_ID_18['company_name_expected']}
    business_register_page.Input Id Number    ${AllSpeedy_Register_008_ID_18['id_number']}
    business_register_page.Verify Input Id Number     ${AllSpeedy_Register_008_ID_18['id_number_expected']}
    business_register_page.Input Company Address    ${AllSpeedy_Register_008_ID_18['company_address']}
    business_register_page.Verify Input Company Address     ${AllSpeedy_Register_008_ID_18['company_address_expected']}
    # Company Address field no data for select address
    # business_register_page.Input Company Address Full    ${AllSpeedy_Register_008_ID_18['search_company_address_full']}
    # business_register_page.Verify Input Company Address Full    ${AllSpeedy_Register_008_ID_18['company_address_full_expected']}
    #common.Verify Capture Screenshot    AllSpeedy_Register_008_ID_18    filled in general information success
    business_register_page.Select Title Name    ${AllSpeedy_Register_008_ID_18['title_name']}
    business_register_page.Verify Title Name     ${AllSpeedy_Register_008_ID_18['title_name_expected']}
    business_register_page.Input First Name    ${AllSpeedy_Register_008_ID_18['first_name']}
    business_register_page.Verify Input First Name    ${AllSpeedy_Register_008_ID_18['first_name_expected']}
    business_register_page.Input Last Name    ${AllSpeedy_Register_008_ID_18['first_name']}
    business_register_page.Verify Input Last Name    ${AllSpeedy_Register_008_ID_18['first_name_expected']}
    business_register_page.Input Email    ${AllSpeedy_Register_008_ID_18['email']}
    business_register_page.Verify Input Email    ${AllSpeedy_Register_008_ID_18['email_expected']}
    business_register_page.Input Mobile No    ${AllSpeedy_Register_008_ID_18['mobile_no']}
    business_register_page.Verify Input Mobile No    ${AllSpeedy_Register_008_ID_18['mobile_no_expected']}
    business_register_page.Input Mobile Ext    ${AllSpeedy_Register_008_ID_18['mobile_ext']}
    business_register_page.Verify Input Mobile Ext    ${AllSpeedy_Register_008_ID_18['mobile_ext']}

    common.Verify Capture Screenshot    AllSpeedy_Register_008_ID_18    filled in contact information success
    