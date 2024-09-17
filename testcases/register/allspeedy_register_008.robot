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
    business_register_page.Select Company registration prefix    ${AllSpeedy_Register_008_ID_18['company_registration_prefix']}
    business_register_page.Verify Company registration prefix    ${AllSpeedy_Register_008_ID_18['company_registration_prefix_expected']}
    business_register_page.Input Company Name    ${AllSpeedy_Register_008_ID_18['company_name']}
    business_register_page.Verify Input Company Name     ${AllSpeedy_Register_008_ID_18['company_name']}
    business_register_page.Input Id Number    ${AllSpeedy_Register_008_ID_18['id_number']}
    business_register_page.Verify Input Id Number     ${AllSpeedy_Register_008_ID_18['id_number']}
    business_register_page.Input Company Address    ${AllSpeedy_Register_008_ID_18['company_address']}
    business_register_page.Verify Input Company Address     ${AllSpeedy_Register_008_ID_18['company_address']}
    business_register_page.Input Company Address    ${AllSpeedy_Register_008_ID_18['company_address']}
    business_register_page.Verify Input Company Address     ${AllSpeedy_Register_008_ID_18['company_address']}   
    
    
    common.Verify Capture Screenshot    AllSpeedy_Register_008_ID_18    Pre Register Success    