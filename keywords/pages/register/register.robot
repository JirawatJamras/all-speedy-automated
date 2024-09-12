*** Keywords ***
Click Register On Button
    Wait Until Element Is Visible    ${register_btn_business}
    Click Element                    ${register_btn_business}

Check Checkbox State
    ${checked}=  Get Element Attribute    ${checkbox_locator}    checked
    RETURN    ${checked} == 'true'


Verify PartnerType LegalEntity    
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${partnertype_txt}    timeout=10s
    Element Should Be Visible    ${partnertype_txt}    ${menu_txt}
    Check Checkbox State

Verify Company Name TextBox  
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${companyname_txtbox}    timeout=10s
    Element Should Be Visible    ${companyname_txtbox}    ${menu_txt}

Verify Tax Identification Number TextBox  
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${tax_identification_number}    timeout=10s
    Element Should Be Visible    ${tax_identification_number}    ${menu_txt}

Verify Address Company TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${addresscompany_textbox}    timeout=10s
    Element Should Be Visible    ${addresscompany_textbox}    ${menu_txt}

Verify Address Full TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${addressfull_textbox}    timeout=10s
    Element Should Be Visible    ${addressfull_textbox}    ${menu_txt}


Verify Prefixname Dropdown
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${Prefixname_dropdown}    timeout=10s
    # Execute Javascript  window.scrollTo(0, document.body.scrollHeight / 2)
    Element Should Be Visible    ${Prefixname_dropdown}    ${menu_txt}

Verify FirstName TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${FirstName_txtbox}    timeout=10s
    Element Should Be Visible    ${FirstName_txtbox}    ${menu_txt}

Verify LastName TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${LastName_txtbox}    timeout=10s
    Element Should Be Visible    ${LastName_txtbox}    ${menu_txt}

Verify Email TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${email_txtbox}    timeout=10s
    Element Should Be Visible    ${email_txtbox}    ${menu_txt}

Verify MobileNo TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${MobileNo_txtbox}    timeout=10s
    Element Should Be Visible    ${MobileNo_txtbox}    ${menu_txt}

Verify MobileExt TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${MobileExt_txtbox}    timeout=10s
    Element Should Be Visible    ${MobileExt_txtbox}    ${menu_txt}

Verify EmailBusiness TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${EmailBusiness_txt}    timeout=10s
    Element Should Be Visible    ${EmailBusiness_txt}    ${menu_txt}

Verify PasswordBusiness TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${PasswordBusiness_txt}    timeout=10s
    Element Should Be Visible    ${PasswordBusiness_txt}    ${menu_txt}

Verify All Page login
    Verify EmailBusiness TextBox    ${EmailBusiness['expected_txtbox']}
    Verify PasswordBusiness TextBox    ${PasswordBusiness['expected_txtbox']}

Verify PartnerType NaturalPerson	
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${partnertype_txt}    timeout=10s
    Element Should Be Visible    ${partnertype_txt}    ${menu_txt}
    Click Element                    ${NaturalPerson_checkbox}
    Check Checkbox State

Verify FormfirstName TextBox	
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${FormfirstName_txtbox}    timeout=10s
    Element Should Be Visible    ${FormfirstName_txtbox}    ${menu_txt}

Verify FormlastName TextBox	
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${FormlastName_txtbox}    timeout=10s
    Element Should Be Visible    ${FormlastName_txtbox}    ${menu_txt}

Verify FormIdNumber TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${FormidNumber_txtbox}    timeout=10s
    Element Should Be Visible    ${FormidNumber_txtbox}    ${menu_txt}

Verify FormEmail TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${Formemail_txtbox}    timeout=10s
    Element Should Be Visible    ${Formemail_txtbox}    ${menu_txt}

Verify FormAddressInfo TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${Form_address_addressInfo_txtbox}    timeout=10s
    Element Should Be Visible    ${Form_address_addressInfo_txtbox}    ${menu_txt}

Verify FormAddressFull TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${Form_address_full_txtbox}    timeout=10s
    Element Should Be Visible    ${Form_address_full_txtbox}    ${menu_txt}

Verify FormMobileNo TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${Form_mobileNo_txtbox}    timeout=10s
    Element Should Be Visible    ${Form_mobileNo_txtbox}    ${menu_txt}

Verify FormMobileExt TextBox
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${Form_mobileExt_txtbox}    timeout=10s
    Element Should Be Visible    ${Form_mobileExt_txtbox}    ${menu_txt}


Verify All Page Register
    ###ประเภทคู่ค้า นิติบุคล
    Verify PartnerType LegalEntity    ${Menu_Checkbox_Partnertype['expected_txtbox'],['LegalEntitytxt']}
    Verify Company Name TextBox    ${CompanyName['expected_txtbox']}
    Verify Tax Identification Number TextBox    ${TaxIdentification['expected_txtbox']}
    Verify Address Company TextBox    ${Address_addressInfo['expected_txtbox']}
    Verify Address Full TextBox    ${Sub_districtDistrict['expected_txtbox']}
    Verify Prefixname Dropdown    ${Prefix_name['expected_txtbox']}
    Verify FirstName TextBox    ${FirstName['expected_txtbox']}
    Verify LastName TextBox    ${LastName['expected_txtbox']}
    Verify Email TextBox    ${Email['expected_txtbox']}
    Verify MobileNo TextBox    ${MobileNo['expected_txtbox']}
    Verify MobileExt TextBox    ${MobileExt['expected_txtbox']}
    ###ประเภทคู่ค้า บุคคลธรรมดา
    Verify PartnerType NaturalPerson	    ${Menu_Checkbox_Partnertype['expected_txtbox'],['NaturalPerson']}
    Verify Prefixname Dropdown    ${Prefix_name['expected_txtbox']}
    Verify FormfirstName TextBox    ${Form_firstName['expected_txtbox']}
    Verify FormlastName TextBox    ${Form_lastName['expected_txtbox']}
    Verify FormIdNumber TextBox    ${Form_idNumber['expected_txtbox']}
    Verify FormEmail TextBox    ${Form_email['expected_txtbox']}
    Verify FormAddressInfo TextBox    ${Form_address_addressInfo['expected_txtbox']}
    Verify FormAddressFull TextBox    ${Form_address_full['expected_txtbox']}
    Verify FormMobileNo TextBox    ${Form_mobileNo['expected_txtbox']}
    Verify FormMobileExt TextBox    ${Form_mobileExt['expected_txtbox']}
