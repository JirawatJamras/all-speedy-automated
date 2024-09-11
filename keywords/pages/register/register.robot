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

Verify Company Name Text Box  
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${companyname_txtbox}    timeout=10s
    Element Should Be Visible    ${companyname_txtbox}    ${menu_txt}

Verify Tax Identification Number Text Box  
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${tax_identification_number}    timeout=10s
    Element Should Be Visible    ${tax_identification_number}    ${menu_txt}

Verify Address Company Text Box
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${addresscompany_textbox}    timeout=10s
    Element Should Be Visible    ${addresscompany_textbox}    ${menu_txt}

Verify Address Full Text Box
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${addressfull_textbox}    timeout=10s
    Element Should Be Visible    ${addressfull_textbox}    ${menu_txt}


Verify Prefixname Dropdown
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${Prefixname_dropdown}    timeout=10s
    # Execute Javascript  window.scrollTo(0, document.body.scrollHeight / 2)
    Element Should Be Visible    ${Prefixname_dropdown}    ${menu_txt}

Verify FirstName Text Box
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${FirstName_txtbox}    timeout=10s
    Element Should Be Visible    ${FirstName_txtbox}    ${menu_txt}

Verify LastName Text Box
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${LastName_txtbox}    timeout=10s
    Element Should Be Visible    ${LastName_txtbox}    ${menu_txt}

Verify Email Text Box
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${email_txtbox}    timeout=10s
    Element Should Be Visible    ${email_txtbox}    ${menu_txt}

Verify MobileNo Text Box
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${MobileNo_txtbox}    timeout=10s
    Element Should Be Visible    ${MobileNo_txtbox}    ${menu_txt}

Verify MobileExt Text Box
    [Arguments]    ${menu_txt}
    Wait Until Element Is Visible    ${MobileExt_txtbox}    timeout=10s
    Element Should Be Visible    ${MobileExt_txtbox}    ${menu_txt}

Verify All Page Register
    Verify PartnerType LegalEntity    ${Menu_Checkbox_Partnertype['expected_txtbox'],['LegalEntitytxt']}
    Verify Company Name Text Box    ${CompanyName['expected_txtbox']}
    Verify Tax Identification Number Text Box    ${TaxIdentification['expected_txtbox']}
    Verify Address Company Text Box    ${Address_addressInfo['expected_txtbox']}
    Verify Address Full Text Box    ${Sub_districtDistrict['expected_txtbox']}
    Verify Prefixname Dropdown    ${Prefix_name['expected_txtbox']}
    Verify FirstName Text Box    ${FirstName['expected_txtbox']}
    Verify LastName Text Box    ${LastName['expected_txtbox']}
    Verify Email Text Box    ${Email['expected_txtbox']}
    Verify MobileNo Text Box    ${MobileNo['expected_txtbox']}
    Verify MobileExt Text Box    ${MobileExt['expected_txtbox']}