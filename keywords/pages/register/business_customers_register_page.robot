**** Keywords ***
Click Checkbox Partner Types Legal
    [Arguments]    ${Partner_Types}
    Wait Until Element Is Visible    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']
    Click Element    //span[text()='${Partner_Types}']/../..//label[@class='ant-radio-wrapper ant-radio-wrapper-checked css-1x1kih3']

Select Partner Type Radio Button
    [Arguments]    ${type}
    Click Xpath By JavaScript    //input[@name='customerType'][@value='${type}']

Select Company Title Name   
    [Arguments]    ${Title}
    common.Click when ready    ${register_dropdown_company_title_name_register_page}
    Wait Until Element Is Visible    //div[text()='${Title}'][@class='ant-select-item-option-content'] 
    Click Element    //div[text()='${Title}'][@class='ant-select-item-option-content']

Input Text Register
    [Arguments]    ${TextBox}    ${Value}
    Wait Until Element Is Visible    ${TextBox}
    Input Text                       ${TextBox}    ${Value}   

Verify Input Text Box
    [Arguments]    ${TextBox}    ${Value}
    Wait Until Element Is Visible    ${TextBox}    
    Element Should Be Visible    ${TextBox}    ${Value}

Input Company Name 
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_company_name_register_page}     ${Value}

Verify Input Company Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_name_register_page}    ${Value}

Input Id Number 
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_id_number_register_page}    ${Value}  

Verify Input Id Number 
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_id_number_register_page}    ${Value}   

Input Company Address 
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_company_address_register_page}    ${Value}  

Verify Input Company Address  
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_address_register_page}    ${Value}     

Input Company Address Full
    [Arguments]    ${Value}    ${Select}
    Input Text Register    ${register_textbox_company_address_full_register_page}     ${Value}  
    #Select one in result search 
    Wait Until Element Is Visible    //div[text()='${Select}'][@class='ant-select-item-option-content'] 
    Click Element    //div[text()='${Select}'][@class='ant-select-item-option-content']

Verify Input Company Address Full  
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_company_address_full_register_page}    ${Value}

Select Title Name  
    [Arguments]    ${Title}
    common.Click when ready    ${register_dropdown_title_name_register_page}
    Wait Until Element Is Visible    //div[text()='${Title}'][@class='ant-select-item-option-content'] 
    Click Element    //div[text()='${Title}'][@class='ant-select-item-option-content']

Verify Title Name  
    [Arguments]    ${Title}
    Wait Until Element Is Visible    ${register_select_title_name_register_page}    timeout=10s
    Element Should Be Visible    ${register_select_title_name_register_page}    ${Title}

Input First Name
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_first_name_register_page}     ${Value}

Verify Input First Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_first_name_register_page}    ${Value}

Input Last Name
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_last_name_register_page}     ${Value}  

Verify Input Last Name
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_last_name_register_page}    ${Value}  

Input Email
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_email_register_page}     ${Value}  

Verify Input Email
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_email_register_page}    ${Value}

Input Mobile No
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_mobile_no_register_page}     ${Value}  

Verify Input Mobile No
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_mobile_no_register_page}    ${Value}

Input Mobile Ext
    [Arguments]    ${Value}  
    Input Text Register    ${register_textbox_mobile_ext_register_page}     ${Value}

Verify Input Mobile Ext
    [Arguments]    ${Value}  
    Verify Input Text Box    ${register_textbox_mobile_ext_register_page}    ${Value}

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