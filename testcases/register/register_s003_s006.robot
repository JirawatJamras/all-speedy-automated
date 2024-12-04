*** Settings ***
Resource          ../../resourses/init_website.robot
Resource          ../../resourses/import.robot

Test Setup        Run Keywords    Open Chrome Browser    headlesschrome    #headlesschrome    #chrome
                  ...    AND   Set Folder Result with date
Test Teardown     Close Browser

*** Test Cases ***
Register_S003_S006
    [Documentation]    Customer : ยกเลิกลงทะเบียน Pre-Register
    [Tags]    Register    Cancel_Pre_Register    UAT
    Log    Scenario 3 Customer : ยกเลิกลงทะเบียน Pre-Register (ลูกค้าประเภทนิติบุคคล)
    Register_S003
    Log    Scenario 6 Customer : ยกเลิกลงทะเบียน Pre-Register (ลูกค้าประเภทบุคคลธรรมดา)
    Register_S006

*** Keywords ***
Register_S003
    Log    Step No.1 กรอกข้อมูล
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab  
    register_business_customers_page.Click Menu Register Business
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S003['checkbox_partner_types']}
    register_business_pre_register.Select Company Title Name Legal Entity     ${Register_S003['company_title_name']}
    register_business_pre_register.Input Company Name Legal Entity    ${Register_S003['company_name']}
    register_business_pre_register.Input Juristic Identification Number Legal Entity    ${Register_S003['id_number']}
    register_business_pre_register.Input Company Address Legal Entity    ${Register_S003['company_address']}
    register_business_pre_register.Input Company Address Full Legal Entity    ${Register_S003['search_company_address_full']}    ${Register_S003['select_company_address_full']}
    common.Verify Capture Screenshot      Register    Register_S003_S006    1.S003_filled in information 1/2
    register_business_pre_register.Select Title Name Legal Entity    ${Register_S003['title_name']}
    register_business_pre_register.Input First Name Legal Entity    ${Register_S003['first_name']}
    register_business_pre_register.Input Last Name Legal Entity    ${Register_S003['last_name']}
    register_business_pre_register.Input Email Legal Entity    ${Register_S003['email']}
    register_business_pre_register.Input Mobile No Legal Entity    ${Register_S003['mobile_no']}
    register_business_pre_register.Input Mobile Ext Legal Entity    ${Register_S003['mobile_ext']}
    common.Verify Capture Screenshot      Register    Register_S003_S006    1.S003_filled in information 2/2
    
    Log    Step No.2 ยกเลิกลงทะเบียน
    register_business_pre_register.Click Cancel
    register_business_pre_register.Verify Cancel Popup    ${Register.Pre_register['text_header_cancel']}    ${Register.Pre_register['text_question_cancel']}
    common.Verify Capture Screenshot      Register    Register_S003_S006    2.S003_Verify Cancel Popup

    
    Log    Step No.3 ตกลงยกเลิกลงทะเบียน
    register_business_pre_register.Click Button Confirm Cancel Popup
    common.Verify Capture Screenshot      Register    Register_S003_S006    3.S003_Back to login page


Register_S006
    Log    Step No.1 กรอกข้อมูล
    common.Open URL    ${B2C_UAT_URL}
    register_general_customers_page.Select Business Customers Tab  
    register_business_customers_page.Click Menu Register Business
    register_business_pre_register.Click Checkbox Partner Types Legal    ${Register_S006['checkbox_partner_types']}
    register_business_pre_register.Select Title Name Individual    ${Register_S006['title_name']}
    register_business_pre_register.Input First Name Individual    ${Register_S006['first_name']}
    register_business_pre_register.Input Last Name Individual    ${Register_S006['last_name']}
    register_business_pre_register.Input National ID Individual    ${Register_S006['id_number']}
    register_business_pre_register.Input Email Individual    ${Register_S006['email']}
    register_business_pre_register.Input Address Individual    ${Register_S005['individual_address']}
    register_business_pre_register.Input Address Full Individual    ${Register_S006['search_individual_address_full']}    ${Register_S006['select_individual_address_full']}
    register_business_pre_register.Input Mobile No Individual    ${Register_S006['mobile_no']}
    register_business_pre_register.Input Mobile Ext Individual    ${Register_S006['mobile_ext']}
    common.Verify Capture Screenshot      Register    Register_S003_S006    1.S006_filled in information


    Log    Step No.2 ยกเลิกลงทะเบียน
    register_business_pre_register.Click Cancel
    register_business_pre_register.Verify Cancel Popup    ${Register.Pre_register['text_header_cancel']}    ${Register.Pre_register['text_question_cancel']}
    common.Verify Capture Screenshot      Register    Register_S003_S006    2.S006_Verify Cancel Popup

    Log    Step No.3 ตกลงยกเลิกลงทะเบียน
    register_business_pre_register.Click Button Confirm Cancel Popup
    common.Verify Capture Screenshot      Register    Register_S003_S006    3.S006_Back to login page
