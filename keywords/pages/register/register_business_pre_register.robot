*** Keywords ***
Click Checkbox Partner Types Legal
    [Arguments]    ${Partner_Types}
    ${Checkbox Partner Types}=    Replace String    ${register_btn_partner_types}    {value}    ${Partner_Types}
    common.Click when ready     ${Checkbox Partner Types}

#Legal entity
Set Juristic ID Legal Entity
    ${currentdate}   Get Current Date
    ${preid}   Convert Date  ${currentdate}    result_format=%y%m%d%H%M%S
    Evaluate   random.seed()   random
    ${prefix_number}=    Evaluate    random.randint(0, 5)    random
    ${JuristicID}=    Set Variable    ${prefix_number}${preid} 
    Set Global Variable    ${JuristicID}

Select Company Title Name Legal Entity
    [Arguments]    ${Title}
    common.Click when ready    ${register_dropdown_company_title_name_legal_entity}
    ${Selected company title name}=    Replace String    ${register_dropdown_choice_title_name}    {value}    ${Title}
    common.Click when ready    ${Selected company title name}

Input Company Name Legal Entity
    [Arguments]    ${Text}  
    common.Input When Ready    ${register_txtbox_company_name_legal_entity}    ${Text} 

Input Juristic Identification Number Legal Entity 
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_juristic_identification_number_legal_entity}     ${Value}  

Input Company Address Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_company_address_legal_entity}    ${Value}  

Input Company Address Full Legal Entity
    [Arguments]    ${Value}    ${Select}
    common.Input When Ready    ${register_dropdown_company_address_full_legal_entity}     ${Value}  
    #Select one in result search 
    ${Selected company address full}=    Replace String    ${register_dropdown_choice_company_address_full_legal_entity}    {value}    ${Select}
    Scroll Element Into View    ${Selected company address full}
    common.Click when ready     ${Selected company address full}

Select Title Name Legal Entity
    [Arguments]    ${Title}
    common.Click when ready    ${register_dropdown_title_name_legal_entity}
    ${Selected title name}=    Replace String    ${register_dropdown_choice_title_name}    {value}    ${Title}
    common.Click when ready    ${Selected title name}

Input First Name Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_first_name_legal_entity}     ${Value}

Input Last Name Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_last_name_legal_entity}     ${Value}  

Input Email Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_email_legal_entity}     ${Value}

Input Mobile No Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_mobile_no_legal_entity}     ${Value}  

Input Mobile Ext Legal Entity
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_mobile_ext_legal_entity}     ${Value}

#general
Set National ID Individual
    ${currentdate}   Get Current Date
    ${preid}   Convert Date  ${currentdate}    result_format=%y%m%d%H%M%S
    Evaluate   random.seed()   random
    ${prefix_number}=    Evaluate    random.randint(1, 8)    random
    ${NationalID}=    Set Variable    ${prefix_number}${preid} 
    Set Global Variable    ${NationalID}

Select Title Name Individual
    [Arguments]    ${Title}
    common.Click when ready    ${register_dropdown_title_name_individual}
    ${Selected title name}=    Replace String    ${register_dropdown_choice_title_name}    {value}    ${Title}
    common.Click when ready    ${Selected title name}

Input First Name Individual
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_first_name_individual}     ${Value}

Input Last Name Individual
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_last_name_individual}     ${Value}

Input National ID Individual
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_national_id_individual}    ${Value}

Input Email Individual
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_email_individual}     ${Value}

Input Address Individual
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_address_individual}    ${Value}  

Input Address Full Individual
    [Arguments]    ${Value}    ${Select}
    common.Input When Ready    ${register_dropdown_address_full_individual}     ${Value}  
    #Select one in result search 
    ${Selected company address full}=    Replace String    ${register_dropdown_choice_address_full_individual}    {value}    ${Select}
    Scroll Element Into View    ${Selected company address full}
    common.Click when ready     ${Selected company address full}

Input Mobile No Individual
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_mobile_no_individual}     ${Value}  

Input Mobile Ext Individual
    [Arguments]    ${Value}  
    common.Input When Ready    ${register_txtbox_mobile_ext_individual}     ${Value}

#both    
Click Confirm 
    ${Click confirm}=    Replace String    ${register_btn_confirm}     {value}    ${Register['btn_confirm']}
    common.Click when ready    ${Click confirm}
     
Click Cancel
    ${Click cancel}=    Replace String    ${register_btn_cancel}     {value}    ${Register['btn_cancel']}
    common.Click when ready    ${Click cancel}

Verify Confirm Page
    [Arguments]    ${Text}
    ${Register success text}=    Replace String    ${register_txt_success}     {value}    ${Text}
    Wait Until Element Is Visible    ${Register success text}    ${DEFAULT_TIMEOUT}
    Page Should Contain Element    ${Register success text}

Verify Cancel Popup
    [Arguments]    ${Header}    ${Body}
    ${Header cancel popup}=    Replace String    ${register_txt_header_cancel_popup}     {value}    ${Header}
    Element Should Be Visible    ${Header cancel popup}
    ${Body cancel popup}=    Replace String    ${register_txt_body_cancel_popup}     {value}    ${Body}
    Element Should Be Visible    ${Body cancel popup}

Click Button Confirm Cancel Popup
    ${Click button}=    Replace String    ${register_btn_cancel_popup}     {value}    ${Register['confirm_cancel_popup']}
    common.Click when ready    ${Click button}

Click Button Cancel Cancel Popup
    ${Click button}=    Replace String    ${register_btn_cancel_popup}     {value}    ${Register['cancel_cancel_popup']}
    common.Click when ready    ${Click button}

#old
Select Partner Type Radio Button
    [Arguments]    ${type}
    Click Xpath By JavaScript    //input[@name='customerType'][@value='${type}']

Input Text Register
    [Arguments]    ${TextBox}    ${Value}
    Wait Until Element Is Visible    ${TextBox}
    Input Text    ${TextBox}    ${Value}

Verify Input Text Box
    [Arguments]    ${TextBox}    ${Value}
    Wait Until Element Is Visible    ${TextBox}    
    Element Should Be Visible    ${TextBox}    ${Value}

Verify Input Tax Identification Number 
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_txtbox_tax_identification_number_register_page}    ${Value}

Verify Invalid Input Tax Identification Number
    [Arguments]    ${Value}
    Verify Input Text Box    ${register_msg_tax_identification_number_business_customers_register_page}    ${Value}

Verify Maximum Tax Identification Number That Can Be Inputted
    ${count_lenght_value}=    Get Value    ${register_txtbox_tax_identification_number_register_page}
    Length Should Be    ${count_lenght_value}    13

Verify Input Characters In Tax Identification Number Is Empty
    ${value}=    Get Value    ${register_txtbox_tax_identification_number_register_page} 
    Should Be Empty   ${value}

Verify Input Company Address  
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_address_register_page}    ${Value}     

Verify Input Company Address Full  
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_address_full_register_page}    ${Value}

Verify Title Name  
    [Arguments]    ${Title}
    Wait Until Element Is Visible    ${register_select_title_name_register_page}    timeout=10s
    Element Should Be Visible    ${register_select_title_name_register_page}    ${Title}

Verify Input First Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_first_name_register_page}    ${Value}

Verify Input Last Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_last_name_register_page}    ${Value}  

Verify Input Email
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_email_register_page}    ${Value}

Verify Input Mobile No
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_mobile_no_register_page}    ${Value}

Verify Input Mobile Ext
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_mobile_ext_register_page}    ${Value}

Verify Maximum Input Mobile Ext That Can Be Inputted
    ${count_lenght_value}=    Get Value    ${register_textbox_mobile_ext_register_page}
    Length Should Be    ${count_lenght_value}    10

Verify Input Characters In Mobile Ext Is Empty
    ${value}=    Get Value    ${register_textbox_mobile_ext_register_page}
    Should Be Empty   ${value}


Verify Pre-Register Form For Legal Entity Page
    [Arguments]    ${testcase}
    Verify Partner Types Radio Button    ${${testcase}.LegalEntitytxt['expected']}    ${${testcase}.NormalPerson['expected']}
    ###ประเภทคู่ค้า นิติบุคล
    Verify Company Title Name    ${${testcase}.companyTitleName['expected']}
    Verify Company Name    ${${testcase}.CompanyName['expected']}
    Verify Tax Identification Number    ${${testcase}.TaxIdentification['expected']}
    Verify Company Address    ${${testcase}.Address_addressInfo['expected']}
    Verify Company Address Full    ${${testcase}.Sub_districtDistrict['expected']}
    Verify Prefixname Dropdown    ${${testcase}.Prefix_name['expected']}
    Verify FirstName    ${${testcase}.FirstName['expected']}
    Verify LastName    ${${testcase}.LastName['expected']}
    Verify Email    ${${testcase}.Email['expected']}
    Verify MobileNo    ${${testcase}.MobileNo['expected']}
    Verify MobileExt    ${${testcase}.MobileExt['expected']}
    
Verify Pre-Register Form For Normal Person Page
    [Arguments]    ${testcase}
    ###ประเภทคู่ค้า บุคคลธรรมดา    
    Verify FormPrefixname Dropdown    ${${testcase}.Form_Prefix_name['expected']}
    Verify FormfirstName    ${${testcase}.Form_firstName['expected']}
    Verify FormlastName    ${${testcase}.Form_lastName['expected']}
    Verify FormIdNumber    ${${testcase}.Form_idNumber['expected']}
    Verify FormEmail    ${${testcase}.Form_email['expected']}
    Verify FormAddressInfo    ${${testcase}.Form_address_addressInfo['expected']}
    Verify FormAddressFull    ${${testcase}.Form_address_full['expected']}
    Verify FormMobileNo    ${${testcase}.Form_mobileNo['expected']}
    Verify FormMobileExt    ${${testcase}.Form_mobileExt['expected']}
    Verify Cacel Business Customers Register Button    ${${testcase}.cencelButton['expected']}
    Verify Register Business Customers Register Button    ${${testcase}.registerButton['expected']}

Verify Partner Types Radio Button
    [Arguments]    ${radio1}    ${radio2}
    Wait Until Element Is Visible    ${register_txt_legal_entity_business_customers_register_page}
    Wait Until Element Is Visible    ${register_txt_normal_person_business_customers_register_page}
    Element Should Contain    ${register_txt_legal_entity_business_customers_register_page}    ${radio1}
    Element Should Contain    ${register_txt_normal_person_business_customers_register_page}    ${radio2}

Verify Company Title Name
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_company_title_name_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_company_title_name_business_customers_register_page}    ${text}

Verify Company Name
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_company_name_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_company_name_business_customers_register_page}    ${text}

Verify Tax Identification Number 
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_tax_identification_number_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_tax_identification_number_business_customers_register_page}    ${text}

Verify Company Address
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_company_address_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_company_address_business_customers_register_page}    ${text}

Verify Company Address Full
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_company_address_full_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_company_address_full_business_customers_register_page}    ${text}

Verify Prefixname Dropdown
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_prefix_name_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_prefix_name_business_customers_register_page}    ${text}

Verify FirstName
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_firstname_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_firstname_business_customers_register_page}    ${text}

Verify LastName
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_lastname_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_lastname_business_customers_register_page}    ${text}

Verify Email
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_email_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_email_business_customers_register_page}    ${text}

Verify MobileNo
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_mobileNumber_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_mobileNumber_business_customers_register_page}    ${text}

Verify MobileExt
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_mobileExt_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_mobileExt_business_customers_register_page}    ${text}

Verify FormPrefixname Dropdown
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_prefix_name_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_prefix_name_business_customers_register_page}    ${text}

Verify FormfirstName	
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_firstName_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_firstName_business_customers_register_page}    ${text}

Verify FormlastName	
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_lastname_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_lastname_business_customers_register_page}    ${text}

Verify FormIdNumber
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_idnumber_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_idnumber_business_customers_register_page}    ${text}

Verify FormEmail
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_email_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_email_business_customers_register_page}    ${text}

Verify FormAddressInfo
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_company_address_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_company_address_business_customers_register_page}    ${text}

Verify FormAddressFull
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_company_address_full_business_customers_register_page}        ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_company_address_full_business_customers_register_page}        ${text}

Verify FormMobileNo
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_mobile_number_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_mobile_number_business_customers_register_page}    ${text}

Verify FormMobileExt
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_txt_form_mobileExt_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_txt_form_mobileExt_business_customers_register_page}    ${text}

Verify Cacel Business Customers Register Button
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_btn_cancel_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_btn_cancel_business_customers_register_page}    ${text}

Verify Register Business Customers Register Button
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_btn_register_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_btn_register_business_customers_register_page}    ${text}

Verify Register Email Errror Messages
    [Arguments]    ${text}
    Wait Until Element Is Visible    ${register_msg_error_business_customers_register_page}    ${DEFAULT_TIMEOUT}
    Element Should Contain    ${register_msg_error_business_customers_register_page}    ${text}
   
